#include <BOARD.h>
#include "ES_Configure.h"
#include "ES_Framework.h"
#include <stdio.h>

void main(void)
{
    BOARD_Init();

    printf("Starting ES_Framework Part 7 FSM harness\r\n");
    if (ES_Initialize() == Success) {
        (void)ES_Run();
    }

    printf("Framework initialization failed\r\n");

    for (;;)
        ;
}

