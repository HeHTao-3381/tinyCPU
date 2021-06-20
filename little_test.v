`timescale 10ns/1ns

module little_test;
	reg [7:0] A,B;
	reg [3:0] op;
	wire [7:0] E;
	wire [1:0] cc;
	reg clk;

	//分配端口给实例化的ALU
	ALU alu(.A(A),.B(B),.op(op),.E(E),.cc(cc));
	
	always #5 clk <= ~clk;
	
	//50ns低电平，100ns高电平，然后反复为一个完整周期
	initial begin
		clk = 1'b1;
	#6 //在第6个时间单位进行操作，比5个时间单位多一个
		A = 1;
		B = 2;
		op = 0;
	#20
		$finish;
		end
		
	initial begin
		$dumpfile("little_test.vcd");
		$dumpvars(0,alu);//将alu存到波形文件中
		$dumpvars(0,clk);
		end
endmodule
