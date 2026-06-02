`timescale 1ns/1ns

module Practice();
    reg I2, I1, I0;

    wire [2:0] add3_assign;
    wire [2:0] add3_gate;
    wire [2:0] add3_if;
    wire [2:0] add3_case;

    Add3Assign add3_a(.I2(I2), .I1(I1), .I0(I0), .O(add3_assign));
    Add3Gate add3_g(.I2(I2), .I1(I1), .I0(I0), .O(add3_gate));
    Add3If add3_i(.I2(I2), .I1(I1), .I0(I0), .O(add3_if));
    Add3Case add3_c(.I2(I2), .I1(I1), .I0(I0), .O(add3_case));

    initial begin
        $monitor("Time=%0d | I2I1I0=%b%b%b | add3=%b/%b/%b/%b",
                 $time, I2, I1, I0, add3_assign, add3_gate, add3_if, add3_case);

        I2 = 1'b0; I1 = 1'b0; I0 = 1'b0;
        #100;
        I2 = 1'b0; I1 = 1'b0; I0 = 1'b1;
        #100;
        I2 = 1'b0; I1 = 1'b1; I0 = 1'b0;
        #100;
        I2 = 1'b0; I1 = 1'b1; I0 = 1'b1;
        #100;
        I2 = 1'b1; I1 = 1'b0; I0 = 1'b0;
        #100;
        I2 = 1'b1; I1 = 1'b0; I0 = 1'b1;
        #100;
        I2 = 1'b1; I1 = 1'b1; I0 = 1'b0;
        #100;
        I2 = 1'b1; I1 = 1'b1; I0 = 1'b1;
        #100;
    end

    initial begin
        $display("Starting Testbench");
        #850;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end
endmodule
