module b19(
   input         clock,
   input         reset,
   input         bs,
   input         na,
   input         hold,
   input [10:0]  in1,
   input [10:0]  in2,
   input [19:0]  in3,
   output reg [29:0] ris
   );
   
   reg           sel1;
   reg           sel2;
   wire [19:0]   do1;
   wire [19:0]   do2;
   integer       di1;
   integer       di2;
   wire [2:0]    ax1;
   wire [2:0]    ax2;
   
   
   
wire  P1_clock;
wire  P1_reset;
wire  P1_hold;
wire  P1_na;
wire  P1_bs;
wire  P1_sel;
reg [19:0] P1_dout;
wire [31:0] P1_din;
reg [2:0] P1_aux;
assign P1_clock = clock;
assign P1_reset = reset;
assign P1_hold = hold;
assign P1_na = na;
assign P1_bs = bs;
assign P1_sel = sel1;
assign do1 = P1_dout;
assign P1_din = di1;
assign ax1 = P1_aux;
 
   integer P1_di1 ; 
   integer P1_di2 ; 
   wire[31:0] P1_do1 ; 
   wire[31:0] P1_do2 ; 
   integer P1_td1 ; 
   integer P1_td2 ; 
   integer P1_di3 ; 
   integer P1_di4 ; 
   wire[31:0] P1_do3 ; 
   wire[31:0] P1_do4 ; 
   reg[29:0] P1_tad1 ; 
   reg[29:0] P1_tad2 ; 
   wire[29:0] P1_ad11 ; 
   wire[29:0] P1_ad12 ; 
   wire[29:0] P1_ad21 ; 
   wire[29:0] P1_ad22 ; 
   wire[19:0] P1_ad31 ; 
   wire[19:0] P1_ad41 ; 
   reg[19:0] P1_tad3 ; 
   reg[19:0] P1_tad4 ; 
   wire P1_wr1 ; 
   wire P1_wr2 ; 
   wire P1_wr3 ; 
   wire P1_wr4 ; 
   wire P1_dc1 ; 
   wire P1_dc2 ; 
   wire P1_mio1 ; 
   wire P1_mio2 ; 
   wire P1_as11 ; 
   wire P1_as12 ; 
   wire P1_as21 ; 
   wire P1_as22 ; 
   reg P1_r11 ; 
   reg P1_r12 ; 
   reg P1_r21 ; 
   reg P1_r22 ; 
   wire P1_rd3 ; 
   wire P1_rd4 ; 
  
