module kogge_stone_4bit_tb;
    reg [3:0] a, b;
    reg cin;
    wire [4:0] s;
    
    kogge_stone_4bit uut(a, b, cin, s);
    
    initial begin
        cin = 0;
        a=4'b1101;
        b=4'b0011; #5
         a=4'b1010;
        b=4'b0110; #5
         a=4'b1011;
        b=4'b0111; #5 a=4'b1000;
        b=4'b1101; #5
         a=4'b1010;
        b=4'b0110; #5
         a=4'b1111;
        b=4'b0101; #5
        $stop;  
    end
endmodule