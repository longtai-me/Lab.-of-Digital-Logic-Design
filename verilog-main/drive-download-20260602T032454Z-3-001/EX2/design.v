module FKFK (
    input  [0:4] P, Q,             // 5-bit
    output [0:6] R,                // 7-bit
    output [0:4] S, U, V, X,       // 5-bit
    output [0:5] T, W,             // 6-bit
    output       Y, Z              // 1-bit
);
    // a. R = P 乘以 3
    assign R = P * 3;

    // b. S = Q 除以 2 (使用右移運算子 >>)
    assign S = Q >> 1;

    // c. T = 學號個位數 (假設為 7) + P
    assign T = 4'd7 + P;

    // d. U = P 和 Q 作反及 (NAND) 運算
    assign U = ~(P & Q);

    // e. V = P 循環右移二位 (使用連接運算子 {})
    // 在 [0:4] 架構下，循環右移二位代表原本的 P[3:4] 移到最前面
    assign V = {P[3:4], P[0:2]};

    // f. W = {P, Q} 十位元資料的中間六個位元
    // {P, Q} 組合為 [0:9]，中間六位元為 [2:7]
    wire [0:9] combined_PQ = {P, Q};
    assign W = combined_PQ[2:7];

    // g. X = 若 P > 10 取 P，否則取 Q (使用條件運算子)
    assign X = (P > 5'd10) ? P : Q;

    // h. 若 Q 介於 10 到 20 之間，Y=1；否則 Y=0
    assign Y = (Q >= 5'd10 && Q <= 5'd20) ? 1'b1 : 1'b0;

    // i. 若 P 各位元中 '1' 的總數為奇數，Z=1；否則 Z=0
    assign Z = ^P;

endmodule