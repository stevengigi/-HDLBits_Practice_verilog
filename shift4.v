module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q);

    always@(posedge clk or posedge areset)begin
        if(areset==1) q<=0;
        else if(load==1) q<=data[3:0];
        else if(ena==1) q<={1'b0,q[3:1]};
    end
endmodule
