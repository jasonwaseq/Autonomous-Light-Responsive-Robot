#include <BOARD.h>
#include <roach.h>
#include <serial.h>
#include <stdio.h>
#include <xc.h>

#include "RoachHardwareExplorer.h"

#define LED_BAR_COUNT 12u
#define LIGHT_SENSOR_MAX 1023u
#define MOTOR_SWEEP_DELAY 2800000u
#define MIN_LIGHT_SPAN_FOR_SCALING 32u

#define FRONT_LEFT_BUMPER_MASK  (1u << 0)
#define FRONT_RIGHT_BUMPER_MASK (1u << 1)
#define REAR_LEFT_BUMPER_MASK   (1u << 2)
#define REAR_RIGHT_BUMPER_MASK  (1u << 3)

static void BusyDelay(unsigned int cycles);
static char PollSerialChar(void);
static char PollStopChar(void);
static void FlushSerialInput(void);
static unsigned char ScaleLightToLedBar(unsigned int lightLevel);
static void ResetLightCalibration(void);
static void UpdateLightCalibration(unsigned int lightLevel);
static void StopMotors(void);
static unsigned char ReadBumpersFromIndividualSensors(void);
static void PrintHelp(void);
static void PrintBumperStates(unsigned char bumperState);
static void ShowBumpersOnce(void);
static void MonitorBumpers(void);
static void ShowLightOnce(void);
static void MonitorLight(void);
static void RunLedSweep(void);
static void RunMotorSweep(unsigned char isLeftMotor);
static void SetCruiseSpeed(signed char speed);

static unsigned int LightMinSeen = LIGHT_SENSOR_MAX;
static unsigned int LightMaxSeen = 0u;

int main(void)
{
    BOARD_Init();
    printf("Starting Roach hardware exploration harness\r\n");
    RunRoachHardwareExplorer();

    while (1) {
    }
}

void RunRoachHardwareExplorer(void)
{
    unsigned char ledBarLevel = 0;
    char command;

    Roach_Init();
    StopMotors();
    Roach_LEDSSet(0);

    printf("\r\nRoach hardware explorer");
    printf("\r\nUse the serial terminal at 115200 baud to trigger tests.");
    PrintHelp();

    while (1) {
        command = PollSerialChar();
        if (command == 0) {
            continue;
        }

        switch (command) {
        case 'm':
        case 'M':
            PrintHelp();
            break;

        case 'b':
            ShowBumpersOnce();
            break;

        case 'B':
            MonitorBumpers();
            break;

        case 'l':
            ShowLightOnce();
            ledBarLevel = 0;
            break;

        case 'L':
            MonitorLight();
            ledBarLevel = 0;
            break;

        case 'c':
        case 'C':
            ResetLightCalibration();
            printf("\r\nLight calibration reset. Use 'L' and expose then cover the sensor.");
            break;

        case '[':
            if (ledBarLevel > 0u) {
                ledBarLevel--;
            }
            Roach_BarGraph(ledBarLevel);
            printf("\r\nLED bar level: %u/%u", ledBarLevel, LED_BAR_COUNT);
            break;

        case ']':
            if (ledBarLevel < LED_BAR_COUNT) {
                ledBarLevel++;
            }
            Roach_BarGraph(ledBarLevel);
            printf("\r\nLED bar level: %u/%u", ledBarLevel, LED_BAR_COUNT);
            break;

        case 'g':
        case 'G':
            RunLedSweep();
            ledBarLevel = 0;
            break;

        case 'a':
        case 'A':
            RunMotorSweep(TRUE);
            ledBarLevel = 0;
            break;

        case 'd':
        case 'D':
            RunMotorSweep(FALSE);
            ledBarLevel = 0;
            break;

        case 'f':
        case 'F':
            SetCruiseSpeed(60);
            ledBarLevel = 0;
            break;

        case 'v':
        case 'V':
            SetCruiseSpeed(-60);
            ledBarLevel = 0;
            break;

        case 'x':
        case 'X':
            StopMotors();
            Roach_LEDSSet(0);
            ledBarLevel = 0;
            printf("\r\nStopped both motors and cleared the LED bar.");
            break;

        default:
            printf("\r\nUnknown command '%c'. Press 'm' to reprint the menu.", command);
            break;
        }
    }
}

