module top_module (
    input clk,
    input x,
    output z
);
    wire dff1,dff2,dff3;
    reg q1=0,q2=0,q3=0;
    assign dff1= q1^x;
    assign dff2= (~q2)&x;
    assign dff3= (~q3)|x;
    df d1(dff1,clk,q1);
    df d2(dff2,clk,q2);
    df d3(dff3,clk,q3);
    assign z=~(q3|q2|q1);
endmodule

module df(input d ,input clk,output reg Q);
    always@(posedge clk)begin
    	Q<=d;
    end
endmodule