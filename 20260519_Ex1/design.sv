module Max(A, B, C, X);
    input [3:0] A, B, C;
    output reg [3:0] X;

    always @(*) begin
        if (A >= B && A >= C) begin
            X = A;
        end else if (B >= A && B >= C) begin
            X = B;
        end else begin
            X = C;
        end
    end
endmodule

module Min(A, B, C, X);
    input [3:0] A, B, C;
    output reg [3:0] X;

    always @(*) begin
        if (A <= B && A <= C) begin
            X = A;
        end else if (B <= A && B <= C) begin
            X = B;
        end else begin
            X = C;
        end
    end
endmodule

module Mid(A, B, C, X);
    input [3:0] A, B, C;
    output reg [3:0] X;

    always @(*) begin
        if ((A >= B && A <= C) || (A <= B && A >= C)) begin
            X = A;
        end else if ((B >= A && B <= C) || (B <= A && B >= C)) begin
            X = B;
        end else begin
            X = C;
        end
    end
endmodule
