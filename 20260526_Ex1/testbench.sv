`timescale 1ns/1ns
module fulladd_test();
  // constants
  
  // general purpose registers
  reg A,B, Ci;
   
  // wires
  wire SOut;
  wire CoOut;


  fulladd uut(
    .A(A),
    .B(B),
    .Ci(Ci),
    .Co(CoOut),
    .S(SOut)
  );

  initial    
  begin
    A=1'b0; //A=0
    B=1'b0; //B=0
	Ci=1'b0; //Ci=0
    #20;
    A=1'b0;
    B=1'b0;
	Ci=1'b1;
    #20;
    A=1'b0;
    B=1'b1; 
	Ci=1'b0;
    #20;
    A=1'b0; 
    B=1'b1;
	Ci=1'b1;
    #20;
    A=1'b1;
    B=1'b0;
	Ci=1'b0;
    #20;
    A=1'b1; 
    B=1'b0; 
	Ci=1'b1;
    #20;
    A=1'b1; 
    B=1'b1;
	Ci=1'b0;
    #20;
    A=1'b1;
    B=1'b1;
    Ci=1'b1;
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