wire  P1_P1_clock;
wire  P1_P1_reset;
wire [31:0] P1_P1_datai;
wire  P1_P1_integerdatao;
wire  P1_P1_hold;
wire  P1_P1_na;
wire  P1_P1_bs16;
reg [29:0] P1_P1_address1;
reg [29:0] P1_P1_address2;
wire  P1_P1_regwr;
wire  P1_P1_regdc;
wire  P1_P1_regmio;
wire  P1_P1_regast1;
wire  P1_P1_regast2;
wire  P1_P1_ready1;
wire  P1_P1_ready2;
assign P1_P1_clock = P1_clock;
assign P1_P1_reset = P1_reset;
assign P1_P1_datai = P1_di1;
assign P1_do1 = P1_P1_integerdatao;
assign P1_P1_hold = P1_hold;
assign P1_P1_na = P1_na;
assign P1_P1_bs16 = P1_bs;
assign P1_ad11 = P1_P1_address1;
assign P1_ad12 = P1_P1_address2;
assign P1_wr1 = P1_P1_regwr;
assign P1_dc1 = P1_P1_regdc;
assign P1_mio1 = P1_P1_regmio;
assign P1_as11 = P1_P1_regast1;
assign P1_as12 = P1_P1_regast2;
assign P1_P1_ready1 = P1_r11;
assign P1_P1_ready2 = P1_r12;
 
   integer P1_P1_buf1 ; 
   integer P1_P1_buf2 ; 
   wire[3:0] P1_P1_be1 ; 
   wire[3:0] P1_P1_be2 ; 
   wire[3:0] P1_P1_be3 ; 
   wire[29:0] P1_P1_addr1 ; 
   wire[29:0] P1_P1_addr2 ; 
   wire[29:0] P1_P1_addr3 ; 
   wire P1_P1_wr1 ; 
   wire P1_P1_wr2 ; 
   wire P1_P1_wr3 ; 
   wire P1_P1_dc1 ; 
   wire P1_P1_dc2 ; 
   wire P1_P1_dc3 ; 
   wire P1_P1_mio1 ; 
   wire P1_P1_mio2 ; 
   wire P1_P1_mio3 ; 
   wire P1_P1_ads1 ; 
   wire P1_P1_ads2 ; 
   wire P1_P1_ads3 ; 
   integer P1_P1_di1 ; 
   integer P1_P1_di2 ; 
   integer P1_P1_di3 ; 
   wire[31:0] P1_P1_do1 ; 
   wire[31:0] P1_P1_do2 ; 
   wire[31:0] P1_P1_do3 ; 
   reg P1_P1_rdy1 ; 
   reg P1_P1_rdy2 ; 
   reg P1_P1_rdy3 ; 
   reg P1_P1_ready11 ; 
   reg P1_P1_ready12 ; 
   reg P1_P1_ready21 ; 
   reg P1_P1_ready22 ; 
  always @(posedge P1_P1_clock orposedge P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf1  <=0;
             P1_P1_ready11  <=1'b0;
             P1_P1_ready12  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr1 >2**29& P1_P1_ads1 ==1'b0& P1_P1_mio1 ==1'b1& P1_P1_dc1 ==1'b0& P1_P1_wr1 ==1'b1& P1_P1_be1 ==4'b0000)
               begin 
                  P1_P1_buf1  <= P1_P1_do1 ;
                  P1_P1_ready11  <=1'b0;
                  P1_P1_ready12  <=1'b1;
               end 
             else 
               if ( P1_P1_addr2 >2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
                  begin 
                     P1_P1_buf1  <= P1_P1_do2 ;
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b1;
                  end 
          end
  
  always @(posedge P1_P1_clock orposedge P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf2  <=0;
             P1_P1_ready21  <=1'b0;
             P1_P1_ready22  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr2 <2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
               begin 
                  P1_P1_buf2  <= P1_P1_do2 ;
                  P1_P1_ready21  <=1'b0;
                  P1_P1_ready22  <=1'b1;
               end 
             else 
               if ( P1_P1_ads3 ==1'b0& P1_P1_mio3 ==1'b1& P1_P1_dc3 ==1'b0& P1_P1_wr3 ==1'b0& P1_P1_be3 ==4'b0000)
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b1;
                  end 
          end
  
  always @( P1_P1_addr1 or P1_P1_buf1 or P1_P1_datai )
       if ( P1_P1_addr1 >2**29)
           P1_P1_di1  <= P1_P1_buf1 ;
        else 
           P1_P1_di1  <= P1_P1_datai ;
 
  always @( P1_P1_addr2 or P1_P1_buf1 or P1_P1_buf2 )
       if ( P1_P1_addr2 >2**29)
           P1_P1_di2  <= P1_P1_buf1 ;
        else 
           P1_P1_di2  <= P1_P1_buf2 ;
 
  always @( P1_P1_addr2 or P1_P1_addr3 or P1_P1_do1 or P1_P1_do2 or P1_P1_do3 )
       if (( P1_P1_do1 <2**30)&( P1_P1_do2 <2**30)&( P1_P1_do3 <2**30))
           P1_P1_address2  <= P1_P1_addr3 ;
        else 
           P1_P1_address2  <= P1_P1_addr2 ;
 
  always @( P1_P1_buf2 or P1_P1_do3 or P1_P1_addr1 or P1_P1_wr3 or P1_P1_dc3 or P1_P1_mio3 or P1_P1_ads1 or P1_P1_ads3 or P1_P1_ready1 or P1_P1_ready2 or P1_P1_ready11 or P1_P1_ready12 or P1_P1_ready21 or P1_P1_ready22 )
       begin 
          P1_P1_di3  <= P1_P1_buf2 ;
          P1_P1_datao  <= P1_P1_do3 ;
          P1_P1_address1  <= P1_P1_addr1 ;
          P1_P1_wr  <= P1_P1_wr3 ;
          P1_P1_dc  <= P1_P1_dc3 ;
          P1_P1_mio  <= P1_P1_mio3 ;
          P1_P1_ast1  <= P1_P1_ads1 ;
          P1_P1_ast2  <= P1_P1_ads3 ;
          P1_P1_rdy1  <= P1_P1_ready11 & P1_P1_ready1 ;
          P1_P1_rdy2  <= P1_P1_ready12 & P1_P1_ready21 ;
          P1_P1_rdy3  <= P1_P1_ready22 & P1_P1_ready2 ;
       end
  
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 

 
  
wire  P1_P1_clock;
wire  P1_P1_reset;
wire [31:0] P1_P1_datai;
wire  P1_P1_integerdatao;
wire  P1_P1_hold;
wire  P1_P1_na;
wire  P1_P1_bs16;
reg [29:0] P1_P1_address1;
reg [29:0] P1_P1_address2;
wire  P1_P1_regwr;
wire  P1_P1_regdc;
wire  P1_P1_regmio;
wire  P1_P1_regast1;
wire  P1_P1_regast2;
wire  P1_P1_ready1;
wire  P1_P1_ready2;
assign P1_P1_clock = P1_clock;
assign P1_P1_reset = P1_reset;
assign P1_P1_datai = P1_di1;
assign P1_do1 = P1_P1_integerdatao;
assign P1_P1_hold = P1_hold;
assign P1_P1_na = P1_na;
assign P1_P1_bs16 = P1_bs;
assign P1_ad11 = P1_P1_address1;
assign P1_ad12 = P1_P1_address2;
assign P1_wr1 = P1_P1_regwr;
assign P1_dc1 = P1_P1_regdc;
assign P1_mio1 = P1_P1_regmio;
assign P1_as11 = P1_P1_regast1;
assign P1_as12 = P1_P1_regast2;
assign P1_P1_ready1 = P1_r11;
assign P1_P1_ready2 = P1_r12;
 
   integer P1_P1_buf1 ; 
   integer P1_P1_buf2 ; 
   wire[3:0] P1_P1_be1 ; 
   wire[3:0] P1_P1_be2 ; 
   wire[3:0] P1_P1_be3 ; 
   wire[29:0] P1_P1_addr1 ; 
   wire[29:0] P1_P1_addr2 ; 
   wire[29:0] P1_P1_addr3 ; 
   wire P1_P1_wr1 ; 
   wire P1_P1_wr2 ; 
   wire P1_P1_wr3 ; 
   wire P1_P1_dc1 ; 
   wire P1_P1_dc2 ; 
   wire P1_P1_dc3 ; 
   wire P1_P1_mio1 ; 
   wire P1_P1_mio2 ; 
   wire P1_P1_mio3 ; 
   wire P1_P1_ads1 ; 
   wire P1_P1_ads2 ; 
   wire P1_P1_ads3 ; 
   integer P1_P1_di1 ; 
   integer P1_P1_di2 ; 
   integer P1_P1_di3 ; 
   wire[31:0] P1_P1_do1 ; 
   wire[31:0] P1_P1_do2 ; 
   wire[31:0] P1_P1_do3 ; 
   reg P1_P1_rdy1 ; 
   reg P1_P1_rdy2 ; 
   reg P1_P1_rdy3 ; 
   reg P1_P1_ready11 ; 
   reg P1_P1_ready12 ; 
   reg P1_P1_ready21 ; 
   reg P1_P1_ready22 ; 
  always @(posedge P1_P1_clock orposedge P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf1  <=0;
             P1_P1_ready11  <=1'b0;
             P1_P1_ready12  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr1 >2**29& P1_P1_ads1 ==1'b0& P1_P1_mio1 ==1'b1& P1_P1_dc1 ==1'b0& P1_P1_wr1 ==1'b1& P1_P1_be1 ==4'b0000)
               begin 
                  P1_P1_buf1  <= P1_P1_do1 ;
                  P1_P1_ready11  <=1'b0;
                  P1_P1_ready12  <=1'b1;
               end 
             else 
               if ( P1_P1_addr2 >2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
                  begin 
                     P1_P1_buf1  <= P1_P1_do2 ;
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b1;
                  end 
          end
  
  always @(posedge P1_P1_clock orposedge P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf2  <=0;
             P1_P1_ready21  <=1'b0;
             P1_P1_ready22  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr2 <2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
               begin 
                  P1_P1_buf2  <= P1_P1_do2 ;
                  P1_P1_ready21  <=1'b0;
                  P1_P1_ready22  <=1'b1;
               end 
             else 
               if ( P1_P1_ads3 ==1'b0& P1_P1_mio3 ==1'b1& P1_P1_dc3 ==1'b0& P1_P1_wr3 ==1'b0& P1_P1_be3 ==4'b0000)
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b1;
                  end 
          end
  
  always @( P1_P1_addr1 or P1_P1_buf1 or P1_P1_datai )
       if ( P1_P1_addr1 >2**29)
           P1_P1_di1  <= P1_P1_buf1 ;
        else 
           P1_P1_di1  <= P1_P1_datai ;
 
  always @( P1_P1_addr2 or P1_P1_buf1 or P1_P1_buf2 )
       if ( P1_P1_addr2 >2**29)
           P1_P1_di2  <= P1_P1_buf1 ;
        else 
           P1_P1_di2  <= P1_P1_buf2 ;
 
  always @( P1_P1_addr2 or P1_P1_addr3 or P1_P1_do1 or P1_P1_do2 or P1_P1_do3 )
       if (( P1_P1_do1 <2**30)&( P1_P1_do2 <2**30)&( P1_P1_do3 <2**30))
           P1_P1_address2  <= P1_P1_addr3 ;
        else 
           P1_P1_address2  <= P1_P1_addr2 ;
 
  always @( P1_P1_buf2 or P1_P1_do3 or P1_P1_addr1 or P1_P1_wr3 or P1_P1_dc3 or P1_P1_mio3 or P1_P1_ads1 or P1_P1_ads3 or P1_P1_ready1 or P1_P1_ready2 or P1_P1_ready11 or P1_P1_ready12 or P1_P1_ready21 or P1_P1_ready22 )
       begin 
          P1_P1_di3  <= P1_P1_buf2 ;
          P1_P1_datao  <= P1_P1_do3 ;
          P1_P1_address1  <= P1_P1_addr1 ;
          P1_P1_wr  <= P1_P1_wr3 ;
          P1_P1_dc  <= P1_P1_dc3 ;
          P1_P1_mio  <= P1_P1_mio3 ;
          P1_P1_ast1  <= P1_P1_ads1 ;
          P1_P1_ast2  <= P1_P1_ads3 ;
          P1_P1_rdy1  <= P1_P1_ready11 & P1_P1_ready1 ;
          P1_P1_rdy2  <= P1_P1_ready12 & P1_P1_ready21 ;
          P1_P1_rdy3  <= P1_P1_ready22 & P1_P1_ready2 ;
       end
  
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 

 
  
wire  P1_P3_clock;
wire  P1_P3_reset;
reg [19:0] P1_P3_addr;
wire [31:0] P1_P3_datai;
wire  P1_P3_integerdatao;
wire  P1_P3_regrd;
wire  P1_P3_regwr;
assign P1_P3_clock = P1_clock;
assign P1_P3_reset = P1_reset;
assign P1_ad31 = P1_P3_addr;
assign P1_P3_datai = P1_di3;
assign P1_do3 = P1_P3_integerdatao;
assign P1_rd3 = P1_P3_regrd;
assign P1_wr3 = P1_P3_regwr;
 
  always @(posedge P1_P3_clock orposedge P1_P3_reset )
       begin : P1_P3_xhdl0 integer P1_P3_reg0 ;integer P1_P3_reg1 ;integer P1_P3_reg2 ;integer P1_P3_reg3 ;reg P1_P3_B ;reg[19:0] P1_P3_MAR ;integer P1_P3_MBR ;reg[1:0] P1_P3_mf ;reg[2:0] P1_P3_df ;reg[0:0] P1_P3_cf ;reg[3:0] P1_P3_ff ;reg[19:0] P1_P3_tail ;integer P1_P3_IR ;reg[0:0] P1_P3_state ;integer P1_P3_r ;integer P1_P3_m ;integer P1_P3_t ;integer P1_P3_d ;integer P1_P3_temp ;reg[1:0] P1_P3_s ;
         parameter P1_P3_FETCH =0;
         parameter P1_P3_EXEC =1;
         if ( P1_P3_reset ==1'b1)
            begin 
               P1_P3_MAR  =0;
               P1_P3_MBR  =0;
               P1_P3_IR  =0;
               P1_P3_d  =0;
               P1_P3_r  =0;
               P1_P3_m  =0;
               P1_P3_s  =0;
               P1_P3_temp  =0;
               P1_P3_mf  =0;
               P1_P3_df  =0;
               P1_P3_ff  =0;
               P1_P3_cf  =0;
               P1_P3_tail  =0;
               P1_P3_B  =1'b0;
               P1_P3_reg0  =0;
               P1_P3_reg1  =0;
               P1_P3_reg2  =0;
               P1_P3_reg3  =0;
               P1_P3_addr  <=0;
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
               P1_P3_datao  <=0;
               P1_P3_state  = P1_P3_FETCH ;
            end 
          else 
            begin 
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
              case ( P1_P3_state )
                P1_P3_FETCH  :
                  begin 
                     P1_P3_MAR  = P1_P3_reg3 %2**20;
                     P1_P3_addr  <= P1_P3_MAR ;
                     P1_P3_rd  <=1'b1;
                     P1_P3_MBR  = P1_P3_datai ;
                     P1_P3_IR  = P1_P3_MBR ;
                     P1_P3_state  = P1_P3_EXEC ;
                  end 
                P1_P3_EXEC  :
                  begin 
                    if ( P1_P3_IR <0)
                        P1_P3_IR  =- P1_P3_IR ;
                     P1_P3_mf  =( P1_P3_IR /2**27)%4;
                     P1_P3_df  =( P1_P3_IR /2**24)%2**3;
                     P1_P3_ff  =( P1_P3_IR /2**19)%2**4;
                     P1_P3_cf  =( P1_P3_IR /2**23)%2;
                     P1_P3_tail  = P1_P3_IR %2**20;
                     P1_P3_reg3  =(( P1_P3_reg3 %2**29)+8);
                     P1_P3_s  =( P1_P3_IR /2**29)%4;
                    case ( P1_P3_s )
                     0 :
                         P1_P3_r  = P1_P3_reg0 ;
                     1 :
                         P1_P3_r  = P1_P3_reg1 ;
                     2 :
                         P1_P3_r  = P1_P3_reg2 ;
                     3 :
                         P1_P3_r  = P1_P3_reg3 ;
                    endcase 
                    case ( P1_P3_cf )
                     1 :
                        begin 
                          case ( P1_P3_mf )
                           0 :
                               P1_P3_m  = P1_P3_tail ;
                           1 :
                              begin 
                                 P1_P3_m  = P1_P3_datai ;
                                 P1_P3_addr  <= P1_P3_tail ;
                                 P1_P3_rd  <=1'b1;
                              end 
                           2 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                           3 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                          endcase 
                          case ( P1_P3_ff )
                           0 :
                              if ( P1_P3_r < P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           1 :
                              if (~( P1_P3_r < P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           2 :
                              if ( P1_P3_r == P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           3 :
                              if (~( P1_P3_r == P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           4 :
                              if (~( P1_P3_r > P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           5 :
                              if ( P1_P3_r > P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           6 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ( P1_P3_r < P1_P3_m )
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           7 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (~( P1_P3_r < P1_P3_m ))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           8 :
                              if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           9 :
                              if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           10 :
                              if (( P1_P3_r == P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           11 :
                              if ((~( P1_P3_r == P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           12 :
                              if ((~( P1_P3_r > P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           13 :
                              if (( P1_P3_r > P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           14 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           15 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~( P1_P3_df ==7))
                           begin 
                             if ( P1_P3_df ==5)
                                begin 
                                  if ((~( P1_P3_B ))==1'b1)
                                      P1_P3_d  =3;
                                end 
                              else 
                                if ( P1_P3_df ==4)
                                   begin 
                                     if ( P1_P3_B ==1'b1)
                                         P1_P3_d  =3;
                                   end 
                                 else 
                                   if ( P1_P3_df ==3)
                                       P1_P3_d  =3;
                                    else 
                                      if ( P1_P3_df ==2)
                                          P1_P3_d  =2;
                                       else 
                                         if ( P1_P3_df ==1)
                                             P1_P3_d  =1;
                                          else 
                                            if ( P1_P3_df ==0)
                                                P1_P3_d  =0;
                             case ( P1_P3_ff )
                              0 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_t  =0;
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t - P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t - P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t - P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t - P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_reg2  = P1_P3_reg3 ;
                                    P1_P3_reg3  = P1_P3_m ;
                                 end 
                              2 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_t  = P1_P3_r /2;
                                    1 :
                                       begin 
                                          P1_P3_t  = P1_P3_r /2;
                                         if ( P1_P3_B ==1'b1)
                                             P1_P3_t  = P1_P3_t %2**29;
                                       end 
                                    2 :
                                        P1_P3_t  =( P1_P3_r %2**29)*2;
                                    3 :
                                       begin 
                                          P1_P3_t  =( P1_P3_r %2**29)*2;
                                         if ( P1_P3_t >2**30-1)
                                             P1_P3_B  =1'b1;
                                          else 
                                             P1_P3_B  =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if ( P1_P3_df ==7)
                              begin 
                                case ( P1_P3_mf )
                                 0 :
                                     P1_P3_m  = P1_P3_tail ;
                                 1 :
                                     P1_P3_m  = P1_P3_tail ;
                                 2 :
                                     P1_P3_m  =( P1_P3_reg1 %2**20)+( P1_P3_tail %2**20);
                                 3 :
                                     P1_P3_m  =( P1_P3_reg2 %2**20)+( P1_P3_tail %2**20);
                                endcase 
                                 P1_P3_addr  <= P1_P3_m %2*20;
                                 P1_P3_wr  <=1'b1;
                                 P1_P3_datao  <= P1_P3_r ;
                              end 
                    endcase 
                     P1_P3_state  = P1_P3_FETCH ;
                  end 
              endcase 
            end 
       end
 
 
  
wire  P1_P3_clock;
wire  P1_P3_reset;
reg [19:0] P1_P3_addr;
wire [31:0] P1_P3_datai;
wire  P1_P3_integerdatao;
wire  P1_P3_regrd;
wire  P1_P3_regwr;
assign P1_P3_clock = P1_clock;
assign P1_P3_reset = P1_reset;
assign P1_ad31 = P1_P3_addr;
assign P1_P3_datai = P1_di3;
assign P1_do3 = P1_P3_integerdatao;
assign P1_rd3 = P1_P3_regrd;
assign P1_wr3 = P1_P3_regwr;
 
  always @(posedge P1_P3_clock orposedge P1_P3_reset )
       begin : P1_P3_xhdl0 integer P1_P3_reg0 ;integer P1_P3_reg1 ;integer P1_P3_reg2 ;integer P1_P3_reg3 ;reg P1_P3_B ;reg[19:0] P1_P3_MAR ;integer P1_P3_MBR ;reg[1:0] P1_P3_mf ;reg[2:0] P1_P3_df ;reg[0:0] P1_P3_cf ;reg[3:0] P1_P3_ff ;reg[19:0] P1_P3_tail ;integer P1_P3_IR ;reg[0:0] P1_P3_state ;integer P1_P3_r ;integer P1_P3_m ;integer P1_P3_t ;integer P1_P3_d ;integer P1_P3_temp ;reg[1:0] P1_P3_s ;
         parameter P1_P3_FETCH =0;
         parameter P1_P3_EXEC =1;
         if ( P1_P3_reset ==1'b1)
            begin 
               P1_P3_MAR  =0;
               P1_P3_MBR  =0;
               P1_P3_IR  =0;
               P1_P3_d  =0;
               P1_P3_r  =0;
               P1_P3_m  =0;
               P1_P3_s  =0;
               P1_P3_temp  =0;
               P1_P3_mf  =0;
               P1_P3_df  =0;
               P1_P3_ff  =0;
               P1_P3_cf  =0;
               P1_P3_tail  =0;
               P1_P3_B  =1'b0;
               P1_P3_reg0  =0;
               P1_P3_reg1  =0;
               P1_P3_reg2  =0;
               P1_P3_reg3  =0;
               P1_P3_addr  <=0;
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
               P1_P3_datao  <=0;
               P1_P3_state  = P1_P3_FETCH ;
            end 
          else 
            begin 
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
              case ( P1_P3_state )
                P1_P3_FETCH  :
                  begin 
                     P1_P3_MAR  = P1_P3_reg3 %2**20;
                     P1_P3_addr  <= P1_P3_MAR ;
                     P1_P3_rd  <=1'b1;
                     P1_P3_MBR  = P1_P3_datai ;
                     P1_P3_IR  = P1_P3_MBR ;
                     P1_P3_state  = P1_P3_EXEC ;
                  end 
                P1_P3_EXEC  :
                  begin 
                    if ( P1_P3_IR <0)
                        P1_P3_IR  =- P1_P3_IR ;
                     P1_P3_mf  =( P1_P3_IR /2**27)%4;
                     P1_P3_df  =( P1_P3_IR /2**24)%2**3;
                     P1_P3_ff  =( P1_P3_IR /2**19)%2**4;
                     P1_P3_cf  =( P1_P3_IR /2**23)%2;
                     P1_P3_tail  = P1_P3_IR %2**20;
                     P1_P3_reg3  =(( P1_P3_reg3 %2**29)+8);
                     P1_P3_s  =( P1_P3_IR /2**29)%4;
                    case ( P1_P3_s )
                     0 :
                         P1_P3_r  = P1_P3_reg0 ;
                     1 :
                         P1_P3_r  = P1_P3_reg1 ;
                     2 :
                         P1_P3_r  = P1_P3_reg2 ;
                     3 :
                         P1_P3_r  = P1_P3_reg3 ;
                    endcase 
                    case ( P1_P3_cf )
                     1 :
                        begin 
                          case ( P1_P3_mf )
                           0 :
                               P1_P3_m  = P1_P3_tail ;
                           1 :
                              begin 
                                 P1_P3_m  = P1_P3_datai ;
                                 P1_P3_addr  <= P1_P3_tail ;
                                 P1_P3_rd  <=1'b1;
                              end 
                           2 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                           3 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                          endcase 
                          case ( P1_P3_ff )
                           0 :
                              if ( P1_P3_r < P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           1 :
                              if (~( P1_P3_r < P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           2 :
                              if ( P1_P3_r == P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           3 :
                              if (~( P1_P3_r == P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           4 :
                              if (~( P1_P3_r > P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           5 :
                              if ( P1_P3_r > P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           6 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ( P1_P3_r < P1_P3_m )
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           7 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (~( P1_P3_r < P1_P3_m ))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           8 :
                              if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           9 :
                              if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           10 :
                              if (( P1_P3_r == P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           11 :
                              if ((~( P1_P3_r == P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           12 :
                              if ((~( P1_P3_r > P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           13 :
                              if (( P1_P3_r > P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           14 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           15 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~( P1_P3_df ==7))
                           begin 
                             if ( P1_P3_df ==5)
                                begin 
                                  if ((~( P1_P3_B ))==1'b1)
                                      P1_P3_d  =3;
                                end 
                              else 
                                if ( P1_P3_df ==4)
                                   begin 
                                     if ( P1_P3_B ==1'b1)
                                         P1_P3_d  =3;
                                   end 
                                 else 
                                   if ( P1_P3_df ==3)
                                       P1_P3_d  =3;
                                    else 
                                      if ( P1_P3_df ==2)
                                          P1_P3_d  =2;
                                       else 
                                         if ( P1_P3_df ==1)
                                             P1_P3_d  =1;
                                          else 
                                            if ( P1_P3_df ==0)
                                                P1_P3_d  =0;
                             case ( P1_P3_ff )
                              0 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_t  =0;
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t - P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t - P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t - P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t - P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_reg2  = P1_P3_reg3 ;
                                    P1_P3_reg3  = P1_P3_m ;
                                 end 
                              2 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_t  = P1_P3_r /2;
                                    1 :
                                       begin 
                                          P1_P3_t  = P1_P3_r /2;
                                         if ( P1_P3_B ==1'b1)
                                             P1_P3_t  = P1_P3_t %2**29;
                                       end 
                                    2 :
                                        P1_P3_t  =( P1_P3_r %2**29)*2;
                                    3 :
                                       begin 
                                          P1_P3_t  =( P1_P3_r %2**29)*2;
                                         if ( P1_P3_t >2**30-1)
                                             P1_P3_B  =1'b1;
                                          else 
                                             P1_P3_B  =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if ( P1_P3_df ==7)
                              begin 
                                case ( P1_P3_mf )
                                 0 :
                                     P1_P3_m  = P1_P3_tail ;
                                 1 :
                                     P1_P3_m  = P1_P3_tail ;
                                 2 :
                                     P1_P3_m  =( P1_P3_reg1 %2**20)+( P1_P3_tail %2**20);
                                 3 :
                                     P1_P3_m  =( P1_P3_reg2 %2**20)+( P1_P3_tail %2**20);
                                endcase 
                                 P1_P3_addr  <= P1_P3_m %2*20;
                                 P1_P3_wr  <=1'b1;
                                 P1_P3_datao  <= P1_P3_r ;
                              end 
                    endcase 
                     P1_P3_state  = P1_P3_FETCH ;
                  end 
              endcase 
            end 
       end
 
 
  always @( P1_do1 or P1_rd3 or P1_wr1 or P1_mio1 or P1_dc1 or P1_as12 or P1_do2 or P1_rd4 or P1_wr2 or P1_mio2 or P1_dc2 or P1_as22 or P1_as21 or P1_as11 or P1_wr3 or P1_ad31 or P1_tad2 or P1_wr4 or P1_ad41 or P1_tad1 or P1_do3 or P1_do4 or P1_ad11 or P1_ad12 or P1_ad21 or P1_ad22 or P1_tad3 or P1_tad4 or P1_sel or P1_din or P1_td1 or P1_td2 )
       begin 
          P1_di3  <= P1_do1 %2**20;
          P1_r12  <=(~( P1_rd3 & P1_wr1 & P1_mio1 & P1_dc1 &(~ P1_as12 )));
          P1_di4  <= P1_do2 ;
          P1_r22  <=(~( P1_rd4 & P1_wr2 & P1_mio2 & P1_dc2 &(~ P1_as22 )));
          P1_r11  <= P1_as21 ;
          P1_r21  <= P1_as11 ;
         if ( P1_wr3 ==1'b1)
             P1_tad3  <= P1_ad31 ;
          else 
             P1_tad3  <= P1_tad2 %2**20;
         if ( P1_wr4 ==1'b1)
             P1_tad4  <= P1_ad41 ;
          else 
             P1_tad4  <= P1_tad1 %2**20;
         if ( P1_do3 >2**28)
             P1_tad1  <= P1_ad11 ;
          else 
             P1_tad1  <= P1_ad12 ;
         if ( P1_do4 >2**29)
             P1_tad2  <= P1_ad21 ;
          else 
             P1_tad2  <= P1_ad22 ;
          P1_dout  <=( P1_tad3 * P1_tad4 )%2**19;
         if ( P1_sel ==1'b0)
            begin 
               P1_td1  <=0;
               P1_td2  <= P1_din ;
            end 
          else 
            begin 
               P1_td1  <= P1_din ;
               P1_td2  <=0;
            end 
          P1_di1  <= P1_do4 * P1_td1 ;
          P1_di2  <= P1_do3 * P1_td2 ;
          P1_aux  <=( P1_tad1 * P1_tad2 )%2**3;
       end
 

   
   
wire  P1_clock;
wire  P1_reset;
wire  P1_hold;
wire  P1_na;
wire  P1_bs;
wire  P1_sel;
reg [19:0] P1_dout;
wire [31:0] P1_din;
reg [2:0] P1_aux;
assign P1_clock = clock;
assign P1_reset = reset;
assign P1_hold = hold;
assign P1_na = na;
assign P1_bs = bs;
assign P1_sel = sel1;
assign do1 = P1_dout;
assign P1_din = di1;
assign ax1 = P1_aux;
 
   integer P1_di1 ; 
   integer P1_di2 ; 
   wire[31:0] P1_do1 ; 
   wire[31:0] P1_do2 ; 
   integer P1_td1 ; 
   integer P1_td2 ; 
   integer P1_di3 ; 
   integer P1_di4 ; 
   wire[31:0] P1_do3 ; 
   wire[31:0] P1_do4 ; 
   reg[29:0] P1_tad1 ; 
   reg[29:0] P1_tad2 ; 
   wire[29:0] P1_ad11 ; 
   wire[29:0] P1_ad12 ; 
   wire[29:0] P1_ad21 ; 
   wire[29:0] P1_ad22 ; 
   wire[19:0] P1_ad31 ; 
   wire[19:0] P1_ad41 ; 
   reg[19:0] P1_tad3 ; 
   reg[19:0] P1_tad4 ; 
   wire P1_wr1 ; 
   wire P1_wr2 ; 
   wire P1_wr3 ; 
   wire P1_wr4 ; 
   wire P1_dc1 ; 
   wire P1_dc2 ; 
   wire P1_mio1 ; 
   wire P1_mio2 ; 
   wire P1_as11 ; 
   wire P1_as12 ; 
   wire P1_as21 ; 
   wire P1_as22 ; 
   reg P1_r11 ; 
   reg P1_r12 ; 
   reg P1_r21 ; 
   reg P1_r22 ; 
   wire P1_rd3 ; 
   wire P1_rd4 ; 
  
wire  P1_P1_clock;
wire  P1_P1_reset;
wire [31:0] P1_P1_datai;
wire  P1_P1_integerdatao;
wire  P1_P1_hold;
wire  P1_P1_na;
wire  P1_P1_bs16;
reg [29:0] P1_P1_address1;
reg [29:0] P1_P1_address2;
wire  P1_P1_regwr;
wire  P1_P1_regdc;
wire  P1_P1_regmio;
wire  P1_P1_regast1;
wire  P1_P1_regast2;
wire  P1_P1_ready1;
wire  P1_P1_ready2;
assign P1_P1_clock = P1_clock;
assign P1_P1_reset = P1_reset;
assign P1_P1_datai = P1_di1;
assign P1_do1 = P1_P1_integerdatao;
assign P1_P1_hold = P1_hold;
assign P1_P1_na = P1_na;
assign P1_P1_bs16 = P1_bs;
assign P1_ad11 = P1_P1_address1;
assign P1_ad12 = P1_P1_address2;
assign P1_wr1 = P1_P1_regwr;
assign P1_dc1 = P1_P1_regdc;
assign P1_mio1 = P1_P1_regmio;
assign P1_as11 = P1_P1_regast1;
assign P1_as12 = P1_P1_regast2;
assign P1_P1_ready1 = P1_r11;
assign P1_P1_ready2 = P1_r12;
 
   integer P1_P1_buf1 ; 
   integer P1_P1_buf2 ; 
   wire[3:0] P1_P1_be1 ; 
   wire[3:0] P1_P1_be2 ; 
   wire[3:0] P1_P1_be3 ; 
   wire[29:0] P1_P1_addr1 ; 
   wire[29:0] P1_P1_addr2 ; 
   wire[29:0] P1_P1_addr3 ; 
   wire P1_P1_wr1 ; 
   wire P1_P1_wr2 ; 
   wire P1_P1_wr3 ; 
   wire P1_P1_dc1 ; 
   wire P1_P1_dc2 ; 
   wire P1_P1_dc3 ; 
   wire P1_P1_mio1 ; 
   wire P1_P1_mio2 ; 
   wire P1_P1_mio3 ; 
   wire P1_P1_ads1 ; 
   wire P1_P1_ads2 ; 
   wire P1_P1_ads3 ; 
   integer P1_P1_di1 ; 
   integer P1_P1_di2 ; 
   integer P1_P1_di3 ; 
   wire[31:0] P1_P1_do1 ; 
   wire[31:0] P1_P1_do2 ; 
   wire[31:0] P1_P1_do3 ; 
   reg P1_P1_rdy1 ; 
   reg P1_P1_rdy2 ; 
   reg P1_P1_rdy3 ; 
   reg P1_P1_ready11 ; 
   reg P1_P1_ready12 ; 
   reg P1_P1_ready21 ; 
   reg P1_P1_ready22 ; 
  always @(posedge P1_P1_clock orposedge P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf1  <=0;
             P1_P1_ready11  <=1'b0;
             P1_P1_ready12  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr1 >2**29& P1_P1_ads1 ==1'b0& P1_P1_mio1 ==1'b1& P1_P1_dc1 ==1'b0& P1_P1_wr1 ==1'b1& P1_P1_be1 ==4'b0000)
               begin 
                  P1_P1_buf1  <= P1_P1_do1 ;
                  P1_P1_ready11  <=1'b0;
                  P1_P1_ready12  <=1'b1;
               end 
             else 
               if ( P1_P1_addr2 >2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
                  begin 
                     P1_P1_buf1  <= P1_P1_do2 ;
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b1;
                  end 
          end
  
  always @(posedge P1_P1_clock orposedge P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf2  <=0;
             P1_P1_ready21  <=1'b0;
             P1_P1_ready22  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr2 <2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
               begin 
                  P1_P1_buf2  <= P1_P1_do2 ;
                  P1_P1_ready21  <=1'b0;
                  P1_P1_ready22  <=1'b1;
               end 
             else 
               if ( P1_P1_ads3 ==1'b0& P1_P1_mio3 ==1'b1& P1_P1_dc3 ==1'b0& P1_P1_wr3 ==1'b0& P1_P1_be3 ==4'b0000)
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b1;
                  end 
          end
  
  always @( P1_P1_addr1 or P1_P1_buf1 or P1_P1_datai )
       if ( P1_P1_addr1 >2**29)
           P1_P1_di1  <= P1_P1_buf1 ;
        else 
           P1_P1_di1  <= P1_P1_datai ;
 
  always @( P1_P1_addr2 or P1_P1_buf1 or P1_P1_buf2 )
       if ( P1_P1_addr2 >2**29)
           P1_P1_di2  <= P1_P1_buf1 ;
        else 
           P1_P1_di2  <= P1_P1_buf2 ;
 
  always @( P1_P1_addr2 or P1_P1_addr3 or P1_P1_do1 or P1_P1_do2 or P1_P1_do3 )
       if (( P1_P1_do1 <2**30)&( P1_P1_do2 <2**30)&( P1_P1_do3 <2**30))
           P1_P1_address2  <= P1_P1_addr3 ;
        else 
           P1_P1_address2  <= P1_P1_addr2 ;
 
  always @( P1_P1_buf2 or P1_P1_do3 or P1_P1_addr1 or P1_P1_wr3 or P1_P1_dc3 or P1_P1_mio3 or P1_P1_ads1 or P1_P1_ads3 or P1_P1_ready1 or P1_P1_ready2 or P1_P1_ready11 or P1_P1_ready12 or P1_P1_ready21 or P1_P1_ready22 )
       begin 
          P1_P1_di3  <= P1_P1_buf2 ;
          P1_P1_datao  <= P1_P1_do3 ;
          P1_P1_address1  <= P1_P1_addr1 ;
          P1_P1_wr  <= P1_P1_wr3 ;
          P1_P1_dc  <= P1_P1_dc3 ;
          P1_P1_mio  <= P1_P1_mio3 ;
          P1_P1_ast1  <= P1_P1_ads1 ;
          P1_P1_ast2  <= P1_P1_ads3 ;
          P1_P1_rdy1  <= P1_P1_ready11 & P1_P1_ready1 ;
          P1_P1_rdy2  <= P1_P1_ready12 & P1_P1_ready21 ;
          P1_P1_rdy3  <= P1_P1_ready22 & P1_P1_ready2 ;
       end
  
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 

 
  
wire  P1_P1_clock;
wire  P1_P1_reset;
wire [31:0] P1_P1_datai;
wire  P1_P1_datao;
wire  P1_P1_hold;
wire  P1_P1_na;
wire  P1_P1_bs16;
reg [29:0] P1_P1_address1;
reg [29:0] P1_P1_address2;
reg  P1_P1_wr;
reg  P1_P1_dc;
reg  P1_P1_mio;
reg  P1_P1_ast1;
reg  P1_P1_ast2;
wire  P1_P1_ready1;
wire  P1_P1_ready2;
assign P1_P1_clock = P1_clock;
assign P1_P1_reset = P1_reset;
assign P1_P1_datai = P1_di1;
assign P1_do1 = P1_P1_datao;
assign P1_P1_hold = P1_hold;
assign P1_P1_na = P1_na;
assign P1_P1_bs16 = P1_bs;
assign P1_ad11 = P1_P1_address1;
assign P1_ad12 = P1_P1_address2;
assign P1_wr1 = P1_P1_wr;
assign P1_dc1 = P1_P1_dc;
assign P1_mio1 = P1_P1_mio;
assign P1_as11 = P1_P1_ast1;
assign P1_as12 = P1_P1_ast2;
assign P1_P1_ready1 = P1_r11;
assign P1_P1_ready2 = P1_r12;
 
   integer P1_P1_buf1 ; 
   integer P1_P1_buf2 ; 
   wire[3:0] P1_P1_be1 ; 
   wire[3:0] P1_P1_be2 ; 
   wire[3:0] P1_P1_be3 ; 
   wire[29:0] P1_P1_addr1 ; 
   wire[29:0] P1_P1_addr2 ; 
   wire[29:0] P1_P1_addr3 ; 
   wire P1_P1_wr1 ; 
   wire P1_P1_wr2 ; 
   wire P1_P1_wr3 ; 
   wire P1_P1_dc1 ; 
   wire P1_P1_dc2 ; 
   wire P1_P1_dc3 ; 
   wire P1_P1_mio1 ; 
   wire P1_P1_mio2 ; 
   wire P1_P1_mio3 ; 
   wire P1_P1_ads1 ; 
   wire P1_P1_ads2 ; 
   wire P1_P1_ads3 ; 
   integer P1_P1_di1 ; 
   integer P1_P1_di2 ; 
   integer P1_P1_di3 ; 
   wire[31:0] P1_P1_do1 ; 
   wire[31:0] P1_P1_do2 ; 
   wire[31:0] P1_P1_do3 ; 
   reg P1_P1_rdy1 ; 
   reg P1_P1_rdy2 ; 
   reg P1_P1_rdy3 ; 
   reg P1_P1_ready11 ; 
   reg P1_P1_ready12 ; 
   reg P1_P1_ready21 ; 
   reg P1_P1_ready22 ; 
  always @(posedge P1_P1_clock orposedge P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf1  <=0;
             P1_P1_ready11  <=1'b0;
             P1_P1_ready12  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr1 >2**29& P1_P1_ads1 ==1'b0& P1_P1_mio1 ==1'b1& P1_P1_dc1 ==1'b0& P1_P1_wr1 ==1'b1& P1_P1_be1 ==4'b0000)
               begin 
                  P1_P1_buf1  <= P1_P1_do1 ;
                  P1_P1_ready11  <=1'b0;
                  P1_P1_ready12  <=1'b1;
               end 
             else 
               if ( P1_P1_addr2 >2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
                  begin 
                     P1_P1_buf1  <= P1_P1_do2 ;
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready11  <=1'b1;
                     P1_P1_ready12  <=1'b1;
                  end 
          end
  
  always @(posedge P1_P1_clock orposedge P1_P1_reset )
       if ( P1_P1_reset ==1'b1)
          begin 
             P1_P1_buf2  <=0;
             P1_P1_ready21  <=1'b0;
             P1_P1_ready22  <=1'b0;
          end 
        else 
          begin 
            if ( P1_P1_addr2 <2**29& P1_P1_ads2 ==1'b0& P1_P1_mio2 ==1'b1& P1_P1_dc2 ==1'b0& P1_P1_wr2 ==1'b1& P1_P1_be2 ==4'b0000)
               begin 
                  P1_P1_buf2  <= P1_P1_do2 ;
                  P1_P1_ready21  <=1'b0;
                  P1_P1_ready22  <=1'b1;
               end 
             else 
               if ( P1_P1_ads3 ==1'b0& P1_P1_mio3 ==1'b1& P1_P1_dc3 ==1'b0& P1_P1_wr3 ==1'b0& P1_P1_be3 ==4'b0000)
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b0;
                  end 
                else 
                  begin 
                     P1_P1_ready21  <=1'b1;
                     P1_P1_ready22  <=1'b1;
                  end 
          end
  
  always @( P1_P1_addr1 or P1_P1_buf1 or P1_P1_datai )
       if ( P1_P1_addr1 >2**29)
           P1_P1_di1  <= P1_P1_buf1 ;
        else 
           P1_P1_di1  <= P1_P1_datai ;
 
  always @( P1_P1_addr2 or P1_P1_buf1 or P1_P1_buf2 )
       if ( P1_P1_addr2 >2**29)
           P1_P1_di2  <= P1_P1_buf1 ;
        else 
           P1_P1_di2  <= P1_P1_buf2 ;
 
  always @( P1_P1_addr2 or P1_P1_addr3 or P1_P1_do1 or P1_P1_do2 or P1_P1_do3 )
       if (( P1_P1_do1 <2**30)&( P1_P1_do2 <2**30)&( P1_P1_do3 <2**30))
           P1_P1_address2  <= P1_P1_addr3 ;
        else 
           P1_P1_address2  <= P1_P1_addr2 ;
 
  always @( P1_P1_buf2 or P1_P1_do3 or P1_P1_addr1 or P1_P1_wr3 or P1_P1_dc3 or P1_P1_mio3 or P1_P1_ads1 or P1_P1_ads3 or P1_P1_ready1 or P1_P1_ready2 or P1_P1_ready11 or P1_P1_ready12 or P1_P1_ready21 or P1_P1_ready22 )
       begin 
          P1_P1_di3  <= P1_P1_buf2 ;
          P1_P1_datao  <= P1_P1_do3 ;
          P1_P1_address1  <= P1_P1_addr1 ;
          P1_P1_wr  <= P1_P1_wr3 ;
          P1_P1_dc  <= P1_P1_dc3 ;
          P1_P1_mio  <= P1_P1_mio3 ;
          P1_P1_ast1  <= P1_P1_ads1 ;
          P1_P1_ast2  <= P1_P1_ads3 ;
          P1_P1_rdy1  <= P1_P1_ready11 & P1_P1_ready1 ;
          P1_P1_rdy2  <= P1_P1_ready12 & P1_P1_ready21 ;
          P1_P1_rdy3  <= P1_P1_ready22 & P1_P1_ready2 ;
       end
  
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
wire  P1_P1_P1_regW_R_n;
wire  P1_P1_P1_regD_C_n;
wire  P1_P1_P1_regM_IO_n;
wire  P1_P1_P1_regADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_integerDatao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_regW_R_n;
assign P1_P1_dc1 = P1_P1_P1_regD_C_n;
assign P1_P1_mio1 = P1_P1_P1_regM_IO_n;
assign P1_P1_ads1 = P1_P1_P1_regADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_integerDatao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
reg [3:0] P1_P1_P1_BE_n;
reg [29:0] P1_P1_P1_Address;
reg  P1_P1_P1_W_R_n;
reg  P1_P1_P1_D_C_n;
reg  P1_P1_P1_M_IO_n;
reg  P1_P1_P1_ADS_n;
wire [31:0] P1_P1_P1_Datai;
wire  P1_P1_P1_Datao;
wire  P1_P1_P1_CLOCK;
wire  P1_P1_P1_NA_n;
wire  P1_P1_P1_BS16_n;
wire  P1_P1_P1_READY_n;
wire  P1_P1_P1_HOLD;
wire  P1_P1_P1_RESET;
assign P1_P1_be1 = P1_P1_P1_BE_n;
assign P1_P1_addr1 = P1_P1_P1_Address;
assign P1_P1_wr1 = P1_P1_P1_W_R_n;
assign P1_P1_dc1 = P1_P1_P1_D_C_n;
assign P1_P1_mio1 = P1_P1_P1_M_IO_n;
assign P1_P1_ads1 = P1_P1_P1_ADS_n;
assign P1_P1_P1_Datai = P1_P1_di1;
assign P1_P1_do1 = P1_P1_P1_Datao;
assign P1_P1_P1_CLOCK = P1_P1_clock;
assign P1_P1_P1_NA_n = P1_P1_na;
assign P1_P1_P1_BS16_n = P1_P1_bs16;
assign P1_P1_P1_READY_n = P1_P1_rdy1;
assign P1_P1_P1_HOLD = P1_P1_hold;
assign P1_P1_P1_RESET = P1_P1_reset;
 
   reg P1_P1_P1_StateNA ; 
   reg P1_P1_P1_StateBS16 ; 
   reg P1_P1_P1_RequestPending ; 
 parameter P1_P1_P1_Pending =1'b1; 
 parameter P1_P1_P1_NotPending =1'b0; 
   reg P1_P1_P1_NonAligned ; 
   reg P1_P1_P1_ReadRequest ; 
   reg P1_P1_P1_MemoryFetch ; 
   reg P1_P1_P1_CodeFetch ; 
   reg[3:0] P1_P1_P1_ByteEnable ; 
   integer P1_P1_P1_DataWidth ; 
 parameter P1_P1_P1_WidthByte =0; 
 parameter P1_P1_P1_WidthWord =1; 
 parameter P1_P1_P1_WidthDword =2; 
   reg[2:0] P1_P1_P1_State ; 
 parameter P1_P1_P1_StateInit =0; 
 parameter P1_P1_P1_StateTi =1; 
 parameter P1_P1_P1_StateT1 =2; 
 parameter P1_P1_P1_StateT2 =3; 
 parameter P1_P1_P1_StateT1P =4; 
 parameter P1_P1_P1_StateTh =5; 
 parameter P1_P1_P1_StateT2P =6; 
 parameter P1_P1_P1_StateT2I =7; 
   integer P1_P1_P1_EAX ; 
   integer P1_P1_P1_EBX ; 
   integer P1_P1_P1_rEIP ; 
 parameter P1_P1_P1_REP =8'hF3; 
 parameter P1_P1_P1_REPNE =8'hF2; 
 parameter P1_P1_P1_LOCK =8'hF0; 
 parameter P1_P1_P1_CSsop =8'h2E; 
 parameter P1_P1_P1_SSsop =8'h36; 
 parameter P1_P1_P1_DSsop =8'h3E; 
 parameter P1_P1_P1_ESsop =8'h26; 
 parameter P1_P1_P1_FSsop =8'h64; 
 parameter P1_P1_P1_GSsop =8'h65; 
 parameter P1_P1_P1_OPsop =8'h66; 
 parameter P1_P1_P1_ADsop =8'h67; 
 parameter P1_P1_P1_MOV_al_b =8'hB0; 
 parameter P1_P1_P1_MOV_eax_dw =8'hB8; 
 parameter P1_P1_P1_MOV_ebx_dw =8'hBB; 
 parameter P1_P1_P1_MOV_ebx_eax =8'h89; 
 parameter P1_P1_P1_MOV_eax_ebx =8'h8B; 
 parameter P1_P1_P1_IN_al =8'hE4; 
 parameter P1_P1_P1_OUT_al =8'hE6; 
 parameter P1_P1_P1_ADD_al_b =8'h04; 
 parameter P1_P1_P1_ADD_ax_w =8'h05; 
 parameter P1_P1_P1_ROL_eax_b =8'hD1; 
 parameter P1_P1_P1_ROL_al_1 =8'hD0; 
 parameter P1_P1_P1_ROL_al_n =8'hC0; 
 parameter P1_P1_P1_INC_eax =8'h40; 
 parameter P1_P1_P1_INC_ebx =8'h43; 
 parameter P1_P1_P1_JMP_rel_short =8'hEB; 
 parameter P1_P1_P1_JMP_rel_near =8'hE9; 
 parameter P1_P1_P1_JMP_intseg_immed =8'hEA; 
 parameter P1_P1_P1_HLT =8'hF4; 
 parameter P1_P1_P1_WAITx =8'h9B; 
 parameter P1_P1_P1_NOP =8'h90; 
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P0 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_BE_n  <=4'b0000;
               P1_P1_P1_Address  <=0;
               P1_P1_P1_W_R_n  <=1'b0;
               P1_P1_P1_D_C_n  <=1'b0;
               P1_P1_P1_M_IO_n  <=1'b0;
               P1_P1_P1_ADS_n  <=1'b0;
               P1_P1_P1_State  <= P1_P1_P1_StateInit ;
               P1_P1_P1_StateNA  <=1'b0;
               P1_P1_P1_StateBS16  <=1'b0;
               P1_P1_P1_DataWidth  <=0;
            end 
          else 
            case ( P1_P1_P1_State )
              P1_P1_P1_StateInit  :
                begin 
                   P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b1;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                   P1_P1_P1_StateNA  <=1'b1;
                   P1_P1_P1_StateBS16  <=1'b1;
                   P1_P1_P1_DataWidth  <=2;
                   P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                end 
              P1_P1_P1_StateTi  :
                if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
              P1_P1_P1_StateT1  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /4%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                   P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                end 
              P1_P1_P1_StateT2  :
                begin 
                  if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                   else 
                     if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b1);
                      else 
                        if (( P1_P1_P1_RequestPending == P1_P1_P1_Pending | P1_P1_P1_HOLD ==1'b1)&( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0))
                            P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                         else 
                           if ( P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b1& P1_P1_P1_NA_n ==1'b0)
                               P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                            else 
                              if ( P1_P1_P1_RequestPending == P1_P1_P1_NotPending & P1_P1_P1_HOLD ==1'b0& P1_P1_P1_READY_n ==1'b0)
                                  P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                               else 
                                 if ( P1_P1_P1_HOLD ==1'b1& P1_P1_P1_READY_n ==1'b1)
                                     P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                                  else 
                                     P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateT1P  :
                begin 
                  if ( P1_P1_P1_NA_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                   else 
                     if ( P1_P1_P1_NA_n ==1'b0&( P1_P1_P1_HOLD ==1'b1| P1_P1_P1_RequestPending == P1_P1_P1_NotPending ))
                         P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
                      else 
                        if ( P1_P1_P1_NA_n ==1'b1)
                            P1_P1_P1_State  <= P1_P1_P1_StateT2 ;
                         else 
                            P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   P1_P1_P1_StateBS16  <= P1_P1_P1_BS16_n ;
                  if ( P1_P1_P1_BS16_n ==1'b0)
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthWord ;
                   else 
                      P1_P1_P1_DataWidth  <= P1_P1_P1_WidthDword ;
                   P1_P1_P1_StateNA  <= P1_P1_P1_NA_n ;
                   P1_P1_P1_ADS_n  <=1'b1;
                end 
              P1_P1_P1_StateTh  :
                if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                    P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                 else 
                   if ( P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                       P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                    else 
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
              P1_P1_P1_StateT2P  :
                begin 
                   P1_P1_P1_Address  <= P1_P1_P1_rEIP /2%2**30;
                   P1_P1_P1_BE_n  <= P1_P1_P1_ByteEnable ;
                   P1_P1_P1_M_IO_n  <= P1_P1_P1_MemoryFetch ;
                  if ( P1_P1_P1_ReadRequest == P1_P1_P1_Pending )
                      P1_P1_P1_W_R_n  <=1'b0;
                   else 
                      P1_P1_P1_W_R_n  <=1'b1;
                  if ( P1_P1_P1_CodeFetch == P1_P1_P1_Pending )
                      P1_P1_P1_D_C_n  <=1'b0;
                   else 
                      P1_P1_P1_D_C_n  <=1'b1;
                   P1_P1_P1_ADS_n  <=1'b0;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State  <= P1_P1_P1_StateT1P ;
                   else 
                      P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                end 
              P1_P1_P1_StateT2I  :
                if ( P1_P1_P1_READY_n ==1'b1& P1_P1_P1_RequestPending == P1_P1_P1_Pending & P1_P1_P1_HOLD ==1'b0)
                    P1_P1_P1_State  <= P1_P1_P1_StateT2P ;
                 else 
                   if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b1)
                       P1_P1_P1_State  <= P1_P1_P1_StateTh ;
                    else 
                      if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_Pending )
                          P1_P1_P1_State  <= P1_P1_P1_StateT1 ;
                       else 
                         if ( P1_P1_P1_READY_n ==1'b0& P1_P1_P1_HOLD ==1'b0& P1_P1_P1_RequestPending == P1_P1_P1_NotPending )
                             P1_P1_P1_State  <= P1_P1_P1_StateTi ;
                          else 
                             P1_P1_P1_State  <= P1_P1_P1_StateT2I ;
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P1 reg[7:0] P1_P1_P1_InstQueue [15:0];reg[4:0] P1_P1_P1_InstQueueRd_Addr ;reg[4:0] P1_P1_P1_InstQueueWr_Addr ;
         parameter P1_P1_P1_InstQueueLimit =15;integer P1_P1_P1_InstAddrPointer ;integer P1_P1_P1_PhyAddrPointer ;reg P1_P1_P1_Extended ;reg P1_P1_P1_More ;reg P1_P1_P1_Flush ;reg[15:0] P1_P1_P1_lWord ;reg[14:0] P1_P1_P1_uWord ;integer P1_P1_P1_fWord ;reg[3:0] P1_P1_P1_State2 ;
         parameter P1_P1_P1_Si =0;
         parameter P1_P1_P1_S1 =1;
         parameter P1_P1_P1_S2 =2;
         parameter P1_P1_P1_S3 =3;
         parameter P1_P1_P1_S4 =4;
         parameter P1_P1_P1_S5 =5;
         parameter P1_P1_P1_S6 =6;
         parameter P1_P1_P1_S7 =7;
         parameter P1_P1_P1_S8 =8;
         parameter P1_P1_P1_S9 =9;
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_State2  = P1_P1_P1_Si ;
               P1_P1_P1_InstQueue  [0]=16*{0};
               P1_P1_P1_InstQueue  [1]=16*{0};
               P1_P1_P1_InstQueue  [2]=16*{0};
               P1_P1_P1_InstQueue  [3]=16*{0};
               P1_P1_P1_InstQueue  [4]=16*{0};
               P1_P1_P1_InstQueue  [5]=16*{0};
               P1_P1_P1_InstQueue  [6]=16*{0};
               P1_P1_P1_InstQueue  [7]=16*{0};
               P1_P1_P1_InstQueueRd_Addr  =0;
               P1_P1_P1_InstQueueWr_Addr  =0;
               P1_P1_P1_InstAddrPointer  =0;
               P1_P1_P1_PhyAddrPointer  =0;
               P1_P1_P1_Extended  =1'b0;
               P1_P1_P1_More  =1'b0;
               P1_P1_P1_Flush  =1'b0;
               P1_P1_P1_lWord  =0;
               P1_P1_P1_uWord  =0;
               P1_P1_P1_fWord  =0;
               P1_P1_P1_CodeFetch  <=1'b0;
               P1_P1_P1_Datao  <=0;
               P1_P1_P1_EAX  <=0;
               P1_P1_P1_EBX  <=0;
               P1_P1_P1_rEIP  <=0;
               P1_P1_P1_ReadRequest  <=1'b0;
               P1_P1_P1_MemoryFetch  <=1'b0;
               P1_P1_P1_RequestPending  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_State2 )
              P1_P1_P1_Si  :
                begin 
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_rEIP ;
                   P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                   P1_P1_P1_rEIP  <=20'hFFFF0;
                   P1_P1_P1_ReadRequest  <=1'b1;
                   P1_P1_P1_MemoryFetch  <=1'b1;
                   P1_P1_P1_RequestPending  <=1'b1;
                end 
              P1_P1_P1_S1  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                   P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                   P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                   P1_P1_P1_CodeFetch  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S2 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
              P1_P1_P1_S2  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %2**8;
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                  if ( P1_P1_P1_StateBS16 ==1'b1)
                     begin 
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**16))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]=( P1_P1_P1_Datai /(2**24))%(2**8);
                        P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +4;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                   else 
                     begin 
                        P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                       if ( P1_P1_P1_PhyAddrPointer <0)
                           P1_P1_P1_rEIP  <=- P1_P1_P1_PhyAddrPointer ;
                        else 
                           P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                        P1_P1_P1_State2  = P1_P1_P1_S3 ;
                     end 
                end 
              P1_P1_P1_S3  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                  if ( P1_P1_P1_READY_n ==1'b0)
                      P1_P1_P1_State2  = P1_P1_P1_S4 ;
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S3 ;
                end 
              P1_P1_P1_S4  :
                begin 
                   P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_Datai %(2**8);
                   P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                   P1_P1_P1_PhyAddrPointer  = P1_P1_P1_PhyAddrPointer +2;
                   P1_P1_P1_State2  = P1_P1_P1_S5 ;
                end 
              P1_P1_P1_S5  :
                begin 
                  case ( P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ])
                    P1_P1_P1_NOP  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_OPsop  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Extended  =1'b1;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_JMP_rel_short  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=3)
                         begin 
                           if ( P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]>127)
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +1-(8'hFF- P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16]);
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            else 
                              begin 
                                 P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +2+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                              end 
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_rel_near  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_PhyAddrPointer  = P1_P1_P1_InstAddrPointer +5+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_PhyAddrPointer ;
                            P1_P1_P1_Flush  =1'b1;
                            P1_P1_P1_More  =1'b0;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_JMP_intseg_immed  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_MOV_eax_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EAX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%16];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_dw  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=5)
                         begin 
                            P1_P1_P1_EBX  <= P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +4)%16]*(2**23)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +3)%16]*(2**16)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +2)%16]*(2**8)+ P1_P1_P1_InstQueue [( P1_P1_P1_InstQueueRd_Addr +1)%1];
                            P1_P1_P1_More  =1'b0;
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +5;
                            P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +5)%16;
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_eax_ebx  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <=- P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_uWord  = P1_P1_P1_Datai %(2**15);
                                if ( P1_P1_P1_StateBS16 ==1'b1)
                                    P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                 else 
                                   begin 
                                      P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                     if ( P1_P1_P1_READY_n ==1'b0)
                                        begin 
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_lWord  = P1_P1_P1_Datai %(2**16);
                                        end 
                                   end 
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_EAX  <= P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord ;
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_MOV_ebx_eax  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                           if ( P1_P1_P1_EBX <0)
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            else 
                               P1_P1_P1_rEIP  <= P1_P1_P1_EBX ;
                            P1_P1_P1_lWord  = P1_P1_P1_EAX %(2**16);
                            P1_P1_P1_uWord  =( P1_P1_P1_EAX /(2**16))%(2**15);
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                     if ( P1_P1_P1_StateBS16 ==1'b0)
                                        begin 
                                           P1_P1_P1_rEIP  <= P1_P1_P1_rEIP +2;
                                           P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_MemoryFetch  <= P1_P1_P1_Pending ;
                                           P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                                           P1_P1_P1_State2  = P1_P1_P1_S6 ;
                                        end 
                                      P1_P1_P1_More  =1'b0;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_IN_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_Pending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_READY_n ==1'b0)
                              begin 
                                 P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                 P1_P1_P1_EAX  <= P1_P1_P1_Datai ;
                                 P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                 P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2);
                                 P1_P1_P1_Flush  =1'b0;
                                 P1_P1_P1_More  =1'b0;
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_OUT_al  :
                      if (( P1_P1_P1_InstQueueWr_Addr - P1_P1_P1_InstQueueRd_Addr )>=2)
                         begin 
                            P1_P1_P1_rEIP  <= P1_P1_P1_InstQueueRd_Addr +1;
                            P1_P1_P1_RequestPending  <= P1_P1_P1_Pending ;
                            P1_P1_P1_ReadRequest  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_MemoryFetch  <= P1_P1_P1_NotPending ;
                            P1_P1_P1_CodeFetch  <= P1_P1_P1_NotPending ;
                           if ( P1_P1_P1_State == P1_P1_P1_StateT1 | P1_P1_P1_State == P1_P1_P1_StateT1P )
                              begin 
                                 P1_P1_P1_fWord  = P1_P1_P1_EAX %(2**16);
                                 P1_P1_P1_Datao  <= P1_P1_P1_fWord ;
                                if ( P1_P1_P1_READY_n ==1'b0)
                                   begin 
                                      P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                                      P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                                      P1_P1_P1_Flush  =1'b0;
                                      P1_P1_P1_More  =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin 
                            P1_P1_P1_Flush  =1'b0;
                            P1_P1_P1_More  =1'b1;
                         end 
                    P1_P1_P1_ADD_al_b  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ADD_ax_w  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_1  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_ROL_al_n  :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +2;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +2)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_eax  :
                      begin 
                         P1_P1_P1_EAX  <= P1_P1_P1_EAX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                    P1_P1_P1_INC_ebx  :
                      begin 
                         P1_P1_P1_EBX  <= P1_P1_P1_EBX +1;
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                   default :
                      begin 
                         P1_P1_P1_InstAddrPointer  = P1_P1_P1_InstAddrPointer +1;
                         P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                         P1_P1_P1_Flush  =1'b0;
                         P1_P1_P1_More  =1'b0;
                      end 
                  endcase 
                  if ((~( P1_P1_P1_InstQueueRd_Addr < P1_P1_P1_InstQueueWr_Addr ))|((( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<4)| P1_P1_P1_Flush | P1_P1_P1_More ))
                      P1_P1_P1_State2  = P1_P1_P1_S7 ;
                end 
              P1_P1_P1_S6  :
                begin 
                   P1_P1_P1_Datao  <=( P1_P1_P1_uWord *(2**16)+ P1_P1_P1_lWord );
                  if ( P1_P1_P1_READY_n ==1'b0)
                     begin 
                        P1_P1_P1_RequestPending  <= P1_P1_P1_NotPending ;
                        P1_P1_P1_State2  = P1_P1_P1_S5 ;
                     end 
                end 
              P1_P1_P1_S7  :
                begin 
                  if ( P1_P1_P1_Flush )
                     begin 
                        P1_P1_P1_InstQueueRd_Addr  =1;
                        P1_P1_P1_InstQueueWr_Addr  =1;
                       if ( P1_P1_P1_InstAddrPointer <0)
                           P1_P1_P1_fWord  =- P1_P1_P1_InstAddrPointer ;
                        else 
                           P1_P1_P1_fWord  = P1_P1_P1_InstAddrPointer ;
                       if ( P1_P1_P1_fWord %2==1)
                           P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr + P1_P1_P1_fWord %4)%16;
                     end 
                  if (( P1_P1_P1_InstQueueLimit - P1_P1_P1_InstQueueRd_Addr )<3)
                     begin 
                        P1_P1_P1_State2  = P1_P1_P1_S8 ;
                        P1_P1_P1_InstQueueWr_Addr  =0;
                     end 
                   else 
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                end 
              P1_P1_P1_S8  :
                if ( P1_P1_P1_InstQueueRd_Addr <= P1_P1_P1_InstQueueLimit )
                   begin 
                      P1_P1_P1_InstQueue  [ P1_P1_P1_InstQueueWr_Addr ]= P1_P1_P1_InstQueue [ P1_P1_P1_InstQueueRd_Addr ];
                      P1_P1_P1_InstQueueRd_Addr  =( P1_P1_P1_InstQueueRd_Addr +1)%16;
                      P1_P1_P1_InstQueueWr_Addr  =( P1_P1_P1_InstQueueWr_Addr +1)%16;
                      P1_P1_P1_State2  = P1_P1_P1_S8 ;
                   end 
                 else 
                   begin 
                      P1_P1_P1_InstQueueRd_Addr  =0;
                      P1_P1_P1_State2  = P1_P1_P1_S9 ;
                   end 
              P1_P1_P1_S9  :
                begin 
                   P1_P1_P1_rEIP  <= P1_P1_P1_PhyAddrPointer ;
                   P1_P1_P1_State2  = P1_P1_P1_S1 ;
                end 
            endcase 
       end
  
  always @(posedge P1_P1_P1_CLOCK orposedge P1_P1_P1_RESET )
       begin : P1_P1_P1_P2 
         if ( P1_P1_P1_RESET ==1'b1)
            begin 
               P1_P1_P1_ByteEnable  <=4'b0000;
               P1_P1_P1_NonAligned  <=1'b0;
            end 
          else 
            case ( P1_P1_P1_DataWidth )
              P1_P1_P1_WidthByte  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                     P1_P1_P1_ByteEnable  <=4'b1110;
                 1 :
                     P1_P1_P1_ByteEnable  <=4'b1101;
                 2 :
                     P1_P1_P1_ByteEnable  <=4'b1011;
                 3 :
                     P1_P1_P1_ByteEnable  <=4'b0111;
                 default :;
                endcase 
              P1_P1_P1_WidthWord  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1100;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b1001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0011;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0111;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 default :;
                endcase 
              P1_P1_P1_WidthDword  :
                case ( P1_P1_P1_rEIP %4)
                 0 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0000;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_NotPending ;
                    end 
                 1 :
                    begin 
                       P1_P1_P1_ByteEnable  <=4'b0001;
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                    end 
                 2 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0011;
                    end 
                 3 :
                    begin 
                       P1_P1_P1_NonAligned  <= P1_P1_P1_Pending ;
                       P1_P1_P1_ByteEnable  <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 

 
  
wire  P1_P3_clock;
wire  P1_P3_reset;
reg [19:0] P1_P3_addr;
wire [31:0] P1_P3_datai;
wire  P1_P3_integerdatao;
wire  P1_P3_regrd;
wire  P1_P3_regwr;
assign P1_P3_clock = P1_clock;
assign P1_P3_reset = P1_reset;
assign P1_ad31 = P1_P3_addr;
assign P1_P3_datai = P1_di3;
assign P1_do3 = P1_P3_integerdatao;
assign P1_rd3 = P1_P3_regrd;
assign P1_wr3 = P1_P3_regwr;
 
  always @(posedge P1_P3_clock orposedge P1_P3_reset )
       begin : P1_P3_xhdl0 integer P1_P3_reg0 ;integer P1_P3_reg1 ;integer P1_P3_reg2 ;integer P1_P3_reg3 ;reg P1_P3_B ;reg[19:0] P1_P3_MAR ;integer P1_P3_MBR ;reg[1:0] P1_P3_mf ;reg[2:0] P1_P3_df ;reg[0:0] P1_P3_cf ;reg[3:0] P1_P3_ff ;reg[19:0] P1_P3_tail ;integer P1_P3_IR ;reg[0:0] P1_P3_state ;integer P1_P3_r ;integer P1_P3_m ;integer P1_P3_t ;integer P1_P3_d ;integer P1_P3_temp ;reg[1:0] P1_P3_s ;
         parameter P1_P3_FETCH =0;
         parameter P1_P3_EXEC =1;
         if ( P1_P3_reset ==1'b1)
            begin 
               P1_P3_MAR  =0;
               P1_P3_MBR  =0;
               P1_P3_IR  =0;
               P1_P3_d  =0;
               P1_P3_r  =0;
               P1_P3_m  =0;
               P1_P3_s  =0;
               P1_P3_temp  =0;
               P1_P3_mf  =0;
               P1_P3_df  =0;
               P1_P3_ff  =0;
               P1_P3_cf  =0;
               P1_P3_tail  =0;
               P1_P3_B  =1'b0;
               P1_P3_reg0  =0;
               P1_P3_reg1  =0;
               P1_P3_reg2  =0;
               P1_P3_reg3  =0;
               P1_P3_addr  <=0;
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
               P1_P3_datao  <=0;
               P1_P3_state  = P1_P3_FETCH ;
            end 
          else 
            begin 
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
              case ( P1_P3_state )
                P1_P3_FETCH  :
                  begin 
                     P1_P3_MAR  = P1_P3_reg3 %2**20;
                     P1_P3_addr  <= P1_P3_MAR ;
                     P1_P3_rd  <=1'b1;
                     P1_P3_MBR  = P1_P3_datai ;
                     P1_P3_IR  = P1_P3_MBR ;
                     P1_P3_state  = P1_P3_EXEC ;
                  end 
                P1_P3_EXEC  :
                  begin 
                    if ( P1_P3_IR <0)
                        P1_P3_IR  =- P1_P3_IR ;
                     P1_P3_mf  =( P1_P3_IR /2**27)%4;
                     P1_P3_df  =( P1_P3_IR /2**24)%2**3;
                     P1_P3_ff  =( P1_P3_IR /2**19)%2**4;
                     P1_P3_cf  =( P1_P3_IR /2**23)%2;
                     P1_P3_tail  = P1_P3_IR %2**20;
                     P1_P3_reg3  =(( P1_P3_reg3 %2**29)+8);
                     P1_P3_s  =( P1_P3_IR /2**29)%4;
                    case ( P1_P3_s )
                     0 :
                         P1_P3_r  = P1_P3_reg0 ;
                     1 :
                         P1_P3_r  = P1_P3_reg1 ;
                     2 :
                         P1_P3_r  = P1_P3_reg2 ;
                     3 :
                         P1_P3_r  = P1_P3_reg3 ;
                    endcase 
                    case ( P1_P3_cf )
                     1 :
                        begin 
                          case ( P1_P3_mf )
                           0 :
                               P1_P3_m  = P1_P3_tail ;
                           1 :
                              begin 
                                 P1_P3_m  = P1_P3_datai ;
                                 P1_P3_addr  <= P1_P3_tail ;
                                 P1_P3_rd  <=1'b1;
                              end 
                           2 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                           3 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                          endcase 
                          case ( P1_P3_ff )
                           0 :
                              if ( P1_P3_r < P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           1 :
                              if (~( P1_P3_r < P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           2 :
                              if ( P1_P3_r == P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           3 :
                              if (~( P1_P3_r == P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           4 :
                              if (~( P1_P3_r > P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           5 :
                              if ( P1_P3_r > P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           6 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ( P1_P3_r < P1_P3_m )
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           7 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (~( P1_P3_r < P1_P3_m ))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           8 :
                              if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           9 :
                              if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           10 :
                              if (( P1_P3_r == P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           11 :
                              if ((~( P1_P3_r == P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           12 :
                              if ((~( P1_P3_r > P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           13 :
                              if (( P1_P3_r > P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           14 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           15 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~( P1_P3_df ==7))
                           begin 
                             if ( P1_P3_df ==5)
                                begin 
                                  if ((~( P1_P3_B ))==1'b1)
                                      P1_P3_d  =3;
                                end 
                              else 
                                if ( P1_P3_df ==4)
                                   begin 
                                     if ( P1_P3_B ==1'b1)
                                         P1_P3_d  =3;
                                   end 
                                 else 
                                   if ( P1_P3_df ==3)
                                       P1_P3_d  =3;
                                    else 
                                      if ( P1_P3_df ==2)
                                          P1_P3_d  =2;
                                       else 
                                         if ( P1_P3_df ==1)
                                             P1_P3_d  =1;
                                          else 
                                            if ( P1_P3_df ==0)
                                                P1_P3_d  =0;
                             case ( P1_P3_ff )
                              0 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_t  =0;
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t - P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t - P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t - P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t - P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_reg2  = P1_P3_reg3 ;
                                    P1_P3_reg3  = P1_P3_m ;
                                 end 
                              2 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_t  = P1_P3_r /2;
                                    1 :
                                       begin 
                                          P1_P3_t  = P1_P3_r /2;
                                         if ( P1_P3_B ==1'b1)
                                             P1_P3_t  = P1_P3_t %2**29;
                                       end 
                                    2 :
                                        P1_P3_t  =( P1_P3_r %2**29)*2;
                                    3 :
                                       begin 
                                          P1_P3_t  =( P1_P3_r %2**29)*2;
                                         if ( P1_P3_t >2**30-1)
                                             P1_P3_B  =1'b1;
                                          else 
                                             P1_P3_B  =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if ( P1_P3_df ==7)
                              begin 
                                case ( P1_P3_mf )
                                 0 :
                                     P1_P3_m  = P1_P3_tail ;
                                 1 :
                                     P1_P3_m  = P1_P3_tail ;
                                 2 :
                                     P1_P3_m  =( P1_P3_reg1 %2**20)+( P1_P3_tail %2**20);
                                 3 :
                                     P1_P3_m  =( P1_P3_reg2 %2**20)+( P1_P3_tail %2**20);
                                endcase 
                                 P1_P3_addr  <= P1_P3_m %2*20;
                                 P1_P3_wr  <=1'b1;
                                 P1_P3_datao  <= P1_P3_r ;
                              end 
                    endcase 
                     P1_P3_state  = P1_P3_FETCH ;
                  end 
              endcase 
            end 
       end
 
 
  
wire  P1_P3_clock;
wire  P1_P3_reset;
reg [19:0] P1_P3_addr;
wire [31:0] P1_P3_datai;
wire  P1_P3_datao;
reg  P1_P3_rd;
reg  P1_P3_wr;
assign P1_P3_clock = P1_clock;
assign P1_P3_reset = P1_reset;
assign P1_ad31 = P1_P3_addr;
assign P1_P3_datai = P1_di3;
assign P1_do3 = P1_P3_datao;
assign P1_rd3 = P1_P3_rd;
assign P1_wr3 = P1_P3_wr;
 
  always @(posedge P1_P3_clock orposedge P1_P3_reset )
       begin : P1_P3_xhdl0 integer P1_P3_reg0 ;integer P1_P3_reg1 ;integer P1_P3_reg2 ;integer P1_P3_reg3 ;reg P1_P3_B ;reg[19:0] P1_P3_MAR ;integer P1_P3_MBR ;reg[1:0] P1_P3_mf ;reg[2:0] P1_P3_df ;reg[0:0] P1_P3_cf ;reg[3:0] P1_P3_ff ;reg[19:0] P1_P3_tail ;integer P1_P3_IR ;reg[0:0] P1_P3_state ;integer P1_P3_r ;integer P1_P3_m ;integer P1_P3_t ;integer P1_P3_d ;integer P1_P3_temp ;reg[1:0] P1_P3_s ;
         parameter P1_P3_FETCH =0;
         parameter P1_P3_EXEC =1;
         if ( P1_P3_reset ==1'b1)
            begin 
               P1_P3_MAR  =0;
               P1_P3_MBR  =0;
               P1_P3_IR  =0;
               P1_P3_d  =0;
               P1_P3_r  =0;
               P1_P3_m  =0;
               P1_P3_s  =0;
               P1_P3_temp  =0;
               P1_P3_mf  =0;
               P1_P3_df  =0;
               P1_P3_ff  =0;
               P1_P3_cf  =0;
               P1_P3_tail  =0;
               P1_P3_B  =1'b0;
               P1_P3_reg0  =0;
               P1_P3_reg1  =0;
               P1_P3_reg2  =0;
               P1_P3_reg3  =0;
               P1_P3_addr  <=0;
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
               P1_P3_datao  <=0;
               P1_P3_state  = P1_P3_FETCH ;
            end 
          else 
            begin 
               P1_P3_rd  <=1'b0;
               P1_P3_wr  <=1'b0;
              case ( P1_P3_state )
                P1_P3_FETCH  :
                  begin 
                     P1_P3_MAR  = P1_P3_reg3 %2**20;
                     P1_P3_addr  <= P1_P3_MAR ;
                     P1_P3_rd  <=1'b1;
                     P1_P3_MBR  = P1_P3_datai ;
                     P1_P3_IR  = P1_P3_MBR ;
                     P1_P3_state  = P1_P3_EXEC ;
                  end 
                P1_P3_EXEC  :
                  begin 
                    if ( P1_P3_IR <0)
                        P1_P3_IR  =- P1_P3_IR ;
                     P1_P3_mf  =( P1_P3_IR /2**27)%4;
                     P1_P3_df  =( P1_P3_IR /2**24)%2**3;
                     P1_P3_ff  =( P1_P3_IR /2**19)%2**4;
                     P1_P3_cf  =( P1_P3_IR /2**23)%2;
                     P1_P3_tail  = P1_P3_IR %2**20;
                     P1_P3_reg3  =(( P1_P3_reg3 %2**29)+8);
                     P1_P3_s  =( P1_P3_IR /2**29)%4;
                    case ( P1_P3_s )
                     0 :
                         P1_P3_r  = P1_P3_reg0 ;
                     1 :
                         P1_P3_r  = P1_P3_reg1 ;
                     2 :
                         P1_P3_r  = P1_P3_reg2 ;
                     3 :
                         P1_P3_r  = P1_P3_reg3 ;
                    endcase 
                    case ( P1_P3_cf )
                     1 :
                        begin 
                          case ( P1_P3_mf )
                           0 :
                               P1_P3_m  = P1_P3_tail ;
                           1 :
                              begin 
                                 P1_P3_m  = P1_P3_datai ;
                                 P1_P3_addr  <= P1_P3_tail ;
                                 P1_P3_rd  <=1'b1;
                              end 
                           2 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                           3 :
                              begin 
                                 P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                 P1_P3_rd  <=1'b1;
                                 P1_P3_m  = P1_P3_datai ;
                              end 
                          endcase 
                          case ( P1_P3_ff )
                           0 :
                              if ( P1_P3_r < P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           1 :
                              if (~( P1_P3_r < P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           2 :
                              if ( P1_P3_r == P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           3 :
                              if (~( P1_P3_r == P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           4 :
                              if (~( P1_P3_r > P1_P3_m ))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           5 :
                              if ( P1_P3_r > P1_P3_m )
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           6 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ( P1_P3_r < P1_P3_m )
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           7 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (~( P1_P3_r < P1_P3_m ))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           8 :
                              if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           9 :
                              if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           10 :
                              if (( P1_P3_r == P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           11 :
                              if ((~( P1_P3_r == P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           12 :
                              if ((~( P1_P3_r > P1_P3_m ))|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           13 :
                              if (( P1_P3_r > P1_P3_m )|( P1_P3_B ==1'b1))
                                  P1_P3_B  =1'b1;
                               else 
                                  P1_P3_B  =1'b0;
                           14 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if (( P1_P3_r < P1_P3_m )|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                           15 :
                              begin 
                                if ( P1_P3_r >2**30-1)
                                    P1_P3_r  = P1_P3_r -2**30;
                                if ((~( P1_P3_r < P1_P3_m ))|( P1_P3_B ==1'b1))
                                    P1_P3_B  =1'b1;
                                 else 
                                    P1_P3_B  =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~( P1_P3_df ==7))
                           begin 
                             if ( P1_P3_df ==5)
                                begin 
                                  if ((~( P1_P3_B ))==1'b1)
                                      P1_P3_d  =3;
                                end 
                              else 
                                if ( P1_P3_df ==4)
                                   begin 
                                     if ( P1_P3_B ==1'b1)
                                         P1_P3_d  =3;
                                   end 
                                 else 
                                   if ( P1_P3_df ==3)
                                       P1_P3_d  =3;
                                    else 
                                      if ( P1_P3_df ==2)
                                          P1_P3_d  =2;
                                       else 
                                         if ( P1_P3_df ==1)
                                             P1_P3_d  =1;
                                          else 
                                            if ( P1_P3_df ==0)
                                                P1_P3_d  =0;
                             case ( P1_P3_ff )
                              0 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_t  =0;
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t - P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t - P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t - P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t - P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                    P1_P3_reg2  = P1_P3_reg3 ;
                                    P1_P3_reg3  = P1_P3_m ;
                                 end 
                              2 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_m ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_m ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_m ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_m ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r + P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r + P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r + P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r + P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_m  = P1_P3_tail ;
                                    1 :
                                       begin 
                                          P1_P3_m  = P1_P3_datai ;
                                          P1_P3_addr  <= P1_P3_tail ;
                                          P1_P3_rd  <=1'b1;
                                       end 
                                    2 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg1 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                    3 :
                                       begin 
                                          P1_P3_addr  <=( P1_P3_tail + P1_P3_reg2 )%2**20;
                                          P1_P3_rd  <=1'b1;
                                          P1_P3_m  = P1_P3_datai ;
                                       end 
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  =( P1_P3_r - P1_P3_m )%2**30;
                                    1 :
                                        P1_P3_reg1  =( P1_P3_r - P1_P3_m )%2**30;
                                    2 :
                                        P1_P3_reg2  =( P1_P3_r - P1_P3_m )%2**30;
                                    3 :
                                        P1_P3_reg3  =( P1_P3_r - P1_P3_m )%2**30;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case ( P1_P3_mf )
                                    0 :
                                        P1_P3_t  = P1_P3_r /2;
                                    1 :
                                       begin 
                                          P1_P3_t  = P1_P3_r /2;
                                         if ( P1_P3_B ==1'b1)
                                             P1_P3_t  = P1_P3_t %2**29;
                                       end 
                                    2 :
                                        P1_P3_t  =( P1_P3_r %2**29)*2;
                                    3 :
                                       begin 
                                          P1_P3_t  =( P1_P3_r %2**29)*2;
                                         if ( P1_P3_t >2**30-1)
                                             P1_P3_B  =1'b1;
                                          else 
                                             P1_P3_B  =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case ( P1_P3_d )
                                    0 :
                                        P1_P3_reg0  = P1_P3_t ;
                                    1 :
                                        P1_P3_reg1  = P1_P3_t ;
                                    2 :
                                        P1_P3_reg2  = P1_P3_t ;
                                    3 :
                                        P1_P3_reg3  = P1_P3_t ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if ( P1_P3_df ==7)
                              begin 
                                case ( P1_P3_mf )
                                 0 :
                                     P1_P3_m  = P1_P3_tail ;
                                 1 :
                                     P1_P3_m  = P1_P3_tail ;
                                 2 :
                                     P1_P3_m  =( P1_P3_reg1 %2**20)+( P1_P3_tail %2**20);
                                 3 :
                                     P1_P3_m  =( P1_P3_reg2 %2**20)+( P1_P3_tail %2**20);
                                endcase 
                                 P1_P3_addr  <= P1_P3_m %2*20;
                                 P1_P3_wr  <=1'b1;
                                 P1_P3_datao  <= P1_P3_r ;
                              end 
                    endcase 
                     P1_P3_state  = P1_P3_FETCH ;
                  end 
              endcase 
            end 
       end
 
 
  always @( P1_do1 or P1_rd3 or P1_wr1 or P1_mio1 or P1_dc1 or P1_as12 or P1_do2 or P1_rd4 or P1_wr2 or P1_mio2 or P1_dc2 or P1_as22 or P1_as21 or P1_as11 or P1_wr3 or P1_ad31 or P1_tad2 or P1_wr4 or P1_ad41 or P1_tad1 or P1_do3 or P1_do4 or P1_ad11 or P1_ad12 or P1_ad21 or P1_ad22 or P1_tad3 or P1_tad4 or P1_sel or P1_din or P1_td1 or P1_td2 )
       begin 
          P1_di3  <= P1_do1 %2**20;
          P1_r12  <=(~( P1_rd3 & P1_wr1 & P1_mio1 & P1_dc1 &(~ P1_as12 )));
          P1_di4  <= P1_do2 ;
          P1_r22  <=(~( P1_rd4 & P1_wr2 & P1_mio2 & P1_dc2 &(~ P1_as22 )));
          P1_r11  <= P1_as21 ;
          P1_r21  <= P1_as11 ;
         if ( P1_wr3 ==1'b1)
             P1_tad3  <= P1_ad31 ;
          else 
             P1_tad3  <= P1_tad2 %2**20;
         if ( P1_wr4 ==1'b1)
             P1_tad4  <= P1_ad41 ;
          else 
             P1_tad4  <= P1_tad1 %2**20;
         if ( P1_do3 >2**28)
             P1_tad1  <= P1_ad11 ;
          else 
             P1_tad1  <= P1_ad12 ;
         if ( P1_do4 >2**29)
             P1_tad2  <= P1_ad21 ;
          else 
             P1_tad2  <= P1_ad22 ;
          P1_dout  <=( P1_tad3 * P1_tad4 )%2**19;
         if ( P1_sel ==1'b0)
            begin 
               P1_td1  <=0;
               P1_td2  <= P1_din ;
            end 
          else 
            begin 
               P1_td1  <= P1_din ;
               P1_td2  <=0;
            end 
          P1_di1  <= P1_do4 * P1_td1 ;
          P1_di2  <= P1_do3 * P1_td2 ;
          P1_aux  <=( P1_tad1 * P1_tad2 )%2**3;
       end
 

   
   
   always @(posedge clock or posedge reset)
      if (reset == 1'b1)
      begin
         sel1 <= 1'b0;
         sel2 <= 1'b0;
      end
      else 
      begin
         if (do1 == 39)
            sel2 <= 1'b1;
         else if (do1 == 1735)
            sel2 <= 1'b0;
         if (do2 == 398)
            sel1 <= 1'b1;
         else if (do2 == 1013)
            sel1 <= 1'b0;
      end
   
   
   always @(sel1 or sel2 or in1 or in2 or in3 or do1 or do2 or ax1 or ax2)
   begin
      if (sel1 == 1'b0 & sel2 == 1'b1)
      begin
         di1 <= in1/2;
         di2 <= in2/16;
      end
      else
      begin
         di1 <= in1/2;
         di2 <= in2/8;
      end
      ris <= ((ax1 - ax2) * do1) - ((ax1 - ax2) * do2);
   end
   
endmodule