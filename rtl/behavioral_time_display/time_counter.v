module time_counter(
    input wire clk,
    input wire reset,
    input wire tick_1sec,
    input wire mode_12_24,

    output reg [4:0] hours,
    output reg [5:0] minutes,
    output reg [5:0] seconds,
    output reg am_pm
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            hours   <= 0;
            minutes <= 0;
            seconds <= 0;
            am_pm   <= 0;
        end

        else if (tick_1sec) begin

            if (seconds == 59) begin
                seconds <= 0;

                if (minutes == 59) begin
                    minutes <= 0;

                    if (!mode_12_24) begin
                        if (hours == 23)
                            hours <= 0;
                        else
                            hours <= hours + 1;
                    end

                    else begin
                        if (hours == 11) begin
                            hours <= 12;
                            am_pm <= ~am_pm;
                        end
                        else if (hours == 12) begin
                            hours <= 1;
                        end
                        else begin
                            hours <= hours + 1;
                        end
                    end
                end
                else begin
                    minutes <= minutes + 1;
                end
            end
            else begin
                seconds <= seconds + 1;
            end
        end
    end

endmodule
