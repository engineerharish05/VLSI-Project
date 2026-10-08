module time_display(
    input wire clk,
    input wire reset,

    input wire [4:0] hours,
    input wire [5:0] minutes,
    input wire [5:0] seconds,

    output reg [6:0] seg,
    output reg [5:0] an
);

    reg [2:0] digit_select;
    reg [3:0] digit;
    wire [6:0] decoded_seg;

    seven_segment decoder(
        .digit(digit),
        .seg(decoded_seg)
    );

    always @(posedge clk or posedge reset) begin
        if (reset)
            digit_select <= 0;
        else
            digit_select <= digit_select + 1;
    end

    always @(*) begin
        case (digit_select)
            3'd0: begin
                digit = hours / 10;
                an = 6'b111110;
            end

            3'd1: begin
                digit = hours % 10;
                an = 6'b111101;
            end

            3'd2: begin
                digit = minutes / 10;
                an = 6'b111011;
            end

            3'd3: begin
                digit = minutes % 10;
                an = 6'b110111;
            end

            3'd4: begin
                digit = seconds / 10;
                an = 6'b101111;
            end

            3'd5: begin
                digit = seconds % 10;
                an = 6'b011111;
            end

            default: begin
                digit = 0;
                an = 6'b111111;
            end
        endcase

        seg = decoded_seg;
    end

endmodule
