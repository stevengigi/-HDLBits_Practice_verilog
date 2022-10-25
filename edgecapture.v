module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]data;
    always@(posedge clk)begin
        data <= in;
        if(reset)	out<=0;
        else if((data) & (~in)) out<= out | ((data) & (~in));
        else out <= out;
    end
endmodule
