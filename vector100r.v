// problem : https://hdlbits.01xz.net/wiki/Vector100r

module top_module(
    input [99:0] in,
    output [99:0] out
);
    always@* begin
        for(integer i=0;i<100;i=i+1)
           out[i]=in[99-i];

    end
endmodule
