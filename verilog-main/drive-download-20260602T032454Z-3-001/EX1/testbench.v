`timescale 1ns/1ns
module IDK_TB ;
    reg [0:3] A,B,C ;
    wire[0:3] max ,min ,mid ;

    IDK uut(
        .A(A), .B(B), .C(C),
        .max(max), .min(min), .mid(mid)
    ) ;

    initial begin
        A = 4'b0000 ; B = 4'b0000 ; C = 4'b0000 ;
        #20 ;
        A = 4'b0001 ; B = 4'b0010 ; C = 4'b0100 ;
        #20 ;
        A = 4'b1000 ; B = 4'b0100 ; C = 4'b0010 ;
        #20 ;
        A = 4'b1100 ; B = 4'b0010 ; C = 4'b0001 ;
    end

    initial begin
        $display("Loding......") ;
        $dumpfile("IDK.vcd") ;
        $dumpvars(0) ;
        #100 ;
        $finish() ;

    end
endmodule