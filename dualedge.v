module top_module (
    input clk,
    input d,
    output q
);
    reg n1,n2;
    always@(posedge clk)begin
    	n1<=d^n2;
    end
    always@(negedge clk)begin
    	n2<=d^n1;
    end

    // with posedge q = (n1^n2) = (d^n2^n2)=d;
    // with negedge q = (n1^n2) = (n1^d^n1)=d;
    assign q=n1^n2;
endmodule
