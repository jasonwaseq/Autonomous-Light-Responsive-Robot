/*
 * File: TemplateService.h
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a simple service to work with the Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that this file
 * will need to be modified to fit your exact needs, and most of the names will have
 * to be changed to match your code.
 *
 * This is provided as an example and a good place to start.
 *
 * Created on 23/Oct/2011
 * Updated on 13/Nov/2013
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "TemplateEventChecker.h"
#include "TemplateService.h"
#include "roach.h"
#include <stdio.h>

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

#define FRONT_LEFT_BUMPER_MASK  (1u << 0)
#define FRONT_RIGHT_BUMPER_MASK (1u << 1)
#define REAR_LEFT_BUMPER_MASK   (1u << 2)
#define REAR_RIGHT_BUMPER_MASK  (1u << 3)
#define LEFT_SIDE_BUMPER_MASK (FRONT_LEFT_BUMPER_MASK | REAR_LEFT_BUMPER_MASK)
#define RIGHT_SIDE_BUMPER_MASK (FRONT_RIGHT_BUMPER_MASK | REAR_RIGHT_BUMPER_MASK)
#define FRONT_BUMPER_MASK (FRONT_LEFT_BUMPER_MASK | FRONT_RIGHT_BUMPER_MASK)
#define REAR_BUMPER_MASK (REAR_LEFT_BUMPER_MASK | REAR_RIGHT_BUMPER_MASK)

#define ROACH_HIDE_LED_LEVEL 0u
#define ROACH_DARK_ESCAPE_LED_LEVEL 4u
#define ROACH_SEARCH_LED_LEVEL 6u
#define ROACH_LIGHT_ESCAPE_LED_LEVEL 8u
#define ROACH_DANCE_LED_LEVEL 10u
#define ROACH_RUN_LED_LEVEL 12u

#define ROACH_RUN_SPEED 70
#define ROACH_SEARCH_SPEED 55
#define ROACH_DARK_ESCAPE_SPEED 65
#define ROACH_LIGHT_ESCAPE_SPEED 75
#define ROACH_LIGHT_PIVOT_SPEED 80

#define ROACH_ESCAPE_INNER_DIVISOR 3
#define ROACH_MIN_RELEASE_HOLD_MS 500u
#define ROACH_SEARCH_DURATION_MS 1400u
#define ROACH_DANCE_STEP_MS 150u
#define ROACH_DANCE_STEPS 4u
#define ROACH_BEHAVIOR_MIN_MS 5000u
#define ROACH_BEHAVIOR_SPAN_MS 5000u
#define ROACH_BASE_ESCAPE_DRIVE_MS 220u
#define ROACH_BASE_ESCAPE_TURN_MS 150u
#define ROACH_BASE_ESCAPE_CLEAR_MS 180u
#define ROACH_DARK_ESCAPE_STEP_MS 220u
#define ROACH_ESCAPE_MS_PER_SEVERITY 110u
#define ROACH_ESCAPE_WATCHDOG_MARGIN_MS 220u
#define ROACH_MAX_ESCAPE_SEVERITY 3u
#define ROACH_MAX_BUMP_RETRIES 4u

#define LIGHT_ESCAPE_MOVE_AWAY_PHASE 0u
#define LIGHT_ESCAPE_TURN_PHASE 1u

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
static void StopMotors(void);
static uint8_t ReadCurrentBumpers(void);
static uint8_t GetKnownBumperMask(uint8_t eventMask);
static void DriveStraight(signed char speed);
static void DriveArc(signed char baseSpeed, uint8_t turnRight);
static void DrivePivot(uint8_t turnRight, signed char speed);
static void UpdateBumperStateFromEvent(ES_Event ThisEvent);
static uint8_t ChooseTurnRight(uint8_t bumpMask);
static signed char ChooseBaseEscapeSpeed(uint8_t bumpMask, signed char magnitude);
static void ScheduleNextLightBehavior(void);
static uint16_t ChooseBehaviorDelay(void);
static uint16_t GetDarkEscapeStepTime(void);
static uint16_t GetLightEscapeDriveTime(void);
static uint16_t GetLightEscapeTurnTime(void);
static void ConfigureDarkEscape(uint8_t bumpMask);
static void ApplyDarkEscapeMotion(void);
static void ConfigureLightEscape(uint8_t bumpMask);
static void ApplyLightEscapePhase(void);
static void ApplyDanceStep(void);

static uint8_t InitDarkSubHSM(void);
static ES_Event RunDarkSubHSM(ES_Event ThisEvent);
static uint8_t InitLightSubHSM(void);
static ES_Event RunLightSubHSM(ES_Event ThisEvent);

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

typedef enum {
    InitPState,
    DarkModeState,
    LightModeState,
} TemplateServiceState_t;

static const char *TopStateNames[] = {
    "InitPState",
    "DarkModeState",
    "LightModeState",
};

typedef enum {
    InitPDarkState,
    DarkStillState,
    DarkEscapeState,
} DarkSubState_t;

static const char *DarkStateNames[] = {
    "InitPDarkState",
    "DarkStillState",
    "DarkEscapeState",
};

typedef enum {
    InitPLightState,
    LightRunState,
    LightEscapeState,
    LightSearchState,
    LightDanceState,
} LightSubState_t;

static const char *LightStateNames[] = {
    "InitPLightState",
    "LightRunState",
    "LightEscapeState",
    "LightSearchState",
    "LightDanceState",
};

static uint8_t MyPriority;
static uint8_t StableBumperState = 0u;
static uint8_t NextDefaultTurnRight = TRUE;
static uint8_t NextBehaviorIsDance = TRUE;
static uint8_t SearchTurnRight = TRUE;
static uint8_t DarkEscapeTurnRight = TRUE;
static uint8_t LightEscapeTurnRight = TRUE;
static uint8_t DarkEscapeBumpMask = 0u;
static uint8_t LightEscapeBumpMask = 0u;
static uint8_t LightEscapePhase = 0u;
static uint8_t LightEscapeRetryCount = 0u;
static uint8_t DarkEscapeRetryCount = 0u;
static uint8_t DanceStep = 0u;
static signed char DarkEscapeBaseSpeed = 0;
static signed char LightEscapeBaseSpeed = 0;
static TemplateServiceState_t CurrentState = InitPState;
static DarkSubState_t CurrentDarkState = InitPDarkState;
static LightSubState_t CurrentLightState = InitPLightState;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

uint8_t InitTemplateService(uint8_t Priority)
{
    ES_Event ThisEvent;

    MyPriority = Priority;
    CurrentState = InitPState;
    CurrentDarkState = InitPDarkState;
    CurrentLightState = InitPLightState;

    Roach_Init();
    StopMotors();
    Roach_BarGraph(ROACH_HIDE_LED_LEVEL);
    StableBumperState = Roach_ReadBumpers() & 0x0Fu;

    ThisEvent.EventType = ES_INIT;
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

uint8_t PostTemplateService(ES_Event ThisEvent)
{
    return ES_PostToService(MyPriority, ThisEvent);
}

ES_Event RunTemplateService(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE;
    TemplateServiceState_t nextState = CurrentState;
    ES_Event ReturnEvent = NO_EVENT;

    ES_AddTattlePoint(__FUNCTION__, TopStateNames[CurrentState], ThisEvent);
    UpdateBumperStateFromEvent(ThisEvent);

    if ((ThisEvent.EventType == ES_TIMERACTIVE) ||
            (ThisEvent.EventType == ES_TIMERSTOPPED)) {
        ES_Tail();
        return ReturnEvent;
    }

    switch (CurrentState) {
    case InitPState:
        if (ThisEvent.EventType == ES_INIT) {
            nextState = (Roach_LightLevel() >= ROACH_LIGHT_TO_DARK_THRESHOLD) ?
                    DarkModeState : LightModeState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case DarkModeState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY:
            InitDarkSubHSM();
            break;

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_RELEASE_HOLD_TIMER);
            (void)ES_Timer_StopTimer(ROACH_MOTION_TIMER);
            (void)RunDarkSubHSM(EXIT_EVENT);
            break;

        default:
            ThisEvent = RunDarkSubHSM(ThisEvent);
            if (ThisEvent.EventType == INTO_LIGHT) {
                nextState = LightModeState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;
        }
        break;

    case LightModeState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY:
            InitLightSubHSM();
            break;

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_BEHAVIOR_TIMER);
            (void)ES_Timer_StopTimer(ROACH_MOTION_TIMER);
            (void)ES_Timer_StopTimer(ROACH_RELEASE_HOLD_TIMER);
            (void)RunLightSubHSM(EXIT_EVENT);
            break;

        default:
            ThisEvent = RunLightSubHSM(ThisEvent);
            if (ThisEvent.EventType == INTO_DARK) {
                nextState = DarkModeState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;
        }
        break;

    default:
        break;
    }

    if (makeTransition == TRUE) {
        RunTemplateService(EXIT_EVENT);
        CurrentState = nextState;
        RunTemplateService(ENTRY_EVENT);
    }

    ES_Tail();
    return ReturnEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

static uint8_t InitDarkSubHSM(void)
{
    CurrentDarkState = InitPDarkState;
    return (RunDarkSubHSM(INIT_EVENT).EventType == ES_NO_EVENT) ? TRUE : FALSE;
}

static ES_Event RunDarkSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE;
    DarkSubState_t nextState = CurrentDarkState;

    ES_AddTattlePoint(__FUNCTION__, DarkStateNames[CurrentDarkState], ThisEvent);

    switch (CurrentDarkState) {
    case InitPDarkState:
        if (ThisEvent.EventType == ES_INIT) {
            nextState = DarkStillState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case DarkStillState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY: {
            uint8_t bumpMask = ReadCurrentBumpers();
            StopMotors();
            Roach_BarGraph(ROACH_HIDE_LED_LEVEL);
            if (bumpMask != 0u) {
                ConfigureDarkEscape(bumpMask);
                DarkEscapeRetryCount = 0u;
                nextState = DarkEscapeState;
                makeTransition = TRUE;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;
        }

        case BUMPED:
            ConfigureDarkEscape(GetKnownBumperMask(
                    (uint8_t)(ThisEvent.EventParam & 0x0Fu)));
            DarkEscapeRetryCount = 0u;
            nextState = DarkEscapeState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case UNBUMPED:
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        default:
            break;
        }
        break;

    case DarkEscapeState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY:
            ApplyDarkEscapeMotion();
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_RELEASE_HOLD_TIMER);
            (void)ES_Timer_StopTimer(ROACH_MOTION_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BUMPED:
            (void)ES_Timer_StopTimer(ROACH_RELEASE_HOLD_TIMER);
            ConfigureDarkEscape(GetKnownBumperMask(
                    (uint8_t)(ThisEvent.EventParam & 0x0Fu)));
            if (DarkEscapeRetryCount < 0xFFu) {
                DarkEscapeRetryCount++;
            }
            ApplyDarkEscapeMotion();
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case UNBUMPED:
            if (ReadCurrentBumpers() == 0u) {
                ES_Timer_InitTimer(ROACH_RELEASE_HOLD_TIMER,
                        ROACH_MIN_RELEASE_HOLD_MS);
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if (ThisEvent.EventParam == ROACH_RELEASE_HOLD_TIMER) {
                if (ReadCurrentBumpers() == 0u) {
                    nextState = DarkStillState;
                    makeTransition = TRUE;
                } else {
                    /* Still pressed — try another escape move */
                    if (DarkEscapeRetryCount < 0xFFu) {
                        DarkEscapeRetryCount++;
                    }
                    if (DarkEscapeRetryCount > ROACH_MAX_BUMP_RETRIES * 2u) {
                        /* Truly stuck: give up and return to still */
                        nextState = DarkStillState;
                        makeTransition = TRUE;
                    } else {
                        ConfigureDarkEscape(ReadCurrentBumpers());
                        ApplyDarkEscapeMotion();
                    }
                }
                ThisEvent.EventType = ES_NO_EVENT;
            } else if (ThisEvent.EventParam == ROACH_MOTION_TIMER) {
                if (ReadCurrentBumpers() != 0u) {
                    if (DarkEscapeRetryCount < 0xFFu) {
                        DarkEscapeRetryCount++;
                    }
                    if (DarkEscapeRetryCount > ROACH_MAX_BUMP_RETRIES * 2u) {
                        /* Truly stuck: give up and return to still */
                        nextState = DarkStillState;
                        makeTransition = TRUE;
                    } else {
                        ConfigureDarkEscape(ReadCurrentBumpers());
                        ApplyDarkEscapeMotion();
                    }
                } else {
                    ES_Timer_InitTimer(ROACH_RELEASE_HOLD_TIMER,
                            ROACH_MIN_RELEASE_HOLD_MS);
                }
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        default:
            break;
        }
        break;

    default:
        break;
    }

    if (makeTransition == TRUE) {
        RunDarkSubHSM(EXIT_EVENT);
        CurrentDarkState = nextState;
        RunDarkSubHSM(ENTRY_EVENT);
    }

    ES_Tail();
    return ThisEvent;
}

