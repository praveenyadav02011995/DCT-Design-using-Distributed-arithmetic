`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 15:52:59
// Design Name: 
// Module Name: top
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


module dac (clk,rst,x0,x1,x2,x3,x4,x5,x6,x7,h0,h1,h2,h3,h4,h5,h6,h7,Yres,out);
	input clk,rst   ;
    wire [127:0]yy;   
    reg signed [19:0] y_out; 
    input signed [7:0] x0,x1,x2,x3,x4,x5,x6,x7;   
	input signed [7:0] h0,h1,h2,h3,h4,h5,h6,h7;  
	integer i;
	output signed [15:0] Yres;
	output signed [15:0] out; 
	
	 
	 wire	[7:0]	mem [0:7]  ;
	 
	 assign	mem[0]  = {x7[0],x6[0],x5[0],x4[0],x3[0],x2[0], x1[0], x0[0]};
     assign	mem[1]  = {x7[1],x6[1],x5[1],x4[1],x3[1],x2[1], x1[1], x0[1]};
     assign	mem[2]  = {x7[2],x6[2],x5[2],x4[2],x3[2],x2[2], x1[2], x0[2]};
     assign	mem[3]  = {x7[3],x6[3],x5[3],x4[3],x3[3],x2[3], x1[3], x0[3]};
     assign	mem[4]  = {x7[4],x6[4],x5[4],x4[4],x3[4],x2[4], x1[4], x0[4]};
     assign	mem[5]  = {x7[5],x6[5],x5[5],x4[5],x3[5],x2[5], x1[5], x0[5]};
     assign	mem[6]  = {x7[6],x6[6],x5[6],x4[6],x3[6],x2[6], x1[6], x0[6]};
     assign mem[7]  = {x7[7],x6[7],x5[7],x4[7],x3[7],x2[7], x1[7], x0[7]};
   
      reg signed  [15:0]	C_out [0:7];
	 
	 always @ (mem)
        begin
            for (i=0 ; i<8 ; i=i+1 )
              begin
                case(mem[i])
                8'b00000000:	C_out[i] = 0;
                8'b00000001:	C_out[i] = h0;	
                8'b00000010:	C_out[i] = h1;
                8'b00000011:	C_out[i] = h1+h0;
                8'b00000100:	C_out[i] = h2;
                8'b00000101:	C_out[i] = h2+h0;
                8'b00000110:	C_out[i] = h2+h1;
                8'b00000111:	C_out[i] = h2+h1+h0;
                8'b00001000:	C_out[i] = h3;
                8'b00001001:	C_out[i] = h3+h0;
                8'b00001010:	C_out[i] = h3+h1;
                8'b00001011:	C_out[i] = h3+h1+h0;
                8'b00001100:	C_out[i] = h3+h2;
                8'b00001101:	C_out[i] = h3+h2+h0;
                8'b00001110:	C_out[i] = h3+h2+h1;
                8'b00001111:	C_out[i] = h3+h2+h1+h0;
                8'b00010000:	C_out[i] = h4;
                8'b00010001:	C_out[i] = h4+h0;	
                8'b00010010:	C_out[i] = h4+h1;
                8'b00010011:	C_out[i] = h4+h1+h0;
                8'b00010100:	C_out[i] = h4+h2;
                8'b00010101:	C_out[i] = h4+h2+h0;
                8'b00010110:	C_out[i] = h4+h2+h1;
                8'b00010111:	C_out[i] = h4+h2+h1+h0;
                8'b00011000:	C_out[i] = h4+h3;
                8'b00011001:	C_out[i] = h4+h3+h0;
                8'b00011010:	C_out[i] = h4+h3+h1;
                8'b00011011:	C_out[i] = h4+h3+h1+h0;
                8'b00011100:	C_out[i] = h4+h3+h2;
                8'b00011101:	C_out[i] = h4+h3+h2+h0;
                8'b00011110:	C_out[i] = h4+h3+h2+h1;
                8'b00011111:	C_out[i] = h4+h3+h2+h1+h0;
                8'b00100000:	C_out[i] = h5;
                8'b00100001:	C_out[i] = h5+h0;	
                8'b00100010:	C_out[i] = h5+h1;
                8'b00100011:	C_out[i] = h5+h1+h0;
                8'b00100100:	C_out[i] = h5+h2;
                8'b00100101:	C_out[i] = h5+h2+h0;
                8'b00100110:	C_out[i] = h5+h2+h1;
                8'b00100111:	C_out[i] = h5+h2+h1+h0;
                8'b00101000:	C_out[i] = h5+h3;
                8'b00101001:	C_out[i] = h5+h3+h0;
                8'b00101010:	C_out[i] = h5+h3+h1;
                8'b00101011:	C_out[i] = h5+h3+h1+h0;
                8'b00101100:	C_out[i] = h5+h3+h2;
                8'b00101101:	C_out[i] = h5+h3+h2+h0;
                8'b00101110:	C_out[i] = h5+h3+h2+h1;
                8'b00101111:	C_out[i] = h5+h3+h2+h1+h0;
                8'b00110000:	C_out[i] = h5+h4;
                8'b00110001:	C_out[i] = h5+h4+h0;	
                8'b00110010:	C_out[i] = h5+h4+h1;
                8'b00110011:	C_out[i] = h5+h4+h1+h0;
                8'b00110100:	C_out[i] = h5+h4+h2;
                8'b00110101:	C_out[i] = h5+h4+h2+h0;
                8'b00110110:	C_out[i] = h5+h4+h2+h1;
                8'b00110111:	C_out[i] = h5+h4+h2+h1+h0;
                8'b00111000:	C_out[i] = h5+h4+h3;
                8'b00111001:	C_out[i] = h5+h4+h3+h0;
                8'b00111010:	C_out[i] = h5+h4+h3+h1;
                8'b00111011:	C_out[i] = h5+h4+h3+h1+h0;
                8'b00111100:	C_out[i] = h5+h4+h3+h2;
                8'b00111101:	C_out[i] = h5+h4+h3+h2+h0;
                8'b00111110:	C_out[i] = h5+h4+h3+h2+h1;
                8'b00111111:	C_out[i] = h5+h4+h3+h2+h1+h0;
                8'b01000000:	C_out[i] = h6;
                8'b01000001:	C_out[i] = h6+h0;	
                8'b01000010:	C_out[i] = h6+h1;
                8'b01000011:	C_out[i] = h6+h1+h0;
                8'b01000100:	C_out[i] = h6+h2;
                8'b01000101:	C_out[i] = h6+h2+h0;
                8'b01000110:	C_out[i] = h6+h2+h1;
                8'b01000111:	C_out[i] = h6+h2+h1+h0;
                8'b01001000:	C_out[i] = h6+h3;
                8'b01001001:	C_out[i] = h6+h3+h0;
                8'b01001010:	C_out[i] = h6+h3+h1;
                8'b01001011:	C_out[i] = h6+h3+h1+h0;
                8'b01001100:	C_out[i] = h6+h3+h2;
                8'b01001101:	C_out[i] = h6+h3+h2+h0;
                8'b01001110:	C_out[i] = h6+h3+h2+h1;
                8'b01001111:	C_out[i] = h6+h3+h2+h1+h0;
                8'b01010000:	C_out[i] = h6+h4;
                8'b01010001:	C_out[i] = h6+h4+h0;	
                8'b01010010:	C_out[i] = h6+h4+h1;
                8'b01010011:	C_out[i] = h6+h4+h1+h0;
                8'b01010100:	C_out[i] = h6+h4+h2;
                8'b01010101:	C_out[i] = h6+h4+h2+h0;
                8'b01010110:	C_out[i] = h6+h4+h2+h1;
                8'b01010111:	C_out[i] = h6+h4+h2+h1+h0;
                8'b01011000:	C_out[i] = h6+h4+h3;
                8'b01011001:	C_out[i] = h6+h4+h3+h0;
                8'b01011010:	C_out[i] = h6+h4+h3+h1;
                8'b01011011:	C_out[i] = h6+h4+h3+h1+h0;
                8'b01011100:	C_out[i] = h6+h4+h3+h2;
                8'b01011101:	C_out[i] = h6+h4+h3+h2+h0;
                8'b01011110:	C_out[i] = h6+h4+h3+h2+h1;
                8'b01011111:	C_out[i] = h6+h4+h3+h2+h1+h0;
                8'b01100000:	C_out[i] = h6+h5;
                8'b01100001:	C_out[i] = h6+h5+h0;	
                8'b01100010:	C_out[i] = h6+h5+h1;
                8'b01100011:	C_out[i] = h6+h5+h1+h0;
                8'b01100100:	C_out[i] = h6+h5+h2;
                8'b01100101:	C_out[i] = h6+h5+h2+h0;
                8'b01100110:	C_out[i] = h6+h5+h2+h1;
                8'b01100111:	C_out[i] = h6+h5+h2+h1+h0;
                8'b01101000:	C_out[i] = h6+h5+h3;
                8'b01101001:	C_out[i] = h6+h5+h3+h0;
                8'b01101010:	C_out[i] = h6+h5+h3+h1;
                8'b01101011:	C_out[i] = h6+h5+h3+h1+h0;
                8'b01101100:	C_out[i] = h6+h5+h3+h2;
                8'b01101101:	C_out[i] = h6+h5+h3+h2+h0;
                8'b01101110:	C_out[i] = h6+h5+h3+h2+h1;
                8'b01101111:	C_out[i] = h6+h5+h3+h2+h1+h0;
                8'b01110000:	C_out[i] = h6+h5+h4;
                8'b01110001:	C_out[i] = h6+h5+h4+h0;	
                8'b01110010:	C_out[i] = h6+h5+h4+h1;
                8'b01110011:	C_out[i] = h6+h5+h4+h1+h0;
                8'b01110100:	C_out[i] = h6+h5+h4+h2;
                8'b01110101:	C_out[i] = h6+h5+h4+h2+h0;
                8'b01110110:	C_out[i] = h6+h5+h4+h2+h1;
                8'b01110111:	C_out[i] = h6+h5+h4+h2+h1+h0;
                8'b01111000:	C_out[i] = h6+h5+h4+h3;
                8'b01111001:	C_out[i] = h6+h5+h4+h3+h0;
                8'b01111010:	C_out[i] = h6+h5+h4+h3+h1;
                8'b01111011:	C_out[i] = h6+h5+h4+h3+h1+h0;
                8'b01111100:	C_out[i] = h6+h5+h4+h3+h2;
                8'b01111101:	C_out[i] = h6+h5+h4+h3+h2+h0;
                8'b01111110:	C_out[i] = h6+h5+h4+h3+h2+h1;
                8'b01111111:	C_out[i] = h6+h5+h4+h3+h2+h1+h0;
                8'b10000000:	C_out[i] = h7;
                8'b10000001:	C_out[i] = h7+h0;	
                8'b10000010:	C_out[i] = h7+h1;
                8'b10000011:	C_out[i] = h7+h1+h0;
                8'b10000100:	C_out[i] = h7+h2;
                8'b10000101:	C_out[i] = h7+h2+h0;
                8'b10000110:	C_out[i] = h7+h2+h1;
                8'b10000111:	C_out[i] = h7+h2+h1+h0;
                8'b10001000:	C_out[i] = h7+h3;
                8'b10001001:	C_out[i] = h7+h3+h0;
                8'b10001010:	C_out[i] = h7+h3+h1;
                8'b10001011:	C_out[i] = h7+h3+h1+h0;
                8'b10001100:	C_out[i] = h7+h3+h2;
                8'b10001101:	C_out[i] = h7+h3+h2+h0;
                8'b10001110:	C_out[i] = h7+h3+h2+h1;
                8'b10001111:	C_out[i] = h7+h3+h2+h1+h0;
                8'b10010000:	C_out[i] = h7+h4;
                8'b10010001:	C_out[i] = h7+h4+h0;	
                8'b10010010:	C_out[i] = h7+h4+h1;
                8'b10010011:	C_out[i] = h7+h4+h1+h0;
                8'b10010100:	C_out[i] = h7+h4+h2;
                8'b10010101:	C_out[i] = h7+h4+h2+h0;
                8'b10010110:	C_out[i] = h7+h4+h2+h1;
                8'b10010111:	C_out[i] = h7+h4+h2+h1+h0;
                8'b10011000:	C_out[i] = h7+h4+h3;
                8'b10011001:	C_out[i] = h7+h4+h3+h0;
                8'b10011010:	C_out[i] = h7+h4+h3+h1;
                8'b10011011:	C_out[i] = h7+h4+h3+h1+h0;
                8'b10011100:	C_out[i] = h7+h4+h3+h2;
                8'b10011101:	C_out[i] = h7+h4+h3+h2+h0;
                8'b10011110:	C_out[i] = h7+h4+h3+h2+h1;
                8'b10011111:	C_out[i] = h7+h4+h3+h2+h1+h0;
                8'b10100000:	C_out[i] = h7+h5;
                8'b10100001:	C_out[i] = h7+h5+h0;	
                8'b10100010:	C_out[i] = h7+h5+h1;
                8'b10100011:	C_out[i] = h7+h5+h1+h0;
                8'b10100100:	C_out[i] = h7+h5+h2;
                8'b10100101:	C_out[i] = h7+h5+h2+h0;
                8'b10100110:	C_out[i] = h7+h5+h2+h1;
                8'b10100111:	C_out[i] = h7+h5+h2+h1+h0;
                8'b10101000:	C_out[i] = h7+h5+h3;
                8'b10101001:	C_out[i] = h7+h5+h3+h0;
                8'b10101010:	C_out[i] = h7+h5+h3+h1;
                8'b10101011:	C_out[i] = h7+h5+h3+h1+h0;
                8'b10101100:	C_out[i] = h7+h5+h3+h2;
                8'b10101101:	C_out[i] = h7+h5+h3+h2+h0;
                8'b10101110:	C_out[i] = h7+h5+h3+h2+h1;
                8'b10101111:	C_out[i] = h7+h5+h3+h2+h1+h0;
                8'b10110000:	C_out[i] = h7+h5+h4;
                8'b10110001:	C_out[i] = h7+h5+h4+h0;	
                8'b10110010:	C_out[i] = h7+h5+h4+h1;
                8'b10110011:	C_out[i] = h7+h5+h4+h1+h0;
                8'b10110100:	C_out[i] = h7+h5+h4+h2;
                8'b10110101:	C_out[i] = h7+h5+h4+h2+h0;
                8'b10110110:	C_out[i] = h7+h5+h4+h2+h1;
                8'b10110111:	C_out[i] = h7+h5+h4+h2+h1+h0;
                8'b10111000:	C_out[i] = h7+h5+h4+h3;
                8'b10111001:	C_out[i] = h7+h5+h4+h3+h0;
                8'b10111010:	C_out[i] = h7+h5+h4+h3+h1;
                8'b10111011:	C_out[i] = h7+h5+h4+h3+h1+h0;
                8'b10111100:	C_out[i] = h7+h5+h4+h3+h2;
                8'b10111101:	C_out[i] = h7+h5+h4+h3+h2+h0;
                8'b10111110:	C_out[i] = h7+h5+h4+h3+h2+h1;
                8'b10111111:	C_out[i] = h7+h5+h4+h3+h2+h1+h0;
                8'b11000000:	C_out[i] = h7+h6;
                8'b11000001:	C_out[i] = h7+h6+h0;	
                8'b11000010:	C_out[i] = h7+h6+h1;
                8'b11000011:	C_out[i] = h7+h6+h1+h0;
                8'b11000100:	C_out[i] = h7+h6+h2;
                8'b11000101:	C_out[i] = h7+h6+h2+h0;
                8'b11000110:	C_out[i] = h7+h6+h2+h1;
                8'b11000111:	C_out[i] = h7+h6+h2+h1+h0;
                8'b11001000:	C_out[i] = h7+h6+h3;
                8'b11001001:	C_out[i] = h7+h6+h3+h0;
                8'b11001010:	C_out[i] = h7+h6+h3+h1;
                8'b11001011:	C_out[i] = h7+h6+h3+h1+h0;
                8'b11001100:	C_out[i] = h7+h6+h3+h2;
                8'b11001101:	C_out[i] = h7+h6+h3+h2+h0;
                8'b11001110:	C_out[i] = h7+h6+h3+h2+h1;
                8'b11001111:	C_out[i] = h7+h6+h3+h2+h1+h0;
                8'b11010000:	C_out[i] = h7+h6+h4;
                8'b11010001:	C_out[i] = h7+h6+h4+h0;	
                8'b11010010:	C_out[i] = h7+h6+h4+h1;
                8'b11010011:	C_out[i] = h7+h6+h4+h1+h0;
                8'b11010100:	C_out[i] = h7+h6+h4+h2;
                8'b11010101:	C_out[i] = h7+h6+h4+h2+h0;
                8'b11010110:	C_out[i] = h7+h6+h4+h2+h1;
                8'b11010111:	C_out[i] = h7+h6+h4+h2+h1+h0;
                8'b11011000:	C_out[i] = h7+h6+h4+h3;
                8'b11011001:	C_out[i] = h7+h6+h4+h3+h0;
                8'b11011010:	C_out[i] = h7+h6+h4+h3+h1;
                8'b11011011:	C_out[i] = h7+h6+h4+h3+h1+h0;
                8'b11011100:	C_out[i] = h7+h6+h4+h3+h2;
                8'b11011101:	C_out[i] = h7+h6+h4+h3+h2+h0;
                8'b11011110:	C_out[i] = h7+h6+h4+h3+h2+h1;
                8'b11011111:	C_out[i] = h7+h6+h4+h3+h2+h1+h0;
                8'b11100000:	C_out[i] = h7+h6+h5;
                8'b11100001:	C_out[i] = h7+h6+h5+h0;	
                8'b11100010:	C_out[i] = h7+h6+h5+h1;
                8'b11100011:	C_out[i] = h7+h6+h5+h1+h0;
                8'b11100100:	C_out[i] = h7+h6+h5+h2;
                8'b11100101:	C_out[i] = h7+h6+h5+h2+h0;
                8'b11100110:	C_out[i] = h7+h6+h5+h2+h1;
                8'b11100111:	C_out[i] = h7+h6+h5+h2+h1+h0;
                8'b11101000:	C_out[i] = h7+h6+h5+h3;
                8'b11101001:	C_out[i] = h7+h6+h5+h3+h0;
                8'b11101010:	C_out[i] = h7+h6+h5+h3+h1;
                8'b11101011:	C_out[i] = h7+h6+h5+h3+h1+h0;
                8'b11101100:	C_out[i] = h7+h6+h5+h3+h2;
                8'b11101101:	C_out[i] = h7+h6+h5+h3+h2+h0;
                8'b11101110:	C_out[i] = h7+h6+h5+h3+h2+h1;
                8'b11101111:	C_out[i] = h7+h6+h5+h3+h2+h1+h0;
                8'b11110000:	C_out[i] = h7+h6+h5+h4;
                8'b11110001:	C_out[i] = h7+h6+h5+h4+h0;	
                8'b11110010:	C_out[i] = h7+h6+h5+h4+h1;
                8'b11110011:	C_out[i] = h7+h6+h5+h4+h1+h0;
                8'b11110100:	C_out[i] = h7+h6+h5+h4+h2;
                8'b11110101:	C_out[i] = h7+h6+h5+h4+h2+h0;
                8'b11110110:	C_out[i] = h7+h6+h5+h4+h2+h1;
                8'b11110111:	C_out[i] = h7+h6+h5+h4+h2+h1+h0;
                8'b11111000:	C_out[i] = h7+h6+h5+h4+h3;
                8'b11111001:	C_out[i] = h7+h6+h5+h4+h3+h0;
                8'b11111010:	C_out[i] = h7+h6+h5+h4+h3+h1;
                8'b11111011:	C_out[i] = h7+h6+h5+h4+h3+h1+h0;
                8'b11111100:	C_out[i] = h7+h6+h5+h4+h3+h2;
                8'b11111101:	C_out[i] = h7+h6+h5+h4+h3+h2+h0;
                8'b11111110:	C_out[i] = h7+h6+h5+h4+h3+h2+h1;
                8'b11111111:	C_out[i] = h7+h6+h5+h4+h3+h2+h1+h0;                                                                                                        
                default:    C_out[i] = 0;
                endcase
                if( i == 7 )
                 C_out[7] = ~C_out[7]+1'b1;
            end
        end

	 assign yy = {C_out[7],C_out[6],C_out[5],C_out[4],C_out[3],C_out[2],C_out[1],C_out[0]};
    

	 always @ (posedge clk or posedge rst)
	 begin
	      if(rst)
	       y_out <= 0;
	      else
	        begin  
	          y_out = 0;
              for(i=1;i<9;i=i+1)
                 begin
                   case(i) 
	                  1: begin
	                       y_out = (({yy[15:0],8'b0})+y_out) ;
	                       y_out = y_out >>> 1;
	                     end  
	                  
	                  2: begin
	                       y_out = (({yy[31:16],8'b0})+y_out) ;
	                       y_out = y_out >>> 1;
	                      end  
	                  
	                  3: begin
	                        y_out = (({yy[47:32],8'b0})+y_out) ;
	                        y_out = y_out >>> 1;
	                      end  
	                  
	                  4: begin
	                        y_out = (({yy[63:48],8'b0})+y_out) ;
	                        y_out = y_out >>> 1;
	                      end  
	                  5: begin
	                       y_out = (({yy[79:64],8'b0})+y_out) ;
	                       y_out = y_out >>> 1;
	                     end  
	                  
	                  6: begin
	                       y_out = (({yy[95:80],8'b0})+y_out) ;
	                       y_out = y_out >>> 1;
	                      end  
	                  
	                  7: begin
	                        y_out = (({yy[111:96],8'b0})+y_out) ;
	                        y_out = y_out >>> 1;
	                      end  
	                  
	                  8: begin
	                        y_out = (({yy[127:112],8'b0})+y_out) ;
	                        y_out = y_out >>> 1;
	                      end
	                  default: y_out<= 0;
	               endcase
	             end
	        end
	  end     
    assign Yres = y_out[15:0];
    assign out = ~Yres +1'b1;
endmodule