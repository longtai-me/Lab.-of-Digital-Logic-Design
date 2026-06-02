`timescale 1ns / 1ns

module tb_value_sorter;

    // 宣告連接模組的變數
    reg  [3:0] A, B, C;
    wire [3:0] X, Y, Z;

    // 實體化 (Instantiate) 測試模組
    value_sorter uut (
        .A(A), .B(B), .C(C),
        .X(X), .Y(Y), .Z(Z)
    );

    // 給定測資
    initial begin
        // 觀察視窗輸出格式
        $monitor("Time = %0d | A=%b, B=%b, C=%b | Max(X)=%b, Min(Y)=%b, Mid(Z)=%b", 
                 $time, A, B, C, X, Y, Z);

        // 初始值
        A = 4'b0000; B = 4'b0000; C = 4'b0000;
        
        // a.
        #20 A = 4'b0001; B = 4'b0010; C = 4'b0100;
        
        // b.
        #20 A = 4'b1000; B = 4'b0100; C = 4'b0010;
        
        // c.
        #20 A = 4'b1100; B = 4'b0010; C = 4'b0001;
        
        #20;
    end
      
  initial 
  begin
    $display("Starting Testbench...");
    #100;
    $finish();
  end

  initial 
  begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