static uint8_t InitLightSubHSM(void)
{
    LightEscapeRetryCount = 0u;
    LightEscapeBumpMask = 0u;
    LightEscapeBaseSpeed = 0;
    CurrentLightState = InitPLightState;
    return (RunLightSubHSM(INIT_EVENT).EventType == ES_NO_EVENT) ? TRUE : FALSE;
}

static ES_Event RunLightSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE;
    LightSubState_t nextState = CurrentLightState;

    ES_AddTattlePoint(__FUNCTION__, LightStateNames[CurrentLightState], ThisEvent);

    switch (CurrentLightState) {
    case InitPLightState:
        if (ThisEvent.EventType == ES_INIT) {
            nextState = LightRunState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case LightRunState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY: {
            uint8_t bumpMask = ReadCurrentBumpers();
            if (bumpMask != 0u) {
                ConfigureLightEscape(bumpMask);
                nextState = LightEscapeState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                break;
            }
            DriveStraight(ROACH_RUN_SPEED);
            Roach_BarGraph(ROACH_RUN_LED_LEVEL);
            ScheduleNextLightBehavior();
            ThisEvent.EventType = ES_NO_EVENT;
            break;
        }

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_BEHAVIOR_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BUMPED:
            ConfigureLightEscape(GetKnownBumperMask(
                    (uint8_t)(ThisEvent.EventParam & 0x0Fu)));
            nextState = LightEscapeState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case UNBUMPED:
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if (ThisEvent.EventParam == ROACH_BEHAVIOR_TIMER) {
                uint8_t bumpMask = ReadCurrentBumpers();
                if (bumpMask != 0u) {
                    ConfigureLightEscape(bumpMask);
                    nextState = LightEscapeState;
                } else {
                    LightEscapeRetryCount = 0u;
                    nextState = (NextBehaviorIsDance == TRUE) ?
                            LightDanceState : LightSearchState;
                    NextBehaviorIsDance ^= TRUE;
                }
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        default:
            break;
        }
        break;

    case LightEscapeState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY:
            LightEscapePhase = LIGHT_ESCAPE_MOVE_AWAY_PHASE;
            ApplyLightEscapePhase();
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_MOTION_TIMER);
            (void)ES_Timer_StopTimer(ROACH_RELEASE_HOLD_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BUMPED:
            ConfigureLightEscape(GetKnownBumperMask(
                    (uint8_t)(ThisEvent.EventParam & 0x0Fu)));
            LightEscapePhase = LIGHT_ESCAPE_MOVE_AWAY_PHASE;
            ApplyLightEscapePhase();
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case UNBUMPED:
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if ((ThisEvent.EventParam == ROACH_MOTION_TIMER) ||
                    (ThisEvent.EventParam == ROACH_RELEASE_HOLD_TIMER)) {
                if (LightEscapePhase == LIGHT_ESCAPE_MOVE_AWAY_PHASE) {
                    LightEscapePhase = LIGHT_ESCAPE_TURN_PHASE;
                    ApplyLightEscapePhase();
                } else {
                    uint8_t bumpMask = ReadCurrentBumpers();
                    if (bumpMask != 0u) {
                        ConfigureLightEscape(bumpMask);
                        LightEscapePhase = LIGHT_ESCAPE_MOVE_AWAY_PHASE;
                        ApplyLightEscapePhase();
                    } else {
                        LightEscapeRetryCount = 0u;
                        nextState = LightRunState;
                        makeTransition = TRUE;
                    }
                }
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        default:
            break;
        }
        break;

    case LightSearchState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY: {
            uint8_t bumpMask = ReadCurrentBumpers();
            if (bumpMask != 0u) {
                ConfigureLightEscape(bumpMask);
                nextState = LightEscapeState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                break;
            }
            SearchTurnRight ^= TRUE;
            DriveArc(ROACH_SEARCH_SPEED, SearchTurnRight);
            Roach_BarGraph(ROACH_SEARCH_LED_LEVEL);
            ES_Timer_InitTimer(ROACH_BEHAVIOR_TIMER, ROACH_SEARCH_DURATION_MS);
            ThisEvent.EventType = ES_NO_EVENT;
            break;
        }

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_BEHAVIOR_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BUMPED:
            ConfigureLightEscape(GetKnownBumperMask(
                    (uint8_t)(ThisEvent.EventParam & 0x0Fu)));
            nextState = LightEscapeState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case UNBUMPED:
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if (ThisEvent.EventParam == ROACH_BEHAVIOR_TIMER) {
                LightEscapeRetryCount = 0u;
                nextState = LightRunState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        default:
            break;
        }
        break;

    case LightDanceState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY: {
            uint8_t bumpMask = ReadCurrentBumpers();
            if (bumpMask != 0u) {
                ConfigureLightEscape(bumpMask);
                nextState = LightEscapeState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                break;
            }
            DanceStep = 0u;
            ApplyDanceStep();
            ThisEvent.EventType = ES_NO_EVENT;
            break;
        }

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_BEHAVIOR_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BUMPED:
            ConfigureLightEscape(GetKnownBumperMask(
                    (uint8_t)(ThisEvent.EventParam & 0x0Fu)));
            nextState = LightEscapeState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case UNBUMPED:
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if (ThisEvent.EventParam == ROACH_BEHAVIOR_TIMER) {
                DanceStep++;
                if (DanceStep < ROACH_DANCE_STEPS) {
                    ApplyDanceStep();
                } else {
                    LightEscapeRetryCount = 0u;
                    nextState = LightRunState;
                    makeTransition = TRUE;
                }
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        default:
            break;
        }
        break;

    default:
        break;
    }

    if (makeTransition == TRUE) {
        RunLightSubHSM(EXIT_EVENT);
        CurrentLightState = nextState;
        RunLightSubHSM(ENTRY_EVENT);
    }

    ES_Tail();
    return ThisEvent;
}

