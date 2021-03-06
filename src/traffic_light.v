module traffic_light (clk,rst,pass,R,G,Y);
    input  clk;
    input  rst;
    input  pass;
    output reg R;
    output reg G;
    output reg Y;
  
  integer cycle = 0;  
  reg[1:0] current_state,next_state;
  reg[2:0] condition = 3'b001;
  parameter[1:0] Red_Light = 0,Green_Light = 1,Yellow_Light = 2,Blank_Light = 3;
  
  ///////////////////  State_register  /////////////////////////
  always@(posedge clk)
  begin 
    cycle = cycle + 1;
    if(rst)      
      begin
        current_state = Red_Light;       
        condition = 3'b001;
        cycle = 0;
      end
    else
      begin
        //current_state = next_state;
      end
    ///////
    if(pass)
      begin
        if(condition != 3'b001)
          begin
            condition = 3'b001;
            cycle = 0;          
          end   
        else               
          ;
      end
    
    
      
    if(condition == 3'b001 & cycle > 1023) //1
      begin
        cycle = 0;
        condition = 3'b010;
      end
    if(condition == 3'b010 & cycle > 127) //2
      begin
        cycle = 0;
        condition = 3'b011;
      end
    if(condition == 3'b011 & cycle > 127) //3
      begin 
        cycle = 0;
        condition = 3'b100;    
      end     
    if(condition == 3'b100 & cycle > 127) //4
      begin 
        cycle = 0;
        condition = 3'b101;    
      end
    if(condition == 3'b101 & cycle > 127) //5
      begin 
        cycle = 0;
        condition = 3'b110;    
      end
    if(condition == 3'b110 & cycle > 511) //6
      begin 
        cycle = 0;
        condition = 3'b111;    
      end
    if(condition == 3'b111 & cycle > 1023) //7
      begin 
        cycle = 0;
        condition = 3'b001;
      end
  end
  ///////////////////  Next_State_Logic   //////////////////////
  always@(condition or posedge clk)
  begin
    case(condition)      
        3'b001: begin current_state = Green_Light;  end
        3'b010: begin current_state = Blank_Light;  end
        3'b011: begin current_state = Green_Light;  end
        3'b100: begin current_state = Blank_Light;  end
        3'b101: begin current_state = Green_Light;  end
        3'b110: begin current_state = Yellow_Light; end
        3'b111: begin current_state = Red_Light;    end
        default: begin current_state = Blank_Light; end          
      
    endcase 
  end
  ///////////////////  Output_Logic  ///////////////////////////
  always@(current_state)
  begin
    case(current_state)
      Red_Light: begin
        R = 1;
        G = 0;
        Y = 0;
      end
      Green_Light: begin
        R = 0;
        G = 1;
        Y = 0;
      end
      Yellow_Light: begin
        R = 0;
        G = 0;
        Y = 1;
      end
      Blank_Light: begin
        R = 0;
        G = 0;
        Y = 0;
      end
      default: begin
        R = 0;
        G = 0;
        Y = 0;
      end
    endcase
  end
  
  
  endmodule

