`timescale 1ns/1ns

module Practice();
    reg Clk, D;
    wire [3:0] Q1;
    wire [3:0] Q2;

    BlockingShiftRegister q1_inst(
        .Clk(Clk),
        .D(D),
        .Q1(Q1)
    );

    NonBlockingShiftRegister q2_inst(
        .Clk(Clk),
        .D(D),
        .Q2(Q2)
    );

    initial begin
        Clk = 1'b0;
        forever begin
            #100;
            Clk = !Clk;
        end
    end

    initial begin
        D = 1'b0;
        #100;
        D = 1'b1;
        #200;
        D = 1'b0;
        #200;
        D = 1'b1;
        #200;
        D = 1'b0;
        #200;
        D = 1'b1;
        #400;
        D = 1'b0;
        #400;
        D = 1'b1;
        #400;
    end

    initial begin
        $display("Starting Testbench");
        #2200;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end
endmodule
