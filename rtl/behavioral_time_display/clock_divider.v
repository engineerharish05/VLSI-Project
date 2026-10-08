module clock_divider #(
    parameter DIV_VALUE = 10
)(
    input wire clk,
    input wire reset,
    output reg tick
);

    reg [31:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            tick <= 0;
        end
        else if (count == DIV_VALUE - 1) begin
            count <= 0;
            tick <= 1;
        end
        else begin
            count <= count + 1;
            tick <= 0;
        end
    end

endmodule
