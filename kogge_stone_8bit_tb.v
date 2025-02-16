module kogge_stone_8bit_tb;
    reg [7:0] a, b;
    reg cin;
    wire [8:0] s;
    wire [7:0] c;

    kogge_stone k1(a, b, cin, s,c);
   
    initial begin
        cin = 0;
       a=8'h41;
       b=8'h54; #5
        a=8'h2b;
       b=8'h90; #5
        a=8'h1c;
       b=8'h5b; #5
        a=8'h2a;
       b=8'hc4; #5
        a=8'h23;
       b=8'hab; #5 
       a=8'h34;
       b=8'h98; #5
        a=8'hcd;
       b=8'hab; #5
  
       
        $finish;
    end
endmodule