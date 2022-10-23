module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum);
    wire [3:0] cout;
    assign sum[4]=cout[3];
    fadd d1(x[0],y[0],0,sum[0],cout[0]);
    fadd d2(x[1],y[1],cout[0],sum[1],cout[1]);
    fadd d3(x[2],y[2],cout[1],sum[2],cout[2]);
    fadd d4(x[3],y[3],cout[2],sum[3],cout[3]);

endmodule

module fadd(input a,input b,input cin,output sum,output cout);
    assign sum = a^b^cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule
