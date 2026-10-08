module top(
    input wire clk,
    input wire reset,
    input wire mode_12_24,

    output wire [4:0] hours,
    output wire [5:0] minutes,
    output wire [5:0] seconds,
    output wire am_pm,

    output wire [6:0] seg,
    output wire [5:0] an
);

    wire tick_1sec;

    clock_divider #(
        .DIV_VALUE(10)
    ) divider (
        .clk(clk),
        .reset(reset),
        .tick(tick_1sec)
    );

    time_counter counter (
        .clk(clk),
        .reset(reset),
        .tick_1sec(tick_1sec),
        .mode_12_24(mode_12_24),
        .hours(hours),
        .minutes(minutes),
        .seconds(seconds),
        .am_pm(am_pm)
    );

    time_display display (
        .clk(clk),
        .reset(reset),
        .hours(hours),
        .minutes(minutes),
        .seconds(seconds),
        .seg(seg),
        .an(an)
    );

endmodule
