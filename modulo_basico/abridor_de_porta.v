`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2025 17:21:26
// Design Name: 
// Module Name: abridor_de_porta
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Exercício retirado do livro de Sistemas Digitais.
// 
//////////////////////////////////////////////////////////////////////////////////


module abridor_de_porta(
    input c,
    input h,
    input p,
    output F
    );
    
    wire n1, n2;
    
    Inv inversor (c, n1);
    Inv_2 inversor2 (h, p, n2);
    And porta_and (n1, n2, F);
    
 endmodule


module Inv(x, F);
    input x;
    output F;
    reg F;
    
    always @ (x)
    begin 
        F = ~x;
    end    
endmodule

module Inv_2(x, y, F);
    input x, y;
    output F;
    reg F;
    
    always @ (x or y)
    begin 
        F = x | y;
    end
endmodule

module And(x, y, F);
    input x, y;
    output F;
    reg F;
    
    always @(x or y)
    begin 
        F = x & y;
    end
endmodule

/*
module AbridorDePorta (h, p, c, F);
    input c, p, h;
    output F;
    reg F;
    
    always @(c or h or p)
    begin
        F <= (~c) & (h | p);
    end
endmodule 
*/
