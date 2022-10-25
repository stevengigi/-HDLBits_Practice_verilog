module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always@(posedge clk)begin
        case({L,E})
            2'b11:Q=R;
            2'b10:Q=R;
            2'b01:Q=w;
            default : ;
        endcase
    end
endmodule
