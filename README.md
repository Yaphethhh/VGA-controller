README: Zybo Verilog Project

Overview

This project implements a VGA controller for the Zybo board, utilizing a fractional clock divider to generate a 25.175 MHz clock from the 50 MHz base clock. The design includes horizontal (H) and vertical (V) counters to control synchronization and pixel positioning. It supports 16-bit color depth (5 bits for red, 5 bits for blue, and 6 bits for green).

Key Features

Clock Divider

A fractional clock divider reduces the Zybo's 50 MHz clock to the VGA standard of 25.175 MHz.

H Counter and V Counter Modules

Separate Verilog modules for horizontal and vertical counters.

H Sync is controlled when h_count reaches 96.

V Sync is controlled when v_count reaches 2.

Color Control

The project supports 16-bit color encoding:

Red: 5 bits

Green: 6 bits

Blue: 5 bits

Sync Control

H Sync and V Sync signals are set to low at specific counts to ensure proper synchronization with VGA standards.

File Structure

clkdiv.v: Implements the fractional clock divider.

Hcnt.v: Module for horizontal counting.

Vcnt.v: Module for vertical counting.

TopMod.v: Top-level module integrating H and V counters and generating H Sync, V Sync, and color signals.

testbench.v: Testbench for simulation and verification.

How It Works

Clock Divider

The 50 MHz clock is divided down to 25.175 MHz using a fractional clock divider. This frequency is necessary for standard VGA timing.

H Counter

Counts pixels along the horizontal axis.

Resets after reaching the end of a horizontal line.

Controls H Sync by setting it low when the count reaches 96.

V Counter

Counts lines along the vertical axis.

Resets after reaching the total number of lines in a frame.

Controls V Sync by setting it low when the count reaches 2.

Color Output

Based on pixel position and the H and V counters, the color signal is generated using 16 bits (R5, G6, B5).

VGA Connection Diagram

Below is an ASCII diagram of the VGA connections:

    +-----------------------------+       +-------------------+
    |          Pin 1 (Red)        |------>|     Red Signal    |
    +-----------------------------+       +-------------------+

    +-----------------------------+       +-------------------+
    |         Pin 2 (Green)       |------>|    Green Signal   |
    +-----------------------------+       +-------------------+

    +-----------------------------+       +-------------------+
    |         Pin 3 (Blue)        |------>|     Blue Signal   |
    +-----------------------------+       +-------------------+

    +-----------------------------+       +-------------------+
    |     Pin 13 (H Sync)         |------>|   Horizontal Sync |
    +-----------------------------+       +-------------------+

    +-----------------------------+       +-------------------+
    |     Pin 14 (V Sync)         |------>|   Vertical Sync   |
    +-----------------------------+       +-------------------+

    +-----------------------------+       +-------------------+
    |     Pin 5, 6, 7, 8 (GND)    |------>|      Ground       |
    +-----------------------------+       +-------------------+
