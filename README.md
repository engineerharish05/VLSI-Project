# Digital Time Display — Spartan-6

A synthesizable Verilog RTL project for a configurable digital time display using a Xilinx Spartan-6 FPGA.

## Features
- HH:MM:SS display
- 12/24-hour mode
- Hour and minute adjustment
- Multiplexed 6-digit 7-segment display
- Synchronized, debounced buttons
- Simulation/testbench support

## Toolchain
- Verilog-2001
- Xilinx ISE
- Spartan-6 FPGA

The design assumes a **50 MHz clock** by default. Update `CLK_FREQ_HZ` in `rtl/digital_clock_top.v` for your board.

> **Board note:** `constraints/board_template.ucf` is a template. Replace placeholders with the pin assignments from your exact board schematic before programming hardware.

## Controls
| Input | Function |
|---|---|
| `btn_set_hour` | Increment hour |
| `btn_set_min` | Increment minute |
| `btn_format` | Toggle 12/24-hour format |
| `reset` | Active-high reset |

## Repository structure
```
rtl/          Synthesizable Verilog RTL
simulation/   Testbench and simulation files
constraints/  UCF constraint template
docs/         Project documentation
screenshots/  Simulation / ISE screenshots
```

## Project goal
This project is part of my hardware-design portfolio, focused on RTL design, FPGA development and digital systems.

---
Built by **Harish P** • ECE / VLSI / Digital Design
