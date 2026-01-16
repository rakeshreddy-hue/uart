`timescale 1ns/1ps

module uart_top (input clk,rst,wr_en, input [7:0] data_in, rdy_clr,output [7:0] data_out,output busy,rdy);


  wire rx_clk_en;
  wire tx_clk_en;

  wire tx_temp;

  baud_rate_generator bg(clk,rst,tx_en,rx_en);
  sender sd(clk,wr_en,tx_clk_en,rst,data_in,tx_temp,busy);
  receiver rc(clk,rst,tx_temp,rdy_clr,rx_clk_en,rdy,data_out);
  end module
