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
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define NUM_BUMPERS 4u

#define FRONT_LEFT_BUMPER_MASK  (1u << 0)
#define FRONT_RIGHT_BUMPER_MASK (1u << 1)
#define REAR_LEFT_BUMPER_MASK   (1u << 2)
#define REAR_RIGHT_BUMPER_MASK  (1u << 3)

/*
 * Higher ADC readings mean less light on this sensor.
 * This single threshold is intentionally naive so the detector can chatter
 * when the sensor hovers near the boundary.
 */
#define LIGHT_DARK_THRESHOLD 650u

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
static uint8_t CheckBumperTransition(uint8_t bumperIndex, uint8_t bumperMask,
        uint8_t currentState, const char *eventSource);
static uint8_t PostDetectedEvent(ES_Event thisEvent, const char *eventSource);

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

static uint8_t LastBumperStates[NUM_BUMPERS];
static uint8_t BumperInitialized[NUM_BUMPERS];
static uint8_t LightInitialized = FALSE;
static uint8_t LastLightWasDark = FALSE;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

uint8_t TemplateCheckFrontLeftBumper(void)
{
    return CheckBumperTransition(0u, FRONT_LEFT_BUMPER_MASK,
            Roach_ReadFrontLeftBumper(), __func__);
}

uint8_t TemplateCheckFrontRightBumper(void)
{
    return CheckBumperTransition(1u, FRONT_RIGHT_BUMPER_MASK,
            Roach_ReadFrontRightBumper(), __func__);
}

uint8_t TemplateCheckRearLeftBumper(void)
{
    return CheckBumperTransition(2u, REAR_LEFT_BUMPER_MASK,
            Roach_ReadRearLeftBumper(), __func__);
}

uint8_t TemplateCheckRearRightBumper(void)
{
    return CheckBumperTransition(3u, REAR_RIGHT_BUMPER_MASK,
            Roach_ReadRearRightBumper(), __func__);
}

uint8_t TemplateCheckLight(void)
{
    ES_Event thisEvent;
    uint16_t lightLevel = Roach_LightLevel();
    uint8_t lightIsDark = (lightLevel > LIGHT_DARK_THRESHOLD) ? TRUE : FALSE;

    if (LightInitialized == FALSE) {
        LastLightWasDark = lightIsDark;
        LightInitialized = TRUE;
        return FALSE;
    }

    if (lightIsDark == LastLightWasDark) {
        return FALSE;
    }

    LastLightWasDark = lightIsDark;
    thisEvent.EventType = lightIsDark ? INTO_DARK : INTO_LIGHT;
    thisEvent.EventParam = lightLevel;
    return PostDetectedEvent(thisEvent, __func__);
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
    printf("\r\nLight threshold is %u (higher ADC means darker).",
            LIGHT_DARK_THRESHOLD);

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

/*******************************************************************************
 * PRIVATE FUNCTIONs                                                           *
 ******************************************************************************/

static uint8_t CheckBumperTransition(uint8_t bumperIndex, uint8_t bumperMask,
        uint8_t currentState, const char *eventSource)
{
    ES_Event thisEvent;

    if (BumperInitialized[bumperIndex] == FALSE) {
        LastBumperStates[bumperIndex] = currentState;
        BumperInitialized[bumperIndex] = TRUE;
        return FALSE;
    }

    if (currentState == LastBumperStates[bumperIndex]) {
        return FALSE;
    }

    LastBumperStates[bumperIndex] = currentState;
    thisEvent.EventType = (currentState == BUMPER_TRIPPED) ? BUMPED : UNBUMPED;
    thisEvent.EventParam = bumperMask;
    return PostDetectedEvent(thisEvent, eventSource);
}

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
