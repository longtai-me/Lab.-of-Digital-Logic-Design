# Lab. of Digital Logic Design 認知資料

來源資料夾：
`/Users/longtaijiang/Documents/GitHub/Lab.-of-Digital-Logic-Design/biography/slides/11402/Lab. of Digital Logic Design`

補充範本：
`/Users/longtaijiang/Documents/GitHub/Lab.-of-Digital-Logic-Design/verilog-main`

用途：
這份文件是後續實作 Lab. of Digital Logic Design 作業時的工作範本。產生或修改作業資料夾、`design.sv`、`testbench.sv`、模擬輸出與檢查流程時，優先依照本文件。

## 課程資料結構

- `iverilog-v12-20220611-x64_setup.exe`：Windows 版 Icarus Verilog 安裝檔。
- `Command三件套.md`：課堂提供的三個基本命令。
- `上傳資料夾的命名規則.txt`：上傳資料夾命名提示。
- `code/`：課堂範例程式。
- `Exercises/`：L1 到 L7 的練習題 PDF/圖片。
- `教學投影片/`：ch01 到 ch08 教學投影片。

## 學長作業範本結構

`verilog-main` 是學長作業範本，主要特色：

- 以日期短碼分資料夾，例如 `0505`、`0512`、`0519`、`0526`、`0603`、`0609`。
- 日期資料夾內再分 `ex1`、`ex2`、`EX1`、`Q2`、`practice`、`final_exam` 等。
- 每題通常有 `design.sv` 或功能命名檔，例如 `gate.sv`、`block.sv`、`question1.sv`。
- 測試平台通常叫 `testbench.sv`，但歷史檔中也有拼成 `testbenach.sv` 的案例；新作業仍使用正確名稱 `testbench.sv`。
- 會保留 `dump.vcd`、編譯輸出檔、截圖，例如 `EX2.PNG`、`擷取.PNG`。
- `module.json` 是 VS Code snippet，可作為 testbench 骨架參考。
- `question/` 與 `logicPPT/` 分別保留題目與投影片。

## 作業資料夾命名

目前 repo 已採用：

```text
YYYYMMDD_ExN
```

例：

```text
20260505_Ex1
20260512_Ex2
20260526_Ex1
20260602_Ex1
```

課程檔案中的上傳範例為：

```text
20260428_EX1
```

後續實作建議沿用 repo 既有格式 `YYYYMMDD_ExN`。如果題目或老師指定大寫 `EX`，再改為指定格式。

學長範本使用日期短碼：

```text
0505/ex1
0512/ex2
0526/final_exam
0603/Q2
```

後續若要整理成自己的 repo 作業，優先使用 `YYYYMMDD_ExN`；若只是參考或搬移學長範本，保留原本短碼資料夾以方便對照。

## 每份作業的標準檔案

每個作業資料夾通常包含：

- `design.sv`：主要邏輯設計。
- `testbench.sv`：測試平台。
- `dump.vcd`：模擬波形輸出，由 testbench 產生。
- `wave`：由 `iverilog` 編譯產生的可執行模擬檔。
- 題目附件：例如 `L1.pdf`、`L2.pdf`、`Test Data.txt`、投影片或截圖。

學長範本額外常見：

- `test`、`practice`、`a.out`、`q1`、`q2`：不同編譯輸出檔名。
- `*.PNG`：波形或題目截圖。
- `test.py`：少數題目用 Python 輔助檢查。

## 標準執行流程

在作業資料夾內執行：

```sh
iverilog -g2012 -o wave design.sv testbench.sv
vvp wave
gtkwave dump.vcd
```

課堂原始三件套沒有 `-g2012`：

```sh
iverilog -o wave design.sv testbench.sv
vvp wave
gtkwave dump.vcd
```

但 repo 的 README 使用 `.sv` 檔案並建議 `-g2012`，後續實作與驗證優先使用：

```sh
iverilog -g2012 -o wave design.sv testbench.sv
```

如果 `testbench.sv` 內有：

```systemverilog
`include "./design.sv"
```

則可只編譯 testbench：

```sh
iverilog -g2012 -o wave testbench.sv
```

實作時二選一即可：

- 不寫 `` `include ``，用 `iverilog -g2012 -o wave design.sv testbench.sv`。
- 寫 `` `include "./design.sv" ``，用 `iverilog -g2012 -o wave testbench.sv`。

避免同時 include 又把 `design.sv` 放進編譯命令，否則可能發生 module 重複定義。

## `design.sv` 風格

課堂範例使用初學者友善的 module 寫法：

```systemverilog
module and_gate(O,A,B);
  input A,B;
  output O;
  and(O,A,B);
