//用于给出指令在指令储存器中的地址
//在时钟信号的上升沿更新，而且需要一个控制信号，在控制信号为0的时候初始化PC寄存器
module PC(
	input wire [7:0] new_pc,  //目标地址，可能是跳转地址或者是下一条指令的地址
	output reg [7:0] pc, //指令地址，输出信号
	input wire clk,  //时钟周期
	input wire rst_  //低电位有效
);
	always @(posedge clk or negedge rst_) begin //异步复位
		if(rst_==1'b0) begin //初始化赋值0，防止随机值
			pc<=0;
		end
	 	else begin //返回指令地址
			pc<=new_pc;
		end
	end
		
endmodule
