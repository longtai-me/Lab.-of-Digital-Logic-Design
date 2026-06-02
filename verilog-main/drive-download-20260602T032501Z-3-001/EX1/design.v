module L1 (A,B,Ci,Co,S);
    input A,B,Ci ;
    output Co,S ;
    and (AB,A,B);
    and (ACi,A,Ci);
    and (BCi,B,Ci);
    xor (S,A,B,Ci);
endmodule