`timescale 1ns/1ns

module tb_pq_operations();
    reg  [4:0] P, Q;
    wire [6:0] R;
    wire [3:0] S;
    wire [7:0] T;
    wire [4:0] U;
    wire [4:0] V;
    wire [5:0] W;
    wire [4:0] X;
    wire       Y;
    wire       Z;

    pq_operations uut(
        .P(P),
        .Q(Q),
        .R(R),
        .S(S),
        .T(T),
        .U(U),
        .V(V),
        .W(W),
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        $monitor("Time=%0d | P=%b Q=%b | R=%b S=%b T=%b U=%b V=%b W=%b X=%b Y=%b Z=%b",
                 $time, P, Q, R, S, T, U, V, W, X, Y, Z);

        P = 5'b00000; Q = 5'b00000;
        #20;
        P = 5'b00100; Q = 5'b00011;
        #20;
        P = 5'b00011; Q = 5'b00010;
        #20;
        P = 5'b00001; Q = 5'b01011;
        #20;
        P = 5'b00110; Q = 5'b01001;
        #20;
        P = 5'b00101; Q = 5'b00110;
        #20;
    end

    initial begin
        $display("Starting Testbench...");
        #140;
        $finish();
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end
endmodule
