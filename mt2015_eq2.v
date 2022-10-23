module top_module ( input [1:0] A, input [1:0] B, output z );
    wire [1:0] set;
    assign set=A~^B;
    assign z=set[0]&set[1];
endmodule