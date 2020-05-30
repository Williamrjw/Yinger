`timescale 1ns / 1ps
///////////////////////
//Author: Williamrjw
//module: RegFile
//Project name:Yinger
///////////////////////

module RegFile(
input clk,
// 写使能信号
input rf_wen,
// 读地址
input[4:0] rf_addr_r1,
input[4:0] rf_addr_r2,
// 写入地址和写入数据
input[4:0] rf_addr_w,
input[31:0] rf_data_w,
// 输出端口
output[31:0] rf_data_r1,
output[31:0] rf_data_r2
);
reg[31:0] file[31:0];
integer i;
/////////////////////////DEFINE THE REGS AND WIRES////////////////////
initial begin
for(i = 0; i < 32; i=i+1) file[i] = 32'b0;
end
///////////////////////INITIAL////////////////////////////////////////
assign rf_data_r1 = file[rf_addr_r1];
assign rf_data_r2 = file[rf_addr_r2];
///////////////////////READ THE DATA//////////////////////////////////
always@(negedge clk) begin
if (rf_wen) begin
file[rf_addr_w]=rf_data_w;
end
end
///////////////////////WRITE THE DATA/////////////////////////////////
endmodule