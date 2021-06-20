module REGFILE(
	input wire [2:0] srcA, //两个读端口A, B
	input wire [2:0] srcB, //总共8个寄存器，需要3位地址表示，所以用[2:0]
	output wire [7:0] A, //8位寄存器，两个端口：A，B
	output wire [7:0] B,
	input wire [2:0] dstM, //8位寄存器，写端口：M，E
	input wire [2:0] dstE, //dst表示端口地址
	input wire [7:0] M,
	input wire [7:0] E,
	input wire clk
); //寄存器

	reg [7:0] rf [0:7];
	//assign对线网型赋值
	assign A = (srcA==3'b000)? 8'h00 : rf[srcA];  //如果srcA是0必须返回一个零值
	assign B = (srcB==3'o0)? 8'h00 : rf[srcB]; //同上

	//<=非阻塞执行，=阻塞执行
	always @(posedge clk) begin
		if(dstM!=3'o0) 
            rf[dstM] <= M;
		if(dstE!=3'o0 && dstE!=dstM) //如果两个地址是同一个地址，需要有一个优先级(POP指令会涉及)，令M端口优先(栈顶的值存入EXP中)
            rf[dstE] <= E;
	end
endmodule
