/****************************************************************************
 Module
     ES_Configure.h
 *****************************************************************************/

#ifndef CONFIGURE_H
#define CONFIGURE_H

#define USE_TATTLETALE

typedef enum {
    ES_NO_EVENT, ES_ERROR,
    ES_INIT,
    ES_ENTRY,
    ES_EXIT,
    ES_KEYINPUT,
    ES_LISTEVENTS,
    ES_TIMEOUT,
    ES_TIMERACTIVE,
    ES_TIMERSTOPPED,
    BUMPED,
    UNBUMPED,
    INTO_LIGHT,
    INTO_DARK,
    NUMBEROFEVENTS,
} ES_EventTyp_t;

static const char *EventNames[] = {
    "ES_NO_EVENT",
    "ES_ERROR",
    "ES_INIT",
    "ES_ENTRY",
    "ES_EXIT",
    "ES_KEYINPUT",
    "ES_LISTEVENTS",
    "ES_TIMEOUT",
    "ES_TIMERACTIVE",
    "ES_TIMERSTOPPED",
    "BUMPED",
    "UNBUMPED",
    "INTO_LIGHT",
    "INTO_DARK",
    "NUMBEROFEVENTS",
};

#define EVENT_CHECK_HEADER "TemplateEventChecker.h"
#define EVENT_CHECK_LIST  TemplateCheckBumpers, TemplateCheckLight

#define TIMER_UNUSED ((pPostFunc)0)
#define TIMER0_RESP_FUNC PostTemplateService
#define TIMER1_RESP_FUNC PostTemplateService
#define TIMER2_RESP_FUNC PostTemplateService
#define TIMER3_RESP_FUNC TIMER_UNUSED
#define TIMER4_RESP_FUNC TIMER_UNUSED
#define TIMER5_RESP_FUNC TIMER_UNUSED
#define TIMER6_RESP_FUNC TIMER_UNUSED
#define TIMER7_RESP_FUNC TIMER_UNUSED
#define TIMER8_RESP_FUNC TIMER_UNUSED
#define TIMER9_RESP_FUNC TIMER_UNUSED
#define TIMER10_RESP_FUNC TIMER_UNUSED
#define TIMER11_RESP_FUNC TIMER_UNUSED
#define TIMER12_RESP_FUNC TIMER_UNUSED
#define TIMER13_RESP_FUNC TIMER_UNUSED
#define TIMER14_RESP_FUNC TIMER_UNUSED
#define TIMER15_RESP_FUNC TIMER_UNUSED

#define GENERIC_NAMED_TIMER 0
#define ROACH_BACKUP_TIMER 1
#define ROACH_TURN_TIMER 2

#define MAX_NUM_SERVICES 8
#define NUM_SERVICES 1

#define SERV_0_HEADER "TemplateService.h"
#define SERV_0_INIT InitTemplateService
#define SERV_0_RUN RunTemplateService
#define SERV_0_QUEUE_SIZE 16

#define POST_KEY_FUNC ES_PostAll
#define NUM_DIST_LISTS 0

#endif
