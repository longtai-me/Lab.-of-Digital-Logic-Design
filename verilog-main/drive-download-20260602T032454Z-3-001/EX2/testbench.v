`timescale 1ns/1ns

module FKFK_TB;
    reg  [0:4] P, Q;
    wire [0:6] R;
    wire [0:4] S, U, V, X;
    wire [0:5] T, W;
    wire       Y, Z;

    FKFK uut (
        .P(P), .Q(Q),
        .R(R), .S(S), .T(T), .U(U), .V(V), .W(W), .X(X), .Y(Y), .Z(Z)
    );

    initial begin
        // 初始值
        P = 5'b00000; Q = 5'b00000;
        #20;
        
        // (1)
        P = 5'b00100; Q = 5'b00011;
        #20;
        
        // (2)
        P = 5'b00011; Q = 5'b00010;
        #20;
        
        // (3)
        P = 5'b00001; Q = 5'b01011;
        #20;
        
        // (4)
        P = 5'b00110; Q = 5'b01001;
        #20;
        
        // (5)
        P = 5'b00101; Q = 5'b00110;
        #20;
    end

    initial begin
        $display("--- Start Simulation with Teacher's Test Data ---");
        $monitor("Time=%0t | P=%b Q=%b | R=%d S=%d X=%d Y=%b Z=%b", 
                 $time, P, Q, R, S, X, Y, Z);
        #150; // 確保時間長度足以涵蓋所有測資
        $finish();
    end

    initial begin
        $dumpfile("FKFK_Teacher.vcd");
        $dumpvars(0, FKFK_TB);
    end
endmodule