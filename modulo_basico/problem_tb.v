`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 16:30:36
// Design Name: 
// Module Name: problem_tb
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


module problem_tb(    
    );
    
    reg clock, rst, data_input;
    wire [1:0] state;
    wire data_output;
    
    problem_2_3 uut (data_input, clock, rst, data_output, state);
   
   initial begin
    $monitor("Time: %t | clock | State: %b | Input: %b | Output: %b", $time, clock, state, data_input, data_output);
end
   
   initial begin
        data_input = 1; clock = 0; rst = 1;
        #15 rst = 0;    
   end
   
    initial repeat (44) #10 clock = ~clock;
    initial repeat (15) #20 data_input = ~data_input;
    
    always @ (data_output) if (data_output == 1)
        $display ("A 1 was detected on data_output at time = %t", $time);
   
endmodule
