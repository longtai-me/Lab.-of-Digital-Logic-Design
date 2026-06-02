`timescale 1ns/1ns
module ABSY_test();
  // constants
  
  // general purpose registers
  reg A, B, S;
   
  // wires
  wire Yout;

  ABSY uut(
    .A(A),
    .B(B),
    .S(S),
    .Y(Yout)
  );

  initial    
  begin
    A=1'b0; B=1'b0; S=1'b0;
    #20;
    A=1'b0; B=1'b1; S=1'b0;
    #20;
    A=1'b1; B=1'b0; S=1'b0;
    #20;
    A=1'b1; B=1'b1; S=1'b0;
    #20;
    A=1'b0; B=1'b0; S=1'b1;
    #20;
    A=1'b0; B=1'b1; S=1'b1;
    #20;
    A=1'b1; B=1'b0; S=1'b1;
    #20;
    A=1'b1; B=1'b1; S=1'b1;
    #20;
  end 
      
  initial 
  begin
    $display("Starting Testbench...");
    #180;
    $finish();
  end

  initial 
  begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
