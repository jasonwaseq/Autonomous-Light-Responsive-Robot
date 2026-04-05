/*
 * File:   TemplateEventChecker.c
 * Author: Gabriel Hugh Elkaim
 *
 * Template file to set up typical EventCheckers for the  Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the
 * names will have to be changed to match your code.
 *
 * This EventCheckers file will work with both FSM's and HSM's.
 *
 * Remember that EventCheckers should only return TRUE when an event has occured,
 * and that the event is a TRANSITION between two detectable differences. They
 * should also be atomic and run as fast as possible for good results.
 *
 * This file includes a test harness that will run the event detectors listed in the
 * ES_Configure file in the project, and will conditionally compile main if the macro
 * EVENTCHECKER_TEST is defined (either in the project or in the file). This will allow
 * you to check you event detectors in their own project, and then leave them untouched
 * for your project unless you need to alter their post functions.
 *
 * Created on September 27, 2013, 8:37 AM
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "TemplateEventChecker.h"
#include "ES_Events.h"
#include "serial.h"
#include "roach.h"
#ifndef EVENTCHECKER_TEST
#include "ES_Framework.h"
#endif

/*******************************************************************************
 * EVENTCHECKER_TEST SPECIFIC CODE                                                             *
 ******************************************************************************/

//#define EVENTCHECKER_TEST
#ifdef EVENTCHECKER_TEST
#include <stdio.h>

static const char *eventName;
static ES_Event storedEvent;
#endif

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
static uint8_t PostDetectedEvent(ES_Event thisEvent, const char *eventSource);

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

#define NUM_BUMPERS 4u
#define BUMPER_HISTORY_BITS 4u
#define BUMPER_HISTORY_MASK ((1u << BUMPER_HISTORY_BITS) - 1u)

static uint8_t LightInitialized = FALSE;
static uint8_t LastLightWasDark = FALSE;
static uint8_t BumperInitialized = FALSE;
static uint8_t StableBumperState = 0u;
static uint8_t PendingBumpedMask = 0u;
static uint8_t PendingUnbumpedMask = 0u;
static uint8_t BumperHistory[NUM_BUMPERS];
static uint8_t PendingLightEventValid = FALSE;
static ES_Event PendingLightEvent;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

uint8_t TemplateCheckBumpers(void)
{
    ES_Event thisEvent;
    uint8_t i;
    uint8_t rawBumpers = Roach_ReadBumpers() & 0x0Fu;
    uint8_t newlyBumped = 0u;
    uint8_t newlyReleased = 0u;

    if (PendingBumpedMask != 0u) {
        thisEvent.EventType = BUMPED;
        thisEvent.EventParam = PendingBumpedMask;
        if (PostDetectedEvent(thisEvent, __func__) == TRUE) {
            PendingBumpedMask = 0u;
            return TRUE;
        }
        return FALSE;
    }

    if (PendingUnbumpedMask != 0u) {
        thisEvent.EventType = UNBUMPED;
        thisEvent.EventParam = PendingUnbumpedMask;
        if (PostDetectedEvent(thisEvent, __func__) == TRUE) {
            PendingUnbumpedMask = 0u;
            return TRUE;
        }
        return FALSE;
    }

    if (BumperInitialized == FALSE) {
        StableBumperState = rawBumpers;
        for (i = 0; i < NUM_BUMPERS; i++) {
            BumperHistory[i] = (rawBumpers & (1u << i)) ? BUMPER_HISTORY_MASK : 0u;
        }
        BumperInitialized = TRUE;
        return FALSE;
    }

    for (i = 0; i < NUM_BUMPERS; i++) {
        uint8_t mask = (uint8_t)(1u << i);
        uint8_t sample = (rawBumpers & mask) ? 1u : 0u;
        uint8_t stableSample = (StableBumperState & mask) ? 1u : 0u;

        BumperHistory[i] = (uint8_t)(((BumperHistory[i] << 1) | sample) &
                BUMPER_HISTORY_MASK);

        if ((BumperHistory[i] == BUMPER_HISTORY_MASK) && (stableSample == 0u)) {
            StableBumperState |= mask;
            newlyBumped |= mask;
        } else if ((BumperHistory[i] == 0u) && (stableSample != 0u)) {
            StableBumperState &= (uint8_t)(~mask);
            newlyReleased |= mask;
        }
    }

    if (newlyBumped != 0u) {
        PendingBumpedMask |= newlyBumped;
        PendingUnbumpedMask |= newlyReleased;
        thisEvent.EventType = BUMPED;
        thisEvent.EventParam = PendingBumpedMask;
        if (PostDetectedEvent(thisEvent, __func__) == TRUE) {
            PendingBumpedMask = 0u;
            return TRUE;
        }
        return FALSE;
    }

    if (newlyReleased != 0u) {
        PendingUnbumpedMask |= newlyReleased;
        thisEvent.EventType = UNBUMPED;
        thisEvent.EventParam = PendingUnbumpedMask;
        if (PostDetectedEvent(thisEvent, __func__) == TRUE) {
            PendingUnbumpedMask = 0u;
            return TRUE;
        }
        return FALSE;
    }

    return FALSE;
}

