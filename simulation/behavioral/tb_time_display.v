`timescale 1ns/1ps

module tb_time_display;

    reg clk;
    reg reset;
    reg mode_12_24;

    wire [4:0] hours;
    wire [5:0] minutes;
    wire [5:0] seconds;
    wire am_pm;

    wire [6:0] seg;
    wire [5:0] an;

    top uut (
        .clk(clk),
        .reset(reset),
        .mode_12_24(mode_12_24),
        .hours(hours),
        .minutes(minutes),
        .seconds(seconds),
        .am_pm(am_pm),
        .seg(seg),
        .an(an)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        mode_12_24 = 0;

        #20;
        reset = 0;

        #7000;

        mode_12_24 = 1;

        #5000;

        $finish;
    end

endmodule
