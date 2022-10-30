module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    reg [3:0]one;
    reg [3:0]ten;
    reg [3:0]hund;
    reg [3:0]thou;

    always@(posedge clk)begin
        if(reset) one<=4'd0;
        else if(one < 4'd9) one <= one+1;
        else if(one==4'd9)one = 4'd0;
    end
    always@(posedge clk)begin
        if(reset) ten<=4'd0;
        else if(ten<4'd9 && ena[1]==1'b1) ten <= ten+1;
        else if(ten==4'd9 && one==4'd9)ten = 4'd0;
    end
    always@(posedge clk)begin
        if(reset) hund<=4'd0;
        else if( hund<4'd9 && ena[2]==1'b1) hund <= hund+1;
        else if(hund==4'd9 && ten==4'd9 && one==4'd9)hund <= 4'd0;
    end
    always@(posedge clk)begin
        if(reset) thou<=4'd0;
        else if(thou<4'd9 && ena[3]==1'b1) thou <= thou+1;
        else if(thou==4'd9 && hund==4'd9 && ten==4'd9 && one==4'd9)thou <= 4'd0;
    end
    assign q[15:0] = {thou,hund,ten,one};
    assign ena[3:1]={hund==4'd9&&ten==4'd9&&one==4'd9,ten==4'd9&&one==4'd9,one==4'd9};
endmodule
