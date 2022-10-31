module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]r_out;
    always@(posedge clk)begin
        if(resetn==0) r_out<= 4'd0;
        else r_out={r_out[2:0],in};
    end
    always@(*)begin
        out=r_out[3];
    end
endmodule
