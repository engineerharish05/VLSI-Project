# Digital Time Display — VLSI Project

A Verilog/Vivado digital time-display project covering RTL design, seven-segment display control, time counting, and behavioral simulation.

## Team

- **Harish P**
- **Anush K**
- **Abdul Adhil S**

## Project implementations

### 1. Spartan-6 RTL implementation
The repository retains the original synthesizable Spartan-6-oriented RTL, constraints template, documentation, and simulation support.

### 2. Vivado behavioral simulation
The newly organized behavioral implementation is based on the submitted Vivado Verilog source and provides:

- HH:MM:SS time representation
- 12/24-hour mode input
- 6-digit seven-segment multiplexing
- Numerical hour/minute/second outputs
- AM/PM output
- Dedicated simulation testbench

## Repository structure

```
rtl/
├── behavioral_time_display/
│   ├── clock_divider.v
│   ├── time_counter.v
│   ├── seven_segment.v
│   ├── time_display.v
│   └── top.v
└── [existing Spartan-6 RTL modules]

simulation/
├── behavioral/
│   └── tb_time_display.v
└── [existing simulation files]

constraints/
└── [board constraint files]

docs/
├── behavioral_simulation.md
└── team.md

screenshots/
└── Vivado behavioral simulation reference
```

## Vivado behavioral simulation

For the newly added behavioral version, add the files under `rtl/behavioral_time_display/` as design sources and `simulation/behavioral/tb_time_display.v` as the simulation source. Set `top` as the design top and `tb_time_display` as the simulation top.

> The supplied source uses `DIV_VALUE = 10` for behavioral simulation. This is intended for simulation rather than a real 1 Hz FPGA clock divider.

## Existing project notes

The original project documentation describes a 50 MHz clock assumption for the Spartan-6 implementation. The board UCF is a template and should be matched to the exact FPGA board before hardware programming.

## Toolchain

- Verilog-2001
- Xilinx Vivado for the behavioral simulation
- Xilinx ISE / Spartan-6 for the original hardware-oriented implementation
