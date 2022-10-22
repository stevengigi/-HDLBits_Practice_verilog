// problem : https://hdlbits.01xz.net/wiki/Module_addsub

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] nb;
    wire cout1,cout2;
    assign nb=b^{32{sub}};
    add16 d1(a[15:0],nb[15:0],sub,sum[15:0],cout1);
    add16 d2(a[31:16],nb[31:16],cout1,sum[31:16],cout2);
endmodule
