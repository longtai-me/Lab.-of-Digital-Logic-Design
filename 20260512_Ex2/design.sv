module pq_operations (
    input  [4:0] P,
    input  [4:0] Q,
    output [6:0] R,
    output [3:0] S,
    output [7:0] T,
    output [4:0] U,
    output [4:0] V,
    output [5:0] W,
    output [4:0] X,
    output       Y,
    output       Z
);
    wire [9:0] ten_vector;

    assign R = P * 3;
    assign S = Q >> 1;
    assign T = 8'd6 + {3'b000, P};
    assign U = ~(P & Q);
    assign V = {P[2:0], P[4:3]};
    assign ten_vector = {P, Q};
    assign W = ten_vector[7:2];
    assign X = (P > 5'd10) ? P : Q;
    assign Y = (Q >= 5'd10 && Q <= 5'd20) ? 1'b1 : 1'b0;
    assign Z = ^P;
endmodule