static void BusyDelay(unsigned int cycles)
{
    volatile unsigned int i;

    for (i = 0; i < cycles; i++) {
        asm("nop");
    }
}

static char PollSerialChar(void)
{
    char ch;

    if (IsReceiveEmpty() == FALSE) {
        ch = GetChar();
        if ((ch == '\r') || (ch == '\n')) {
            return 0;
        }
        return ch;
    }
    return 0;
}

static char PollStopChar(void)
{
    return PollSerialChar();
}

static void FlushSerialInput(void)
{
    while (IsReceiveEmpty() == FALSE) {
        (void)GetChar();
    }
}

static unsigned char ScaleLightToLedBar(unsigned int lightLevel)
{
    unsigned int scaledValue;
    unsigned int span;

    span = LightMaxSeen - LightMinSeen;
    if (span < MIN_LIGHT_SPAN_FOR_SCALING) {
        scaledValue = (lightLevel * LED_BAR_COUNT) / (LIGHT_SENSOR_MAX + 1u);
    } else {
        scaledValue = ((lightLevel - LightMinSeen) * LED_BAR_COUNT) / span;
    }
    if (scaledValue > LED_BAR_COUNT) {
        scaledValue = LED_BAR_COUNT;
    }
    return (unsigned char)scaledValue;
}

static void ResetLightCalibration(void)
{
    LightMinSeen = LIGHT_SENSOR_MAX;
    LightMaxSeen = 0u;
}

static void UpdateLightCalibration(unsigned int lightLevel)
{
    if (lightLevel < LightMinSeen) {
        LightMinSeen = lightLevel;
    }
    if (lightLevel > LightMaxSeen) {
        LightMaxSeen = lightLevel;
    }
}

static void StopMotors(void)
{
    Roach_LeftMtrSpeed(0);
    Roach_RightMtrSpeed(0);
}

