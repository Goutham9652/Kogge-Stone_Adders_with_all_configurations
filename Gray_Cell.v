`timescale 1ns / 1ps

module Gray_Cell(input gi_k, pi_k, gk1_j,output gi_j);
    wire w1;
    and a1(w1, pi_k, gk1_j);
    or o1(gi_j, w1, gi_k);
endmodule