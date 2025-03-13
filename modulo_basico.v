`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2025 13:29:55
// Design Name: 
// Module Name: modulo_basico
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

module modulo_basico(

    );
endmodule

// modulo_basico.v

// Porta AND de 2 entradas
module and_gate(
    input a, b,
    output y
);
    assign y = a & b;
endmodule

// Porta OR de 2 entradas
module or_gate(
    input a, b,
    output y
);
    assign y = a | b;
endmodule

// Porta NOT de 1 entrada
module not_gate(
    input a,
    output y
);
    assign y = ~a;
endmodule

module half_adder (
    input a, b,
    output sum, carry
);

assign sum = a ^ b;    // XOR para a soma
assign carry = a & b;  // AND para o carry

endmodule

module full_adder (
    input a, b, cin,
    output sum, cout
);

assign sum = a ^ b ^ cin;              // XOR para a soma
assign cout = (a & b) | (b & cin) | (a & cin);  // Carry-out

endmodule