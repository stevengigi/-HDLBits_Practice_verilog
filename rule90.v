module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q );
    reg [511:0]r_q;
    always@(posedge clk)begin
        if(load) r_q=data;
        else begin
            r_q <= {1'b0,q[511:1]}^{q[510:0],1'b0};
        end
    end
    assign q=r_q;
endmodule
