module Add3Assign(I2, I1, I0, O);
    input I2, I1, I0;
    output [2:0] O;

    assign O = {I2, I1, I0} + 3'b011;
endmodule

module Add3Gate(I2, I1, I0, O);
    input I2, I1, I0;
    output [2:0] O;
    wire nI2, nI1, nI0;
    wire o1_a, o1_b;
    wire o2_a, o2_b, o2_c;

    not(nI2, I2);
    not(nI1, I1);
    not(nI0, I0);

    not(O[0], I0);

    and(o1_a, nI1, nI0);
    and(o1_b, I1, I0);
    or(O[1], o1_a, o1_b);

    and(o2_a, I2, nI1, nI0);
    and(o2_b, nI2, I1);
    and(o2_c, nI2, I0);
    or(O[2], o2_a, o2_b, o2_c);
endmodule

module Add3If(I2, I1, I0, O);
    input I2, I1, I0;
    output reg [2:0] O;

    always @(*) begin
        if ({I2, I1, I0} == 3'b000) O = 3'b011;
        else if ({I2, I1, I0} == 3'b001) O = 3'b100;
        else if ({I2, I1, I0} == 3'b010) O = 3'b101;
        else if ({I2, I1, I0} == 3'b011) O = 3'b110;
        else if ({I2, I1, I0} == 3'b100) O = 3'b111;
        else if ({I2, I1, I0} == 3'b101) O = 3'b000;
        else if ({I2, I1, I0} == 3'b110) O = 3'b001;
        else O = 3'b010;
    end
endmodule

module Add3Case(I2, I1, I0, O);
    input I2, I1, I0;
    output reg [2:0] O;

    always @(*) begin
        case ({I2, I1, I0})
            3'b000: O = 3'b011;
            3'b001: O = 3'b100;
            3'b010: O = 3'b101;
            3'b011: O = 3'b110;
            3'b100: O = 3'b111;
            3'b101: O = 3'b000;
            3'b110: O = 3'b001;
            3'b111: O = 3'b010;
            default: O = 3'b000;
        endcase
    end
endmodule
