module fulladd(A, B, Ci, S, Co);
  input A, B, Ci;
  output S, Co;

  wire AB, ACi, BCi, xorAB;

  and(AB, A, B);
  and(ACi, A, Ci);
  and(BCi, B, Ci);
  or(Co, AB, ACi, BCi);

  xor(xorAB, A, B);
  xor(S, xorAB, Ci);
endmodule