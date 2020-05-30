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
6'b100101:alu_ct= 4'b0001;  ///////////////////2020/05/29/////////add ORI function////��Ϊ����i��ָ�����or��alu opӦ����00����addiuһ����������������
6'b100100:alu_ct= 4'b0000;  ///////////////////2020/05/29/////////add ANDI function////��Ϊ����i��ָ�����and��alu opӦ����00����addiuһ����������������
6'b100110:alu_ct= 4'b0011;  ///////////////////2020/05/29/////////add XORI function////��Ϊ����i��ָ�����xor��alu opӦ����00����addiuһ����������������
default: alu_ct = 0;
endcase end
2'b01:alu_ct= 4'b0110;
2'b10:begin case(funct)
6'b100001:alu_ct= 4'b0010;
6'b100011:alu_ct= 4'b0110;  ///////////////////2020/05/29/////////add SUBU function////��Ϊ����R��ָ�����subu��alu opӦ����10����adduһ����������������
6'b100101:alu_ct= 4'b0001;  ///////////////////2020/05/29/////////add OR function////��Ϊ����R��ָ�����or��alu opӦ����10����adduһ����������������
6'b100100:alu_ct= 4'b0000;  ///////////////////2020/05/29/////////add AND function////��Ϊ����R��ָ�����and��alu opӦ����10����adduһ����������������
6'b100110:alu_ct= 4'b0011;  ///////////////////2020/05/29/////////add XOR function////��Ϊ����R��ָ�����xor��alu opӦ����10����adduһ����������������
6'b100111:alu_ct= 4'b0100;  ///////////////////2020/05/29/////////add NOR function////��Ϊ����R��ָ�����nor��alu opӦ����10����adduһ����������������
endcase end
default: alu_ct = 0;
endcase
///////////////////////GET CONTROL SIGNAL////////////////////
endmodule