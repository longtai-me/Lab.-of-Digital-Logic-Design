`timescale 1ns/1ns

module L1_testbench;
    reg A,B,Ci;
    wire Co,S;

    L1 uut (
        .A(A),
        .B(B),
        .Ci(Ci),
        .Co(Co),
        .S(S)
    );

    initial begin
        A = 1'B0 ;
        B = 1'B0 ;
        Ci = 1'B0 ;
        #100 ;
        A = 1'B0 ;
        B = 1'B0 ;
        Ci = 1'B1 ;
        #100 ;
        A = 1'B0 ;
        B = 1'B1 ;
        Ci = 1'B0 ;
        #100 ;
        A = 1'B0 ;
        B = 1'B1 ;
        Ci = 1'B1 ;
        #100 ;
        A = 1'B1 ;
        B = 1'B0 ;
        Ci = 1'B0 ;
        #100 ;
        A = 1'B1 ;
        B = 1'B0 ;
        Ci = 1'B1 ;
        #100 ;
        A = 1'B1 ;
        B = 1'B1 ;
        Ci = 1'B0 ;
        #100 ;
        A = 1'B1 ;
        B = 1'B1 ;
        Ci = 1'B1 ;
    end

    initial begin
        $display("開始測試...");
        #1000
        $finish();
    end

    initial begin
        $dumpfile("L1TB.vcd");
        $dumpvars(0);
    end
    
endmodule