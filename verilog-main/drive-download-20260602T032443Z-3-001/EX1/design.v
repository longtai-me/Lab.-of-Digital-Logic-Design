module shift_reg_blocking (
    input clk,
    input D,
    output reg [3:0] Q1
);
    integer i;
    always @(posedge clk) begin
        for (i = 0; i < 3; i = i + 1) begin
            if (i == 0)
                Q1[0] = D;
            Q1[i+1] = Q1[i];
        end
    end
endmodule