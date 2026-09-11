`timescale 1ns/1ps
module clock_divider #(
    parameter integer CLK_FREQ_HZ = 50000000
)(
    input wire clk,
    input wire reset,
    output reg tick_1hz,
    output reg tick_scan
);
    parameter integer SCAN_FREQ_HZ = 1000;
    localparam integer SEC_DIV = CLK_FREQ_HZ;
    localparam integer SCAN_DIV = CLK_FREQ_HZ / SCAN_FREQ_HZ;
    integer sec_count, scan_count;

    always @(posedge clk) begin
        if (reset) begin
            sec_count <= 0; scan_count <= 0;
            tick_1hz <= 0; tick_scan <= 0;
        end else begin
            tick_1hz <= 0; tick_scan <= 0;
            if (sec_count == SEC_DIV-1) begin
                sec_count <= 0; tick_1hz <= 1;
            end else sec_count <= sec_count + 1;
            if (scan_count == SCAN_DIV-1) begin
                scan_count <= 0; tick_scan <= 1;
            end else scan_count <= scan_count + 1;
        end
    end
endmodule
