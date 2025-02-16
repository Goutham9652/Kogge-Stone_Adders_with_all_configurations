`timescale 1ns / 1ps

module KS_adder_16bit(
    input [15:0] a, b,
    output [16:0] s
    );
    wire [15:0] p, g;
    wire [68:1] w;
    wire bf1,bf2,bf3,bf4,bf5,bf6,bf7,bf8,bf9,bf10,bf11,bf12,bf13,bf14,bf15,bf16;
    wire [15:0] c;
    
   
    // 0th cArry //////////////////////////////////////////
    prop p0(p[0], a[0],b[0]);
    gen g0(g[0], a[0], b[0]);
    Gray_Cell gc0(g[0], p[0],1'b0, bf1);
   assign c[0]=bf1;
    
    
    // 1st carry ///////////////////////////////////////////
    prop p1(p[1], a[1], b[1]);
    gen g1(g[1], a[1], b[1]);
    Gray_Cell gc1(g[1], p[1], bf1, bf2);
//    buf  b2(c[1], bf2);
    assign c[1]=bf2;
    
    // 2nd carry ///////////////////////////////////////////
    prop p2(p[2], a[2], b[2]);
    gen g2(g[2], a[2], b[2]);
    Black_Cell bcl(p[2], p[1], g[2], g[1], w[1], w[2]);
    Gray_Cell gc2(w[2], w[1], bf1, bf3);
//    buf  b3(c[2], bf3);
    assign c[2]=bf3;
    // 3rd carry ///////////////////////////////////////////
    prop p3(p[3], a[3], b[3]);
    gen g3(g[3], a[3], b[3]);
    Black_Cell bc2(p[3], p[2], g[3], g[2], w[3], w[4]);
    Gray_Cell gc3(w[4], w[3], bf2, bf4);
//    buf  b4(c[3], bf4);
assign c[3]=bf4;
    // 4th carry ///////////////////////////////////////////
    prop p4(p[4], a[4], b[4]);
    gen g4(g[4], a[4], b[4]);
    Black_Cell bl3(p[4], p[3], g[4], g[3], w[5], w[6]);
    Black_Cell bl4(w[5], w[1], w[6], w[2], w[7], w[8]);
    Gray_Cell gc4(w[8], w[7], bf1, bf5);
//    buf  b5(c[4], bf5);
assign c[4]=bf5;
    // 5th carry ///////////////////////////////////////////
    prop p5(p[5], a[5], b[5]);
    gen g5(g[5], a[5], b[5]);
    Black_Cell bl5(p[5], p[4], g[5], g[4], w[9], w[10]);
    Black_Cell bl6(w[9], w[3], w[10], w[4], w[11], w[12]);
    Gray_Cell gc5(w[12], w[11], bf2, bf6);
//    buf  b6(c[5], bf6);
assign c[5]=bf6;
    // 6th carry ///////////////////////////////////////////
    prop p6(p[6], a[6], b[6]);
    gen g6(g[6], a[6], b[6]);
    Black_Cell bl7(p[6], p[5], g[6], g[5], w[13], w[14]);
    Black_Cell bl8(w[13], w[5], w[14], w[6], w[15], w[16]);
    Gray_Cell gc6(w[16], w[15], bf3, bf7);
//    buf  b7(c[6], bf7);
assign c[6]=bf7;
    // 7th carry ///////////////////////////////////////////
    prop p7(p[7], a[7], b[7]);
    gen g7(g[7], a[7], b[7]);
    Black_Cell bl9(p[7], p[6], g[7], g[6], w[17], w[18]);
    Black_Cell bl10(w[17], w[9], w[18], w[10], w[19], w[20]);
    Gray_Cell gc7(w[20], w[19], bf4, bf8);
//    buf  b8(c[7], bf8);
assign c[7]=bf8;
    //8th carry ///////////////////////////////////////////
    prop p8(p[8], a[8], b[8]);
    gen g8(g[8], a[8], b[8]);
    Black_Cell b20(p[8], p[7], g[8], g[7], w[21], w[22]);//7
    Black_Cell b21(w[21], w[13], w[22], w[14], w[23], w[24]);//6
    Black_Cell b22(w[23], w[7], w[24], w[8], w[25], w[26]);//4
    Gray_Cell gc8(w[26], w[25], bf1, bf9);
//    buf  b9(c[8], bf9);
    assign c[8]=bf9;
    //9th carry ////////////////////////////////////////////
    prop p9(p[9], a[9], b[9]);
    gen g9(g[9], a[9], b[9]);
    Black_Cell b23(p[9], p[8], g[9], g[8], w[27], w[28]);//8
    Black_Cell b24(w[27], w[17], w[28], w[18], w[29], w[30]);//7
    Black_Cell b25(w[29], w[11], w[30], w[12], w[31], w[32]);//5
    Gray_Cell gc9(w[32], w[31], bf2, bf10);//1
//    buf  b10(c[9], bf10);
    assign c[9]=bf10;
    //10th carry ////////////////////////////////////////////
    prop p10(p[10], a[10], b[10]);
    gen g10(g[10], a[10], b[10]);
    Black_Cell b26(p[10], p[9], g[10], g[9], w[33], w[34]);//9
    Black_Cell b27(w[33], w[21], w[34], w[22], w[35], w[36]);//8
    Black_Cell b28(w[35], w[15], w[36], w[16], w[37], w[38]);//6
    Gray_Cell gc10(w[38], w[37], bf3, bf11);//2
//    buf  b11(c[10], bf11);
    assign c[10]=bf11;
    //11th carry ///////////////////////////////////////////
    prop p11(p[11], a[11], b[11]);
    gen g11(g[11], a[11], b[11]);
    Black_Cell b29(p[11], p[10], g[11], g[10], w[39], w[40]);//10
    Black_Cell b30(w[39], w[27], w[40], w[28], w[41], w[42]);//9
    Black_Cell b31(w[41], w[19], w[42], w[20], w[43], w[44]);//7
    Gray_Cell gc11(w[44], w[43], bf4, bf12);//3
//    buf  b12(c[11], bf12);
    assign c[11]=bf12;
    //12th carry ///////////////////////////////////////////
    prop p12(p[12], a[12], b[12]);
    gen g12(g[12], a[12], b[12]);
    Black_Cell b32(p[12], p[11], g[12], g[11], w[45], w[46]);//11
    Black_Cell b33(w[45], w[33], w[46], w[34], w[47], w[48]);//10
    Black_Cell b34(w[47], w[23], w[48], w[24], w[49], w[50]);//8
    Gray_Cell gc12(w[50], w[49], bf5, bf13);//4
//    buf  b13(c[12], bf13);
    assign c[12]=bf13;
    //13th carry ///////////////////////////////////////////
    prop p13(p[13], a[13], b[13]);
    gen g13(g[13], a[13], b[13]);
    Black_Cell b35(p[13], p[12], g[13], g[12], w[51], w[52]);//12
    Black_Cell b36(w[51], w[39], w[52], w[40], w[53], w[54]);//11
    Black_Cell b37(w[53], w[29], w[54], w[30], w[55], w[56]);//9
    Gray_Cell gc13(w[56], w[55], bf6, bf14);//5
//    buf  b14(c[13], bf14);
    assign c[13]=bf14;
    //14th carry ///////////////////////////////////////////
    prop p14(p[14], a[14], b[14]);
    gen g14(g[14], a[14], b[14]);
    Black_Cell b38(p[14], p[13], g[14], g[13], w[57], w[58]);//13
    Black_Cell b39(w[57], w[45], w[58], w[46], w[59], w[60]);//12
    Black_Cell b40(w[59], w[35], w[60], w[36], w[61], w[62]);//10
    Gray_Cell gc14(w[62], w[61], bf7, bf15);//6
//    buf  b15(c[14], bf15);
    assign c[14]=bf15;
     //15th carry ///////////////////////////////////////////
    prop p15(p[15], a[15], b[15]);
    gen g15(g[15], a[15], b[15]);
    Black_Cell b41(p[15], p[14], g[15], g[14], w[63], w[64]);//14
    Black_Cell b42(w[63], w[51], w[64], w[52], w[65], w[66]);//13
    Black_Cell b43(w[65], w[41], w[66], w[42], w[67], w[68]);//11
    Gray_Cell gc15(w[68], w[67], bf8, bf16);//7
//    buf  b16(c[15], bf16);
    assign c[15]=bf16;
    // Sum calculation using XOR gates
    xor sum0(s[0], p[0],1'b0);
    xor sum1(s[1], p[1], c[0]);
    xor sum2(s[2], p[2], c[1]);
    xor sum3(s[3], p[3], c[2]);
    xor sum4(s[4], p[4], c[3]);
    xor sum5(s[5], p[5], c[4]);
    xor sum6(s[6], p[6], c[5]);
    xor sum7(s[7], p[7], c[6]);
    xor sum8(s[8], p[8], c[7]);
    xor sum9(s[9], p[9], c[8]);
    xor sum10(s[10], p[10], c[9]);
    xor sum11(s[11], p[11], c[10]);
    xor sum12(s[12], p[12], c[11]);
    xor sum13(s[13], p[13], c[12]);
    xor sum14(s[14], p[14], c[13]);
    xor sum15(s[15], p[15], c[14]);
    buf b17(s[16],bf16);
    
endmodule
