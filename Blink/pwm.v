module pwmGen #(
    parameter RESOLUTION = 8, // bits
) (
    input   i_clk,
    input [RESOLUTION-1:0] i_duty,
    output  o_pwm
);

reg [RESOLUTION-1:0] counter;
reg pwmSignal;

always @(posedge i_clk) begin
    if(counter > i_duty) begin
        pwmSignal <= 1'b0;
    end else begin
        pwmSignal <= 1'b1;
    end
    counter <= counter +1;
end

assign o_pwm = pwmSignal;
    
endmodule