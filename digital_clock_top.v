`timescale 1ns/1ps
module digital_clock_top #(
    parameter integer CLK_FREQ_HZ = 50000000
)(
    input wire clk, input wire reset,
    input wire btn_set_hour, input wire btn_set_min, input wire btn_format,
    output wire [6:0] seg, output wire [5:0] an, output wire dp
);
    wire tick_1hz, tick_scan;
    wire set_hour_pulse, set_min_pulse, format_pulse;
    wire [4:0] hour24, display_hour;
    wire [5:0] minute, second;
    wire mode12, am_pm;

    clock_divider #(.CLK_FREQ_HZ(CLK_FREQ_HZ)) u_div (
        .clk(clk), .reset(reset), .tick_1hz(tick_1hz), .tick_scan(tick_scan));

    button_debounce #(.CLK_FREQ_HZ(CLK_FREQ_HZ)) u_hour (
        .clk(clk), .reset(reset), .btn_in(btn_set_hour), .btn_pulse(set_hour_pulse));
    button_debounce #(.CLK_FREQ_HZ(CLK_FREQ_HZ)) u_min (
        .clk(clk), .reset(reset), .btn_in(btn_set_min), .btn_pulse(set_min_pulse));
    button_debounce #(.CLK_FREQ_HZ(CLK_FREQ_HZ)) u_fmt (
        .clk(clk), .reset(reset), .btn_in(btn_format), .btn_pulse(format_pulse));

    time_counter u_time (
        .clk(clk), .reset(reset), .tick_1hz(tick_1hz),
        .set_hour(set_hour_pulse), .set_min(set_min_pulse),
        .hour24(hour24), .minute(minute), .second(second));

    format_controller u_fmt (
        .clk(clk), .reset(reset), .format_pulse(format_pulse),
        .hour24(hour24), .mode12(mode12),
        .display_hour(display_hour), .am_pm(am_pm));

    seven_segment_driver u_disp (
        .clk(clk), .reset(reset), .tick_scan(tick_scan),
        .hour(display_hour), .minute(minute), .second(second),
        .mode12(mode12), .am_pm(am_pm), .seg(seg), .an(an), .dp(dp));
endmodule
