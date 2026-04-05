#include "ES_Configure.h"
#include "TemplateEventChecker.h"
#include "ES_Events.h"
#include "roach.h"
#ifndef EVENTCHECKER_TEST
#include "ES_Framework.h"
#endif

#define NUM_BUMPERS 4u
#define BUMPER_HISTORY_BITS 4u
#define BUMPER_HISTORY_MASK ((1u << BUMPER_HISTORY_BITS) - 1u)

static uint8_t LightInitialized = FALSE;
static uint8_t LastLightWasDark = FALSE;
static uint8_t BumperInitialized = FALSE;
static uint8_t StableBumperState = 0u;
static uint8_t PendingUnbumpedMask = 0u;
static uint8_t BumperHistory[NUM_BUMPERS];

static uint8_t PostDetectedEvent(ES_Event thisEvent);
static uint8_t ReadCurrentBumpers(void);

uint8_t TemplateCheckBumpers(void)
{
    ES_Event thisEvent;
    uint8_t i;
    uint8_t rawBumpers = ReadCurrentBumpers();
    uint8_t newlyBumped = 0u;
    uint8_t newlyReleased = 0u;

    if (PendingUnbumpedMask != 0u) {
        thisEvent.EventType = UNBUMPED;
        thisEvent.EventParam = PendingUnbumpedMask;
        PendingUnbumpedMask = 0u;
        return PostDetectedEvent(thisEvent);
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
        thisEvent.EventType = BUMPED;
        thisEvent.EventParam = newlyBumped;
        PendingUnbumpedMask |= newlyReleased;
        return PostDetectedEvent(thisEvent);
    }

    if (newlyReleased != 0u) {
        thisEvent.EventType = UNBUMPED;
        thisEvent.EventParam = newlyReleased;
        return PostDetectedEvent(thisEvent);
    }

    return FALSE;
}

uint8_t TemplateCheckLight(void)
{
    ES_Event thisEvent;
    uint16_t lightLevel = Roach_LightLevel();

    if (LightInitialized == FALSE) {
        LastLightWasDark = (lightLevel >= ROACH_LIGHT_TO_DARK_THRESHOLD) ? TRUE : FALSE;
        LightInitialized = TRUE;
        return FALSE;
    }

    if (LastLightWasDark == FALSE) {
        if (lightLevel >= ROACH_LIGHT_TO_DARK_THRESHOLD) {
            LastLightWasDark = TRUE;
            thisEvent.EventType = INTO_DARK;
            thisEvent.EventParam = lightLevel;
            return PostDetectedEvent(thisEvent);
        }
    } else if (lightLevel <= ROACH_DARK_TO_LIGHT_THRESHOLD) {
        LastLightWasDark = FALSE;
        thisEvent.EventType = INTO_LIGHT;
        thisEvent.EventParam = lightLevel;
        return PostDetectedEvent(thisEvent);
    }

    return FALSE;
}

static uint8_t PostDetectedEvent(ES_Event thisEvent)
{
#ifndef EVENTCHECKER_TEST
    return ES_PostAll(thisEvent);
#else
    return TRUE;
#endif
}

static uint8_t ReadCurrentBumpers(void)
{
    uint8_t bumperState = 0u;

    if (Roach_ReadFrontLeftBumper() == BUMPER_TRIPPED) {
        bumperState |= (1u << 0);
    }
    if (Roach_ReadFrontRightBumper() == BUMPER_TRIPPED) {
        bumperState |= (1u << 1);
    }
    if (Roach_ReadRearLeftBumper() == BUMPER_TRIPPED) {
        bumperState |= (1u << 2);
    }
    if (Roach_ReadRearRightBumper() == BUMPER_TRIPPED) {
        bumperState |= (1u << 3);
    }

    return bumperState;
}

