`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2025 17:58:55
// Design Name: 
// Module Name: abridor_de_porta_tb
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


module abridor_de_porta_tb;
    reg h, c, p;
    wire F;
    
    abridor_de_porta uut (
        .c(c),
        .h(h),
        .p(p),
        .F(F)   );
        
    initial begin 
        $display("Tempo | c h p | F");
        $monitor("%4t | %b %b %b | %b", $time, c, h, p, F);
        
        c = 0; h = 0; p = 0; #10;
        c = 0; h = 0; p = 1; #10;
        c = 0; h = 1; p = 0; #10;
        c = 0; h = 1; p = 1; #10;
        c = 1; h = 0; p = 0; #10;
        c = 1; h = 0; p = 1; #10;
        c = 1; h = 1; p = 0; #10;
        c = 1; h = 1; p = 1; #10;

        $finish;

    end

endmodule


