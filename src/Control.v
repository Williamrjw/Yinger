`timescale 1ns / 1ps
///////////////////////
//Author: Williamrjw
//module: Control
//Project name:Yinger
///////////////////////
module Control(
input rst,
input[5:0] ct_inst,
input[5:0] aluct_inst,
output ct_rf_dst,
output ct_rf_wen,
output ct_alu_src,
output[3:0] ct_alu,
output ct_mem_wen,
output ct_mem_ren,
output ct_data_rf,
output ct_branch,
output ct_jump
);
wire inst_r,inst_lw,inst_sw,inst_beq,inst_j,inst_addiu;
wire inst_andi,inst_ori,inst_xori;//////////////////////////2020/5/29////////add I- instruction
//wire inst_jr;///////////////////////////////2020/5/30////////add JR instruction
wire[1:0] ct_alu_op;
wire [5:0] funct;
ALUCt aluct0(rst,funct,ct_alu_op,ct_alu);
///////////////////////DEFINE THE REGS AND WIRES////////////////////
//二级逻辑阵列
//与阵
assign inst_r = (!ct_inst[5])&&(!ct_inst[4])&&(!ct_inst[3])&&(!ct_inst[2])&&(!ct_inst[1])&&(!ct_inst[0]);
assign inst_lw = (ct_inst[5])&&(!ct_inst[4])&&(!ct_inst[3])&&(!ct_inst[2])&&(ct_inst[1])&&(ct_inst[0]);
assign inst_sw = (ct_inst[5])&&(!ct_inst[4])&&(ct_inst[3])&&(!ct_inst[2])&&(ct_inst[1])&&(ct_inst[0]);
assign inst_beq = (!ct_inst[5])&&(!ct_inst[4])&&(!ct_inst[3])&&(ct_inst[2])&&(!ct_inst[1])&&(!ct_inst[0]);
assign inst_j = (!ct_inst[5])&&(!ct_inst[4])&&(!ct_inst[3])&&(!ct_inst[2])&&(ct_inst[1])&&(!ct_inst[0]);
assign inst_addiu = (!ct_inst[5])&&(!ct_inst[4])&&(ct_inst[3])&&(!ct_inst[2])&&(!ct_inst[1])&&(ct_inst[0]);
assign inst_andi = (!ct_inst[5])&&(!ct_inst[4])&&(ct_inst[3])&&(ct_inst[2])&&(!ct_inst[1])&&(!ct_inst[0]);
assign inst_ori = (!ct_inst[5])&&(!ct_inst[4])&&(ct_inst[3])&&(ct_inst[2])&&(!ct_inst[1])&&(ct_inst[0]);
assign inst_xori = (!ct_inst[5])&&(!ct_inst[4])&&(ct_inst[3])&&(ct_inst[2])&&(ct_inst[1])&&(!ct_inst[0]);
assign funct = inst_r?aluct_inst:(inst_addiu?6'b100001:inst_andi?6'b100100:inst_ori?6'b100101:inst_xori?6'b100110:6'b000000);
//assign inst_jr = inst_r&(aluct_inst==6'b001000);///////////////////////////////////////////2020/05/30
//或阵
assign ct_rf_dst = rst?inst_r:0;
assign ct_rf_wen = rst?inst_r || inst_lw||inst_addiu||inst_andi||inst_ori||inst_xori:0;
assign ct_alu_src = inst_lw || inst_sw||inst_addiu||inst_andi||inst_ori||inst_xori;
assign ct_alu_op[1:0] = {inst_r,inst_beq};
assign ct_branch=rst?inst_beq:0;
assign ct_mem_ren=rst?inst_lw:0;
assign ct_mem_wen=inst_sw;
assign ct_data_rf=inst_lw;
assign ct_jump=rst?inst_j:0;
endmodule

 