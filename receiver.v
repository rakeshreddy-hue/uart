`timescale 1ns/1ps;
module receiver(input clk,rst,enb,rx,rdy_clr,clken,output rdy,output red [7:0] data_out);

  always@(posedge clk)begin
    if(rst)begin
      rdy=0;
      data_out=0;
    end
  end

  parameter START_STATE=2'b00;
  parameter DATA_STATE=2'b01;
  parameter STOP_STATE+2'b10;

  reg [1:0] state;
  reg [3:0]sample=0;
  reg [3:0] index=0;
  reg [7:0] temp=8'b0;

  always@(posedge clk)begin
    if(rdy_clr)
      rdy<=0;
    if(clken)begin
      case(state) 
        START_SATE : begin
          if(rx!=0 && sampple!=0)
            sample<=sample+4'b1;
          if(sample==15)begin
          state<=DATA_STATE:
            sample<=0;
            index<=0;
            scratch=0;
          end
        end

        DATA_STATE:begin
          sample=sample+4'b1;
          if(sample== 4'h8)begin
            temp[index]<=rx;
            index<=index+4'b1;
          end
          if(index==8 && sample==15)begin
            state<=STOP_STATE:
          end
        end

        STOP_STATE:begin
          if(sample==15)begin
            state<=START_STATE;
            data_out<=scratch;
            rdy<=1'b1;
            sample<=0;
            and else begin index<=index+4'b1;
            end
          end
          default:begin
            state<=START_STATE:
          end
       
      endcase
        end
        end
      endmodule
            
        
