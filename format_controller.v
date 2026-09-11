`timescale 1ns/1ps
module format_controller(
    input wire clk, input wire reset, input wire format_pulse,
    input wire [4:0] hour24,
    output reg mode12, output reg [4:0] display_hour, output reg am_pm
);
    always @(posedge clk) begin
        if (reset) mode12 <= 0;
        else if (format_pulse) mode12 <= ~mode12;
    end

    always @(*) begin
        am_pm = (hour24 >= 12);
        if (!mode12) display_hour = hour24;
        else if (hour24 == 0) display_hour = 12;
        else if (hour24 > 12) display_hour = hour24 - 12;
        else display_hour = hour24;
    end
endmodule
