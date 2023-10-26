
module mips_16_core_top
(
	input						clk,
	input						rst,

	output	[`PC_WIDTH-1:0]		pc
);
	wire 						pipeline_stall_n ;
	wire	[5:0]				branch_offset_imm;
	wire						branch_taken;
	wire	[15:0]				instruction;
	wire	[56:0]				ID_pipeline_reg_out;
	wire	[37:0]				EX_pipeline_reg_out;
	wire	[36:0]				MEM_pipeline_reg_out;
	
	wire	[2:0]				reg_read_addr_1;	// register file read port 1 address
	wire	[2:0]				reg_read_addr_2;	// register file read port 2 address
	wire	[15:0]				reg_read_data_1;	// register file read port 1 data
	wire	[15:0]				reg_read_data_2;	// register file read port 2 data
	wire	[2:0]				decoding_op_src1;		//source_1 register number
	wire	[2:0]				decoding_op_src2;		//source_2 register number
	wire	[2:0]				ex_op_dest;				//EX stage destinaton register number
	wire	[2:0]				mem_op_dest;			//MEM stage destinaton register number
	wire	[2:0]				wb_op_dest;				//WB stage destinaton register number
	wire						reg_write_en;
	wire	[2:0]				reg_write_dest;
	wire	[15:0]				reg_write_data;
	
	IF_stage IF_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.instruction_fetch_en	(pipeline_stall_n),
		.branch_offset_imm		(branch_offset_imm), 
		.branch_taken			(branch_taken), 
		.pc						(pc),
		.instruction			(instruction)
	);
	
	ID_stage ID_stage_inst (
		.clk					(clk),
		.rst					(rst),
		.instruction_decode_en	(pipeline_stall_n),
		.pipeline_reg_out		(ID_pipeline_reg_out),
		.instruction			(instruction),
		.branch_offset_imm		(branch_offset_imm),
		.branch_taken			(branch_taken),
		.reg_read_addr_1		(reg_read_addr_1),	//
		.reg_read_addr_2		(reg_read_addr_2),	//
		.reg_read_data_1		(reg_read_data_1),	//
		.reg_read_data_2		(reg_read_data_2),	//
		.decoding_op_src1		(decoding_op_src1),		
		.decoding_op_src2		(decoding_op_src2)
	);
	
	EX_stage EX_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.pipeline_reg_in		(ID_pipeline_reg_out), 
		.pipeline_reg_out		(EX_pipeline_reg_out), 
		.ex_op_dest				(ex_op_dest)
	);
	
	MEM_stage MEM_stage_inst (
		.clk					(clk), 
		.rst					(rst), 
		.pipeline_reg_in		(EX_pipeline_reg_out), 
		.pipeline_reg_out		(MEM_pipeline_reg_out), 
		.mem_op_dest			(mem_op_dest)
	);
	
	WB_stage WB_stage_inst (
		.pipeline_reg_in		(MEM_pipeline_reg_out), 
		.reg_write_en			(reg_write_en), 
		.reg_write_dest			(reg_write_dest), 
		.reg_write_data			(reg_write_data), 
		.wb_op_dest				(wb_op_dest)
	);
	
	register_file register_file_inst (
		.clk					(clk), 
		.rst					(rst), 
		.reg_write_en			(reg_write_en), 
		.reg_write_dest			(reg_write_dest), 
		.reg_write_data			(reg_write_data), 
		.reg_read_addr_1		(reg_read_addr_1), 
		.reg_read_data_1		(reg_read_data_1), 
		.reg_read_addr_2		(reg_read_addr_2), 
		.reg_read_data_2		(reg_read_data_2)
	);
	
	hazard_detection_unit hazard_detection_unit_inst (
		.decoding_op_src1		(decoding_op_src1), 
		.decoding_op_src2		(decoding_op_src2), 
		.ex_op_dest				(ex_op_dest), 
		.mem_op_dest			(mem_op_dest), 
		.wb_op_dest				(wb_op_dest), 
		.pipeline_stall_n		(pipeline_stall_n)
	);
	
endmodule 

module alu
(
	input		[15:0]	a,		//src1
	input		[15:0]	b,		//src2
	input		[2:0]	cmd,	//function sel
	
	output	reg	[15:0]	r		//result	
);
	always @ (*) begin
		case(cmd)
			`ALU_NC	:
				r = 16'bx;
			`ALU_ADD:
				r = a + b;
			`ALU_SUB:
				r = a - b;
			`ALU_AND:
				r = a & b;
			`ALU_OR	:
				r = a | b;
			`ALU_XOR:
				r = a ^ b;
			`ALU_SL	:
				r = a << b;
			`ALU_SR	:
				r = {{16{a[15]}},a} >> b;
			`ALU_SRU	:
				r = {16'b0,a} >> b;
			default	:
				begin
					r = 0;

				end
		endcase
	end
	
endmodule 

module data_mem
(
	input					clk,
	
	// address input, shared by read and write port
	input	[15:0]			mem_access_addr,
	
	// write port
	input	[15:0]			mem_write_data,
	input					mem_write_en,
	// read port
	output	[15:0]			mem_read_data
	
);


	reg [15:0] ram [(2**`DATA_MEM_ADDR_WIDTH)-1:0];

	wire [`DATA_MEM_ADDR_WIDTH-1 : 0] ram_addr = mem_access_addr[`DATA_MEM_ADDR_WIDTH-1 : 0];

	always @(posedge clk)
		if (mem_write_en)
			ram[ram_addr] <= mem_write_data;

	assign mem_read_data = ram[ram_addr]; 
   
endmodule 

module EX_stage
(
	input					clk,
	input					rst,
	// from ID_stage
	input		[56:0]		pipeline_reg_in,	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0]
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to MEM_stage
	output	reg	[37:0]		pipeline_reg_out,	//	[37:22],16bits:	ex_alu_result[15:0];
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to hazard detection unit
	output		[2:0]		ex_op_dest
);
	wire	[2:0]		alu_cmd		= pipeline_reg_in[56:54];				//S2
	wire	[15:0]		alu_src1	= pipeline_reg_in[53:38];
	wire	[15:0]		alu_src2	= pipeline_reg_in[37:22];
	
	wire	[15:0]		ex_alu_result;
	
	/********************** ALU *********************/
	alu alu_inst(
		.a		( alu_src1),
		.b		( alu_src2),
		.cmd	( alu_cmd),
		.r		( ex_alu_result)
	);
	
	
	/********************** singals to MEM_stage *********************/
	always @ (posedge clk) begin
		if(rst) begin
			pipeline_reg_out[37:0] <= 0;
		end
		else begin
			pipeline_reg_out[37:22] <= ex_alu_result;
			pipeline_reg_out[21:0] <= pipeline_reg_in[21:0];
		end
	end
	
	
	/********************** to hazard detection unit *********************/
	assign ex_op_dest = pipeline_reg_in[3:1];
endmodule 

module hazard_detection_unit
(
	input		[2:0]		decoding_op_src1,		//ID stage source_1 register number
	input		[2:0]		decoding_op_src2,		//ID stage source_2 register number
	
	input		[2:0]		ex_op_dest,				//EX stage destinaton register number
	input		[2:0]		mem_op_dest,			//MEM stage destinaton register number
	input		[2:0]		wb_op_dest,				//WB stage destinaton register number
	
	output	reg				pipeline_stall_n		// Active low
);
	
	always @ (*) begin
		pipeline_stall_n = 1;
		
		if( decoding_op_src1 != 0 &&
			(
				decoding_op_src1 == ex_op_dest	||
				decoding_op_src1 == mem_op_dest	||
				decoding_op_src1 == wb_op_dest	
			)
		)
			pipeline_stall_n = 0;
			
		if( decoding_op_src2 != 0 &&
			(
				decoding_op_src2 == ex_op_dest	||
				decoding_op_src2 == mem_op_dest	||
				decoding_op_src2 == wb_op_dest	
			)
		)
			pipeline_stall_n = 0;
		
		
	end
	
	
	
endmodule 


module ID_stage
(
	input					clk,
	input					rst,
	input					instruction_decode_en,
	//input					insert_bubble,
	
	
	// to EX_stage
	output	reg	[56:0]		pipeline_reg_out,	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0]
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to IF_stage
	input		[15:0]		instruction,
	output		[5:0]		branch_offset_imm,
	output	reg				branch_taken,
	
	// to register file
	output		[2:0]		reg_read_addr_1,	// register file read port 1 address
	output		[2:0]		reg_read_addr_2,	// register file read port 2 address
	input		[15:0]		reg_read_data_1,	// register file read port 1 data
	input		[15:0]		reg_read_data_2,	// register file read port 2 data
	
	// to hazard detection unit
	output		[2:0]		decoding_op_src1,		//source_1 register number
	output		[2:0]		decoding_op_src2		//source_2 register number
	
);
    
	/********************** internal wires ***********************************/
	//----------------- Instruction Register signals --------------------//
	reg		[15:0]		instruction_reg;
	wire	[3:0]		ir_op_code;		//operation code
	wire	[2:0]		ir_dest;		//destination register number
	wire	[2:0]		ir_src1;		//source_1 register number
	wire	[2:0]		ir_src2;		//source_2 register number
	wire	[5:0]		ir_imm;			//immediate number carried by the instruction
	
	//---------------- data path control signals --------------------------//
	// write back stage signals
	reg					write_back_en;			// S3
	wire	[2:0]		write_back_dest;		// dest
	reg					write_back_result_mux;	// S1
	// mem stage signals
	wire				mem_write_en;		
	wire	[15:0]		mem_write_data;
	// ex stage signals
	reg		[2:0]		ex_alu_cmd;				//S2
	wire	[15:0]		ex_alu_src1;
	wire	[15:0]		ex_alu_src2;
	// instruction decode stage signals
	reg					alu_src2_mux;			// S4
	wire				decoding_op_is_branch;	//S5
	wire				decoding_op_is_store;	//S6
	wire	[3:0]		ir_op_code_with_bubble;
	wire	[2:0]		ir_dest_with_bubble;
	//reg					branch_condition_satisfied;
	
	
	/********************** Instruction Register *********************/
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			instruction_reg <= 0;
		end
		else begin
			if(instruction_decode_en) begin
				instruction_reg <= instruction;
			end
		end
	end
	assign ir_op_code = instruction_reg[15:12];
	assign ir_dest = instruction_reg[11: 9];
	assign ir_src1 = instruction_reg[ 8: 6];
	assign ir_src2 = (decoding_op_is_store)? instruction_reg[11: 9] : instruction_reg[ 5: 3];
	assign ir_imm  = instruction_reg[ 5: 0];
	
	/********************** pipeline bubble insertion *********************/
	// if instrcution decode is frozen, insert bubble operations into the pipeline
	assign ir_op_code_with_bubble = ( instruction_decode_en )?  ir_op_code : 0;
	// if instrcution decode is frozen, force destination reg number to 0, 
	// this operation is to prevent pipeline stall.
	assign ir_dest_with_bubble = ( instruction_decode_en )?  ir_dest : 0;
	
	/********************** Data path control logic *********************/
	always @ (*) begin
		if(rst) begin
			write_back_en			= 0;	// S3
			write_back_result_mux	= 0;	// S1
			ex_alu_cmd				= 0;	// S2
			alu_src2_mux			= 0;	// S4
		end
		else begin
			case( ir_op_code_with_bubble )
				`OP_NOP	:
					begin
						write_back_en			= 0;		// S3
						write_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= `ALU_NC;	// S2
						alu_src2_mux			= 1'bx;		// S4
					end
				`OP_ADD	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_ADD;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_SUB	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_SUB;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_AND	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_AND;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_OR	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_OR;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_XOR	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_XOR;	// S2
						alu_src2_mux			= 1'bx;		// S4
					end
				`OP_SL	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_SL;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_SR	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_SR;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_SRU	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_SRU;	// S2
						alu_src2_mux			= 0;		// S4
					end
				`OP_ADDI:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 0;		// S1
						ex_alu_cmd				= `ALU_ADD;	// S2
						alu_src2_mux			= 1;		// S4
					end
				`OP_LD	:
					begin
						write_back_en			= 1;		// S3
						write_back_result_mux	= 1;		// S1
						ex_alu_cmd				= `ALU_ADD;	// S2
						alu_src2_mux			= 1;		// S4
					end
				`OP_ST	:
					begin
						write_back_en			= 0;		// S3
						write_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= `ALU_ADD;	// S2
						alu_src2_mux			= 1;		// S4
					end
				`OP_BZ	:
					begin
						write_back_en			= 0;		// S3
						write_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= `ALU_NC;	// S2
						alu_src2_mux			= 1;		// S4
					end
				default	:
					begin
						write_back_en			= 0;		// S3
						write_back_result_mux	= 1'bx;		// S1
						ex_alu_cmd				= `ALU_NC;	// S2
						alu_src2_mux			= 1'bx;		// S4


					end
			endcase
		end
	end
	
	assign decoding_op_is_branch = ( ir_op_code == `OP_BZ )? 1 : 0;	// S5
	assign decoding_op_is_store	= ( ir_op_code == `OP_ST )? 1 : 0;	// S6
	
	/********************** singals to EX_stage *********************/
	assign mem_write_data = reg_read_data_2;
	assign mem_write_en = decoding_op_is_store;
	assign write_back_dest = ir_dest_with_bubble;
	assign ex_alu_src1 = reg_read_data_1;
	assign ex_alu_src2 = (alu_src2_mux)? {{10{ir_imm[5]}},ir_imm} : reg_read_data_2;
	
	//	pipeline_reg_out:
	//	[56:22],35bits:	ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0],
	//	[21:5],17bits:	mem_write_en, mem_write_data[15:0],
	//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux,
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			pipeline_reg_out[56:0] <= 0;
		end
		else begin
			pipeline_reg_out[56:0] <= {
				ex_alu_cmd[2:0],		// pipeline_reg_out[56:54]	//S2
				ex_alu_src1[15:0],		// pipeline_reg_out[53:38]
				ex_alu_src2[15:0],		// pipeline_reg_out[37:22]	
				mem_write_en, 			// pipeline_reg_out[21]		//
				mem_write_data[15:0],	// pipeline_reg_out[20:5]	//
				write_back_en, 			// pipeline_reg_out[4]		//S3
				write_back_dest[2:0], 	// pipeline_reg_out[3:1]	//dest
				write_back_result_mux 	// pipeline_reg_out[0]		//S1
				};
		end
	end
	
			 
	/********************** interface with register file *********************/
	assign reg_read_addr_1 = ir_src1;
	assign reg_read_addr_2 = ir_src2;
	
	/********************** branch signals generate *********************/
	always @ (*) begin
		if(decoding_op_is_branch) begin
			case( ir_dest_with_bubble )
				`BRANCH_Z	:
					begin
						if(reg_read_data_1 == 0)
							branch_taken = 1;
						else
							branch_taken = 0;
					end
					
				default:
					begin
						branch_taken = 0;

		
					end
			endcase
		end
		else begin
			branch_taken = 0;
		end
	end
	assign branch_offset_imm = ir_imm;
	//assign branch_taken = decoding_op_is_branch & branch_condition_satisfied ;
	
	/********************** to hazard detection unit *********************/
	assign decoding_op_src1 = ir_src1;
	assign decoding_op_src2 = (
					ir_op_code == `OP_NOP 	||
					ir_op_code == `OP_ADDI 	||
					ir_op_code == `OP_LD 	||
					ir_op_code == `OP_BZ 	
					)?
					3'b000 : ir_src2;
	
endmodule 


module IF_stage
(
	input							clk,
	input							rst,				//active high
	input							instruction_fetch_en,
	
	input	[5:0]					branch_offset_imm,
	input							branch_taken,
	
	output	reg	[`PC_WIDTH-1:0]		pc,
	output	[15:0]					instruction
);
    
	// pc control
	always @ (posedge clk or posedge rst) begin
	    if (rst) begin
	        pc <= `PC_WIDTH'b0;
	    end 
		else begin
			if(instruction_fetch_en) begin
				if(branch_taken)
					//don't forget sign bit expansion
					pc <= pc + {{(`PC_WIDTH-6){branch_offset_imm[5]}}, branch_offset_imm[5:0]};	
				else
					pc <= pc + `PC_WIDTH'd1;
			end
		end
	end
	
	// instruction memory, or rom
	instruction_mem imem(
		.clk				(clk),
		.pc					(pc),
		
		.instruction		(instruction)
	);
	
	
endmodule 


module instruction_mem		// a rtl simulation rom, rom initial code can be found in the testbench
(
	input					clk,		// asynchronized!!
	input	[`PC_WIDTH-1:0]	pc,
	
	output	[15:0]			instruction
);
	
	reg	[15:0] rom [2**`INSTR_MEM_ADDR_WIDTH-1 : 0];
	
	wire [`INSTR_MEM_ADDR_WIDTH-1 : 0] rom_addr = pc[`INSTR_MEM_ADDR_WIDTH-1 : 0];
	
	// always @ (posedge clk) begin
	// always @ (*) begin
	    // instruction = rom[rom_addr];
	// end
	
	assign instruction = rom[rom_addr];
	
	
endmodule 


module instruction_mem		// a synthesisable rom implementation
(
	input					clk,		// asynchronized!!
	input	[`PC_WIDTH-1:0]	pc,
	
	output reg	[15:0]		instruction
);
	
	wire [`INSTR_MEM_ADDR_WIDTH-1 : 0] rom_addr = pc[`INSTR_MEM_ADDR_WIDTH-1 : 0];
	
	// ASM code in rom:
	// L1:	ADDI		R1,R0,8
	// 		ADDI		R2,R1,8
	// 		ADDI		R3,R2,8
	// 		ADD			R4,R2,R3
	// 		ST			R4,R1,2
	// 		LD			R5,R1,2
	// 		SUB			R6,R4,R5
	// 		BZ			R6,L1
	// 		ADDI		R7,R7,1
	always @(*)
		case (rom_addr)
			4'b0000: instruction = 16'b1001001000001000;
			4'b0001: instruction = 16'b1001010001001000;
			4'b0010: instruction = 16'b1001011010001000;
			4'b0011: instruction = 16'b0001100010011000;
			4'b0100: instruction = 16'b1011100001000010;
			4'b0101: instruction = 16'b1010101001000010;
			4'b0110: instruction = 16'b0010110100101000;
			4'b0111: instruction = 16'b1100000110111000;
			4'b1000: instruction = 16'b1001111111000001;
			4'b1001: instruction = 16'b0000000000000000;
			4'b1010: instruction = 16'b0000000000000000;
			4'b1011: instruction = 16'b0000000000000000;
			4'b1100: instruction = 16'b0000000000000000;
			4'b1101: instruction = 16'b0000000000000000;
			4'b1110: instruction = 16'b0000000000000000;
			4'b1111: instruction = 16'b0000000000000000;
			default: instruction = 16'b0000000000000000;
	 endcase
	
