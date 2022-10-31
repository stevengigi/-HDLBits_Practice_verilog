module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    wire [2:0]LEDR_next;
    always@(posedge KEY[0])begin
        if(KEY[1])begin
        	LEDR<=SW;
        end
        else begin
            LEDR<=LEDR_next;
        end
    end
    assign LEDR_next = {LEDR[1]^LEDR[2],LEDR[0],LEDR[2]};

endmodule