static void StopMotors(void)
{
    Roach_LeftMtrSpeed(0);
    Roach_RightMtrSpeed(0);
}

static uint8_t ReadCurrentBumpers(void)
{
    return (uint8_t)(Roach_ReadBumpers() & 0x0Fu);
}

static uint8_t GetKnownBumperMask(uint8_t eventMask)
{
    uint8_t mask = StableBumperState & 0x0Fu;

    if (mask == 0u) {
        mask = (uint8_t)(eventMask & 0x0Fu);
    }
    if (mask == 0u) {
        mask = ReadCurrentBumpers();
    }
    return mask;
}

static void DriveStraight(signed char speed)
{
    Roach_LeftMtrSpeed(speed);
    Roach_RightMtrSpeed(speed);
}

static void DriveArc(signed char baseSpeed, uint8_t turnRight)
{
    signed char outerSpeed = baseSpeed;
    signed char innerSpeed = (signed char)(baseSpeed / ROACH_ESCAPE_INNER_DIVISOR);

    if (turnRight == TRUE) {
        Roach_LeftMtrSpeed(outerSpeed);
        Roach_RightMtrSpeed(innerSpeed);
    } else {
        Roach_LeftMtrSpeed(innerSpeed);
        Roach_RightMtrSpeed(outerSpeed);
    }
}

