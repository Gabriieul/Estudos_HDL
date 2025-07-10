`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 16:29:52
// Design Name: 
// Module Name: problem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module problem_2_1 (input [1:0] sel , input [3:0] data, 
output reg data_out);

always @ (*)
begin

    case (sel)
        2'b00: data_out <= data [0];
        2'b01: data_out <= data [1];
        2'b10: data_out <= data [2];
        2'b11: data_out <= data [3];
    endcase
        
end
 
 endmodule
 
 
module problem_2_2 (input [2:0] data_input, output data_out);
 
assign data_out = data_input [0] & data_input [1] | data_input [1] & data_input [2] | data_input [0] & data_input [2];

endmodule  
 
 
module problem_2_3 (input data_in, clk, reset, output data_out, output [1:0] state);
reg [1:0] current;
assign state = current;
parameter [1:0] s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

always @ (posedge clk)
begin

    if (reset) current <= s0;
    else
        case (current)
            s0: if (data_in) current <= s1; else current <= s0;        //avança pro proximo status quando data_in = 1
            s1: if (data_in) current <= s1; else current <= s2;        //avança pro proximo status quando data_in = 0
            s2: if (data_in) current <= s3; else current <= s0;        //avança quando data_in = 1
            s3: if (data_in) current <= s1; else current <= s0;        //volta pro status 1 quando data_in = 1  
        endcase      
end

assign data_out = (current == s3) ? 1: 0;

endmodule
