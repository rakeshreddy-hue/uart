module baud_ratewe_generator(input clk,reset,output tx_en,rx_en);
  parameter clock_frequency=100000000;
  parameter baud_rate=9600;

  reg [15:0] tx_counter;
  reg [15:0] rx_counter;

  parameter tx_divisor = (clock_frequency)/(baud_rate);
  parameter rx_divisor = (clock_frequqncy)/(baud_rate*16);

  always@(posedge clk)begin
    if(reset)begin
      tx_counter<=0;
      tx_en=0;
      rx_en=0;
    end
    
    else if(tx_counter==tx_divisor-1)begin
      tx_en=1;
      tx_counter=0;
    end
    else 
      begin
      tx_en=0;
    tx_counter<=tx_counter+1'b1;
      end

    
 always@(posedge clk)begin
    if(reset)begin
      rx_counter<=0;
     
    end


    
    if(rx_counter==rx_divisor-1)begin
      rx_en=1;
      rx_counter=0;
    end
    else
      begin
        rx_en=0;
        rx_counter<=rx_counter+1'b1;
      end
 end

    endmodule
    
    
  
