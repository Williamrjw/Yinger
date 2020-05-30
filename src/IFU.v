`timescale 1ns / 1ps
///////////////////////
//Author: Williamrjw
//module: IFU
//Project name:Yinger
///////////////////////

module IFU(
input clk,rst,
input alu_zero,ct_branch,ct_jump,
output[31:0] inst
);
reg[31:0] pc;
reg[31:0] instRom[65535:0];//指令存储器空间为256KB
wire[31:0] ext_data;//符号扩展后的值
/////////////////////////DEFINE THE REGS AND WIRES////////////////////
initial $readmemh("inst.data",instRom);//加载指令文件到存储器
assign inst=instRom[pc[17:2]];//取指令
assign ext_data = {{16{inst[15]}},inst[15:0]};//符号扩展
///////////////////////INITIAL////////////////////////////////////////
always @ (posedge clk)
    if(!rst)
        pc <= 0;
    else begin
        if(ct_jump) begin
        pc<={pc[31:28], inst[25:0], 2'b00};
        end
        else if(ct_branch && alu_zero) begin
        pc<=pc+4+(ext_data<<2);
        end
        else
        pc <= pc + 4;
    end
 /////////////////////FETCH THE INSTRUCTION///////////////////////////////
endmodule