`timescale 1ns/1ns

module Practice();
    reg I1, I0;

    wire [3:0] square_assign;
    wire [3:0] square_gate;
    wire [3:0] square_if;
    wire [3:0] square_case;

    SquareGeneratorAssign square_a(
        .I1(I1), .I0(I0),
        .O3(square_assign[3]), .O2(square_assign[2]),
        .O1(square_assign[1]), .O0(square_assign[0])
    );

    SquareGeneratorGate square_g(
        .I1(I1), .I0(I0),
        .O3(square_gate[3]), .O2(square_gate[2]),
        .O1(square_gate[1]), .O0(square_gate[0])
    );

    SquareGeneratorIf square_i(
        .I1(I1), .I0(I0),
        .O3(square_if[3]), .O2(square_if[2]),
        .O1(square_if[1]), .O0(square_if[0])
    );

    SquareGeneratorCase square_c(
        .I1(I1), .I0(I0),
        .O3(square_case[3]), .O2(square_case[2]),
        .O1(square_case[1]), .O0(square_case[0])
    );

    initial begin
        $monitor("Time=%0d | I1I0=%b%b | square=%b/%b/%b/%b",
                 $time, I1, I0, square_assign, square_gate, square_if, square_case);

        I1 = 1'b0; I0 = 1'b0;
        #100;
        I1 = 1'b0; I0 = 1'b1;
        #100;
        I1 = 1'b1; I0 = 1'b0;
        #100;
        I1 = 1'b1; I0 = 1'b1;
        #100;
    end

    initial begin
        $display("Starting Testbench");
        #450;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end
endmodule
