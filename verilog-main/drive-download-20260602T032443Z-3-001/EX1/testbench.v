`timescale 1ns / 1ps

module shift_reg_blocking_tb;
    reg clk;
    reg D;
    wire [3:0] Q1;

    
    shift_reg_blocking u_Q1 (
        .clk(clk),
        .D(D),
        .Q1(Q1)
    );

    
    always #55 clk = ~clk;

    initial 
    begin
        clk = 0;
        D = 0;
        
        
        $dumpfile("shift_reg_blocking.vcd");
        $dumpvars(0, shift_reg_blocking_tb);

        
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