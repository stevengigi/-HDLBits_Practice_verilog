// problem : https://hdlbits.01xz.net/wiki/Conditional

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0]compare1,compare2;
    assign compare1 = (a>b)?b:a;
    assign compare2 =(c>d)?d:c;
    assign min=(compare1>compare2)?compare2:compare1;
endmodule
