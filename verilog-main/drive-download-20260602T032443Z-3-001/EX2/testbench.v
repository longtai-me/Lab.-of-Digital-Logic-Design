`timescale 1ns / 1ps

module shift_reg_nonblocking_tb;
    reg clk;
    reg D;
    wire [3:0] Q2;

    
    shift_reg_nonblocking u_Q2 (
        .clk(clk),
        .D(D),
        .Q2(Q2)
    );

    
    always #55 clk = ~clk;

    initial 
    begin
        clk = 0;
        D = 0;
        
        
        $dumpfile("shift_reg_nonblocking.vcd");
        $dumpvars(0, shift_reg_nonblocking_tb);

        
        #110 D = 1;
        #110 D = 0;
        #110 D = 1;
        #110 D = 0;
        #110 D = 1;
        #110 D = 0;
        #110 D = 1;
        #110 D = 0;
        #110 D = 1;
        #110 D = 1;
        #110 D = 0;
        #110 D = 1;
        #110 D = 0;
        #110 D = 0;
        #110 D = 1;
        #110 D = 0;
        #110 D = 0;
        #110 D = 1;
        #110 D = 1;
        
        #110;
        $finish; 
    end
endmodule