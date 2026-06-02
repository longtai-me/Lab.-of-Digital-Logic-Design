module ABSY(A, B, S, Y);
  input A, B, S;
  output Y;

  wire notS, notSA, SB;

  not(notS, S);
  and(notSA, notS, A);
  and(SB, S, B);
  or(Y, notSA, SB);

endmodule
