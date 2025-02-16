
`timescale 1ns / 1ps

module kogge_stone(
    input [7:0] a, b,
    input cin,
    output [8:0] s,
    output [7:0] c
    );
    wire [7:0] p, g;
    wire bf1,bf2,bf3,bf4,bf5,bf6,bf7,bf8;
    wire g1, g2, g3, g4, g5, g6, g7;
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20;

    // Propagate signals
    prop x01(p[0], a[0], b[0]);
    prop x11(p[1], a[1], b[1]);
    prop x21(p[2], a[2], b[2]);
    prop x31(p[3], a[3], b[3]);
    prop x41(p[4], a[4], b[4]);
    prop x51(p[5], a[5], b[5]);
    prop x61(p[6], a[6], b[6]);
    prop x71(p[7], a[7], b[7]);
    
    //generate signals
    gen g00(g[0], a[0], b[0]);
    gen g11(g[1], a[1], b[1]);
    gen g22(g[2], a[2], b[2]);
    gen g33(g[3], a[3], b[3]);
    gen g44(g[4], a[4], b[4]);
    gen g55(g[5], a[5], b[5]);
    gen g66(g[6], a[6], b[6]);
    gen g77(g[7], a[7], b[7]);

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

    // Fourth carry
    Black_Cell bl3(p[4], p[3], g[4], g[3], w5, w6);
    Black_Cell bl4(w5, w1, w6, w2, w7, w8);
    Gray_Cell gc4(w8, w7, bf1,bf5);
    buf  b5(c[4], bf5);

    // Fifth carry
    Black_Cell bl5(p[5], p[4], g[5], g[4], w9, w10);
    Black_Cell bl6(w9, w3, w10, w4, w11, w12);
    Gray_Cell gc5(w12, w11, bf2,bf6);
    buf  b6(c[5], bf6);

    // Sixth carry
    Black_Cell bl7(p[6], p[5], g[6], g[5], w13, w14);
    Black_Cell bl8(w13, w5, w14, w6, w15, w16);
    Gray_Cell gc6(w16, w15, bf3, bf7);
    buf  b7(c[6], bf7);

    // Seventh carry
    Black_Cell bl9(p[7], p[6], g[7], g[6], w17, w18);
    Black_Cell bl10(w17, w9, w18, w10, w19, w20);
    Gray_Cell gc7(w20, w19, bf4, bf8);
    buf  b8(c[7], bf8);

    // Sum calculation using XOR gates
    xor x2(s[0], p[0], cin);
    xor x3(s[1], p[1], c[0]);
    xor x4(s[2], p[2], c[1]);
    xor x5(s[3], p[3], c[2]);
    xor x6(s[4], p[4], c[3]);
    xor x7(s[5], p[5], c[4]);
    xor x8(s[6], p[6], c[5]);
    xor x9(s[7], p[7], c[6]);
    buf b9(s[8],bf8);

endmodule
