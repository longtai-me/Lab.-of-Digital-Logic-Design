module Excess_3_Dataflow (
    input I2, I1, I0,
    output O2, O1, O0
);
    assign O0 = ~I0;
    assign O1 = ~(I1 ^ I0);
    assign O2 = (~I2 & (I1 | I0)) | (I2 & ~I1 & ~I0);

endmodule

module Excess_3_If (
    input I2, I1, I0,
    output reg O2, O1, O0
);
    always @(*) begin
        if ({I2, I1, I0} == 3'b000)      {O2, O1, O0} = 3'b011;
        else if ({I2, I1, I0} == 3'b001) {O2, O1, O0} = 3'b100;
        else if ({I2, I1, I0} == 3'b010) {O2, O1, O0} = 3'b101;
        else if ({I2, I1, I0} == 3'b011) {O2, O1, O0} = 3'b110;
        else if ({I2, I1, I0} == 3'b100) {O2, O1, O0} = 3'b111;
        else if ({I2, I1, I0} == 3'b101) {O2, O1, O0} = 3'b000;
        else if ({I2, I1, I0} == 3'b110) {O2, O1, O0} = 3'b001;
        else                             {O2, O1, O0} = 3'b010;
    end
endmodule