#ifndef TEMPLATEEVENTCHECKER_H
#define	TEMPLATEEVENTCHECKER_H

#include "ES_Configure.h"
#include "BOARD.h"

#define ROACH_LIGHT_TO_DARK_THRESHOLD 650u
#define ROACH_DARK_TO_LIGHT_THRESHOLD 550u

uint8_t TemplateCheckBumpers(void);
uint8_t TemplateCheckLight(void);

#endif

