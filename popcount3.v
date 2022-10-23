module top_module(
    input [2:0] in,
    output [1:0] out );
    always@(*) begin
        out=0;
        for(integer i=0;i<3;i=i+1)begin
            out=out+in[i];
        end
    end
endmodule
