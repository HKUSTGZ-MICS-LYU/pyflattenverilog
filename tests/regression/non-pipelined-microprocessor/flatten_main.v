module main( clk );
    input clk;

    wire[0:`DATA] aluOut;
    wire[0:`DATA] memOut1;
    wire[0:`DATA] memOut2;
    wire[0:`DATA_ADDR] readLoc1;
    wire[0:`DATA_ADDR] readLoc2;
    wire[0:`INSTR] instruction;
    wire[0:`OPCODE] opcode;
    wire [0:`DATA_ADDR] writeLoc;
    wire [0:`PROG_ADDR] progCntr;



    wire  M_clk;
    wire [0:]opcode M_;
    wire [0:]readLoc1 M_;
    wire [0:]readLoc2 M_;
    wire [0:]writeLoc M_;
    wire [0:]data M_;
    wire [0:]memOut1 M_;
    wire [0:]memOut2 M_;
    assign M_clk = clk;
    assign M_ = opcode;
    assign M_ = readLoc1;
    assign M_ = readLoc2;
    assign M_ = writeLoc;
    assign M_ = aluOut;
    assign memOut1 = M_;
    assign memOut2 = M_;

    input clk;
    input [0:] M_opcode ;
    input [0:] M_readLoc1 ;
    input [0:] M_readLoc2 ;
    input [0:] M_writeLoc ;
    input [0:] M_data ;
    output [0:] M_memOut1 ;
    output [0:] M_memOut2 ;

    wire[0:]  memOut1;

    wire[0:]  memOut2;
    reg[0:] M_m0 ;
    <missing ';
    '>
     reg[0:] M_m1 ;
    <missing ';
    '>
     reg[0:] M_m2 ;
    <missing ';
    '>
     reg[0:] M_m3 ;
    <missing ';
    '>
     reg[0:] M_m4 ;
    <missing ';
    '>
     reg[0:] M_m5 ;
    <missing ';
    '>
     reg[0:] M_m6 ;
    <missing ';
    '>
     reg[0:] M_m7 ;
    <missing ';
    '> initial
     begin
         M_m0  =1;
     end
     initial
     begin
         M_m1  =0;
     end
     initial
     begin
         M_m2  =0;
     end
     initial
     begin
         M_m3  =0;
     end
     initial
     begin
         M_m4  =0;
     end
     initial
     begin
         M_m5  =0;
     end
     initial
     begin
         M_m6  =0;
     end
     initial
     begin
         M_m7  =0;
     end
     assign  M_memOut1 =( M_readLoc1 ==0)? M_m0 :( M_readLoc1 ==1)? M_m1 :( M_readLoc1 ==2)? M_m2 :( M_readLoc1 ==3)? M_m3 :( M_readLoc1 ==4)? M_m5 :( M_readLoc1 ==5)? M_m5 :( M_readLoc1 ==6)? M_m6 : M_m7 ;
    assign  M_memOut2 =( M_readLoc2 ==0)? M_m0 :( M_readLoc2 ==1)? M_m1 :( M_readLoc2 ==2)? M_m2 :( M_readLoc2 ==3)? M_m3 :( M_readLoc2 ==4)? M_m5 :( M_readLoc2 ==5)? M_m5 :( M_readLoc2 ==6)? M_m6 : M_m7 ;
    always @( posedge  M_clk )
    begin
        if ( M_opcode !=)
        begin
            if ( M_writeLoc ==0)
            begin
                M_m0  = M_data ;
            end
            if ( M_writeLoc ==1)
            begin
                M_m1  = M_data ;
            end
            if ( M_writeLoc ==2)
            begin
                M_m2  = M_data ;
            end
            if ( M_writeLoc ==3)
            begin
                M_m3  = M_data ;
            end
            if ( M_writeLoc ==4)
            begin
                M_m4  = M_data ;
            end
            if ( M_writeLoc ==5)
            begin
                M_m5  = M_data ;
            end
            if ( M_writeLoc ==6)
            begin
                M_m6  = M_data ;
            end
            if ( M_writeLoc ==7)
            begin
                M_m7  = M_data ;
            end
        end
    end



    wire  P_clk;
    wire [0:]progCntr P_;
    wire [0:]instruction P_;
    assign P_clk = clk;
    assign P_ = progCntr;
    assign instruction = P_;

    input clk;
    input [0:] P_progCntr ;
    output [0:] P_instruction ;

    wire[0:]  instr0;

    wire[0:]  instr1;

    wire[0:]  instr2;

    wire[0:]  instr3;

    wire[0:]  instr4;

    wire[0:]  instr5;

    wire[0:]  instr6;

    wire[0:]  instr7;
    assign  P_instr0 =576;
    assign  P_instr1 =1152;
    assign  P_instr2 =1728;
    assign  P_instr3 =2304;
    assign  P_instr4 =505;
    assign  P_instr5 =0;
    assign  P_instr6 =0;
    assign  P_instr7 =0;
    assign  P_instruction =( P_progCntr ==0)? P_instr0 :( P_progCntr ==1)? P_instr1 :( P_progCntr ==2)? P_instr2 :( P_progCntr ==3)? P_instr3 :( P_progCntr ==4)? P_instr4 :( P_progCntr ==5)? P_instr5 :( P_progCntr ==6)? P_instr6 : P_instr7 ;



    wire  Opcode_clk;
    wire [0:]instruction Opcode_;
    wire [0:]opcode Opcode_;
    assign Opcode_clk = clk;
    assign Opcode_ = instruction;
    assign opcode = Opcode_;

    input clk;
    input [0:] Opcode_instruction ;
    output [0:] Opcode_opcode ;
    assign  Opcode_opcode = Opcode_instruction [0:2];


    wire  Loc1_clk;
    wire [0:]instruction Loc1_;
    wire [0:]readLoc1 Loc1_;
    assign Loc1_clk = clk;
    assign Loc1_ = instruction;
    assign readLoc1 = Loc1_;

    input clk;
    input [0:] Loc1_instruction ;
    output [0:] Loc1_readLoc1 ;
    assign  Loc1_readLoc1 = Loc1_instruction [3:5];


    wire  Loc2_clk;
    wire [0:]instruction Loc2_;
    wire [0:]readLoc2 Loc2_;
    assign Loc2_clk = clk;
    assign Loc2_ = instruction;
    assign readLoc2 = Loc2_;

    input clk;
    input [0:] Loc2_instruction ;
    output [0:] Loc2_readLoc2 ;
    assign  Loc2_readLoc2 = Loc2_instruction [6:8];


    wire  Loc3_clk;
    wire [0:]instruction Loc3_;
    wire [0:]writeLoc Loc3_;
    assign Loc3_clk = clk;
    assign Loc3_ = instruction;
    assign writeLoc = Loc3_;

    input clk;
    input [0:] Loc3_instruction ;
    output [0:] Loc3_writeLoc ;
    assign  Loc3_writeLoc = Loc3_instruction [9:11];



    wire  ALU_clk;
    wire [0:]opcode ALU_;
    wire [0:]operand1 ALU_;
    wire [0:]operand2 ALU_;
    wire [0:]aluOut ALU_;
    assign ALU_clk = clk;
    assign ALU_ = opcode;
    assign ALU_ = memOut1;
    assign ALU_ = memOut2;
    assign aluOut = ALU_;

    input clk;
    input [0:] ALU_opcode ;
    input [0:] ALU_operand1 ;
    input [0:] ALU_operand2 ;
    output [0:] ALU_aluOut ;
    assign  ALU_aluOut =( ALU_opcode ==)?( ALU_operand1 + ALU_operand2 ):( ALU_opcode ==)?( ALU_operand1 ^ ALU_operand2 ):( ALU_opcode ==)?( ALU_operand1 & ALU_operand2 ):0;



    wire  PC_clk;
    wire [0:]opcode PC_;
    wire [0:]operand1 PC_;
    wire [0:]operand2 PC_;
    wire [0:]progCntr PC_;
    assign PC_clk = clk;
    assign PC_ = opcode;
    assign PC_ = memOut1;
    assign PC_ = memOut2;
    assign progCntr = PC_;

    input clk;
    input [0:] PC_opcode ;
    input [0:] PC_operand1 ;
    input [0:] PC_operand2 ;
    output [0:] PC_progCntr ;
    reg[0:] PC_progCntr ;
    <missing ';
    '> initial
     begin
         PC_progCntr  =0;
     end
     always @( posedge  PC_clk )
     begin
         if (( PC_opcode ==)&&( PC_operand1 ==0))
         begin
             PC_progCntr  = PC_operand2 [0:2];
         end
         else
         begin
             PC_progCntr  = PC_progCntr +1;
         end
     end



     //assert property1:	(!((opcode == `JMP) && (memOut1 == 0)) && (progCntr == memOut2[0:2]));

 endmodule
