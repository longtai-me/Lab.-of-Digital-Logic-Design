module SquareGeneratorAssign(I1, I0, O3, O2, O1, O0);
    input I1, I0;
    output O3, O2, O1, O0;

    assign O3 = I1 & I0;
    assign O2 = I1 & ~I0;
    assign O1 = 1'b0;
    assign O0 = I0;
endmodule

module SquareGeneratorGate(I1, I0, O3, O2, O1, O0);
    input I1, I0;
    output O3, O2, O1, O0;
    wire nI0;

    not(nI0, I0);
    and(O3, I1, I0);
    and(O2, I1, nI0);
    buf(O1, 1'b0);
    buf(O0, I0);
endmodule

module SquareGeneratorIf(I1, I0, O3, O2, O1, O0);
    input I1, I0;
    output reg O3, O2, O1, O0;

    always @(*) begin
        if ({I1, I0} == 2'b00) begin
            {O3, O2, O1, O0} = 4'b0000;
        end else if ({I1, I0} == 2'b01) begin
            {O3, O2, O1, O0} = 4'b0001;
        end else if ({I1, I0} == 2'b10) begin
            {O3, O2, O1, O0} = 4'b0100;
        end else begin
            {O3, O2, O1, O0} = 4'b1001;
        end
    end
endmodule

module SquareGeneratorCase(I1, I0, O3, O2, O1, O0);
    input I1, I0;
    output reg O3, O2, O1, O0;

    always @(*) begin
        case ({I1, I0})
            2'b00: {O3, O2, O1, O0} = 4'b0000;
            2'b01: {O3, O2, O1, O0} = 4'b0001;
            2'b10: {O3, O2, O1, O0} = 4'b0100;
            2'b11: {O3, O2, O1, O0} = 4'b1001;
            default: {O3, O2, O1, O0} = 4'b0000;
        endcase
    end
endmodule