static unsigned char ReadBumpersFromIndividualSensors(void)
{
    unsigned char bumperState = 0u;

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

static void PrintHelp(void)
{
    printf("\r\n\r\nCommands:");
    printf("\r\n  m  : print this menu again");
    printf("\r\n  b  : read all four bumpers once");
    printf("\r\n  B  : stream bumper changes until a key is pressed");
    printf("\r\n  l  : read the light sensor once");
    printf("\r\n  L  : stream the light sensor and mirror it on the LED bar");
    printf("\r\n  c  : clear light-sensor calibration");
    printf("\r\n  [  : decrease the LED bar by one LED");
    printf("\r\n  ]  : increase the LED bar by one LED");
    printf("\r\n  g  : run an LED sweep demo");
    printf("\r\n  a  : sweep the left motor through forward, stop, and reverse");
    printf("\r\n  d  : sweep the right motor through forward, stop, and reverse");
    printf("\r\n  f  : drive both motors forward at 60%%");
    printf("\r\n  v  : drive both motors backward at 60%%");
    printf("\r\n  x  : stop both motors and clear the LEDs");
}

static void PrintBumperStates(unsigned char bumperState)
{
    printf("\r\nBumpers FL:%u FR:%u RL:%u RR:%u packed:0x%X",
            (bumperState & FRONT_LEFT_BUMPER_MASK) ? 1u : 0u,
            (bumperState & FRONT_RIGHT_BUMPER_MASK) ? 1u : 0u,
            (bumperState & REAR_LEFT_BUMPER_MASK) ? 1u : 0u,
            (bumperState & REAR_RIGHT_BUMPER_MASK) ? 1u : 0u,
            bumperState & 0x0Fu);
}

static void ShowBumpersOnce(void)
{
    unsigned char bumperState;
    unsigned char packedState;

    bumperState = ReadBumpersFromIndividualSensors();
    packedState = Roach_ReadBumpers();
    PrintBumperStates(bumperState);
    if (packedState != bumperState) {
        printf("\r\nWarning: packed bumper read 0x%X does not match individual reads 0x%X.",
                packedState & 0x0Fu, bumperState & 0x0Fu);
    }
    Roach_LEDSSet((uint16_t)bumperState);
}

static void MonitorBumpers(void)
{
    unsigned char lastBumperState = 0xFFu;
    char exitKey = 0;

    FlushSerialInput();

    printf("\r\nStreaming bumpers. Press any key to stop.");
    while (exitKey == 0) {
        unsigned char currentBumperState;
        unsigned char packedState;

        currentBumperState = ReadBumpersFromIndividualSensors();
        packedState = Roach_ReadBumpers();
        if (currentBumperState != lastBumperState) {
            lastBumperState = currentBumperState;
            PrintBumperStates(currentBumperState);
            if (packedState != currentBumperState) {
                printf("\r\nWarning: packed bumper read 0x%X does not match individual reads 0x%X.",
                        packedState & 0x0Fu, currentBumperState & 0x0Fu);
            }
            Roach_LEDSSet((uint16_t)currentBumperState);
        }

        exitKey = PollStopChar();
    }

    printf("\r\nStopped bumper monitor.");
    Roach_LEDSSet(0);
}

static void ShowLightOnce(void)
{
    unsigned int lightLevel;
    unsigned char barLevel;

    lightLevel = Roach_LightLevel();
    UpdateLightCalibration(lightLevel);
    barLevel = ScaleLightToLedBar(lightLevel);
    printf("\r\nLight sensor reading: %u (min %u max %u) -> LED bar: %u/%u",
            lightLevel, LightMinSeen, LightMaxSeen, barLevel, LED_BAR_COUNT);
    Roach_BarGraph(barLevel);
}

static void MonitorLight(void)
{
    unsigned int printDivider = 0;
    char exitKey = 0;

    FlushSerialInput();
    ResetLightCalibration();
    printf("\r\nStreaming light sensor. Press any key to stop.");
    printf("\r\nExpose then cover the sensor to establish a real min/max range.");
    while (exitKey == 0) {
        unsigned int lightLevel;
        unsigned char barLevel;

        lightLevel = Roach_LightLevel();
        UpdateLightCalibration(lightLevel);
        barLevel = ScaleLightToLedBar(lightLevel);
        Roach_BarGraph(barLevel);

        if ((printDivider++ % 4000u) == 0u) {
            printf("\r\nLight sensor reading: %u (min %u max %u) -> LED bar: %u/%u",
                    lightLevel, LightMinSeen, LightMaxSeen, barLevel, LED_BAR_COUNT);
        }

        exitKey = PollStopChar();
    }

    printf("\r\nStopped light monitor.");
    Roach_LEDSSet(0);
}

static void RunLedSweep(void)
{
    unsigned int i;

    printf("\r\nRunning LED sweep.");
    for (i = 0; i < LED_BAR_COUNT; i++) {
        Roach_LEDSSet((uint16_t)(1u << i));
        BusyDelay(MOTOR_SWEEP_DELAY >> 2);
    }
    Roach_LEDSSet(0x0FFFu);
    BusyDelay(MOTOR_SWEEP_DELAY >> 1);
    Roach_LEDSSet(0);
    printf("\r\nLED sweep complete.");
}

static void RunMotorSweep(unsigned char isLeftMotor)
{
    static const signed char SweepSpeeds[] = {100, 70, 40, 0, -40, -70, -100, 0};
    unsigned char i;
    const char *label;
    int magnitude;

    label = (isLeftMotor == TRUE) ? "Left" : "Right";
    StopMotors();
    printf("\r\n%s motor sweep starting.", label);

    for (i = 0; i < (sizeof(SweepSpeeds) / sizeof(SweepSpeeds[0])); i++) {
        signed char speed;

        speed = SweepSpeeds[i];
        if (isLeftMotor == TRUE) {
            Roach_LeftMtrSpeed(speed);
        } else {
            Roach_RightMtrSpeed(speed);
        }

        magnitude = speed;
        if (magnitude < 0) {
            magnitude = -magnitude;
        }
        Roach_BarGraph((unsigned char)((magnitude * LED_BAR_COUNT) / ROACH_MAX_SPEED));
        printf("\r\n%s motor speed: %d", label, speed);
        BusyDelay(MOTOR_SWEEP_DELAY);
    }

    StopMotors();
    Roach_LEDSSet(0);
    printf("\r\n%s motor sweep complete.", label);
}

static void SetCruiseSpeed(signed char speed)
{
    StopMotors();
    Roach_LeftMtrSpeed(speed);
    Roach_RightMtrSpeed(speed);
    Roach_BarGraph((unsigned char)(((unsigned int)((speed < 0) ? -speed : speed) * LED_BAR_COUNT) / ROACH_MAX_SPEED));
    printf("\r\nBoth motors set to %d.", speed);
}