static void DrivePivot(uint8_t turnRight, signed char speed)
{
    if (turnRight == TRUE) {
        Roach_LeftMtrSpeed(speed);
        Roach_RightMtrSpeed(-speed);
    } else {
        Roach_LeftMtrSpeed(-speed);
        Roach_RightMtrSpeed(speed);
    }
}

static void UpdateBumperStateFromEvent(ES_Event ThisEvent)
{
    if (ThisEvent.EventType == BUMPED) {
        StableBumperState |= (uint8_t)(ThisEvent.EventParam & 0x0Fu);
    } else if (ThisEvent.EventType == UNBUMPED) {
        StableBumperState &= (uint8_t)(~ThisEvent.EventParam);
        StableBumperState &= 0x0Fu;
    }
}

static uint8_t ChooseTurnRight(uint8_t bumpMask)
{
    uint8_t leftSideHit = bumpMask & LEFT_SIDE_BUMPER_MASK;
    uint8_t rightSideHit = bumpMask & RIGHT_SIDE_BUMPER_MASK;
    uint8_t preferred;

    if ((leftSideHit != 0u) && (rightSideHit == 0u)) {
        preferred = TRUE;
    } else if ((rightSideHit != 0u) && (leftSideHit == 0u)) {
        preferred = FALSE;
    } else {
        preferred = NextDefaultTurnRight;
    }
    NextDefaultTurnRight ^= TRUE;
    return preferred;
}

