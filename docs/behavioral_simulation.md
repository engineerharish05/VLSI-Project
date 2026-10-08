# Digital Time Display — Vivado Behavioral Simulation

This section contains the software-only behavioral simulation source supplied for the Digital Time Display project.

## Module organization

- `rtl/behavioral_time_display/clock_divider.v` — generates the simulation tick.
- `rtl/behavioral_time_display/time_counter.v` — HH:MM:SS counter and 12/24-hour mode logic.
- `rtl/behavioral_time_display/seven_segment.v` — seven-segment digit decoder.
- `rtl/behavioral_time_display/time_display.v` — six-digit multiplexing logic.
- `rtl/behavioral_time_display/top.v` — top-level module connecting the design.
- `simulation/behavioral/tb_time_display.v` — behavioral simulation testbench.

## Simulation parameters

The submitted source uses `DIV_VALUE = 10` in the clock divider and a `#5` clock toggle in the testbench.

## Vivado simulation reference

The supplied Vivado screenshot is the visual reference for this behavioral simulation.
