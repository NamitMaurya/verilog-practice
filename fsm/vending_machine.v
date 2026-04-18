module vending_machine(
            input x,
            input clk,
            input rst,
            output reg Y
            );

reg [1:0]state ;

parameter S0=2'b00 ;
parameter S1=2'b01 ;
parameter S2=2'b10 ;

always @(posedge clk) begin
        if(rst) begin
           state<=S0 ;
           Y<=0 ;
        end
        else begin
           case(state)
               S0: begin
                  if(x) begin
                      state<=S2 ;
                      Y<=0 ;
                  end
                  else begin
                      state<=S1 ;
                      Y<=0 ;
                  end
              end
              S1: begin
                 if(x) begin
                    state<=S0 ;
                    Y<=1 ;
                 end
                 else begin
                     state<=S2 ;
                     Y<=0 ;
                 end
             end
             S2: begin
                state<=S0 ;
                Y<=1 ;
            end
            default: begin
                state<=S0 ;
                Y<=0 ;
            end
        endcase
      end
 end                    

endmodule       




