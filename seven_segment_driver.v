`timescale 1ns/1ps
module seven_segment_driver(
    input wire clk, input wire reset, input wire tick_scan,
    input wire [4:0] hour, input wire [5:0] minute, input wire [5:0] second,
    input wire mode12, input wire am_pm,
    output reg [6:0] seg, output reg [5:0] an, output reg dp
);
    reg [2:0] digit_index;
    reg [3:0] digit_value;

    function [6:0] seg_decode;
        input [3:0] d;
        begin
            case(d)
                0: seg_decode=7'b1111110; 1: seg_decode=7'b0110000;
                2: seg_decode=7'b1101101; 3: seg_decode=7'b1111001;
                4: seg_decode=7'b0110011; 5: seg_decode=7'b1011011;
                6: seg_decode=7'b1011111; 7: seg_decode=7'b1110000;
                8: seg_decode=7'b1111111; 9: seg_decode=7'b1111011;
                default: seg_decode=7'b0000001;
            endcase
        end
    endfunction

    always @(posedge clk) begin
        if (reset) digit_index <= 0;
        else if (tick_scan)
            if (digit_index==5) digit_index<=0;
            else digit_index<=digit_index+1;
    end

    always @(*) begin
        case(digit_index)
            0: begin an=6'b000001; digit_value=hour/10; end
            1: begin an=6'b000010; digit_value=hour%10; end
            2: begin an=6'b000100; digit_value=minute/10; end
            3: begin an=6'b001000; digit_value=minute%10; end
            4: begin an=6'b010000; digit_value=second/10; end
            default: begin an=6'b100000; digit_value=second%10; end
        endcase
        seg = seg_decode(digit_value);
        dp = mode12 && am_pm;
    end
endmodule
