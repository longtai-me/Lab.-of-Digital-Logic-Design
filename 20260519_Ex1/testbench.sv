`timescale 1ns/1ns

module Practice();
    reg [3:0] A, B, C;
    wire [3:0] X;
    wire [3:0] Y;
    wire [3:0] Z;

    Max max_inst(.A(A), .B(B), .C(C), .X(X));
    Min min_inst(.A(A), .B(B), .C(C), .X(Y));
    Mid mid_inst(.A(A), .B(B), .C(C), .X(Z));

    initial begin
        $monitor("Time=%0d | A=%b B=%b C=%b | Max=%b Min=%b Mid=%b",
                 $time, A, B, C, X, Y, Z);

        A = 4'b0000; B = 4'b0000; C = 4'b0000;
        #100;
        A = 4'b1111; B = 4'b1010; C = 4'b0000;
        #100;
        A = 4'b1011; B = 4'b1000; C = 4'b0001;
        #100;
        A = 4'b1010; B = 4'b0011; C = 4'b1010;
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
