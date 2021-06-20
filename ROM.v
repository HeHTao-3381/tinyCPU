module ROM(
	input wire [7:0] addr,   //8位地址输入
	output wire [23 :0] out   //需要输出一整条指令，需要三个字节24位
							//第一个字节存储指令码：高四位是指令类型，第四位是功能码
							//第二个字节描述寄存器操作数/指令码：一共最多两个寄存器，每一个寄存器操作数3位，刚好占一个字节。
							//第三个字节描述常量
);

	reg [7:0] mem [0:255];  //存储单元
	
	assign out = {mem[addr],mem[addr+1],mem[addr+2]};   //连续输出三个字节
	
	initial 
		$readmemh("rom.txt",mem,0,255); //利用系统任务读入
	
endmodule