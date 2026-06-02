`timescale 1ns/1ns

module Excess_3_tb;
    reg t_I2, t_I1, t_I0;
    wire t_O2_df, t_O1_df, t_O0_df;
    wire t_O2_if, t_O1_if, t_O0_if;

    Excess_3_Dataflow uut1 (
        .I2(t_I2),
        .I1(t_I1), 
        .I0(t_I0),  
        .O2(t_O2_df), 
        .O1(t_O1_df), 
        .O0(t_O0_df)
    );

    Excess_3_If uut2 (
        .I2(t_I2),
        .I1(t_I1), 
        .I0(t_I0),  
        .O2(t_O2_if), 
        .O1(t_O1_if), 
        .O0(t_O0_if)
    );

    initial begin
        $dumpfile("Excess_3.vcd");
        $dumpvars(0, Excess_3_tb); 
        

        t_I2 = 0; t_I1 = 0; t_I0 = 0; #10;
        t_I2 = 0; t_I1 = 0; t_I0 = 1; #10;
        t_I2 = 0; t_I1 = 1; t_I0 = 0; #10;
        t_I2 = 0; t_I1 = 1; t_I0 = 1; #10;
        t_I2 = 1; t_I1 = 0; t_I0 = 0; #10;
        t_I2 = 1; t_I1 = 0; t_I0 = 1; #10;
        t_I2 = 1; t_I1 = 1; t_I0 = 0; #10;
        t_I2 = 1; t_I1 = 1; t_I0 = 1; #10;
        
        $finish; 
    end
endmodule