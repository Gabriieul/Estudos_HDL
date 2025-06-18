`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2025 13:32:30
// Design Name: 
// Module Name: modulo_basico_tb
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

// Testbench para simular os módulos
module modulo_basico_tb;
    reg a, b, cin;
    wire and_out, or_out, not_out, sum_half, carry_half, sum_full, cout;

    // Instanciando os módulos
    
    assign sum = a ^ b;    // XOR para a soma
    assign carry = a & b;  // AND para o carry

    and_gate u1(.a(a), .b(b), .y(and_out));
    or_gate u2(.a(a), .b(b), .y(or_out));
    not_gate u3(.a(a), .y(not_out));
    half_adder u4(.a(a), .b(b), .sum(sum_half), .carry(carry_half));
    full_adder u5(.a(a), .b(b), .cin(cin), .sum(sum_full), .cout(cout));

    initial begin
 // Cabeçalho
        $display("a b cin | AND OR NOT | Half-Sum Half-Carry | Full-Sum Full-Carry");
        $display("-----------------------------------------------------------------");

        // Testando as combinações
        a = 0; b = 0; cin = 0; #10;
        $display("%b %b  %b   |  %b   %b   %b   |    %b        %b        |    %b      %b", 
                 a, b, cin, and_out, or_out, not_out, sum_half, carry_half, sum_full, cout);

        a = 0; b = 1; cin = 0; #10;
        $display("%b %b  %b   |  %b   %b   %b   |    %b        %b        |    %b      %b", 
                 a, b, cin, and_out, or_out, not_out, sum_half, carry_half, sum_full, cout);

        a = 1; b = 0; cin = 1; #10;
        $display("%b %b  %b   |  %b   %b   %b   |    %b        %b        |    %b      %b", 
                 a, b, cin, and_out, or_out, not_out, sum_half, carry_half, sum_full, cout);

        a = 1; b = 1; cin = 1; #10;
        $display("%b %b  %b   |  %b   %b   %b   |    %b        %b        |    %b      %b", 
                 a, b, cin, and_out, not_out, or_out, sum_half, carry_half, sum_full, cout);


        $finish;
    end
endmodule
