module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//
    assign w[7:0]={a[4:0],b[4:2]};
    assign x[7:0]={b[1:0],c[4:0],d[4]};
    assign y[7:0]={d[3:0],e[4:1]};
    assign z[7:0]={e[0],f[4:0],2'b11};
    // assign { ... } = { ... };

endmodule


// {3'b111, 3'b000} => 6'b111000
// {1'b1, 1'b0, 3'b101} => 5'b10101
// {4'ha, 4'd10} => 8'b10101010     // 4'ha and 4'd10 are both 4'b1010 in binary