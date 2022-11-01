module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q);

    reg [255:0] q_next=256'h7;
    reg [255:0] q_neighbor1,q_neighbor2,q_neighbor3,q_neighbor4,q_neighbor5,q_neighbor6,q_neighbor7,q_neighbor8;
    reg [3:0] sum = 0;


    //q_neighbor1	q_neighbor2		q_neighbor3
    //q_neighbor5	q				q_neighbor4
    //q_neighbor6	q_neighbor7		q_neighbor8

    always @(posedge clk)
        if(load)
            q <= data;
    	else
            q <= q_next;

    always @(*)
        for (integer i=0; i<256; i++)
        begin
            sum = 0;
            sum = q_neighbor1[i]+q_neighbor2[i]+q_neighbor3[i]+q_neighbor4[i]+q_neighbor5[i]+q_neighbor6[i]+q_neighbor7[i]+q_neighbor8[i];
            case(sum)
                2: q_next[i] <= q[i];
                3: q_next[i] <= 1;
                default : q_next[i] <= 0;
            endcase
        end



    square16x16_roll neighbor2( q,			2'b01, q_neighbor2 );
    square16x16_roll neighbor4( q,			2'b11, q_neighbor4 );
    square16x16_roll neighbor5( q,			2'b10, q_neighbor5 );
    square16x16_roll neighbor7( q,			2'b00, q_neighbor7 );

    square16x16_roll neighbor1(q_neighbor2,	2'b11, q_neighbor1 );
    square16x16_roll neighbor3(q_neighbor2,	2'b10, q_neighbor3 );
    square16x16_roll neighbor6(q_neighbor7,	2'b11, q_neighbor6 );
    square16x16_roll neighbor8(q_neighbor7,	2'b10, q_neighbor8 );

endmodule

module square16x16_roll(
    input [255:0] data,
    input [1:0] direction, // 2'b00:up  2'b01: down  2'b10 left  2'b11 right
    output reg [255:0] q
);

    always @(data or direction)
        case(direction)
            2'b00: begin
                q[255:240] <= data[15:0];
                for(integer i=1;i<16;i++)
                    q[i*16-1 -:16] <= data[(i+1)*16-1 -:16];
            end

            2'b01: begin
                q[15:0] <= data[255:240];
                for(integer i=2;i<17;i++)
                    q[i*16-1 -:16] <= data[(i-1)*16-1 -:16];
            end

            2'b10:
                for(integer i=1;i<17;i++)
                    q[i*16-1 -:16] <= {data[i*16-2 -:15], data[i*16-1]};

            2'b11:
            	for(integer i=1;i<17;i++)
                    q[i*16-1 -:16] <= {data[i*16-16], data[i*16-1 -:15]};
        endcase

endmodule