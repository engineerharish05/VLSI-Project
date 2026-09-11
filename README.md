# Digital Time Display Device — Spartan-6

Verilog HDL project for a configurable digital clock:
- HH:MM:SS
- 12/24-hour mode
- hour/minute setting
- multiplexed 6-digit 7-segment display
- synchronized/debounced buttons

## Toolchain
Xilinx ISE for Spartan-6. RTL is Verilog-2001 and intended to be synthesizable.

## Important
Spartan-6 boards differ in clock frequency, pinout, display polarity, and display type.
The RTL assumes a 50 MHz clock by default. Change `CLK_FREQ_HZ` in
`rtl/digital_clock_top.v` if required.

`constraints/board_template.ucf` is intentionally a TEMPLATE. Do not use it
until you replace placeholders with pins from your exact board schematic.

## Controls
btn_set_hour: increment hour
btn_set_min: increment minute
btn_format: toggle 24/12-hour display
reset: active-high

## Repository layout
rtl/          synthesizable Verilog
simulation/   testbench
constraints/  UCF template
docs/         project documentation
screenshots/  add simulation/ISE screenshots here
