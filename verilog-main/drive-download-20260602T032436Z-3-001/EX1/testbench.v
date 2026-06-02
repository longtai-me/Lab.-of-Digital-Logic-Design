`timescale 1ns / 1ps

module TWODSVG_TB;

    // 1. 宣告要連接到設計模組的訊號
    // 輸入訊號在 Testbench 中要宣告成 reg，因為我們要主動給它數值
    reg t_I1;
    reg t_I0;
    
    // 輸出訊號宣告成 wire，用來觀測結果
    wire t_O3;
    wire t_O2;
    wire t_O1;
    wire t_O0;

    // 2. 實例化 (Instantiate) 你的電路模組
    TWODSVG uut1 (
        .I1(t_I1), 
        .I0(t_I0), 
        .O3(t_O3), 
        .O2(t_O2), 
        .O1(t_O1), 
        .O0(t_O0)
    );

    TWODSVG_assign uut2 (
        .I1(t_I1), 
        .I0(t_I0), 
        .O3(t_O3), 
        .O2(t_O2), 
        .O1(t_O1), 
        .O0(t_O0)
    );

    TWODSVG_if uut3 (
        .I1(t_I1), 
        .I0(t_I0), 
        .O3(t_O3), 
        .O2(t_O2), 
        .O1(t_O1), 
        .O0(t_O0)
    );

    TWODSVG_case uut4 (
        .I1(t_I1), 
        .I0(t_I0), 
        .O3(t_O3), 
        .O2(t_O2), 
        .O1(t_O1), 
        .O0(t_O0)
    );

    // 3. 產生測試訊號
    initial begin
        $dumpfile("TWODSVG.vcd");
        $dumpvars(0, TWODSVG_TB);
        // 使用 $monitor 自動監聽，只要訊號有變動就會自動印在畫面上
        $monitor("TIME: %4td | INPUT: I1,I0 = %b%b | OUTPUT: O3,O2,O1,O0 = %b%b%b%b", 
                 $time, t_I1, t_I0, t_O3, t_O2, t_O1, t_O0);
        
        // 依序送入 00, 01, 10, 11
        t_I1 = 0; t_I0 = 0; #10; // 等待 10 個時間單位
        t_I1 = 0; t_I0 = 1; #10;
        t_I1 = 1; t_I0 = 0; #10;
        t_I1 = 1; t_I0 = 1; #10;
        
        $finish; // 結束模擬
    end

endmodule