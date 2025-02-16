`timescale 1ns / 1ps

module k_s_16bit_tb;
    reg [15:0] a, b;
    
    wire [16:0] s;
   
    KS_adder_16bit k16(a, b,  s);
    
    initial begin
        
        a = 16'h0000;
        b = 16'h0000; 
        #10;
        a = 16'b0111111111111111;
        b = 16'b0111111111111111;   
        #10;
        a = 16'h1021;
        b = 16'hf02f; 
        #10;
        a = 16'h48a0;
        b = 16'hf50d;
        #10
         a = 16'h24c1;
        b = 16'h111f; 
        #10;
         a = 16'habc1;
        b = 16'h01bf; 
        #10; a = 16'h0001;
        b = 16'h123f; 
        #10;
         a = 16'hffba;
        b = 16'hfabf; 
        #10;
        
        $finish;
    end
endmodule
