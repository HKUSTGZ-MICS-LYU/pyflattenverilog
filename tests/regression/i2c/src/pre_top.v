module i2c_master_top (
  input wb_clk_i,
  input rst_i,
  input [2:0] wb_adr_i,
  input [7:0] wb_dat_i,
  output reg  [7:0] wb_dat_o,
  input wb_we_i,
  input wb_stb_i,
  input wb_cyc_i,
  output reg  wb_ack_o,
  output reg  wb_inta_o,
  input scl_pad_i,
  output scl_pad_o,
  output scl_padoen_o,
  input sda_pad_i,
  output sda_pad_o,
  output sda_padoen_o) ; 
   reg [15:0] prer ;  
   reg [7:0] ctr ;  
   reg [7:0] txr ;  
   wire [7:0] rxr ;  
   reg [7:0] cr ;  
   wire [7:0] sr ;  
   wire done ;  
   wire core_en ;  
   wire ien ;  
   wire irxack ;  
   reg rxack ;  
   reg tip ;  
   reg irq_flag ;  
   wire i2c_busy ;  
   wire i2c_al ;  
   reg al ;  
   wire wb_wacc=wb_cyc_i&wb_stb_i&wb_we_i ;  
  always @( posedge wb_clk_i)
       wb_ack_o <=wb_cyc_i&wb_stb_i&~wb_ack_o;
 
  always @( posedge wb_clk_i)
       begin 
         case (wb_adr_i)
          3 'b000:
             wb_dat_o <=prer[7:0];
          3 'b001:
             wb_dat_o <=prer[15:8];
          3 'b010:
             wb_dat_o <=ctr;
          3 'b011:
             wb_dat_o <=rxr;
          3 'b100:
             wb_dat_o <=sr;
          3 'b101:
             wb_dat_o <=txr;
          3 'b110:
             wb_dat_o <=cr;
          3 'b111:
             wb_dat_o <=0;
         endcase 
       end
  
  always @(  posedge wb_clk_i or  negedge rst_i)
       if (!rst_i)
          begin 
            prer <=16'hffff;
            ctr <=8'h0;
            txr <=8'h0;
          end 
        else 
          if (wb_wacc)
             case (wb_adr_i)
              3 'b000:
                 prer <={prer[15:8],wb_dat_i};
              3 'b001:
                 prer <={wb_dat_i,prer[7:0]};
              3 'b010:
                 ctr <=wb_dat_i;
              3 'b011:
                 txr <=wb_dat_i;
             endcase
  
  always @(  posedge wb_clk_i or  negedge rst_i)
       if (~rst_i)
          cr <=8'h0;
        else 
          if (wb_wacc)
             begin 
               if (core_en&(wb_adr_i==3'b100))
                  cr <=wb_dat_i;
             end 
           else 
             begin 
               if (done|i2c_al)
                  begin 
                    cr <={4'h0,cr[3:0]};
                  end 
               cr <={cr[7:3],3'b0};
             end
  
   wire sta=cr[7] ;  
   wire sto=cr[6] ;  
   wire rd=cr[5] ;  
   wire wr=cr[4] ;  
   wire ack=cr[3] ;  
   wire iack=cr[0] ;  
  assign core_en=ctr[7]; 
  assign ien=ctr[6]; 
  i2c_master_byte_ctrl byte_controller(.clk(wb_clk_i),.nReset(rst_i),.ena(core_en),.clk_cnt(prer),.start(sta),.stop(sto),.read(rd),.write(wr),.ack_in(ack),.din(txr),.cmd_ack(done),.ack_out(irxack),.dout(rxr),.i2c_busy(i2c_busy),.i2c_al(i2c_al),.scl_i(scl_pad_i),.scl_o(scl_pad_o),.scl_oen(scl_padoen_o),.sda_i(sda_pad_i),.sda_o(sda_pad_o),.sda_oen(sda_padoen_o)); 
  always @(  posedge wb_clk_i or  negedge rst_i)
       if (!rst_i)
          begin 
            al <=1'b0;
            rxack <=1'b0;
            tip <=1'b0;
            irq_flag <=1'b0;
          end 
        else 
          begin 
            al <=i2c_al|(al&~sta);
            rxack <=irxack;
            tip <=(rd|wr);
            irq_flag <=(done|i2c_al|irq_flag)&~iack;
          end
  
  always @(  posedge wb_clk_i or  negedge rst_i)
       if (!rst_i)
          wb_inta_o <=1'b0;
        else 
          wb_inta_o <=irq_flag&&ien;
 
  assign sr={rxack,i2c_busy,al,3'h0,tip,irq_flag}; 
endmodule
 
module i2c_master_byte_ctrl (
  input clk,
  input nReset,
  input ena,
  input [15:0] clk_cnt,
  input start,
  input stop,
  input read,
  input write,
  input ack_in,
  input [7:0] din,
  output reg  cmd_ack,
  output reg  ack_out,
  output [7:0] dout,
  output i2c_busy,
  output i2c_al,
  input scl_i,
  output scl_o,
  output scl_oen,
  input sda_i,
  output sda_o,
  output sda_oen) ; 
 parameter[4:0] ST_IDLE =5'b0_0000; 
 parameter[4:0] ST_START =5'b0_0001; 
 parameter[4:0] ST_READ =5'b0_0010; 
 parameter[4:0] ST_WRITE =5'b0_0100; 
 parameter[4:0] ST_ACK =5'b0_1000; 
 parameter[4:0] ST_STOP =5'b1_0000; 
   reg [3:0] core_cmd ;  
   reg core_txd ;  
   wire core_ack,core_rxd ;  
   reg [7:0] sr ;  
   reg shift,ld ;  
   wire go ;  
   reg [2:0] dcnt ;  
   wire cnt_done ;  
  i2c_master_bit_ctrl bit_controller(.clk(clk),.nReset(nReset),.ena(ena),.clk_cnt(clk_cnt),.cmd(core_cmd),.cmd_ack(core_ack),.busy(i2c_busy),.al(i2c_al),.din(core_txd),.dout(core_rxd),.scl_i(scl_i),.scl_o(scl_o),.scl_oen(scl_oen),.sda_i(sda_i),.sda_o(sda_o),.sda_oen(sda_oen)); 
  assign go=(read|write|stop)&~cmd_ack; 
  assign dout=sr; 
  always @(  posedge clk or  negedge nReset)
       if (!nReset)
          sr <=8'h0;
        else 
          if (ld)
             sr <=din;
           else 
             if (shift)
                sr <={sr[6:0],core_rxd};
 
  always @(  posedge clk or  negedge nReset)
       if (!nReset)
          dcnt <=3'h0;
        else 
          if (ld)
             dcnt <=3'h7;
           else 
             if (shift)
                dcnt <=dcnt-3'h1;
 
  assign cnt_done=~(|dcnt); 
   reg [4:0] c_state ;  
  always @(  posedge clk or  negedge nReset)
       if (!nReset)
          begin 
            core_cmd <=;core_txd<=1'b0;
            shift <=1'b0;
            ld <=1'b0;
            cmd_ack <=1'b0;
            c_state <=ST_IDLE;
            ack_out <=1'b0;
          end 
        else 
          if (i2c_al)
             begin 
               core_cmd <=;core_txd<=1'b0;
               shift <=1'b0;
               ld <=1'b0;
               cmd_ack <=1'b0;
               c_state <=ST_IDLE;
               ack_out <=1'b0;
             end 
           else 
             begin 
               core_txd <=sr[7];
               shift <=1'b0;
               ld <=1'b0;
               cmd_ack <=1'b0;
               case (c_state)
                ST_IDLE :
                   if (go)
                      begin 
                        if (start)
                           begin 
                             c_state <=ST_START;
                             core_cmd <=;
                           end 
                         else 
                           if (read)
                              begin 
                                c_state <=ST_READ;
                                core_cmd <=;
                              end 
                            else 
                              if (write)
                                 begin 
                                   c_state <=ST_WRITE;
                                   core_cmd <=;
                                 end 
                               else 
                                 begin 
                                   c_state <=ST_STOP;
                                   core_cmd <=;
                                 end 
                        ld <=1'b1;
                      end 
                ST_START :
                   if (core_ack)
                      begin 
                        if (read)
                           begin 
                             c_state <=ST_READ;
                             core_cmd <=;
                           end 
                         else 
                           begin 
                             c_state <=ST_WRITE;
                             core_cmd <=;
                           end 
                        ld <=1'b1;
                      end 
                ST_WRITE :
                   if (core_ack)
                      if (cnt_done)
                         begin 
                           c_state <=ST_ACK;
                           core_cmd <=;
                         end 
                    else 
                      begin 
                        c_state <=ST_WRITE;
                        core_cmd <=;shift<=1'b1;
                      end 
                ST_READ :
                   if (core_ack)
                      begin 
                        if (cnt_done)
                           begin 
                             c_state <=ST_ACK;
                             core_cmd <=;
                           end 
                         else 
                           begin 
                             c_state <=ST_READ;
                             core_cmd <=;
                           end 
                        shift <=1'b1;
                        core_txd <=ack_in;
                      end 
                ST_ACK :
                   if (core_ack)
                      begin 
                        if (stop)
                           begin 
                             c_state <=ST_STOP;
                             core_cmd <=;
                           end 
                         else 
                           begin 
                             c_state <=ST_IDLE;
                             core_cmd <=;cmd_ack<=1'b1;
                           end 
                        ack_out <=core_rxd;
                        core_txd <=1'b1;
                      end 
                    else 
                      core_txd <=ack_in;
                ST_STOP :
                   if (core_ack)
                      begin 
                        c_state <=ST_IDLE;
                        core_cmd <=;cmd_ack<=1'b1;
                      end 
               endcase 
             end
  
endmodule
 
module i2c_master_bit_ctrl (
  input clk,
  input nReset,
  input [15:0] clk_cnt,
  input ena,
  input [3:0] cmd,
  output reg  cmd_ack,
  output reg  busy,
  output reg  al,
  input din,
  output reg  dout,
  input scl_i,
  output scl_o,
  output reg  scl_oen,
  input sda_i,
  output sda_o,
  output reg  sda_oen) ; 
   reg sSCL,sSDB ;  
   reg dscl_oen ;  
   reg sda_chk ;  
   reg clk_en ;  
   wire slave_wait ;  
   reg [15:0] cnt ;  
   reg [16:0] c_state ;  
  always @(  posedge clk or  negedge nReset)
       if (~nReset)
          dscl_oen <=1'b0;
        else 
          dscl_oen <=scl_oen;
 
  assign slave_wait=dscl_oen&&!sSCL; 
  always @(  posedge clk or  negedge nReset)
       if (~nReset)
          begin 
            cnt <=16'h0;
            clk_en <=1'b1;
          end 
        else 
          if (~|cnt||~ena)
             if (~slave_wait)
                begin 
                  cnt <=clk_cnt;
                  clk_en <=1'b1;
                end 
              else 
                begin 
                  cnt <=cnt;
                  clk_en <=1'b0;
                end 
           else 
             begin 
               cnt <=cnt-16'h1;
               clk_en <=1'b0;
             end
  
   reg dSCL,dSDA ;  
   reg sta_condition ;  
   reg sto_condition ;  
  always @(  posedge clk or  negedge nReset)
       if (~nReset)
          begin 
            sSCL <=1'b1;
            sSDB <=1'b1;
            dSCL <=1'b1;
            dSDA <=1'b1;
          end 
        else 
          begin 
            sSCL <=scl_i;
            sSDB <=sda_i;
            dSCL <=sSCL;
            dSDA <=sSDB;
          end
  
  always @(  posedge clk or  negedge nReset)
       if (~nReset)
          begin 
            sta_condition <=1'b0;
            sto_condition <=1'b0;
          end 
        else 
          begin 
            sta_condition <=~sSDB&dSDA&sSCL;
            sto_condition <=sSDB&~dSDA&sSCL;
          end
  
  always @(  posedge clk or  negedge nReset)
       if (!nReset)
          busy <=1'b0;
        else 
          busy <=(sta_condition|busy)&~sto_condition;
 
   reg cmd_stop ;  
  always @(  posedge clk or  negedge nReset)
       if (~nReset)
          cmd_stop <=1'b0;
        else 
          if (clk_en)
             cmd_stop <=cmd==;
 
  always @(  posedge clk or  negedge nReset)
       if (~nReset)
          al <=1'b0;
        else 
          al <=(sda_chk&~sSDB&sda_oen)|(|c_state&sto_condition&~cmd_stop);
 
  always @(  posedge clk or  negedge nReset)
       if (~nReset)
          dout <=1'b0;
        else 
          if (sSCL&~dSCL)
             dout <=sSDB;
 
 parameter[16:0] idle =17'b0_0000_0000_0000_0000; 
 parameter[16:0] start_a =17'b0_0000_0000_0000_0001; 
 parameter[16:0] start_b =17'b0_0000_0000_0000_0010; 
 parameter[16:0] start_c =17'b0_0000_0000_0000_0100; 
 parameter[16:0] start_d =17'b0_0000_0000_0000_1000; 
 parameter[16:0] start_e =17'b0_0000_0000_0001_0000; 
 parameter[16:0] stop_a =17'b0_0000_0000_0010_0000; 
 parameter[16:0] stop_b =17'b0_0000_0000_0100_0000; 
 parameter[16:0] stop_c =17'b0_0000_0000_1000_0000; 
 parameter[16:0] stop_d =17'b0_0000_0001_0000_0000; 
 parameter[16:0] rd_a =17'b0_0000_0010_0000_0000; 
 parameter[16:0] rd_b =17'b0_0000_0100_0000_0000; 
 parameter[16:0] rd_c =17'b0_0000_1000_0000_0000; 
 parameter[16:0] rd_d =17'b0_0001_0000_0000_0000; 
 parameter[16:0] wr_a =17'b0_0010_0000_0000_0000; 
 parameter[16:0] wr_b =17'b0_0100_0000_0000_0000; 
 parameter[16:0] wr_c =17'b0_1000_0000_0000_0000; 
 parameter[16:0] wr_d =17'b1_0000_0000_0000_0000; 
  always @(  posedge clk or  negedge nReset)
       if (!nReset)
          begin 
            c_state <=idle;
            cmd_ack <=1'b0;
            scl_oen <=1'b1;
            sda_oen <=1'b1;
            sda_chk <=1'b0;
          end 
        else 
          if (al)
             begin 
               c_state <=idle;
               cmd_ack <=1'b0;
               scl_oen <=1'b1;
               sda_oen <=1'b1;
               sda_chk <=1'b0;
             end 
           else 
             begin 
               cmd_ack <=1'b0;
               if (clk_en)
                  case (c_state)
                   idle :
                      begin 
                        case (cmd):
                         c_state <=start_a;:
                            c_state <=stop_a;:
                         c_state <=wr_a;:
                            c_state <=rd_a;
                         default :
                            c_state <=idle;
                        endcase 
                        scl_oen <=scl_oen;
                        sda_oen <=sda_oen;
                        sda_chk <=1'b0;
                      end 
                   start_a :
                      begin 
                        c_state <=start_b;
                        scl_oen <=scl_oen;
                        sda_oen <=1'b1;
                        sda_chk <=1'b0;
                      end 
                   start_b :
                      begin 
                        c_state <=start_c;
                        scl_oen <=1'b1;
                        sda_oen <=1'b1;
                        sda_chk <=1'b0;
                      end 
                   start_c :
                      begin 
                        c_state <=start_d;
                        scl_oen <=1'b1;
                        sda_oen <=1'b0;
                        sda_chk <=1'b0;
                      end 
                   start_d :
                      begin 
                        c_state <=start_e;
                        scl_oen <=1'b1;
                        sda_oen <=1'b0;
                        sda_chk <=1'b0;
                      end 
                   start_e :
                      begin 
                        c_state <=idle;
                        cmd_ack <=1'b1;
                        scl_oen <=1'b0;
                        sda_oen <=1'b0;
                        sda_chk <=1'b0;
                      end 
                   stop_a :
                      begin 
                        c_state <=stop_b;
                        scl_oen <=1'b0;
                        sda_oen <=1'b0;
                        sda_chk <=1'b0;
                      end 
                   stop_b :
                      begin 
                        c_state <=stop_c;
                        scl_oen <=1'b1;
                        sda_oen <=1'b0;
                        sda_chk <=1'b0;
                      end 
                   stop_c :
                      begin 
                        c_state <=stop_d;
                        scl_oen <=1'b1;
                        sda_oen <=1'b0;
                        sda_chk <=1'b0;
                      end 
                   stop_d :
                      begin 
                        c_state <=idle;
                        cmd_ack <=1'b1;
                        scl_oen <=1'b1;
                        sda_oen <=1'b1;
                        sda_chk <=1'b0;
                      end 
                   rd_a :
                      begin 
                        c_state <=rd_b;
                        scl_oen <=1'b0;
                        sda_oen <=1'b1;
                        sda_chk <=1'b0;
                      end 
                   rd_b :
                      begin 
                        c_state <=rd_c;
                        scl_oen <=1'b1;
                        sda_oen <=1'b1;
                        sda_chk <=1'b0;
                      end 
                   rd_c :
                      begin 
                        c_state <=rd_d;
                        scl_oen <=1'b1;
                        sda_oen <=1'b1;
                        sda_chk <=1'b0;
                      end 
                   rd_d :
                      begin 
                        c_state <=idle;
                        cmd_ack <=1'b1;
                        scl_oen <=1'b0;
                        sda_oen <=1'b1;
                        sda_chk <=1'b0;
                      end 
                   wr_a :
                      begin 
                        c_state <=wr_b;
                        scl_oen <=1'b0;
                        sda_oen <=din;
                        sda_chk <=1'b0;
                      end 
                   wr_b :
                      begin 
                        c_state <=wr_c;
                        scl_oen <=1'b1;
                        sda_oen <=din;
                        sda_chk <=1'b1;
                      end 
                   wr_c :
                      begin 
                        c_state <=wr_d;
                        scl_oen <=1'b1;
                        sda_oen <=din;
                        sda_chk <=1'b1;
                      end 
                   wr_d :
                      begin 
                        c_state <=idle;
                        cmd_ack <=1'b1;
                        scl_oen <=1'b0;
                        sda_oen <=din;
                        sda_chk <=1'b0;
                      end 
                  endcase 
             end
  
  assign scl_o=1'b0; 
  assign sda_o=1'b0; 
endmodule
 