uint8_t TemplateCheckLight(void)
{
    ES_Event thisEvent;
    uint16_t lightLevel = Roach_LightLevel();

    if (PendingLightEventValid == TRUE) {
        if (PostDetectedEvent(PendingLightEvent, __func__) == TRUE) {
            PendingLightEventValid = FALSE;
            return TRUE;
        }
        return FALSE;
    }

    if (LightInitialized == FALSE) {
        LastLightWasDark = (lightLevel >= ROACH_LIGHT_TO_DARK_THRESHOLD) ? TRUE : FALSE;
        LightInitialized = TRUE;
        return FALSE;
    }

    if (LastLightWasDark == FALSE) {
        if (lightLevel >= ROACH_LIGHT_TO_DARK_THRESHOLD) {
            LastLightWasDark = TRUE;
            PendingLightEvent.EventType = INTO_DARK;
            PendingLightEvent.EventParam = lightLevel;
            PendingLightEventValid = TRUE;
            if (PostDetectedEvent(PendingLightEvent, __func__) == TRUE) {
                PendingLightEventValid = FALSE;
                return TRUE;
            }
            return FALSE;
        }
    } else {
        if (lightLevel <= ROACH_DARK_TO_LIGHT_THRESHOLD) {
            LastLightWasDark = FALSE;
            PendingLightEvent.EventType = INTO_LIGHT;
            PendingLightEvent.EventParam = lightLevel;
            PendingLightEventValid = TRUE;
            if (PostDetectedEvent(PendingLightEvent, __func__) == TRUE) {
                PendingLightEventValid = FALSE;
                return TRUE;
            }
            return FALSE;
        }
    }

    return FALSE;
}

/* 
 * The Test Harness for the event checkers is conditionally compiled using
 * the EVENTCHECKER_TEST macro (defined either in the file or at the project level).
 * No other main() can exist within the project.
 * 
 * It requires a valid ES_Configure.h file in the project with the correct events in 
 * the enum, and the correct list of event checkers in the EVENT_CHECK_LIST.
 * 
 * The test harness will run each of your event detectors identically to the way the
 * ES_Framework will call them, and if an event is detected it will print out the function
 * name, event, and event parameter. Use this to test your event checking code and
 * ensure that it is fully functional.
 * 
 * If you are locking up the output, most likely you are generating too many events.
 * Remember that events are detectable changes, not a state in itself.
 * 
 * Once you have fully tested your event checking code, you can leave it in its own
 * project and point to it from your other projects. If the EVENTCHECKER_TEST marco is
 * defined in the project, no changes are necessary for your event checkers to work
 * with your other projects.
 */
#ifdef EVENTCHECKER_TEST
static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};

void PrintEvent(void);

void main(void) {
    int i;

    BOARD_Init();
    Roach_Init();

    printf("\r\nEvent checking test harness for %s", __FILE__);
    printf("\r\nLight hysteresis: into dark >= %u, into light <= %u.",
            ROACH_LIGHT_TO_DARK_THRESHOLD, ROACH_DARK_TO_LIGHT_THRESHOLD);

    while (1) {
        if (IsTransmitEmpty()) {
            for (i = 0; i< sizeof (EventList) >> 2; i++) {
                if (EventList[i]() == TRUE) {
                    PrintEvent();
                    break;
                }

            }
        }
    }
}

void PrintEvent(void) {
    printf("\r\nFunc: %s\tEvent: %s\tParam: 0x%X", eventName,
            EventNames[storedEvent.EventType], storedEvent.EventParam);
}
#endif

static uint8_t PostDetectedEvent(ES_Event thisEvent, const char *eventSource)
{
#ifndef EVENTCHECKER_TEST
    (void)eventSource;
    return ES_PostAll(thisEvent);
#else
    eventName = eventSource;
    storedEvent = thisEvent;
    return TRUE;
#endif
}
