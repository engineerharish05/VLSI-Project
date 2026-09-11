`timescale 1ns/1ps
module digital_clock_tb;
    reg clk=0, reset=1, btn_set_hour=0, btn_set_min=0, btn_format=0;
    wire [6:0] seg; wire [5:0] an; wire dp;

    digital_clock_top #(.CLK_FREQ_HZ(10)) dut(
        .clk(clk), .reset(reset), .btn_set_hour(btn_set_hour),
        .btn_set_min(btn_set_min), .btn_format(btn_format),
        .seg(seg), .an(an), .dp(dp));

    always #5 clk=~clk;

    initial begin
        #30 reset=0;
        #220;
        btn_set_min=1; #30 btn_set_min=0;
        #100;
        btn_format=1; #30 btn_format=0;
        #300;
        $finish;
    end

    always @(posedge clk)
        $display("t=%0t H=%0d M=%0d S=%0d mode12=%b",
                 $time,dut.hour24,dut.minute,dut.second,dut.mode12);
endmodule
