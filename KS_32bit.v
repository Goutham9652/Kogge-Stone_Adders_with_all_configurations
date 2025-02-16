`timescale 1ns / 1ps

module KS_32bit(
    input [31:0] a,b,
    input cin,
    output [32:0] s,
    output [31:0] c
    );
    wire [31:0] p, g;
    wire [196:1] w;
    wire bf1, bf2, bf3, bf4, bf5, bf6, bf7, bf8, bf9, bf10,
     bf11, bf12, bf13, bf14, bf15, bf16, bf17,
    bf18, bf19, bf20, bf21, bf22, bf23, bf24,
     bf25, bf26, bf27, bf28, bf29, bf30, bf31, bf32;
  

    // 0th carry //////////////////////////////////////////
    prop p0(p[0], a[0], b[0]);
    gen g0(g[0], a[0], b[0]);
    Gray_Cell gc0(g[0], p[0], cin, bf1);
    buf  b1(c[0], bf1);
    
    // 1st carry ///////////////////////////////////////////
    prop p1(p[1], a[1], b[1]);
    gen g1(g[1], a[1], b[1]);
    Gray_Cell gc1(g[1], p[1], bf1, bf2);
    buf  b2(c[1], bf2);
    
    // 2nd carry ///////////////////////////////////////////
    prop p2(p[2], a[2], b[2]);
    gen g2(g[2], a[2], b[2]);
    Black_Cell bcl(p[2], p[1], g[2], g[1], w[1], w[2]);
    Gray_Cell gc2(w[2], w[1], bf1, bf3);
    buf  b3(c[2], bf3);

    // 3rd carry ///////////////////////////////////////////
    prop p3(p[3], a[3], b[3]);
    gen g3(g[3], a[3], b[3]);
    Black_Cell bc2(p[3], p[2], g[3], g[2], w[3], w[4]);
    Gray_Cell gc3(w[4], w[3], bf2, bf4);
    buf  b4(c[3], bf4);

    // 4th carry ///////////////////////////////////////////
    prop p4(p[4], a[4], b[4]);
    gen g4(g[4], a[4], b[4]);
    Black_Cell bl3(p[4], p[3], g[4], g[3], w[5], w[6]);
    Black_Cell bl4(w[5], w[1], w[6], w[2], w[7], w[8]);
    Gray_Cell gc4(w[8], w[7], bf1, bf5);
    buf  b5(c[4], bf5);

    // 5th carry ///////////////////////////////////////////
    prop p5(p[5], a[5], b[5]);
    gen g5(g[5], a[5], b[5]);
    Black_Cell bl5(p[5], p[4], g[5], g[4], w[9], w[10]);
    Black_Cell bl6(w[9], w[3], w[10], w[4], w[11], w[12]);
    Gray_Cell gc5(w[12], w[11], bf2, bf6);
    buf  b6(c[5], bf6);

    // 6th carry ///////////////////////////////////////////
    prop p6(p[6], a[6], b[6]);
    gen g6(g[6], a[6], b[6]);
    Black_Cell bl7(p[6], p[5], g[6], g[5], w[13], w[14]);
    Black_Cell bl8(w[13], w[5], w[14], w[6], w[15], w[16]);
    Gray_Cell gc6(w[16], w[15], bf3, bf7);
    buf  b7(c[6], bf7);

    // 7th carry ///////////////////////////////////////////
    prop p7(p[7], a[7], b[7]);
    gen g7(g[7], a[7], b[7]);
    Black_Cell bl9(p[7], p[6], g[7], g[6], w[17], w[18]);
    Black_Cell bl10(w[17], w[9], w[18], w[10], w[19], w[20]);
    Gray_Cell gc7(w[20], w[19], bf4, bf8);
    buf  b8(c[7], bf8);

    //8th carry ///////////////////////////////////////////
    prop p8(p[8], a[8], b[8]);
    gen g8(g[8], a[8], b[8]);
    Black_Cell b20(p[8], p[7], g[8], g[7], w[21], w[22]);//7
    Black_Cell b21(w[21], w[13], w[22], w[14], w[23], w[24]);//6
    Black_Cell b22(w[23], w[7], w[24], w[8], w[25], w[26]);//4
    Gray_Cell gc8(w[26], w[25], bf1, bf9);
    buf  b9(c[8], bf9);
    
    //9th carry ////////////////////////////////////////////
    prop p9(p[9], a[9], b[9]);
    gen g9(g[9], a[9], b[9]);
    Black_Cell b23(p[9], p[8], g[9], g[8], w[27], w[28]);//8
    Black_Cell b24(w[27], w[17], w[28], w[18], w[29], w[30]);//7
    Black_Cell b25(w[29], w[11], w[30], w[12], w[31], w[32]);//5
    Gray_Cell gc9(w[32], w[31], bf2, bf10);//1
    buf  b10(c[9], bf10);
    
    //10th carry ////////////////////////////////////////////
    prop p10(p[10], a[10], b[10]);
    gen g10(g[10], a[10], b[10]);
    Black_Cell b26(p[10], p[9], g[10], g[9], w[33], w[34]);//9
    Black_Cell b27(w[33], w[21], w[34], w[22], w[35], w[36]);//8
    Black_Cell b28(w[35], w[15], w[36], w[16], w[37], w[38]);//6
    Gray_Cell gc10(w[38], w[37], bf3, bf11);//2
    buf  b11(c[10], bf11);
    
    //11th carry ///////////////////////////////////////////
    prop p11(p[11], a[11], b[11]);
    gen g11(g[11], a[11], b[11]);
    Black_Cell b29(p[11], p[10], g[11], g[10], w[39], w[40]);//10
    Black_Cell b30(w[39], w[27], w[40], w[28], w[41], w[42]);//9
    Black_Cell b31(w[41], w[19], w[42], w[20], w[43], w[44]);//7
    Gray_Cell gc11(w[44], w[43], bf4, bf12);//3
    buf  b12(c[11], bf12);
    
    //12th carry ///////////////////////////////////////////
    prop p12(p[12], a[12], b[12]);
    gen g12(g[12], a[12], b[12]);
    Black_Cell b32(p[12], p[11], g[12], g[11], w[45], w[46]);//11
    Black_Cell b33(w[45], w[33], w[46], w[34], w[47], w[48]);//10
    Black_Cell b34(w[47], w[23], w[48], w[24], w[49], w[50]);//8
    Gray_Cell gc12(w[50], w[49], bf5, bf13);//4
    buf  b13(c[12], bf13);
    
    //13th carry ///////////////////////////////////////////
    prop p13(p[13], a[13], b[13]);
    gen g13(g[13], a[13], b[13]);
    Black_Cell b35(p[13], p[12], g[13], g[12], w[51], w[52]);//12
    Black_Cell b36(w[51], w[39], w[52], w[40], w[53], w[54]);//11
    Black_Cell b37(w[53], w[29], w[54], w[30], w[55], w[56]);//9
    Gray_Cell gc13(w[56], w[55], bf6, bf14);//5
    buf  b14(c[13], bf14);
    
    //14th carry ///////////////////////////////////////////
    prop p14(p[14], a[14], b[14]);
    gen g14(g[14], a[14], b[14]);
    Black_Cell b38(p[14], p[13], g[14], g[13], w[57], w[58]);//13
    Black_Cell b39(w[57], w[45], w[58], w[46], w[59], w[60]);//12
    Black_Cell b40(w[59], w[35], w[60], w[36], w[61], w[62]);//10
    Gray_Cell gc14(w[62], w[61], bf7, bf15);//6
    buf  b15(c[14], bf15);
    
     //15th carry ///////////////////////////////////////////
    prop p15(p[15], a[15], b[15]);
    gen g15(g[15], a[15], b[15]);
    Black_Cell b41(p[15], p[14], g[15], g[14], w[63], w[64]);//14
    Black_Cell b42(w[63], w[51], w[64], w[52], w[65], w[66]);//13
    Black_Cell b43(w[65], w[41], w[66], w[42], w[67], w[68]);//11
    Gray_Cell gc15(w[68], w[67], bf8, bf16);//7
    buf  b16(c[15], bf16);
    
    //16th carry ///////////////////////////////////////////
    prop p16(p[16], a[16], b[16]);
     gen g16(g[16], a[16], b[16]);
    Black_Cell b44(p[16], p[15], g[16], g[15], w[69], w[70]);
    Black_Cell b45(w[69], w[57], w[70], w[58], w[71], w[72]);
    Black_Cell b46(w[71], w[47], w[72], w[48], w[73], w[74]);
    Black_Cell b47(w[73], w[25], w[74], w[26], w[75], w[76]);
    Gray_Cell gc16(w[76], w[75], bf1, bf17);
    buf b17(c[16], bf17);
    
    //17th carry ///////////////////////////////////////////
    prop p17(p[17], a[17], b[17]);
    gen g17(g[17], a[17], b[17]);
    Black_Cell b48(p[17], p[16], g[17], g[16], w[77], w[78]);  //17
    Black_Cell b49(w[77], w[63], w[78], w[64], w[79], w[80]);  //15
    Black_Cell b50(w[79], w[53], w[80], w[54], w[81], w[82]);  //13
    Black_Cell b51(w[81], w[31], w[82], w[32], w[83], w[84]);   //9
    Gray_Cell gc17(w[84], w[83], bf2, bf18);                    //1
    buf  b18(c[17], bf18);
    
    //18th carry ///////////////////////////////////////////
    prop p18(p[18], a[18], b[18]);
    gen g18(g[18], a[18], b[18]);
    Black_Cell b52(p[18], p[17], g[18], g[17], w[85], w[86]);   //18
    Black_Cell b53(w[85], w[69], w[86], w[70], w[87], w[88]);   //16
    Black_Cell b54(w[87], w[59], w[88], w[60], w[89], w[90]);   //14
    Black_Cell b55(w[89], w[37], w[90], w[38], w[91], w[92]);   //10
    Gray_Cell gc18(w[92], w[91], bf3, bf19);                     //2
    buf  b19(c[18], bf19);
    
    // 19th carry ///////////////////////////////////////////
    prop p19(p[19], a[19], b[19]);
    gen g19(g[19], a[19], b[19]);
    Black_Cell b56(p[19], p[18], g[19], g[18], w[93], w[94]);   //19
    Black_Cell b57(w[93], w[77], w[94], w[78], w[95], w[96]);   //17
    Black_Cell b58(w[95], w[65], w[96], w[66], w[97], w[98]);   //15
    Black_Cell b59(w[97], w[43], w[98], w[44], w[99], w[100]);  //11
    Gray_Cell gc19(w[100], w[99], bf4, bf20);                   //3
    buf  buf20(c[19], bf20);
    
    // 20th carry ///////////////////////////////////////////
    prop p20(p[20], a[20], b[20]);
    gen g20(g[20], a[20], b[20]);
    Black_Cell b60(p[20], p[19], g[20], g[19], w[101], w[102]);   //20
    Black_Cell b61(w[101], w[85], w[102], w[86], w[103], w[104]);   //18
    Black_Cell b62(w[103], w[71], w[104], w[72], w[105], w[106]);   //16
    Black_Cell b63(w[105], w[49], w[106], w[50], w[107], w[108]);   //12
    Gray_Cell gc20(w[108], w[107], bf5, bf21);                      //4
    buf  buf21(c[20], bf21);

    // 21st carry ///////////////////////////////////////////
    prop p21(p[21], a[21], b[21]);
    gen g21(g[21], a[21], b[21]);
    Black_Cell b64(p[21], p[20], g[21], g[20], w[109], w[110]);    //21
    Black_Cell b65(w[109], w[93], w[110], w[94], w[111], w[112]);   //19
    Black_Cell b66(w[111], w[79], w[112], w[80], w[113], w[114]);   //17
    Black_Cell b67(w[113], w[55], w[114], w[56], w[115], w[116]);   //13
    Gray_Cell gc21(w[116], w[115], bf6, bf22);                      //5
    buf  buf22(c[21], bf22);

    // 22nd carry ///////////////////////////////////////////
    prop p22(p[22], a[22], b[22]);
    gen g22(g[22], a[22], b[22]);
    Black_Cell b68(p[22], p[21], g[22], g[21], w[117], w[118]);     //22
    Black_Cell b69(w[117], w[101], w[118], w[102], w[119], w[120]);   //20
    Black_Cell b70(w[119], w[87], w[120], w[88], w[121], w[122]);   //18
    Black_Cell b71(w[121], w[61], w[122], w[62], w[123], w[124]);   //14
    Gray_Cell gc22(w[124], w[123], bf7, bf23);                      //6
    buf  buf23(c[22], bf23);

    // 23 carry ///////////////////////////////////////////
    prop p23(p[23], a[23], b[23]);
    gen g23(g[23], a[23], b[23]);
    Black_Cell b72(p[23], p[22], g[23], g[22], w[125], w[126]);//23
    Black_Cell b73(w[125], w[109], w[126], w[110], w[127], w[128]);//21
    Black_Cell b74(w[127], w[95], w[128], w[96], w[129], w[130]);//19
    Black_Cell b75(w[129], w[67], w[130], w[68], w[131], w[132]);//15
    Gray_Cell gc23(w[132], w[131], bf8, bf24);                  //7
    buf  buf24(c[23], bf24);

    // 24th carry ///////////////////////////////////////////
    prop p24(p[24], a[24], b[24]);
    gen g24(g[24], a[24], b[24]);
    Black_Cell b76(p[24], p[23], g[24], g[23], w[133], w[134]);
    Black_Cell b77(w[133], w[117], w[134], w[118], w[135], w[136]);
    Black_Cell b78(w[135], w[103], w[136], w[104], w[137], w[138]);
    Black_Cell b79(w[137], w[73], w[138], w[74], w[139], w[140]);
    Gray_Cell gc24(w[140], w[139], bf9, bf25);
    buf  buf25(c[24], bf25);

    //25th carry ///////////////////////////////////////////
    prop p25(p[25], a[25], b[25]);
    gen g25(g[25], a[25], b[25]);
    Black_Cell b80(p[25], p[24], g[25], g[24], w[141], w[142]);
    Black_Cell b81(w[141], w[125], w[142], w[126], w[143], w[144]);
    Black_Cell b82(w[143], w[111], w[144], w[112], w[145], w[146]);
    Black_Cell b83(w[145], w[79], w[146], w[80], w[147], w[148]);
    Gray_Cell gc25(w[148], w[147], bf10, bf26);
    buf  buf26(c[25], bf26);

    //26th carry ///////////////////////////////////////////
    prop p26(p[26], a[26], b[26]);
    gen g26(g[26], a[26], b[26]);
    Black_Cell b84(p[26], p[25], g[26], g[25], w[149], w[150]);
    Black_Cell b85(w[149], w[133], w[150], w[134], w[151], w[152]);
    Black_Cell b86(w[151], w[119], w[152], w[120], w[153], w[154]);
    Black_Cell b87(w[153], w[85], w[154], w[86], w[155], w[156]);
    Gray_Cell gc26(w[156], w[155], bf11, bf27);
    buf  buf27(c[26], bf27);

    // 27th carry ///////////////////////////////////////////
    prop p27(p[27], a[27], b[27]);
    gen g27(g[27], a[27], b[27]);
    Black_Cell b88(p[27], p[26], g[27], g[26], w[157], w[158]);
    Black_Cell b89(w[157], w[141], w[158], w[142], w[159], w[160]);
    Black_Cell b90(w[159], w[127], w[160], w[128], w[161], w[162]);
    Black_Cell b91(w[161], w[91], w[162], w[92], w[163], w[164]);
    Gray_Cell gc27(w[164], w[163], bf12, bf28);
    buf  buf28(c[27], bf28);

    // 28 carry ///////////////////////////////////////////
    prop p28(p[28], a[28], b[28]);
    gen g28(g[28], a[28], b[28]);
    Black_Cell b92(p[28], p[27], g[28], g[27], w[165], w[166]);
    Black_Cell b93(w[165], w[149], w[166], w[150], w[167], w[168]);
    Black_Cell b94(w[167], w[135], w[168], w[136], w[169], w[170]);
    Black_Cell b95(w[169], w[97], w[170], w[98], w[171], w[172]);
    Gray_Cell gc28(w[172], w[171], bf13, bf29);
    buf  buf29(c[28], bf29);

    // 29 carry ///////////////////////////////////////////
    prop p29(p[29], a[29], b[29]);
    gen g29(g[29], a[29], b[29]);
    Black_Cell b96(p[29], p[28], g[29], g[28], w[173], w[174]);
    Black_Cell b97(w[173], w[157], w[174], w[158], w[175], w[176]);
    Black_Cell b98(w[175], w[143], w[176], w[144], w[177], w[178]);
    Black_Cell b99(w[177], w[103], w[178], w[104], w[179], w[180]);
    Gray_Cell gc29(w[180], w[179], bf14, bf30);
    buf  buf30(c[29], bf30);

    // 30 carry ///////////////////////////////////////////
    prop p30(p[30], a[30], b[30]);
    gen g30(g[30], a[30], b[30]);
    Black_Cell b100(p[30], p[29], g[30], g[29], w[181], w[182]);
    Black_Cell b101(w[181], w[165], w[182], w[166], w[183], w[184]);
    Black_Cell b102(w[183], w[151], w[184], w[152], w[185], w[186]);
    Black_Cell b103(w[185], w[109], w[186], w[110], w[187], w[188]);
    Gray_Cell gc30(w[188], w[187], bf15, bf31);
    buf  buf31(c[30], bf31);

    // 31 carry ///////////////////////////////////////////
    prop p31(p[31], a[31], b[31]);
    gen g31(g[31], a[31], b[31]);
    Black_Cell b104(p[31], p[30], g[31], g[30], w[189], w[190]);
    Black_Cell b105(w[189], w[173], w[190], w[174], w[191], w[192]);
    Black_Cell b106(w[191], w[159], w[192], w[160], w[193], w[194]);
    Black_Cell b107(w[193], w[117], w[194], w[118], w[195], w[196]);
    Gray_Cell gc31(w[196], w[195], bf16, bf32);
    buf  buf32(c[31], bf32);
    
     // Sum calculation using XOR gates ///////////////////////////////////////////
    xor sum0(s[0], p[0], cin);
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
    xor sum16(s[16], p[16], c[15]);
    xor sum17(s[17], p[17], c[16]);
    xor sum18(s[18], p[18], c[17]);
    xor sum19(s[19], p[19], c[18]);
    xor sum20(s[20], p[20], c[19]);
    xor sum21(s[21], p[21], c[20]);
    xor sum22(s[22], p[22], c[21]);
    xor sum23(s[23], p[23], c[22]);
    xor sum24(s[24], p[24], c[23]);
    xor sum25(s[25], p[25], c[24]);
    xor sum26(s[26], p[26], c[25]);
    xor sum27(s[27], p[27], c[26]);
    xor sum28(s[28], p[28], c[27]);
    xor sum29(s[29], p[29], c[28]);
    xor sum30(s[30], p[30], c[29]);
    xor sum31(s[31], p[31], c[30]);
    buf buf33(s[32],bf32);
    
endmodule