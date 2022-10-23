module top_module(
    input a, b, cin,
    output cout, sum );
    assign cout = (a&b)|(a&cin)|(cin&b);
    assign sum  = a^b^cin;
endmodule
