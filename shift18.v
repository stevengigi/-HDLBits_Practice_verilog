module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q);
    always@(posedge clk)begin
        if(load==1) q<=data;
        else if(ena==1)begin
            case(amount)
                2'b00 : q<={q[62:0],1'b0}; //left 1 bit
                2'b01 : q<={q[55:0],8'd0}; //left 8 bits
                2'b10 : q<={q[63],q[63:1]}; //right 1 bit
                2'b11 : q<={{8{q[63]}},q[63:8]}; //right 8 bits
            endcase
        end
		else begin
        	q<=q;
        end
    end
endmodule
