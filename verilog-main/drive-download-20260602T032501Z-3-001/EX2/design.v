module MUX (A, S, B, Y);
    input A, S, B ;
    output Y ;
    not (S_N,S) ;
    and (AS_N, A, S_N) ;
    and (SB, S, B) ;
    or (Y, AS_N, SB) ;
endmodule