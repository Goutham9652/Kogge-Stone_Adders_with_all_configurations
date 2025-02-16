`timescale 1ns / 1ps

module Black_Cell(input pi_k, pk1_j, gi_k, gk1_j,output pi_j, gi_j);
    wire w1;
    and a1(pi_j, pk1_j, pi_k);
    and a2(w1, pi_k, gk1_j);
    or o1(gi_j, w1, gi_k);
endmodule