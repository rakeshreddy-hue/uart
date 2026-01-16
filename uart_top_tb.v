`timescale 1ns/1ps
module uart_top_tb;
  reg [7:0] data_in;
  reg clk;
  reg rst;
  reg wr_en;


  wire [7:0] data_out;
  wire busy;
  reg rdy_clr;
  wire rdy;

  

  uart_top_tb dut(data_in,clk,rst,wr_en,data_out,busy,rdy_clr,rdy);
  initial begin
    {data_in,clk,rst,rdy_clr}=0;
  end
  

  always #5 clk= ~clk;
  task send_byte(input [7:0] din);
    begin
    @(negedge clk)
      data_in=din;
    wr_en=1'b1;
    @(negedge clk)
    wr_en=0'b0;
    end
  endtask

  task clear_rdy;
    begin
      @(negedge clk)
      rdy_clr=1'b1;
      @(negedge clk)
      rdy_cle=1'b0;
    end
  endtask

  initial
    begin
       @(negedge clk)
      rst=1'b1;
       @(negedge clk)
       rst=1'b0;

      send_byte(8'h41);
      wait(!busy);
      wait(rdy);
      $display("the op waveform is given by",dout);
      clear_ready;

      send_byte(8'h55);
      wait(!busy);
      wait(rdy);
      $display("the op waveform is given by",dout);
      clear_ready;l;
    end
endmodule















      



      
  
      
      














      
  
