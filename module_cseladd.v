// problem : https://hdlbits.01xz.net/wiki/Module_cseladd
module top_module( input [31:0] a, input [31:0] b, output [31:0] sum);
    wire in1,in2,in3,o1,o2,o3;
    wire [15:0] sum1,sum2,sum3;
    assign in1=1'b0;
    assign in2=1'b0;
    assign in3=1'b1;
    add16 inst1 (a[15:0],b[15:0],in1,sum1,o1);
    add16 inst2 (a[31:16],b[31:16],in2,sum2,o2);
    add16 inst3 (a[31:16],b[31:16],in3,sum3,o3);
    always@(*)
        case(o1)
            1'b0:sum={sum2,sum1};
            1'b1:sum={sum3,sum1};
        endcase
endmodule