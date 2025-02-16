`timescale 1ns / 1ps

module KS_64bit_tb;
    reg [63:0] a,b;
    reg cin;
    wire [64:0] s;
    wire [63:0] c;
KS_64bit uut3(a,b,cin,s,c);
initial begin
cin=0;
        a = 64'h0000000000000000;
        b = 64'h0000000000000000; 
         $display("A = %h, B = %h, Cin = %b, Sum = %b, Carry = %b", a, b, cin, s, c);
        #10;
        a = 64'h631ff211631ff211;
        b = 64'h12356312faf2fcff;
         $display("A = %h, B = %h, Cin = %b, Sum = %b, Carry = %b", a, b, cin, s, c);
        #10;
        a = 64'h0fe02306faf2fcff;
        b = 64'hfaf2fcfffaf2fcff;
         $display("A = %h, B = %h, Cin = %b, Sum = %b, Carry = %b", a, b, cin, s, c);
        #10;
         a = 32'h0fe92c0e92c060f6;
        b = 32'hf098ae92c060f1c32;
        #10;
         a = 32'h0fe92c060fe02306;
        b = 32'hf098ac32fe9fe0234;
        #10;
        a = 64'hffffffffffffffff;
        b = 64'hffffffff11111111;
         $display("A = %h, B = %h, Cin = %b, Sum = %b, Carry = %b", a, b, cin, s, c);
        #10;
        $finish;
        
    end
endmodule