static signed char ChooseBaseEscapeSpeed(uint8_t bumpMask, signed char magnitude)
{
    uint8_t frontHit = bumpMask & FRONT_BUMPER_MASK;
    uint8_t rearHit = bumpMask & REAR_BUMPER_MASK;

    if ((frontHit != 0u) && (rearHit == 0u)) {
        return (signed char)(-magnitude);
    }
    if ((rearHit != 0u) && (frontHit == 0u)) {
        return magnitude;
    }
    return 0;
}

static void ScheduleNextLightBehavior(void)
{
    ES_Timer_InitTimer(ROACH_BEHAVIOR_TIMER, ChooseBehaviorDelay());
}

static uint16_t ChooseBehaviorDelay(void)
{
    return (uint16_t)(ROACH_BEHAVIOR_MIN_MS +
            (ES_Timer_GetTime() % (ROACH_BEHAVIOR_SPAN_MS + 1u)));
}

static uint16_t GetDarkEscapeStepTime(void)
{
    uint16_t extraTime = (uint16_t)((DarkEscapeRetryCount & 0x03u) * 120u);
    return (uint16_t)(ROACH_DARK_ESCAPE_STEP_MS + extraTime);
}

static uint16_t GetLightEscapeDriveTime(void)
{
    uint8_t severity = LightEscapeRetryCount;
    if (severity > ROACH_MAX_ESCAPE_SEVERITY) {
        severity = ROACH_MAX_ESCAPE_SEVERITY;
    }
    return (uint16_t)(ROACH_BASE_ESCAPE_DRIVE_MS +
            (severity * ROACH_ESCAPE_MS_PER_SEVERITY));
}

