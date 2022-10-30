module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    reg [3:0] sec_one;
    reg [3:0] sec_ten;

    always@(posedge clk)begin
        if(reset) sec_one<=4'd0;
        else if(ena==1'b1)begin
            if(sec_one==4'd9)begin
            	sec_one<=4'd0;
            end
            else begin
                sec_one<=sec_one+1;
            end
        end
    end

    always@(posedge clk)begin
        if(reset) sec_ten<=4'd0;
        else if(ena==1'b1 && sec_one==4'd9)begin
            if(sec_ten==4'd5)begin
            	sec_ten<=4'd0;
            end
            else begin
                sec_ten<=sec_ten+1;
            end
        end
    end
    // min
    reg [3:0]min_one;
    reg [3:0]min_ten;

    always@(posedge clk)begin
        if(reset) min_one<=4'd0;
        else if(ena==1'b1 && sec_ten==4'd5 && sec_one==4'd9)begin
            if(min_one==4'd9)begin
            	min_one<=4'd0;
            end
            else begin
                min_one<=min_one+1;
            end
        end
    end

    always@(posedge clk)begin
        if(reset) min_ten<=4'd0;
        else if(ena==1'b1 && min_one==4'd9 && sec_ten==4'd5 && sec_one==4'd9)begin
            if(min_ten==4'd5)begin
            	min_ten<=4'd0;
            end
            else begin
                min_ten<=min_ten+1;
            end
        end
    end
    //hour
    reg [3:0]hour_one;
    reg [3:0]hour_ten;
    always@(posedge clk)begin
        if(reset) hour_one<=4'd2;
        else if(ena==1'b1 && min_ten==4'd5 && min_one==4'd9 && sec_ten==4'd5 && sec_one==4'd9)begin
            if(hour_ten==4'd1 && hour_one==4'd2)begin
            	hour_one<=4'd1;
            end
            else if(hour_one==4'd9)begin
                hour_one<=4'd0;
            end
            else begin
                hour_one<=hour_one + 1'b1;
            end
        end
    end

    always@(posedge clk)begin
        if(reset) hour_ten<=4'd1;
        else if(ena==1'b1 && min_ten==4'd5 && min_one==4'd9 && sec_ten==4'd5 && sec_one==4'd9)begin
            if(hour_ten==4'd1 && hour_one==4'd2)begin
            	hour_ten<=4'd0;
            end
            else if(hour_one==4'd9)begin
                hour_ten<=hour_ten + 1'b1;
            end
        end
    end
    always@(posedge clk)begin
        if(reset) pm=1'b0;
        else if(hour_ten==4'd1 && hour_one==4'd1 && min_ten==4'd5 && min_one==4'd9 && sec_ten==4'd5 && sec_one==4'd9)begin
        	pm=~pm;
        end
        else begin
        	pm<=pm;
        end
    end
    assign ss={sec_ten,sec_one};
    assign mm={min_ten,min_one};
    assign hh={hour_ten,hour_one};
endmodule
