module TWODSVG (// 閘層次
    input I1, I0,
    output O3, O2, O1, O0
);
    and (O3, I0, I1);
    not (NI0, I0);
    and (O2, NI0, I1);
    and (O1, 1'b0, 1'b0);
    buf (O0, I0);
endmodule

module TWODSVG_assign (// 資料流層次
    input I1, I0,
    output O3, O2, O1, O0
);
    assign O3 = I1 & I0;
    assign O2 = I1 & ~I0;
    assign O1 = 1'b0;
    assign O0 = I0;
endmodule

module TWODSVG_if (// 行為層次 if / if-else
    input I1, I0,
    output reg O3, O2, O1, O0
);
    always @(*) begin
        O3 = 1'b0;
        O2 = 1'b0;
        O1 = 1'b0;
        O0 = I0;
        if (I1) begin
            if (I0)
                O3 = 1'b1;
            else
                O2 = 1'b1;
        end
    end
endmodule

module TWODSVG_case (// 行為層次 case
    input I1, I0,
    output reg O3, O2, O1, O0
);
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