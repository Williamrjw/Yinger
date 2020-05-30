`timescale 1ns / 1ps
///////////////////////
//Author: Williamrjw
//module: ALUct
//Project name:Yinger
///////////////////////
module ALUCt(
input rst,
input[5:0] funct,
input[1:0] alu_ct_op,
output reg[3:0] alu_ct
);
///////////////////////DEFINE THE REGS AND WIRES////////////////////
always@(*)
if(!rst)
alu_ct = 0;
else
case(alu_ct_op)
2'b00:begin case(funct)
6'b100001:alu_ct= 4'b0010;
6'b100101:alu_ct= 4'b0001;  ///////////////////2020/05/29/////////add ORI function////因为属于i型指令，所以or的alu op应该是00，和addiu一样，所以列在这里
6'b100100:alu_ct= 4'b0000;  ///////////////////2020/05/29/////////add ANDI function////因为属于i型指令，所以and的alu op应该是00，和addiu一样，所以列在这里
6'b100110:alu_ct= 4'b0011;  ///////////////////2020/05/29/////////add XORI function////因为属于i型指令，所以xor的alu op应该是00，和addiu一样，所以列在这里
default: alu_ct = 0;
endcase end
2'b01:alu_ct= 4'b0110;
2'b10:begin case(funct)
6'b100001:alu_ct= 4'b0010;
6'b100011:alu_ct= 4'b0110;  ///////////////////2020/05/29/////////add SUBU function////因为属于R型指令，所以subu的alu op应该是10，和addu一样，所以列在这里
6'b100101:alu_ct= 4'b0001;  ///////////////////2020/05/29/////////add OR function////因为属于R型指令，所以or的alu op应该是10，和addu一样，所以列在这里
6'b100100:alu_ct= 4'b0000;  ///////////////////2020/05/29/////////add AND function////因为属于R型指令，所以and的alu op应该是10，和addu一样，所以列在这里
6'b100110:alu_ct= 4'b0011;  ///////////////////2020/05/29/////////add XOR function////因为属于R型指令，所以xor的alu op应该是10，和addu一样，所以列在这里
6'b100111:alu_ct= 4'b0100;  ///////////////////2020/05/29/////////add NOR function////因为属于R型指令，所以nor的alu op应该是10，和addu一样，所以列在这里
endcase end
default: alu_ct = 0;
endcase
///////////////////////GET CONTROL SIGNAL////////////////////
endmodule