static uint16_t GetLightEscapeTurnTime(void)
{
    uint8_t severity = LightEscapeRetryCount;
    if (severity > ROACH_MAX_ESCAPE_SEVERITY) {
        severity = ROACH_MAX_ESCAPE_SEVERITY;
    }
    return (uint16_t)(ROACH_BASE_ESCAPE_TURN_MS +
            (severity * ROACH_ESCAPE_MS_PER_SEVERITY));
}

static void ConfigureDarkEscape(uint8_t bumpMask)
{
    if (bumpMask == 0u) {
        bumpMask = ReadCurrentBumpers();
    }
    DarkEscapeBumpMask = bumpMask;
    DarkEscapeTurnRight = ChooseTurnRight(bumpMask);
    DarkEscapeBaseSpeed = ChooseBaseEscapeSpeed(bumpMask, ROACH_DARK_ESCAPE_SPEED);
}

static void ApplyDarkEscapeMotion(void)
{
    Roach_BarGraph(ROACH_DARK_ESCAPE_LED_LEVEL);

    if (DarkEscapeRetryCount >= ROACH_MAX_BUMP_RETRIES) {
        if ((DarkEscapeRetryCount & 0x01u) == 0u) {
            if (DarkEscapeBaseSpeed != 0) {
                DriveStraight(DarkEscapeBaseSpeed);
            } else {
                DriveStraight((DarkEscapeTurnRight == TRUE) ?
                        ROACH_DARK_ESCAPE_SPEED : (signed char)(-ROACH_DARK_ESCAPE_SPEED));
            }
        } else {
            DrivePivot((uint8_t)(!DarkEscapeTurnRight), ROACH_DARK_ESCAPE_SPEED);
        }
        ES_Timer_InitTimer(ROACH_MOTION_TIMER, GetDarkEscapeStepTime());
        return;
    }

    switch (DarkEscapeRetryCount & 0x03u) {
    case 0u:
        if (DarkEscapeBaseSpeed != 0) {
            DriveStraight(DarkEscapeBaseSpeed);
        } else {
            DrivePivot(DarkEscapeTurnRight, ROACH_DARK_ESCAPE_SPEED);
        }
        break;

    case 1u:
        DrivePivot(DarkEscapeTurnRight, ROACH_DARK_ESCAPE_SPEED);
        break;

    case 2u:
        if (DarkEscapeBaseSpeed != 0) {
            DriveStraight(DarkEscapeBaseSpeed);
        } else {
            DrivePivot((uint8_t)(!DarkEscapeTurnRight), ROACH_DARK_ESCAPE_SPEED);
        }
        break;

    default:
        if (DarkEscapeBumpMask == (FRONT_BUMPER_MASK | REAR_BUMPER_MASK)) {
            DriveStraight(-ROACH_DARK_ESCAPE_SPEED);
        } else {
            DrivePivot((uint8_t)(!DarkEscapeTurnRight), ROACH_DARK_ESCAPE_SPEED);
        }
        break;
    }
    ES_Timer_InitTimer(ROACH_MOTION_TIMER, GetDarkEscapeStepTime());
}

