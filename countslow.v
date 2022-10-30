module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always@(posedge clk)begin
        if(reset==1) q<=0;
        else if(slowena==1)begin
            if(q<4'b1001) q<=q+1;
            else q<=0;
        end
    end
endmodule
