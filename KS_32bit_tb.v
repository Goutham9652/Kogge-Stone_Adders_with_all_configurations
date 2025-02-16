module KS_32bit_tb;
    reg [31:0] a, b;
    reg cin;
    wire [32:0] s;
    wire [31:0] c;
    
    KS_32bit uut2 (a,b,cin,s,c);

    initial begin
    cin=0;
        a = 32'h00000000;
        b = 32'h00000000; 
        #10;
        a = 32'h631ff211;
        b = 32'h12356312;
        #10;
        a = 32'h0fe02306;
        b = 32'hfaf2fcff;
        #10;
        a = 32'h0fe92c06;
        b = 32'hf098ac32;
        #10;
         a = 32'h2340b706;
        b = 32'hfa37fc0f;
        #10;
        a = 32'hffffffff;
        b = 32'hffffffff;
        #10;
        $finish;
    end
endmodule

