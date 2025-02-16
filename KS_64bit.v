`timescale 1ns / 1ps

module KS_64bit(
    input [63:0] a,b,
    input cin,
    output [64:0] s,
    output [63:0] c
    );
    wire [63:0] p, g;
    wire [516:1] w;
    wire bf1, bf2, bf3, bf4, bf5, bf6, bf7, bf8, bf9, bf10,
     bf11, bf12, bf13, bf14, bf15, bf16, bf17,
     bf18, bf19, bf20, bf21, bf22, bf23, bf24,
     bf25, bf26, bf27, bf28, bf29, bf30, bf31, bf32,bf33, bf34, bf35, bf36, bf37, bf38, bf39, bf40, bf41, bf42,
     bf43, bf44, bf45, bf46, bf47, bf48, bf49,
     bf50, bf51, bf52, bf53, bf54, bf55, bf56,
     bf57, bf58, bf59, bf60, bf61, bf62 ,bf63, bf64;
  

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

    // 26th carry ///////////////////////////////////////////
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
    
    // 32 carry ///////////////////////////////////////////
    prop p32(p[32], a[32], b[32]);
    gen g32(g[32], a[32], b[32]);
    Black_Cell b108(p[32], p[31], g[32], g[31], w[197], w[198]);//31
    Black_Cell b109(w[197], w[181], w[198], w[182], w[199], w[200]);//30
    Black_Cell b110(w[199], w[167], w[200], w[168], w[201], w[202]);//28
    Black_Cell b111(w[193], w[137], w[194], w[138], w[203], w[204]);//24
    Black_Cell b112(w[203], w[75], w[204], w[76], w[205], w[206]);//16
    Gray_Cell gc32(w[206], w[205], bf1, bf33);//0
    buf  buf33(c[32], bf33);
    
    // 33 carry ///////////////////////////////////////////
    prop p33(p[33], a[33], b[33]);
    gen g33(g[33], a[33], b[33]);
    Black_Cell b113(p[33], p[32], g[33], g[32], w[207], w[208]);//32
    Black_Cell b114(w[207], w[189], w[208], w[190], w[209], w[210]);//31
    Black_Cell b115(w[209], w[175], w[210], w[176], w[211], w[212]);//29
    Black_Cell b116(w[211], w[145], w[212], w[146], w[213], w[214]);//25
    Black_Cell b117(w[213], w[83], w[214], w[84], w[215], w[216]);//17
    Gray_Cell gc33(w[216], w[215], bf2, bf34);//1
    buf  buf34(c[33], bf34);
    
    // 34 carry ///////////////////////////////////////////
    prop p34(p[34], a[34], b[34]);
    gen g34(g[34], a[34], b[34]);
    Black_Cell b118(p[34], p[33], g[34], g[33], w[217], w[218]);//33
    Black_Cell b119(w[217], w[197], w[218], w[198], w[219], w[220]);//32
    Black_Cell b120(w[219], w[183], w[220], w[184], w[221], w[222]);//30
    Black_Cell b121(w[221], w[153], w[222], w[154], w[223], w[224]);//26
    Black_Cell b122(w[223], w[91], w[224], w[92], w[225], w[226]);//18
    Gray_Cell gc34(w[226], w[225], bf3, bf35);//2
    buf  buf35(c[34], bf35);
    
    // 35 carry ///////////////////////////////////////////
    prop p35(p[35], a[35], b[35]);
    gen g35(g[35], a[35], b[35]);
    Black_Cell b123(p[35], p[34], g[35], g[34], w[227], w[228]);//34
    Black_Cell b124(w[227], w[207], w[228], w[208], w[229], w[230]);//33
    Black_Cell b125(w[229], w[191], w[230], w[192], w[231], w[232]);//31
    Black_Cell b126(w[231], w[161], w[232], w[162], w[233], w[234]);//27
    Black_Cell b127(w[233], w[99], w[234], w[100], w[235], w[236]);//19
    Gray_Cell gc35(w[236], w[235], bf4, bf36);//3
    buf  buf36(c[35], bf36);
    
    // 36 carry ///////////////////////////////////////////
    prop p36(p[36], a[36], b[36]);
    gen g36(g[36], a[36], b[36]);
    Black_Cell b128(p[36], p[35], g[36], g[35], w[237], w[238]);//35
    Black_Cell b129(w[237], w[217], w[238], w[218], w[239], w[240]);//34
    Black_Cell b130(w[239], w[199], w[240], w[200], w[241], w[242]);//32
    Black_Cell b131(w[241], w[169], w[242], w[170], w[243], w[244]);//28
    Black_Cell b132(w[243], w[107], w[244], w[108], w[245], w[246]);//20
    Gray_Cell gc36(w[246], w[245], bf5, bf37);//4
    buf  buf37(c[36], bf37);
    
    // 37 carry ///////////////////////////////////////////
    prop p37(p[37], a[37], b[37]);
    gen g37(g[37], a[37], b[37]);
    Black_Cell b133(p[37], p[36], g[37], g[36], w[247], w[248]);//36
    Black_Cell b134(w[247], w[227], w[248], w[228], w[249], w[250]);//35
    Black_Cell b135(w[249], w[209], w[250], w[210], w[251], w[252]);//33
    Black_Cell b136(w[251], w[177], w[252], w[178], w[253], w[254]);//29
    Black_Cell b137(w[253], w[115], w[254], w[116], w[255], w[256]);//21
    Gray_Cell gc37(w[256], w[255], bf6, bf38);//5
    buf  buf38(c[37], bf38);
    
    // 38 carry ///////////////////////////////////////////
    prop p38(p[38], a[38], b[38]);
    gen g38(g[38], a[38], b[38]);
    Black_Cell b138(p[38], p[37], g[38], g[37], w[257], w[258]);//37
    Black_Cell b139(w[257], w[237], w[258], w[238], w[259], w[260]);//36
    Black_Cell b140(w[259], w[219], w[260], w[220], w[261], w[262]);//34
    Black_Cell b141(w[261], w[185], w[262], w[186], w[263], w[264]);//30
    Black_Cell b142(w[263], w[123], w[264], w[124], w[265], w[266]);//22
    Gray_Cell gc38(w[266], w[265], bf7, bf39);//6
    buf  buf39(c[38], bf39);
    
    // 39 carry ///////////////////////////////////////////
    prop p39(p[39], a[39], b[39]);
    gen g39(g[39], a[39], b[39]);
    Black_Cell b143(p[39], p[38], g[39], g[38], w[267], w[268]);//38
    Black_Cell b144(w[267], w[247], w[268], w[248], w[269], w[270]);//37
    Black_Cell b145(w[269], w[229], w[270], w[230], w[271], w[272]);//35
    Black_Cell b146(w[271], w[193], w[272], w[194], w[273], w[274]);//31
    Black_Cell b147(w[273], w[131], w[274], w[132], w[275], w[276]);//23
    Gray_Cell gc39(w[276], w[275], bf8, bf40);//7
    buf  buf40(c[39], bf40);
    
    // 40 carry ///////////////////////////////////////////
    prop p40(p[40], a[40], b[40]);
    gen g40(g[40], a[40], b[40]);
    Black_Cell b148(p[40], p[39], g[40], g[39], w[277], w[278]);//39
    Black_Cell b149(w[277], w[257], w[278], w[258], w[279], w[280]);//38
    Black_Cell b150(w[279], w[239], w[280], w[240], w[281], w[282]);//36
    Black_Cell b151(w[281], w[201], w[282], w[202], w[283], w[284]);//32
    Black_Cell b152(w[283], w[139], w[284], w[140], w[285], w[286]);//24
    Gray_Cell gc40(w[286], w[285], bf9, bf41);//8
    buf  buf41(c[40], bf41);
    
    // 41 carry ///////////////////////////////////////////
    prop p41(p[41], a[41], b[41]);
    gen g41(g[41], a[41], b[41]);
    Black_Cell b153(p[41], p[40], g[41], g[40], w[287], w[288]);//40
    Black_Cell b154(w[287], w[267], w[288], w[268], w[289], w[290]);//39
    Black_Cell b155(w[289], w[249], w[290], w[250], w[291], w[292]);//37
    Black_Cell b156(w[291], w[211], w[292], w[212], w[293], w[294]);//33
    Black_Cell b157(w[293], w[147], w[294], w[148], w[295], w[296]);//25
    Gray_Cell gc41(w[296], w[295], bf10, bf42);//9
    buf  buf42(c[41], bf42);
    
    // 42 carry ///////////////////////////////////////////
    prop p42(p[42], a[42], b[42]);
    gen g42(g[42], a[42], b[42]);
    Black_Cell b158(p[42], p[41], g[42], g[41], w[297], w[298]);//41
    Black_Cell b159(w[297], w[277], w[298], w[278], w[299], w[300]);//40
    Black_Cell b160(w[299], w[259], w[300], w[260], w[301], w[302]);//38
    Black_Cell b161(w[301], w[221], w[302], w[222], w[303], w[304]);//34
    Black_Cell b162(w[283], w[155], w[284], w[156], w[305], w[306]);//26
    Gray_Cell gc42(w[306], w[305], bf11, bf43);//10
    buf  buf43(c[42], bf43);
    
    // 43 carry ///////////////////////////////////////////
    prop p43(p[43], a[43], b[43]);
    gen g43(g[43], a[43], b[43]);
    Black_Cell b163(p[43], p[42], g[43], g[42], w[307], w[308]);//42
    Black_Cell b164(w[307], w[287], w[308], w[288], w[309], w[310]);//41
    Black_Cell b165(w[309], w[269], w[310], w[270], w[311], w[312]);//39
    Black_Cell b166(w[311], w[231], w[312], w[232], w[313], w[314]);//35
    Black_Cell b167(w[313], w[163], w[314], w[164], w[315], w[316]);//27
    Gray_Cell gc43(w[316], w[315], bf12, bf44);//11
    buf  buf44(c[43], bf44);
    
    // 44 carry ///////////////////////////////////////////
    prop p44(p[44], a[44], b[44]);
    gen g44(g[44], a[44], b[44]);
    Black_Cell b168(p[44], p[43], g[44], g[43], w[317], w[318]);//43
    Black_Cell b169(w[317], w[297], w[318], w[298], w[319], w[320]);//42
    Black_Cell b170(w[319], w[279], w[320], w[280], w[321], w[322]);//40
    Black_Cell b171(w[321], w[241], w[322], w[242], w[323], w[324]);//36
    Black_Cell b172(w[323], w[171], w[324], w[172], w[325], w[326]);//28
    Gray_Cell gc44(w[326], w[325], bf13, bf45);//12
    buf  buf45(c[44], bf45);
    
    // 45 carry ///////////////////////////////////////////
    prop p45(p[45], a[45], b[45]);
    gen g45(g[45], a[45], b[45]);
    Black_Cell b173(p[45], p[44], g[45], g[44], w[327], w[328]);//44
    Black_Cell b174(w[327], w[307], w[328], w[308], w[329], w[330]);//43
    Black_Cell b175(w[329], w[289], w[330], w[290], w[331], w[332]);//41
    Black_Cell b176(w[331], w[251], w[332], w[252], w[333], w[334]);//37
    Black_Cell b177(w[333], w[179], w[334], w[180], w[335], w[336]);//29
    Gray_Cell gc45(w[336], w[335], bf14, bf46);//13
    buf  buf46(c[45], bf46);
    
    // 46 carry ///////////////////////////////////////////
    prop p46(p[46], a[46], b[46]);
    gen g46(g[46], a[46], b[46]);
    Black_Cell b178(p[46], p[45], g[46], g[45], w[337], w[338]);//45
    Black_Cell b179(w[337], w[317], w[338], w[318], w[339], w[340]);//44
    Black_Cell b180(w[339], w[299], w[330], w[300], w[341], w[342]);//42
    Black_Cell b181(w[341], w[261], w[342], w[262], w[343], w[344]);//38
    Black_Cell b182(w[343], w[187], w[344], w[188], w[345], w[346]);//30
    Gray_Cell gc46(w[346], w[345], bf15, bf47);//14
    buf  buf47(c[46], bf47);
    
    // 47 carry ///////////////////////////////////////////
    prop p47(p[47], a[47], b[47]);
    gen g47(g[47], a[47], b[47]);
    Black_Cell b183(p[47], p[46], g[47], g[46], w[347], w[348]);//46
    Black_Cell b184(w[347], w[327], w[348], w[328], w[349], w[350]);//45
    Black_Cell b185(w[349], w[309], w[350], w[310], w[351], w[352]);//43
    Black_Cell b186(w[351], w[271], w[352], w[272], w[353], w[354]);//39
    Black_Cell b187(w[353], w[195], w[354], w[196], w[355], w[356]);//31
    Gray_Cell gc47(w[356], w[355], bf16, bf48);//15
    buf  buf48(c[47], bf48);
    
    // 48 carry ///////////////////////////////////////////
    prop p48(p[48], a[48], b[48]);
    gen g48(g[48], a[48], b[48]);
    Black_Cell b188(p[48], p[47], g[48], g[47], w[357], w[358]);//47
    Black_Cell b189(w[357], w[337], w[358], w[338], w[359], w[360]);//46
    Black_Cell b190(w[359], w[319], w[360], w[320], w[361], w[362]);//44
    Black_Cell b191(w[361], w[281], w[362], w[282], w[363], w[364]);//40
    Black_Cell b192(w[363], w[203], w[364], w[204], w[365], w[366]);//32
    Gray_Cell gc48(w[366], w[365], bf17, bf49);//16
    buf  buf49(c[48], bf49);
    
    // 49 carry ///////////////////////////////////////////
    prop p49(p[49], a[49], b[49]);
    gen g49(g[49], a[49], b[49]);
    Black_Cell b193(p[49], p[48], g[49], g[48], w[367], w[368]);//48
    Black_Cell b194(w[367], w[347], w[368], w[348], w[369], w[370]);//47
    Black_Cell b195(w[369], w[329], w[370], w[330], w[371], w[372]);//45
    Black_Cell b196(w[371], w[291], w[372], w[292], w[373], w[374]);//41
    Black_Cell b197(w[373], w[211], w[374], w[212], w[375], w[376]);//33
    Gray_Cell gc49(w[376], w[375], bf18, bf50);//17
    buf  buf50(c[49], bf50);
    
    // 50 carry ///////////////////////////////////////////
    prop p50(p[50], a[50], b[50]);
    gen g50(g[50], a[50], b[50]);
    Black_Cell b198(p[50], p[49], g[50], g[49], w[377], w[378]);//49
    Black_Cell b199(w[377], w[357], w[378], w[358], w[379], w[380]);//48
    Black_Cell b200(w[379], w[339], w[380], w[340], w[381], w[382]);//46
    Black_Cell b201(w[381], w[301], w[382], w[302], w[383], w[384]);//42
    Black_Cell b202(w[383], w[219], w[384], w[220], w[385], w[386]);//34
    Gray_Cell gc50(w[386], w[385], bf19, bf51);//18
    buf  buf51(c[50], bf51);
    
    // 51 carry ///////////////////////////////////////////
    prop p51(p[51], a[51], b[51]);
    gen g51(g[51], a[51], b[51]);
    Black_Cell b203(p[51], p[50], g[51], g[50], w[387], w[388]);//50
    Black_Cell b204(w[387], w[367], w[388], w[368], w[389], w[390]);//49
    Black_Cell b205(w[389], w[349], w[390], w[350], w[391], w[392]);//47
    Black_Cell b206(w[391], w[311], w[392], w[312], w[393], w[394]);//43
    Black_Cell b207(w[393], w[227], w[394], w[228], w[395], w[396]);//35
    Gray_Cell gc51(w[396], w[395], bf20, bf52);//19
    buf  buf52(c[51], bf52);
    
    // 52 carry ///////////////////////////////////////////
    prop p52(p[52], a[52], b[52]);
    gen g52(g[52], a[52], b[52]);
    Black_Cell b208(p[52], p[51], g[52], g[51], w[397], w[398]);//51
    Black_Cell b209(w[397], w[377], w[398], w[378], w[399], w[400]);//50
    Black_Cell b210(w[399], w[359], w[400], w[360], w[401], w[402]);//48
    Black_Cell b211(w[401], w[321], w[402], w[322], w[403], w[404]);//44
    Black_Cell b212(w[403], w[235], w[404], w[236], w[405], w[406]);//36
    Gray_Cell gc52(w[406], w[405], bf21, bf53);//20
    buf  buf53(c[52], bf53);
    
    // 53 carry ///////////////////////////////////////////
    prop p53(p[53], a[53], b[53]);
    gen g53(g[53], a[53], b[53]);
    Black_Cell b213(p[53], p[52], g[53], g[52], w[407], w[408]);//52
    Black_Cell b214(w[407], w[387], w[408], w[388], w[409], w[410]);//51
    Black_Cell b215(w[409], w[369], w[410], w[370], w[411], w[412]);//49
    Black_Cell b216(w[411], w[331], w[412], w[332], w[413], w[414]);//45
    Black_Cell b217(w[413], w[243], w[414], w[244], w[415], w[416]);//37
    Gray_Cell gc53(w[416], w[415], bf22, bf54);//21
    buf  buf54(c[53], bf54);
    
    // 54 carry ///////////////////////////////////////////
    prop p54(p[54], a[54], b[54]);
    gen g54(g[54], a[54], b[54]);
    Black_Cell b218(p[54], p[53], g[54], g[53], w[417], w[418]);//52
    Black_Cell b219(w[417], w[397], w[418], w[398], w[419], w[420]);//51
    Black_Cell b220(w[419], w[379], w[420], w[380], w[421], w[422]);//49
    Black_Cell b221(w[421], w[341], w[422], w[342], w[423], w[424]);//45
    Black_Cell b222(w[423], w[251], w[424], w[252], w[425], w[426]);//37
    Gray_Cell gc54(w[426], w[425], bf23, bf55);//21
    buf  buf55(c[54], bf55);
    
    // 55 carry ///////////////////////////////////////////
    prop p55(p[55], a[55], b[55]);
    gen g55(g[55], a[55], b[55]);
    Black_Cell b223(p[55], p[54], g[55], g[54], w[427], w[428]);//52
    Black_Cell b224(w[427], w[407], w[428], w[408], w[429], w[430]);//51
    Black_Cell b225(w[429], w[389], w[430], w[390], w[431], w[432]);//49
    Black_Cell b226(w[431], w[351], w[432], w[352], w[433], w[434]);//45
    Black_Cell b227(w[433], w[259], w[434], w[260], w[435], w[436]);//37
    Gray_Cell gc55(w[436], w[435], bf24, bf56);//21
    buf  buf56(c[55], bf56);
    
    // 56 carry ///////////////////////////////////////////
    prop p56(p[56], a[56], b[56]);
    gen g56(g[56], a[56], b[56]);
    Black_Cell b228(p[56], p[55], g[56], g[55], w[437], w[438]);//52
    Black_Cell b229(w[437], w[417], w[438], w[418], w[439], w[440]);//51
    Black_Cell b230(w[439], w[399], w[440], w[400], w[441], w[442]);//49
    Black_Cell b231(w[441], w[361], w[442], w[362], w[443], w[444]);//45
    Black_Cell b232(w[443], w[267], w[444], w[268], w[445], w[446]);//37
    Gray_Cell gc56(w[446], w[445], bf25, bf57);//21
    buf  buf57(c[56], bf57);
    
    // 57 carry ///////////////////////////////////////////
    prop p57(p[57], a[57], b[57]);
    gen g57(g[57], a[57], b[57]);
    Black_Cell b233(p[57], p[56], g[57], g[56], w[447], w[448]);//52
    Black_Cell b234(w[447], w[427], w[448], w[428], w[449], w[450]);//51
    Black_Cell b235(w[449], w[409], w[450], w[410], w[451], w[452]);//49
    Black_Cell b236(w[451], w[371], w[452], w[372], w[453], w[454]);//45
    Black_Cell b237(w[453], w[275], w[454], w[276], w[455], w[456]);//37
    Gray_Cell gc57(w[456], w[455], bf26, bf58);//21
    buf  buf58(c[57], bf58);
    
    // 58 carry ///////////////////////////////////////////
    prop p58(p[58], a[58], b[58]);
    gen g58(g[58], a[58], b[58]);
    Black_Cell b238(p[58], p[57], g[58], g[57], w[457], w[458]);//52
    Black_Cell b239(w[457], w[437], w[458], w[438], w[459], w[460]);//51
    Black_Cell b240(w[459], w[419], w[460], w[420], w[461], w[462]);//49
    Black_Cell b241(w[461], w[381], w[462], w[382], w[463], w[464]);//45
    Black_Cell b242(w[463], w[283], w[464], w[284], w[465], w[466]);//37
    Gray_Cell gc58(w[466], w[465], bf27, bf59);//21
    buf  buf59(c[58], bf59);
    
    //59 carry ///////////////////////////////////////////
    prop p59(p[59], a[59], b[59]);
    gen g59(g[59], a[59], b[59]);
    Black_Cell b243(p[59], p[58], g[59], g[58], w[467], w[468]);//52
    Black_Cell b244(w[467], w[447], w[468], w[448], w[469], w[470]);//51
    Black_Cell b245(w[469], w[429], w[470], w[430], w[471], w[472]);//49
    Black_Cell b246(w[471], w[391], w[472], w[392], w[473], w[474]);//45
    Black_Cell b247(w[473], w[291], w[474], w[292], w[475], w[476]);//37
    Gray_Cell gc59(w[476], w[475], bf28, bf60);//21
    buf  buf60(c[59], bf60);
    
    // 60 carry ///////////////////////////////////////////
    prop p60(p[60], a[60], b[60]);
    gen g60(g[60], a[60], b[60]);
    Black_Cell b248(p[60], p[59], g[60], g[59], w[477], w[478]);//52
    Black_Cell b249(w[477], w[457], w[478], w[458], w[479], w[480]);//51
    Black_Cell b250(w[479], w[439], w[480], w[440], w[481], w[482]);//49
    Black_Cell b251(w[481], w[401], w[482], w[402], w[483], w[484]);//45
    Black_Cell b252(w[483], w[299], w[484], w[300], w[485], w[486]);//37
    Gray_Cell gc60(w[486], w[485], bf29, bf61);//21
    buf  buf61(c[60], bf61);
    
    // 61 carry ///////////////////////////////////////////
    prop p61(p[61], a[61], b[61]);
    gen g61(g[61], a[61], b[61]);
    Black_Cell b253(p[61], p[60], g[61], g[60], w[487], w[488]);//52
    Black_Cell b254(w[487], w[467], w[488], w[468], w[489], w[490]);//51
    Black_Cell b255(w[489], w[449], w[490], w[450], w[491], w[492]);//49
    Black_Cell b256(w[491], w[411], w[492], w[412], w[493], w[494]);//45
    Black_Cell b257(w[493], w[307], w[494], w[308], w[495], w[496]);//37
    Gray_Cell gc61(w[496], w[495], bf30, bf62);//21
    buf  buf62(c[61], bf62);
    
    // 62 carry ///////////////////////////////////////////
    prop p62(p[62], a[62], b[62]);
    gen g62(g[62], a[62], b[62]);
    Black_Cell b258(p[62], p[61], g[62], g[61], w[497], w[498]);//52
    Black_Cell b259(w[497], w[477], w[498], w[478], w[499], w[500]);//51
    Black_Cell b260(w[499], w[459], w[500], w[460], w[501], w[502]);//49
    Black_Cell b261(w[501], w[421], w[502], w[422], w[503], w[504]);//45
    Black_Cell b262(w[503], w[315], w[504], w[316], w[505], w[506]);//37
    Gray_Cell gc62(w[506], w[505], bf31, bf63);//21
    buf  buf63(c[62], bf63);
    
    // 63 carry ///////////////////////////////////////////
    prop p63(p[63], a[63], b[63]);
    gen g63(g[63], a[63], b[63]);
    Black_Cell b263(p[63], p[62], g[63], g[62], w[507], w[508]);//52
    Black_Cell b264(w[507], w[487], w[508], w[488], w[509], w[510]);//51
    Black_Cell b265(w[509], w[469], w[510], w[470], w[511], w[512]);//49
    Black_Cell b266(w[511], w[431], w[512], w[432], w[513], w[514]);//45
    Black_Cell b267(w[513], w[323], w[514], w[324], w[515], w[516]);//37
    Gray_Cell gc63(w[516], w[515], bf32, bf64);//21
    buf  buf64(c[63], bf64);
    
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
    xor sum32(s[32], p[32], c[31]);
    xor sum33(s[33], p[33], c[32]);
    xor sum34(s[34], p[34], c[33]);
    xor sum35(s[35], p[35], c[34]);
    xor sum36(s[36], p[36], c[35]);
    xor sum37(s[37], p[37], c[36]);
    xor sum38(s[38], p[38], c[37]);
    xor sum39(s[39], p[39], c[38]);
    xor sum40(s[40], p[40], c[39]);
    xor sum41(s[41], p[41], c[40]);
    xor sum42(s[42], p[42], c[41]);
    xor sum43(s[43], p[43], c[42]);
    xor sum44(s[44], p[44], c[43]);
    xor sum45(s[45], p[45], c[44]);
    xor sum46(s[46], p[46], c[45]);
    xor sum47(s[47], p[47], c[46]);
    xor sum48(s[48], p[48], c[47]);
    xor sum49(s[49], p[49], c[48]);
    xor sum50(s[50], p[50], c[49]);
    xor sum51(s[51], p[51], c[50]);
    xor sum52(s[52], p[52], c[51]);
    xor sum53(s[53], p[53], c[52]);
    xor sum54(s[54], p[54], c[53]);
    xor sum55(s[55], p[55], c[54]);
    xor sum56(s[56], p[56], c[55]);
    xor sum57(s[57], p[57], c[56]);
    xor sum58(s[58], p[58], c[57]);
    xor sum59(s[59], p[59], c[58]);
    xor sum60(s[60], p[60], c[59]);
    xor sum61(s[61], p[61], c[60]);
    xor sum62(s[62], p[62], c[61]);
    xor sum63(s[63], p[63], c[62]);
    buf buf65(s[64],bf64);

endmodule