endmodule
```

也可以使用較清楚的 SystemVerilog port 宣告：

```systemverilog
module example (
    input  logic A,
    input  logic B,
    output logic O
);
    assign O = A & B;
endmodule
```

實作時的原則：

- 題目若偏基礎邏輯閘，可用 `assign` 或 gate primitive。
- 組合邏輯若使用 `always @(*)` 或 `always_comb`，區塊內使用程序指派 `=`，不要在 `always` 內寫 `assign`。
- 多個小模組可以放在同一份 `design.sv`，測試平台用不同 instance 名稱實例化。
- 輸入輸出位元寬度要明確，例如 `input [3:0] A`、`output reg [3:0] X`。

學長作業常見四種實作法，遇到題目要求不同寫法時可並列：

- 資料流：用 `assign`、位元運算、串接、reduction operator。
- 閘層次：用 `and`、`or`、`nand`、`buf` 等 gate primitive。
- `if`：在 `always` 區塊內用條件判斷輸出。
- `case`：將輸入串接成暫存向量後列出 truth table。

範例命名慣例：

```text
Power
PowerGate
PowerIf
PowerCase
Add3
Add3_Gate
Add3_If
Add3_Case
```

若是 sequential logic：

- 使用 `always @(posedge Clk)`。
- 輸出宣告為 `output reg [N:0] Q`。
- testbench 用 `forever` 或固定間隔產生 clock。
- shift register 題型可用 `for` loop 搬移位元。

## `testbench.sv` 範本

課堂範例的測試平台固定包含：

- `` `timescale 1ns/1ns ``
- `reg` 作為輸入刺激。
- `wire` 接收輸出。
- `uut` 或具名 instance。
- `initial` 區塊逐筆設定測資。
- `$display("Starting Testbench...");`
- `$dumpfile("dump.vcd");`
- `$dumpvars(0);`
- `$finish();`

標準範本：

```systemverilog
`timescale 1ns/1ns

module Practice();
    reg A;
    reg B;
    wire O;

    example uut(
        .A(A),
        .B(B),
        .O(O)
    );

    initial begin
        A = 1'b0; B = 1'b0;
        #20;
        A = 1'b0; B = 1'b1;
        #20;
        A = 1'b1; B = 1'b0;
        #20;
        A = 1'b1; B = 1'b1;
    end

    initial begin
        $display("Starting Testbench...");
        #100;
        $finish();
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end
endmodule
```

學長 snippet `module.json` 的簡化骨架：

```systemverilog
`timescale 1ns/1ns
module Test();
    reg A;
    wire O;

    target uut(
        .A(A),
        .O(O)
    );

    initial begin
        // test vectors
    end

    initial begin
        $display("Starting Testbench");
        #100;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end
endmodule
```

Sequential logic clock 範本：

```systemverilog
initial begin
    clk = 1'b0;
    forever begin
        #100;
        clk = !clk;
    end
end
```

如果要同時比較多種寫法，testbench 可共用同一組輸入並實例化多個 module，例如 `Add3`、`Add3_Gate`、`Add3_If`、`Add3_Case`。

## 實作檢查清單

1. 建立或確認資料夾名稱符合 `YYYYMMDD_ExN`。
2. 放入或保留題目附件。
3. 撰寫 `design.sv`，模組名稱與 testbench instance 對齊。
4. 撰寫 `testbench.sv`，完整覆蓋題目要求的輸入案例。
5. 確認 testbench 會產生 `dump.vcd`。
6. 執行 `iverilog -g2012 -o wave design.sv testbench.sv`。
7. 執行 `vvp wave`。
8. 如需檢查波形，再執行 `gtkwave dump.vcd`。
9. 若有錯誤，優先修正語法、port 對應、位元寬度、`reg/wire/logic` 宣告。
10. 若參考學長範本，確認檔名是否為 `testbench.sv`；不要延續 `testbenach.sv` 拼字。
11. 若題目需要附圖或波形證明，保留截圖檔，但不把截圖當成唯一驗證。

## 後續實作偏好

- 保留課堂作業容易讀懂的風格，不過語法要能通過 Icarus Verilog。
- 若題目未指定 module 名稱，依功能取名，例如 `Max`、`Min`、`Mid`、`decoder`、`mux`。
- 測資優先依題目或 `Test Data.txt`，沒有測資時補完整 truth table 或代表性案例。
- 完成後至少跑一次 `iverilog` 與 `vvp` 驗證。
- 不主動刪除既有 `dump.vcd` 或 `wave`，除非使用者要求清理。
- 學長作業可當作解題方向參考，但新實作時要修正常見瑕疵，例如 `always` 內誤用 `assign`、case 分支未完整賦值、clock 初值未先設定等。
