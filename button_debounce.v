`timescale 1ns/1ps
module button_debounce #(
    parameter integer CLK_FREQ_HZ = 50000000,
    parameter integer DEBOUNCE_MS = 20
)(
    input wire clk,
    input wire reset,
    input wire btn_in,
    output reg btn_pulse
);
    localparam integer COUNT_MAX = (CLK_FREQ_HZ/1000)*DEBOUNCE_MS;
    reg sync1, sync2, stable;
    integer count;

    always @(posedge clk) begin
        if (reset) begin
            sync1 <= 0; sync2 <= 0; stable <= 0;
            count <= 0; btn_pulse <= 0;
        end else begin
            sync1 <= btn_in;
            sync2 <= sync1;
            btn_pulse <= 0;
            if (sync2 == stable) count <= 0;
            else if (count >= COUNT_MAX-1) begin
                stable <= sync2; count <= 0;
                if (sync2) btn_pulse <= 1;
            end else count <= count + 1;
        end
    end
endmodule
