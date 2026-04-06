# ECE118 Lab 0

This repository contains an MPLAB X project for ECE118 Lab 0 on the PIC32-based Roach platform. The main lab deliverable is a serial-driven hardware exploration program that lets you exercise the bumpers, light sensor, LED bar, and motors from a terminal connection.

## Project overview

The active lab application lives in `ECE118_Lab0.X` and uses `src/RoachHardwareExplorer.c` as its entry point. When flashed to the board, it prints a menu over the serial port and waits for single-character commands to trigger hardware tests.

The repo also keeps the course framework sources, event-checker templates, and FSM templates alongside the lab project so you can reuse the provided scaffolding in later assignments.

## Toolchain

- MPLAB X project: `ECE118_Lab0.X`
- Target MCU: `PIC32MX320F128H`
- Compiler: XC32 `5.10`
- Programmer/debugger setting in the project: `pickitbasic`
- Serial terminal speed: `115200` baud

## Repository layout

- `ECE118_Lab0.X/` - main MPLAB X project for this lab
- `src/` - board support code plus the lab-specific explorer program
- `include/` - shared headers for the framework and Roach hardware
- `templates/` - service/event-checker templates from the course framework
- `fsm_templates/` - FSM-oriented template versions
- `scripts/` - helper utilities for bootstrapping and visualization
- `tools/` - small support batch scripts

## Building and flashing

1. Open `ECE118_Lab0.X` in MPLAB X.
2. Make sure the project is using the installed XC32 toolchain and the correct PIC32 device pack.
3. Build the default configuration from MPLAB X.
4. Program the board with your configured PICkit/debugger.
5. Open a serial terminal at `115200` baud to interact with the explorer.

This repository includes other MPLAB X projects (`ECE118_Framework.X`, `ECE118_FSM_Framework.X`, and `ECE118_EventChecker.X`) for the supplied course templates, but `ECE118_Lab0.X` is the project intended for the Lab 0 hardware demo.

## Serial command menu

After reset, the explorer prints a command list similar to the following:

- `m` - print the menu again
- `b` - read all four bumpers once
- `B` - stream bumper changes until a key is pressed
- `l` - read the light sensor once
- `L` - stream the light sensor and mirror it on the LED bar
- `c` - clear light-sensor calibration
- `[` - decrease the LED bar by one LED
- `]` - increase the LED bar by one LED
- `g` - run an LED sweep demo
- `a` - sweep the left motor forward, stop, and reverse
- `d` - sweep the right motor forward, stop, and reverse
- `f` - drive both motors forward at 60%
- `v` - drive both motors backward at 60%
- `x` - stop both motors and clear the LEDs

## Notes

- Build products from MPLAB X are intentionally ignored in Git.
- If you add new generated project folders, the ignore rules are written broadly enough to cover them.
- The root-level source tree contains both framework code and lab code, so changes in `src/` and `include/` may affect multiple MPLAB X projects in this repo.
