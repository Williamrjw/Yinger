`timescale 1ns / 1ps
///////////////////////
//Author: Williamrjw
//module: ALU
//Project name:Yinger
///////////////////////
//parameter ADD=4'b0010;
//parameter SUB=4'b0110;

module ALU(
input rst,
input[3:0] alu_ct,
input[31:0] alu_src1,alu_src2,
output alu_zero,
output reg [31:0] alu_res
);
assign alu_zero= (alu_res==0)?1:0;
/////////////////////////DEFINE THE REGS AND WIRES////////////////////
always@(*)
if(!rst)begin
alu_res = 32'b0;
end
else begin
case(alu_ct)
//ADD:
4'b0010:
alu_res<=alu_src1+alu_src2;
//SUB:
4'b0110:
alu_res<=alu_src1-alu_src2;
//OR:////////////////////2020/5/29 add OR function
4'b0001:
alu_res<=alu_src1|alu_src2;//////////////////////////随便选的一个alu ct 如果要改这里，还要改aluct文件里的这个值
//AND:////////////////////2020/5/29 add AND function
4'b0000:
alu_res<=alu_src1&alu_src2;//////////////////////////随便选的一个alu ct 如果要改这里，还要改aluct文件里的这个值
//XOR:////////////////////2020/5/29 add XOR function
4'b0011:
alu_res<=alu_src1^alu_src2;//////////////////////////随便选的一个alu ct 如果要改这里，还要改aluct文件里的这个值
//NOR:
4'b0100:
alu_res<=~(alu_src1|alu_src2);//////////////////////////随便选的一个alu ct 如果要改这里，还要改aluct文件里的这个值
default: alu_res = 32'b0;
endcase
end
/////////////////////////CALCULATE///////////////////////////////////
endmodule