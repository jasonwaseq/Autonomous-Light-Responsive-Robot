#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "TemplateEventChecker.h"
#include "TemplateService.h"
#include "roach.h"

#define FRONT_LEFT_BUMPER_MASK  (1u << 0)
#define FRONT_RIGHT_BUMPER_MASK (1u << 1)
#define REAR_LEFT_BUMPER_MASK   (1u << 2)
#define REAR_RIGHT_BUMPER_MASK  (1u << 3)
#define LEFT_SIDE_BUMPER_MASK (FRONT_LEFT_BUMPER_MASK | REAR_LEFT_BUMPER_MASK)
#define RIGHT_SIDE_BUMPER_MASK (FRONT_RIGHT_BUMPER_MASK | REAR_RIGHT_BUMPER_MASK)
#define FRONT_BUMPER_MASK (FRONT_LEFT_BUMPER_MASK | FRONT_RIGHT_BUMPER_MASK)
#define REAR_BUMPER_MASK (REAR_LEFT_BUMPER_MASK | REAR_RIGHT_BUMPER_MASK)

#define ROACH_HIDE_LED_LEVEL 0u
#define ROACH_RUN_LED_LEVEL 12u
#define ROACH_ESCAPE_LED_LEVEL 6u

#define ROACH_RUN_SPEED 70
#define ROACH_ESCAPE_SPEED 65
#define ROACH_TURN_SPEED 70
#define ROACH_LIGHT_POLL_MS 100u
#define ROACH_BACKUP_MS 220u
#define ROACH_TURN_MS 260u

typedef enum {
    InitPState,
    HidingState,
    RunningState,
    BackingState,
    TurningState,
} TemplateServiceState_t;

static const char *StateNames[] = {
    "InitPState",
    "HidingState",
    "RunningState",
    "BackingState",
    "TurningState",
};

static uint8_t MyPriority;
static uint8_t EscapeTurnRight = TRUE;
static signed char EscapeSpeed = -ROACH_ESCAPE_SPEED;
static TemplateServiceState_t CurrentState = InitPState;

static void StopMotors(void);
static void DriveStraight(signed char speed);
static void DrivePivot(uint8_t turnRight, signed char speed);
static uint8_t ReadCurrentBumpers(void);
static uint8_t ResolveBumpMask(ES_Event ThisEvent);
static uint8_t ChooseTurnRight(uint8_t bumpMask);
static signed char ChooseEscapeSpeed(uint8_t bumpMask);
static void ConfigureEscape(uint8_t bumpMask);

