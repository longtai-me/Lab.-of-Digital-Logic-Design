`timescale 1ns/1ns
module MUX_TB ;
    reg A,S,B;
    wire Y;

    MUX uut(
        .A(A),
        .S(S),
        .B(B),
        .Y(Y)
    );

    initial begin
        //0ns
        A = 1'B0 ;
        B = 1'B0 ;
        S = 1'B0 ;
        #80 ;
        //80ns
        A = 1'B0 ;
        B = 1'B0 ;
        S = 1'B0 ;
        #80 ;
        //160ns
        A = 1'B1 ;
        B = 1'B0 ;
        S = 1'B0 ;
        #80 ;
        //240ns
        A = 1'B1 ;
        B = 1'B0 ;
        S = 1'B1 ;
        #80 ;
        //320ns
        A = 1'B1 ;
        B = 1'B0 ;
        S = 1'B1 ;
        #80 ;
        //400ns
        A = 1'B1 ;
        B = 1'B0 ;
        S = 1'B1 ;
        #80 ;
        //480ns
        A = 1'B0 ;
        B = 1'B0 ;
        S = 1'B1 ;
        #80 ;
        //560ns
        A = 1'B0 ;
        B = 1'B0 ;
        S = 1'B1 ;
        #80 ;
        //640ns
        A = 1'B0 ;
        B = 1'B1 ;
        S = 1'B1 ;
        #80 ;
        //720ns
        A = 1'B0 ;
        B = 1'B1 ;
        S = 1'B1 ;
    end

        initial begin
            $display("開始測試...") ;
            #1000 ;
            $finish() ;
        end

        initial begin
            $dumpfile("MUX.vsd") ;
            $dumpvars(0) ;
        end
endmodule