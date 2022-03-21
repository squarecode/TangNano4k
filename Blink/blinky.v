module top (
  input   SYS_CLK,
  input   KEY1,
  input   KEY2,
  output  LED

);

localparam LED_PWM_RES = 8;

wire clk_27MHz;
wire led;

reg [17:0] clk_100HzCnt;
reg clk_100Hz;
reg [LED_PWM_RES-1:0] ledDuty;


// SLOW CLOCK GENERATOR
always @(posedge clk_27MHz) begin
  if(clk_100HzCnt == 18'd135000) begin
    clk_100HzCnt <= 18'd0;
    clk_100Hz <= ~clk_100Hz;
  end else begin
    clk_100HzCnt <= clk_100HzCnt +1;
  end
end

// LED PWM DUTY
always @(posedge clk_100Hz) begin
  ledDuty <= ledDuty +1;
end

// LED PWM GENERATOR
pwmGen #(
  .RESOLUTION(LED_PWM_RES)
) LED_PWM_GENERATOR (
  .i_clk(clk_27MHz),
  .i_duty(ledDuty),
  .o_pwm(led)
);

assign clk_27MHz = SYS_CLK;
assign LED = led;

endmodule