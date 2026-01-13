
`timescale 1ns/1ps

module sender(input clk,wr_en,enb,reset, input reg[7:0]data_in,output reg tx,busy);

  parameter IDLE_STATE=2'b00;
  parameter START_STATE=2'b01;
  parameter DATA_STATE=2'b10;
  parameter STOP_STATE = 2'b11;

  reg[7:0]data=8'h00;
  reg[2:0]bitpos = 3'h0;
  reg[1:0]state=IDLE_STATE;

      always@(posedge clk)begin
        if(rst)begin
          tx=1'b1;
        end
      end
      always@(posedge clk)begin
        
        case(state)
          STATE_IDLE : begin
            if(wr_enb)begin
          state<=START_STATE;
              data=data_in;
            bitpos=3'h0;
            end
          end

          START_STATE:begin
            if(enb)begin
              tx<=1'b0;
            state<=DATA_STATE;
            end
          end

          DATA_STATE:begin
            if(enb)begin
              if(bitpos=3'h7)begin
              state<=STOP_STATE;
                else
                  bitpos=bitpos+3'h1;
                tx<=data[bitpos]
              end
            end
          end
            STOP_STATE:begin
              if(enb)begin
                tx=1'b1;
              state<=IDLE_STATE:
              end
            end
        endcase
        default:begin
           tx=1'b1;
              state<=IDLE_STATE:
              end

        

          assign busy= (state!=IDLE_STATE);
          endmodule
            
          
      
