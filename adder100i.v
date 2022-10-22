// problem : https://hdlbits.01xz.net/wiki/Adder100i

module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
	wire c;
    always@(*)begin
        c=cin;
        for(integer i=0;i<100;i=i+1)begin
            sum[i]=a[i] ^  b[i] ^ c;
            cout[i]=(a[i] & b[i]) |  (b[i] & c) | (c & a[i]);
            c=cout[i];
        end
    end
endmodule