static void ConfigureLightEscape(uint8_t bumpMask)
{
    if (bumpMask == 0u) {
        bumpMask = ReadCurrentBumpers();
    }
    LightEscapeBumpMask = bumpMask;
    if (LightEscapeRetryCount < ROACH_MAX_BUMP_RETRIES) {
        LightEscapeRetryCount++;
    }
    LightEscapeTurnRight = ChooseTurnRight(bumpMask);
    LightEscapeBaseSpeed = ChooseBaseEscapeSpeed(bumpMask, ROACH_LIGHT_ESCAPE_SPEED);
}

static void ApplyLightEscapePhase(void)
{
    uint16_t phaseTime;

    Roach_BarGraph(ROACH_LIGHT_ESCAPE_LED_LEVEL);

    if (LightEscapePhase == LIGHT_ESCAPE_MOVE_AWAY_PHASE) {
        if (LightEscapeBaseSpeed != 0) {
            DriveStraight(LightEscapeBaseSpeed);
        } else {
            DrivePivot(LightEscapeTurnRight, ROACH_LIGHT_PIVOT_SPEED);
        }
        phaseTime = GetLightEscapeDriveTime();
        ES_Timer_InitTimer(ROACH_MOTION_TIMER, phaseTime);
    } else {
        DrivePivot(LightEscapeTurnRight, ROACH_LIGHT_PIVOT_SPEED);
        phaseTime = GetLightEscapeTurnTime();
        ES_Timer_InitTimer(ROACH_MOTION_TIMER, phaseTime);
    }

    /* Backup timeout so LightEscapeState always progresses even if one timer
       event is missed in the queue. */
    ES_Timer_InitTimer(ROACH_RELEASE_HOLD_TIMER,
            (uint16_t)(phaseTime + ROACH_ESCAPE_WATCHDOG_MARGIN_MS));
}

static void ApplyDanceStep(void)
{
    static const signed char DanceTable[ROACH_DANCE_STEPS][2] = {
        {75, -75},
        {-75, 75},
        {75, -75},
        {-75, 75},
    };

    Roach_LeftMtrSpeed(DanceTable[DanceStep][0]);
    Roach_RightMtrSpeed(DanceTable[DanceStep][1]);
    Roach_BarGraph(ROACH_DANCE_LED_LEVEL);
    ES_Timer_InitTimer(ROACH_BEHAVIOR_TIMER, ROACH_DANCE_STEP_MS);
}
