module kogge_stone_4bit(
    input [3:0] a, b,
    input cin,
    output [4:0] s
);
    wire [3:0] c;
    wire [3:0] p, g;
    wire bf1, bf2, bf3, bf4;
    wire w1, w2, w3, w4;

    // Propagate signals
    prop x01(p[0], a[0], b[0]);
    prop x11(p[1], a[1], b[1]);
    prop x21(p[2], a[2], b[2]);
    prop x31(p[3], a[3], b[3]);
     
    // Generate signals
    gen g00(g[0], a[0], b[0]);
    gen g11(g[1], a[1], b[1]);
    gen g22(g[2], a[2], b[2]);
    gen g33(g[3], a[3], b[3]);

    // Initial carry
    Gray_Cell gc0(g[0], p[0], cin, bf1);
    buf  b1(c[0], bf1);
   
    // First carry
    Gray_Cell gc1(g[1], p[1], bf1, bf2);
    buf  b2(c[1], bf2);
   
    // Second carry
    Black_Cell bcl(p[2], p[1], g[2], g[1], w1, w2);
    Gray_Cell gc2(w2, w1, bf1, bf3);
    buf  b3(c[2], bf3);

    // Third carry
    Black_Cell bc2(p[3], p[2], g[3], g[2], w3, w4);
    Gray_Cell gc3(w4, w3, bf2, bf4);
    buf  b4(c[3], bf4);
   
    // Sum calculation
    xor x2(s[0], p[0], cin);
    xor x3(s[1], p[1], c[0]);
    xor x4(s[2], p[2], c[1]);
    xor x5(s[3], p[3], c[2]);
    buf  b5(s[4], bf4);

endmodule