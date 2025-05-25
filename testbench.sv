testbench code

// Code your testbench here
// or browse Examples
`include "compare_class.sv"
  logic clk;
  logic rstn;
  logic t;
  logic q;

module tff_tb_top();
  
  
  tff tff_inst(
    .clk(clk),
    .rstn(rstn),
    .t(t),
    .q(q)
  );
  
  initial begin
    $display("Initialization begins");
    clk=1'b0;
    rstn=1'b0;
    t=1'b0;
  end
  
  compare_class compare_h = new();
  
  initial begin
    fork
      compare_h.compare_t();
      //signals_h.signals_t()
    join
  end
  
  always begin
    //$display("Clk generation begin");
    
    clk=~clk;
    #5;
  end
  
  initial begin
    //#5;
    rstn=0;
    //$display("Rst begins");
    #10;
    rstn=~rstn;
  end
  
  initial begin
    //#5;
    t=0;
    #15;
    //$display("Stimulus begins");
    repeat(5) begin
      #5;
      t=1'b1;
      #5;
      t=1'b0;
    end
  end
  
  initial begin
    $monitor("Time=%0t | clk=%0b rstn=%0b t=%0b q=%0b", $time, clk, rstn, t, q);
    #50 $finish;
  end
  
   initial begin
       $dumpfile("dump.vcd");
       $dumpvars(1);
     end
endmodule
  
