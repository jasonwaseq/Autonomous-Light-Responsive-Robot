#include <BOARD.h>
#include <stdio.h>

#include "RoachHardwareExplorer.h"

void main(void)
{
    BOARD_Init();

    printf("Starting Roach hardware exploration harness\r\n");
    RunRoachHardwareExplorer();

    for (;;)
        ;
}

/*------------------------------- Footnotes -------------------------------*/
/*------------------------------ End of file ------------------------------*/