endmodule 



module MEM_stage
(
	input					clk,
	input					rst,
	
	// from EX_stage
	input		[37:0]		pipeline_reg_in,	//	[37:22],16bits:	ex_alu_result[15:0];
												//	[21:5],17bits:	mem_write_en, mem_write_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to WB_stage
	output	reg	[36:0]		pipeline_reg_out,	//	[36:21],16bits:	ex_alu_result[15:0]
												//	[20:5],16bits:	mem_read_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	output		[2:0]		mem_op_dest
);
	
	wire	[15:0]		ex_alu_result = pipeline_reg_in[37:22];
	wire				mem_write_en = pipeline_reg_in[21];
	wire	[15:0]		mem_write_data = pipeline_reg_in[20:5];
	
	wire	[15:0]		mem_read_data ;		
	
	/********************** Data memory *********************/
	// a ram
	data_mem dmem (
		.clk(clk), 
		.mem_access_addr	( ex_alu_result ), 
		.mem_write_data		( mem_write_data ), 
		.mem_write_en		( mem_write_en ), 
		.mem_read_data		( mem_read_data )
	);
	
	/********************** singals to WB_stage *********************/
	always @ (posedge clk) begin
		if(rst) begin
			pipeline_reg_out[36:0] <= 0;
		end
		else begin
			pipeline_reg_out[36:21] <= ex_alu_result;
			pipeline_reg_out[20:5]	<= mem_read_data ;
			pipeline_reg_out[4:0] 	<= pipeline_reg_in[4:0];
		end
	end
	
	
	/********************** to hazard detection unit *********************/
	assign mem_op_dest = pipeline_reg_in[3:1];

