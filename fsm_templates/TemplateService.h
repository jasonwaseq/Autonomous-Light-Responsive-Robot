/*
 * File: TemplateService.h
 */

#ifndef TemplateService_H
#define TemplateService_H

#include "ES_Configure.h"

uint8_t InitTemplateService(uint8_t Priority);
uint8_t PostTemplateService(ES_Event ThisEvent);
ES_Event RunTemplateService(ES_Event ThisEvent);

#endif

