module traffic_light(
        input clk,
        input rst,
        output reg red,
        output reg yellow,
        output reg green
        );
reg [1:0]state ;
reg [3:0]count ;
parameter RED=2'b00 ;
parameter YELLOW=2'b01 ;
parameter GREEN=2'b10 ;

always @(posedge clk) begin
        if(rst) begin
             state<=RED ;
             count<=0 ;
        end
        else begin
         case(state)
            RED: begin
                 if(count==2'd2) begin
                       state<=YELLOW ;
                       count<=0 ;
                 end
                 else
                     count<=count+1 ;
             end
            YELLOW: begin
                   if(count==1) begin
                       state<=GREEN ;
                       count<=0 ;
                   end
                   else
                       count<=count+1 ;
             end
            GREEN: begin
                   if(count==2) begin
                         state<=RED ;
                         count<=0 ;
                    end
                    else
                    count<=count+1 ;
              end
            default: begin
                    state<=RED ;
                    count<=0 ;
               end
          endcase
      end
   end

always@(*) begin
  red=(state==RED) ;
  yellow=(state==YELLOW) ;
  green=(state==GREEN) ;
end

endmodule