endmodule 


module register_file
(
	input				clk,
	input				rst,
	
	// write port
	input				reg_write_en,
	input		[2:0]	reg_write_dest,
	input		[15:0]	reg_write_data,
	
	//read port 1
	input		[2:0]	reg_read_addr_1,
	output		[15:0]	reg_read_data_1,
	//read port 2
	input		[2:0]	reg_read_addr_2,
	output		[15:0]	reg_read_data_2
);
	reg	[15:0]	reg_array [7:0];
	
	// write port
	//reg [2:0] i;
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			// for(i=0; i<8; i=i+1)
				// reg_array[i] <= 15'b0;
			reg_array[0] <= 15'b0;
			reg_array[1] <= 15'b0;
			reg_array[2] <= 15'b0;
			reg_array[3] <= 15'b0;
			reg_array[4] <= 15'b0;
			reg_array[5] <= 15'b0;
			reg_array[6] <= 15'b0;
			reg_array[7] <= 15'b0;	
		end
		else begin
			if(reg_write_en) begin
				reg_array[reg_write_dest] <= reg_write_data;
			end
		end
		
	end
	
	//read port 1
	// always @ (*) begin
		// if( reg_read_addr_1 == 0) begin
			// reg_read_data_1 = 15'b0;
		// end
		// else begin
			// reg_read_data_1 = reg_array[reg_read_addr_1];
		// end
	// end
	assign reg_read_data_1 = ( reg_read_addr_1 == 0)? 15'b0 : reg_array[reg_read_addr_1];
	
	//read port 2
	// always @ (*) begin
		// if( reg_read_addr_2 == 0) begin
			// reg_read_data_2 = 15'b0;
		// end
		// else begin
			// reg_read_data_2 = reg_array[reg_read_addr_2];
		// end
	// end
	assign reg_read_data_2 = ( reg_read_addr_2 == 0)? 15'b0 : reg_array[reg_read_addr_2];

endmodule 

module WB_stage
(
	//input					clk,
	
	// from EX stage
	input		[36:0]		pipeline_reg_in,	//	[36:21],16bits:	ex_alu_result[15:0]
												//	[20:5],16bits:	mem_read_data[15:0]
												//	[4:0],5bits:	write_back_en, write_back_dest[2:0], write_back_result_mux, 
	
	// to register file
	output					reg_write_en,
	output		[2:0]		reg_write_dest,
	output		[15:0]		reg_write_data,
	
	output		[2:0]		wb_op_dest
);
	
	wire [15:0]	ex_alu_result = pipeline_reg_in[36:21];
	wire [15:0]	mem_read_data = pipeline_reg_in[20:5];
	wire		write_back_en = pipeline_reg_in[4];
	wire [2:0]	write_back_dest = pipeline_reg_in[3:1];
	wire		write_back_result_mux = pipeline_reg_in[0];
	
	/********************** to register file *********************/
	assign reg_write_en = write_back_en;
	assign reg_write_dest = write_back_dest;
	assign reg_write_data = (write_back_result_mux)? mem_read_data : ex_alu_result;
	
	/********************** to hazard detection unit *********************/
	assign wb_op_dest = pipeline_reg_in[3:1];
	
	
endmodule 