uint8_t InitTemplateService(uint8_t Priority)
{
    ES_Event ThisEvent;

    MyPriority = Priority;
    CurrentState = InitPState;
    Roach_Init();
    StopMotors();
    Roach_BarGraph(ROACH_HIDE_LED_LEVEL);

    ThisEvent.EventType = ES_INIT;
    return ES_PostToService(MyPriority, ThisEvent);
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

    ES_Tattle();

    if ((ThisEvent.EventType == ES_TIMERACTIVE) ||
            (ThisEvent.EventType == ES_TIMERSTOPPED)) {
        ES_Tail();
        return ReturnEvent;
    }

    switch (CurrentState) {
    case InitPState:
        if (ThisEvent.EventType == ES_INIT) {
            nextState = (Roach_LightLevel() >= ROACH_LIGHT_TO_DARK_THRESHOLD) ?
                    HidingState : RunningState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case HidingState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY:
            StopMotors();
            Roach_BarGraph(ROACH_HIDE_LED_LEVEL);
            ES_Timer_InitTimer(GENERIC_NAMED_TIMER, ROACH_LIGHT_POLL_MS);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_EXIT:
            (void) ES_Timer_StopTimer(GENERIC_NAMED_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case INTO_LIGHT:
            nextState = RunningState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if (ThisEvent.EventParam == GENERIC_NAMED_TIMER) {
                if (Roach_LightLevel() < ROACH_LIGHT_TO_DARK_THRESHOLD) {
                    nextState = RunningState;
                    makeTransition = TRUE;
                } else {
                    ES_Timer_InitTimer(GENERIC_NAMED_TIMER, ROACH_LIGHT_POLL_MS);
                }
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        case BUMPED:
        case UNBUMPED:
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        default:
            break;
        }
        break;

    case RunningState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY:
            DriveStraight(ROACH_RUN_SPEED);
            Roach_BarGraph(ROACH_RUN_LED_LEVEL);
            ES_Timer_InitTimer(GENERIC_NAMED_TIMER, ROACH_LIGHT_POLL_MS);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_EXIT:
            (void) ES_Timer_StopTimer(GENERIC_NAMED_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case INTO_DARK:
            nextState = HidingState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if (ThisEvent.EventParam == GENERIC_NAMED_TIMER) {
                if (Roach_LightLevel() >= ROACH_LIGHT_TO_DARK_THRESHOLD) {
                    nextState = HidingState;
                    makeTransition = TRUE;
                } else {
                    ES_Timer_InitTimer(GENERIC_NAMED_TIMER, ROACH_LIGHT_POLL_MS);
                }
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        case BUMPED:
            ConfigureEscape(ResolveBumpMask(ThisEvent));
            nextState = BackingState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        default:
            break;
        }
        break;

    case BackingState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY:
            DriveStraight(EscapeSpeed);
            Roach_BarGraph(ROACH_ESCAPE_LED_LEVEL);
            ES_Timer_InitTimer(ROACH_BACKUP_TIMER, ROACH_BACKUP_MS);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_BACKUP_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case INTO_DARK:
            nextState = HidingState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BUMPED:
            ConfigureEscape(ResolveBumpMask(ThisEvent));
            makeTransition = TRUE;
            nextState = BackingState;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if (ThisEvent.EventParam == ROACH_BACKUP_TIMER) {
                nextState = TurningState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        default:
            break;
        }
        break;

    case TurningState:
        switch (ThisEvent.EventType) {
        case ES_ENTRY:
            DrivePivot(EscapeTurnRight, ROACH_TURN_SPEED);
            Roach_BarGraph(ROACH_ESCAPE_LED_LEVEL);
            ES_Timer_InitTimer(ROACH_TURN_TIMER, ROACH_TURN_MS);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_EXIT:
            (void)ES_Timer_StopTimer(ROACH_TURN_TIMER);
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case INTO_DARK:
            nextState = HidingState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BUMPED:
            ConfigureEscape(ResolveBumpMask(ThisEvent));
            nextState = BackingState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ES_TIMEOUT:
            if (ThisEvent.EventParam == ROACH_TURN_TIMER) {
                nextState = RunningState;
                makeTransition = TRUE;
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
        RunTemplateService(EXIT_EVENT);
        CurrentState = nextState;
        RunTemplateService(ENTRY_EVENT);
    }

    ES_Tail();
    return ReturnEvent;
}

static void StopMotors(void)
{
    Roach_LeftMtrSpeed(0);
    Roach_RightMtrSpeed(0);
}

static void DriveStraight(signed char speed)
{
    Roach_LeftMtrSpeed(speed);
    Roach_RightMtrSpeed(speed);
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

static uint8_t ReadCurrentBumpers(void)
{
    uint8_t bumperState = 0u;

    if (Roach_ReadFrontLeftBumper() == BUMPER_TRIPPED) {
        bumperState |= FRONT_LEFT_BUMPER_MASK;
    }
    if (Roach_ReadFrontRightBumper() == BUMPER_TRIPPED) {
        bumperState |= FRONT_RIGHT_BUMPER_MASK;
    }
    if (Roach_ReadRearLeftBumper() == BUMPER_TRIPPED) {
        bumperState |= REAR_LEFT_BUMPER_MASK;
    }
    if (Roach_ReadRearRightBumper() == BUMPER_TRIPPED) {
        bumperState |= REAR_RIGHT_BUMPER_MASK;
    }

    return bumperState;
}

static uint8_t ResolveBumpMask(ES_Event ThisEvent)
{
    return (uint8_t)((ReadCurrentBumpers() |
            (uint8_t)(ThisEvent.EventParam & 0x0Fu)) & 0x0Fu);
}

static uint8_t ChooseTurnRight(uint8_t bumpMask)
{
    uint8_t leftSideHit = bumpMask & LEFT_SIDE_BUMPER_MASK;
    uint8_t rightSideHit = bumpMask & RIGHT_SIDE_BUMPER_MASK;

    if ((leftSideHit != 0u) && (rightSideHit == 0u)) {
        return TRUE;
    }
    if ((rightSideHit != 0u) && (leftSideHit == 0u)) {
        return FALSE;
    }
    return TRUE;
}

static signed char ChooseEscapeSpeed(uint8_t bumpMask)
{
    if ((bumpMask & FRONT_BUMPER_MASK) != 0u) {
        return (signed char)(-ROACH_ESCAPE_SPEED);
    }
    if ((bumpMask & REAR_BUMPER_MASK) != 0u) {
        return ROACH_ESCAPE_SPEED;
    }
    return (signed char)(-ROACH_ESCAPE_SPEED);
}

static void ConfigureEscape(uint8_t bumpMask)
{
    if (bumpMask == 0u) {
        bumpMask = ReadCurrentBumpers();
    }
    EscapeTurnRight = ChooseTurnRight(bumpMask);
    EscapeSpeed = ChooseEscapeSpeed(bumpMask);
}
