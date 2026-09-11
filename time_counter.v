`timescale 1ns/1ps
module time_counter(
    input wire clk, input wire reset, input wire tick_1hz,
    input wire set_hour, input wire set_min,
    output reg [4:0] hour24, output reg [5:0] minute, output reg [5:0] second
);
    always @(posedge clk) begin
        if (reset) begin hour24<=0; minute<=0; second<=0; end
        else if (set_hour) begin
            if (hour24==23) hour24<=0; else hour24<=hour24+1;
        end else if (set_min) begin
            if (minute==59) begin
                minute<=0;
                if (hour24==23) hour24<=0; else hour24<=hour24+1;
            end else minute<=minute+1;
        end else if (tick_1hz) begin
            if (second==59) begin
                second<=0;
                if (minute==59) begin
                    minute<=0;
                    if (hour24==23) hour24<=0; else hour24<=hour24+1;
                end else minute<=minute+1;
            end else second<=second+1;
        end
    end
endmodule
