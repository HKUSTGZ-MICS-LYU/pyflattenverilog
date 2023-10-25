module add_dec (
  output [TWO_BIT-1:0] a_fault_dec_r,
  output reg  [TWO_BIT-1:0] a_fault_dec,
  output reg  a_dig_out,
  output [BANKS_NUMBER-1:0] a_dig_in,
  output reg  add_test_en,
  output [THIRTEEN_BIT-1:0] add_decoded_r,
  output reg  [THIRTEEN_BIT-1:0] add_decoded,
  input rst,
  input clock,
  input [A_BUS_NUMBER-1:0] a_bus) ; 
   wire [THIRTEEN_BIT-1:0] add_decoded_int ;  
   wire [TWO_BIT-1:0] a_fault_dec_int ;  
   wire [BANKS_NUMBER-1:0] a_dig_in_int ;  
   wire a_dig_out_int ;  
   wire add_test_en_int ;  
   wire [4:0] not_a_bus ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_add_dec
 time prop_delay ;
         if (rst==1'b0)
            begin 
              add_decoded <={THIRTEEN_BIT{1'b0}};
              a_fault_dec <={TWO_BIT{1'b0}};
              a_dig_out <=1'b0;
              add_test_en <=1'b0;
            end 
          else 
            begin 
              add_decoded <=add_decoded_int&13'b1111111111111;
              a_fault_dec <=a_fault_dec_int&2'b11;
              a_dig_out <=a_dig_out_int&1'b1;
              add_test_en <=add_test_en_int&1'b1;
            end 
       end
  
  assign a_dig_in={2{a_dig_in_int}}&2'b11; 
  assign add_decoded_r=add_decoded_int&13'b1111111111111; 
  assign a_fault_dec_r=a_fault_dec_int&2'b11; 
  assign not_a_bus[0]=(~(a_bus[0])); 
  assign not_a_bus[1]=(~(a_bus[1])); 
  assign not_a_bus[2]=(~(a_bus[2])); 
  assign not_a_bus[3]=(~(a_bus[3])); 
  assign not_a_bus[4]=(~(a_bus[4])); 
  dwand dwand_add_t1(not_a_bus[4],not_a_bus[3],not_a_bus[2],not_a_bus[1],not_a_bus[0]); 
  dwand dwand_add_t2(not_a_bus[4],not_a_bus[3],not_a_bus[2],not_a_bus[1],a_bus[0]); 
  dwand dwand_add_tab(not_a_bus[4],not_a_bus[3],not_a_bus[2],a_bus[1],not_a_bus[0]); 
  dwand dwand_add_tah(not_a_bus[4],not_a_bus[3],not_a_bus[2],a_bus[1],a_bus[0]); 
  dwand dwand_add_tbb(not_a_bus[4],not_a_bus[3],a_bus[2],not_a_bus[1],not_a_bus[0]); 
  dwand dwand_add_tbh(not_a_bus[4],not_a_bus[3],a_bus[2],not_a_bus[1],a_bus[0]); 
  dwand dwand_add_tonh(not_a_bus[4],not_a_bus[3],a_bus[2],a_bus[1],not_a_bus[0]); 
  dwand dwand_add_tonl(not_a_bus[4],not_a_bus[3],a_bus[2],a_bus[1],a_bus[0]); 
  dwand dwand_add_tp(not_a_bus[4],a_bus[3],not_a_bus[2],not_a_bus[1],not_a_bus[0]); 
  dwand dwand_add_t3_034(not_a_bus[4],a_bus[3],not_a_bus[2],not_a_bus[1],a_bus[0]); 
  dwand dwand_add_t3_125(not_a_bus[4],a_bus[3],not_a_bus[2],a_bus[1],not_a_bus[0]); 
  dwand dwand_add_t4_034(not_a_bus[4],a_bus[3],not_a_bus[2],a_bus[1],a_bus[0]); 
  dwand dwand_add_t4_125(not_a_bus[4],a_bus[3],a_bus[2],not_a_bus[1],not_a_bus[0]); 
  dwand dwand_add_fr1(not_a_bus[4],a_bus[3],a_bus[2],not_a_bus[1],a_bus[0]); 
  dwand dwand_add_fr2(not_a_bus[4],a_bus[3],a_bus[2],a_bus[1],not_a_bus[0]); 
  dwand dwand_a_dig_in_int(not_a_bus[4],a_bus[3],a_bus[2],a_bus[1],a_bus[0]); 
  dwand dwand_a_dig_in_int1(a_bus[4],not_a_bus[3],not_a_bus[2],not_a_bus[1],not_a_bus[0]); 
  dwand dwand_a_dig_out(a_bus[4],not_a_bus[3],not_a_bus[2],not_a_bus[1],a_bus[0]); 
  dwand dwand_add_test_en_int(a_bus[4],not_a_bus[3],not_a_bus[2],a_bus[1],not_a_bus[0]); endmodule 
module anti_glitch (
  output end_t0,
  input rst,
  input cs8,
  input clock) ; 
   reg [2:0] counter ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_count
 time prop_delay ;
         if (rst==1'b0)
            counter <=3'b000;
          else 
            begin 
              if (cs8==1'b1)
                 counter <=3'b000;
               else 
                 counter <=counter+3'b001;
            end 
       end
  
  assign end_t0=counter[0]&counter[1]&counter[2]; endmodule 
module b30 (d_bus_ext,outputvehicle,outputturbo_speed_lev,outputturbo,output[BANKS_NUMBER-1:0]t3,output[INJ_NUMBER-1:0]t2,output[INJ_NUMBER-1:0]t1,outputsmot60,outputseg_speed_lev,outputrpm_out,outputrelpot,outputknock2u,output[BANKS_NUMBER-1:0]knock2,outputknock1u,output[BANKS_NUMBER-1:0]knock1,outputirq,outputin_speed_lev,output[BANKS_NUMBER-1:0]hlo,output[7:0]digital_output,outputcam_smot,input[INJ_NUMBER-1:0]v_fbk,inputvehicle_speed,inputturbo_speed,inputtrg_knock2,inputtrg_knock1,inputseg_speed_pickup,inputseg_speed_hall,inputr_w,inputrpm_in,inputreset,input[SEVEN_BIT-1:0]nssm_in,input[BANKS_NUMBER-1:0]i_fbk,inputin_speed,input[INJ_NUMBER-1:0]inj_cmd,input[SPLIT_NUMBER-1:0]fbk_pwm,inputds,input[TWENTYONE_BIT-1:0]digital_input,inputcs,inputclock,input[A_BUS_NUMBER-1:0]a_bus) ; 
  inj_ctrl instance_inj_ctrl(a_bus,clock,cs,digital_input,ds,fbk_pwm,inj_cmd,in_speed,i_fbk,nssm_in,rpm_in,reset,r_w,seg_speed_hall,seg_speed_pickup,trg_knock1,trg_knock2,turbo_speed,vehicle_speed,v_fbk,cam_smot,clock,digital_output,hlo,in_speed_lev,irq,knock1,knock1u,knock2,knock2u,relpot,rpm_out,seg_speed_lev,smot60,t1,t2,t3,turbo,turbo_speed_lev,vehicle,d_bus_ext); 
  rst_inv instance_rst_inv(reset); endmodule 
module chopper_count (
  output [SEVEN_BIT-1:0] chop_count,
  input rst,
  input cs4,
  input clock) ; 
   reg [SEVEN_BIT-1:0] int_counter ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_chopper_count
 time prop_delay ;
         if (rst==1'b0)
            int_counter <={SEVEN_BIT{1'b0}};
          else 
            begin 
              if (cs4==1'b1)
                 int_counter <={SEVEN_BIT{1'b0}};
               else 
                 int_counter <=int_counter+7'b0000001;
            end 
       end
  
  assign chop_count=int_counter; endmodule 
module clock_gen (
  output clock_o,
  input rst,clock_i) ; 
   reg [3:0] counter ;  
   reg clock_int ;  
  always @(  posedge clock_i or  negedge rst)
       begin :vhdl_clock_gen
 time prop_delay ;
         if (rst==1'b0)
            begin 
              counter <={4{1'b0}};
              clock_int <=1'b0;
            end 
          else 
            begin 
              if (counter==4'b1001)
                 begin 
                   counter <=4'b0000;
                   clock_int <=(~clock_int);
                 end 
               else 
                 counter <=counter+4'b0001;
            end 
       end
  
  assign clock_o=clock_int; endmodule 
module comparator (
  output reg  comp,
  input [REG_BITS-1:0] stop_count_bus,
  input [REG_BITS-1:0] count) ; 
  always @(  count or  stop_count_bus)
       begin :vhdl_comparator
 time prop_delay ;
         if (count==stop_count_bus)
            comp <=1'b1;
          else 
            comp <=1'b0;
       end
  endmodule 
module counter (
  output [REG_BITS-1:0] count,
  input rst,
  input cs1,
  input clock) ; 
   reg [REG_BITS-1:0] int_counter ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_counter
 time prop_delay ;
         if (rst==1'b0)
            int_counter <={REG_BITS{1'b0}};
          else 
            begin 
              if (cs1==1'b1)
                 int_counter <={REG_BITS{1'b0}};
               else 
                 int_counter <=int_counter+11'b00000000001;
            end 
       end
  
  assign count=int_counter; endmodule 
module d_bus_handle (d_bus_ext,d_bus,inputwr_en,inputrst,inputrd_en,inputclock) ; 
   reg [D_BUS_NUMBER-1:0] d_bus_int ;  
  assign d_bus=((wr_en==1'b1))?d_bus_int:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus_ext=((rd_en==1'b1))?d_bus:16'bZZZZZZZZZZZZZZZZ; 
  always @(  posedge clock or  negedge rst)
       begin :vhdl_d_bus_handle
 time prop_delay ;
         if (rst==1'b0)
            d_bus_int <={D_BUS_NUMBER{1'b0}};
          else 
            d_bus_int <=d_bus_ext;
       end
  endmodule 
module d_bus_interface (d_bus_ext,d_bus,outputwr_en,outputrd_en,inputr_w,inputrst,inputds,inputcs,inputclock) ; 
   wire rd_en_internal ;  
   wire wr_en_internal ;  
  d_bus_handle instance_d_bus_handle(clock,rd_en_internal,rst,wr_en_internal,d_bus,d_bus_ext); 
  ds_handle instance_ds_handle(clock,cs,ds,rst,r_w,rd_en_internal,wr_en_internal); 
  assign rd_en=rd_en_internal; 
  assign wr_en=wr_en_internal; endmodule 
module digital_inputs_handle (
  output [D_BUS_NUMBER-1:0] d_bus,
  input rst,
  input rd_en,
  input [SEVEN_BIT-1:0] nssm_in,
  input [SPLIT_NUMBER-1:0] fbk_pwm,
  input [TWENTYONE_BIT-1:0] digital_input,
  input clock,
  input [BANKS_NUMBER-1:0] a_dig_in) ; 
   reg [31:0] store_digital_input ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_digital_inputs_handle
         if (rst==1'b0)
            store_digital_input <={32{1'b0}};
          else 
            begin 
              store_digital_input [20:0]<=digital_input;
              store_digital_input [23:21]<=fbk_pwm;
              store_digital_input [30:24]<=nssm_in;
            end 
       end
  
  assign d_bus=((a_dig_in[0]==1'b1&rd_en==1'b1))?store_digital_input[15:0]:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((a_dig_in[1]==1'b1&rd_en==1'b1))?{1'b0,store_digital_input[30:16]}:16'bZZZZZZZZZZZZZZZZ; endmodule 
module digital_outputs_handle (
  output turbo_speed_lev,
  output trg_knock_en,
  output smot_camme_en,
  output seg_speed_lev,
  output pickup_hall,
  output knock2u,
  output knock1u,
  output in_speed_lev,
  output [7:0] digital_output,
  input wr_en,
  input rst,
  input [D_BUS_NUMBER-1:0] d_bus,
  input clock,
  input a_dig_out) ; 
   reg [7:0] digital_output_store ;  
   reg smot_camme_store ;  
   reg trg_knock_store ;  
   reg knock1_store ;  
   reg knock2_store ;  
   reg in_speed_lev_store ;  
   reg seg_speed_lev_store ;  
   reg turbo_speed_lev_store ;  
   reg pickup_hall_store ;  
  assign digital_output=digital_output_store; 
  assign smot_camme_en=smot_camme_store; 
  assign trg_knock_en=trg_knock_store; 
  assign pickup_hall=pickup_hall_store; 
  assign in_speed_lev=in_speed_lev_store; 
  assign seg_speed_lev=seg_speed_lev_store; 
  assign turbo_speed_lev=turbo_speed_lev_store; 
  assign knock1u=knock1_store; 
  assign knock2u=knock2_store; 
  always @(  posedge clock or  negedge rst)
       begin :vhdl_digital_outputs_handle
 time prop_delay ;
         if (rst==1'b0)
            begin 
              digital_output_store <={8{1'b0}};
              smot_camme_store <=1'b0;
              trg_knock_store <=1'b0;
              pickup_hall_store <=1'b0;
              in_speed_lev_store <=1'b0;
              seg_speed_lev_store <=1'b0;
              turbo_speed_lev_store <=1'b0;
              knock1_store <=1'b0;
              knock2_store <=1'b0;
            end 
          else 
            begin 
              if (a_dig_out==1'b1&wr_en==1'b1)
                 begin 
                   digital_output_store <=d_bus[7:0];
                   smot_camme_store <=d_bus[8];
                   trg_knock_store <=d_bus[9];
                   pickup_hall_store <=d_bus[10];
                   in_speed_lev_store <=d_bus[11];
                   seg_speed_lev_store <=d_bus[12];
                   turbo_speed_lev_store <=d_bus[13];
                   knock1_store <=d_bus[14];
                   knock2_store <=d_bus[15];
                 end 
            end 
       end
  endmodule 
module ds_handle (
  output reg  wr_en,
  output rd_en,
  input r_w,
  input rst,
  input ds,
  input cs,
  input clock) ; 
   wire wr_en_int ;  
  assign rd_en=(~(cs))&r_w; 
  assign wr_en_int=(~(cs))&(~(ds))&(~(r_w)); 
  always @(  posedge clock or  negedge rst)
       begin :vhdl_ds_handle
 time prop_delay ;
         if (rst==1'b0)
            wr_en <=1'b0;
          else 
            wr_en <=wr_en_int;
       end
  endmodule 
module dwand (
  output o,
  input i4,
  input i3,
  input i2,
  input i1,
  input i0) ; 
  assign o=(i0&i1&i2&i3&i4); endmodule 
module enable_fbk_chk (
  output [GLOB_STATE_BITS-1:0] global_state_store,
  output reg  en_state_store,
  output reg  en_fbk_store,
  output reg  enable_check,
  input test_en_cur,
  input rst,
  input [GLOB_STATE_BITS-1:0] global_state,
  input clock) ; 
   reg [6:0] global_state_store_int ;  
   reg [THREE_BIT-1:0] delay_counter ;  
  always @(  posedge clock or  negedge rst)
       if (rst==1'b0)
          global_state_store_int <=7'b0000000;
        else 
          global_state_store_int <=global_state;
 
  always @(  posedge clock or  negedge rst)
       if (rst==1'b0)
          delay_counter <=3'b000;
        else 
          begin 
            if (global_state_store_int!=global_state)
               delay_counter <=3'b000;
             else 
               if (delay_counter[2]==1'b0)
                  delay_counter <=delay_counter+3'b001;
          end
  
  always @(    delay_counter[2] or  test_en_cur or  global_state or  global_state_store_int)
       begin 
         if ((delay_counter[2]==1'b1)&(test_en_cur==1'b1)&(global_state==global_state_store_int))
            enable_check <=1'b1;
          else 
            enable_check <=1'b0;
         if (global_state_store_int!=global_state)
            begin 
              if (global_state[6:5]!=2'b11)
                 begin 
                   en_state_store <=1'b1;
                   en_fbk_store <=1'b1;
                 end 
               else 
                 begin 
                   en_state_store <=1'b0;
                   en_fbk_store <=1'b1;
                 end 
            end 
          else 
            begin 
              en_state_store <=1'b0;
              en_fbk_store <=1'b0;
            end 
       end
  
  assign global_state_store=global_state; endmodule 
module error_handle (d_bus,output[ST_REG_NUM-1:0]status_reg_125,output[ST_REG_NUM-1:0]status_reg_034,outputrelpot,inputwr_en,input[INJ_NUMBER-1:0]v_fbk_f,inputrst,inputrel_pot_en,inputrd_en,input[BANKS_NUMBER-1:0]i_fbk_f,input[GLOB_STATE_BITS-1:0]global_state_125,input[GLOB_STATE_BITS-1:0]global_state_034,inputen_state_store_125,inputen_state_store_034,inputen_fbk_store_125,inputen_fbk_store_034,inputclock,input[TWO_BIT-1:0]a_fault_dec_r,input[TWO_BIT-1:0]a_fault_dec) ; 
   reg [10:0] sr_034 ;  
   reg [10:0] sr_125 ;  
  assign status_reg_034=sr_034[10:0]; 
  assign status_reg_125=sr_125[10:0]; 
  assign relpot=rel_pot_en; 
  always @(    posedge clock or  negedge rst or  a_fault_dec or  posedge wr_en)
       begin :vhdl_st_reg_wr_034
 time prop_delay ;
         if ((rst==1'b0)|(a_fault_dec[0]==1'b1&wr_en==1'b1))
            sr_034 <={11{1'b0}};
          else 
            begin 
              if (en_state_store_034==1'b1)
                 sr_034 [6:0]<=global_state_034;
              if (en_fbk_store_034==1'b1)
                 begin 
                   sr_034 [7]<=i_fbk_f[0];
                   sr_034 [8]<=v_fbk_f[0];
                   sr_034 [9]<=v_fbk_f[3];
                   sr_034 [10]<=v_fbk_f[4];
                 end 
            end 
       end
  
  always @(    posedge clock or  negedge rst or  a_fault_dec or  posedge wr_en)
       begin :vhdl_st_reg_wr_125
 time prop_delay ;
         if ((rst==1'b0)|(a_fault_dec[1]==1'b1&wr_en==1'b1))
            sr_125 <={11{1'b0}};
          else 
            begin 
              if (en_state_store_125==1'b1)
                 sr_125 [6:0]<=global_state_125;
              if (en_fbk_store_125==1'b1)
                 begin 
                   sr_125 [7]<=i_fbk_f[1];
                   sr_125 [8]<=v_fbk_f[1];
                   sr_125 [9]<=v_fbk_f[2];
                   sr_125 [10]<=v_fbk_f[5];
                 end 
            end 
       end
  
  assign d_bus=((a_fault_dec_r[0]==1'b1&rd_en==1'b1))?{5'b00000,sr_034}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((a_fault_dec_r[1]==1'b1&rd_en==1'b1))?{5'b00000,sr_125}:16'bZZZZZZZZZZZZZZZZ; endmodule 
module filter (
  output reg  filtered_value,
  input rst,
  input new_value,
  input clock) ; 
 parameter[2:0] filter_state_type_start_state =0,filter_state_type_zero_1=1,filter_state_type_zero_2=2,filter_state_type_zero_3=3,filter_state_type_one_0=4,filter_state_type_one_1=5,filter_state_type_one_2=6,filter_state_type_one_3=7; 
   reg [2:0] current_state ;  
   reg [2:0] next_state ;  
  always @(   posedge clock or  new_value or  negedge rst)
       begin :clocked
         if (rst==1'b0)
            current_state <=filter_state_type_start_state;
          else 
            current_state <=next_state;
       end
  
  always @(    current_state or  clock or  new_value or  rst)
       begin :set_next_state
         next_state <=current_state;
         case (current_state)
          filter_state_type_start_state :
             if (new_value==1'b0)
                next_state <=filter_state_type_start_state;
              else 
                if (new_value==1'b1)
                   next_state <=filter_state_type_zero_1;
          filter_state_type_zero_1 :
             if (new_value==1'b1)
                next_state <=filter_state_type_zero_2;
              else 
                if (new_value==1'b0)
                   next_state <=filter_state_type_start_state;
          filter_state_type_zero_2 :
             if (new_value==1'b1)
                next_state <=filter_state_type_zero_3;
              else 
                if (new_value==1'b0)
                   next_state <=filter_state_type_zero_1;
          filter_state_type_zero_3 :
             if (new_value==1'b1)
                next_state <=filter_state_type_one_0;
              else 
                if (new_value==1'b0)
                   next_state <=filter_state_type_zero_2;
          filter_state_type_one_0 :
             if (new_value==1'b1)
                next_state <=filter_state_type_one_0;
              else 
                if (new_value==1'b0)
                   next_state <=filter_state_type_one_1;
          filter_state_type_one_1 :
             if (new_value==1'b1)
                next_state <=filter_state_type_one_0;
              else 
                if (new_value==1'b0)
                   next_state <=filter_state_type_one_2;
          filter_state_type_one_2 :
             if (new_value==1'b1)
                next_state <=filter_state_type_one_1;
              else 
                if (new_value==1'b0)
                   next_state <=filter_state_type_one_3;
          filter_state_type_one_3 :
             if (new_value==1'b1)
                next_state <=filter_state_type_one_2;
              else 
                if (new_value==1'b0)
                   next_state <=filter_state_type_start_state;
          default :;
         endcase 
       end
  
  always @( current_state)
       begin :unclocked
         case (current_state)
          filter_state_type_start_state :
             filtered_value <=1'b0;
          filter_state_type_zero_1 :
             filtered_value <=1'b0;
          filter_state_type_zero_2 :
             filtered_value <=1'b0;
          filter_state_type_zero_3 :
             filtered_value <=1'b0;
          filter_state_type_one_0 :
             filtered_value <=1'b1;
          filter_state_type_one_1 :
             filtered_value <=1'b1;
          filter_state_type_one_2 :
             filtered_value <=1'b1;
          filter_state_type_one_3 :
             filtered_value <=1'b1;
          default :;
         endcase 
       end
  endmodule 
module filter_feedback (
  output [INJ_NUMBER-1:0] v_fbk_f,
  output [BANKS_NUMBER-1:0] i_fbk_f,
  input [INJ_NUMBER-1:0] v_fbk,
  input rst,
  input [BANKS_NUMBER-1:0] i_fbk,
  input clock) ; 
   wire v_fbk_0 ;  
   wire v_fbk_f0 ;  
   wire v_fbk_1 ;  
   wire v_fbk_f1 ;  
   wire v_fbk_2 ;  
   wire v_fbk_f2 ;  
   wire v_fbk_3 ;  
   wire v_fbk_f3 ;  
   wire v_fbk_4 ;  
   wire v_fbk_f4 ;  
   wire v_fbk_5 ;  
   wire v_fbk_f5 ;  
   wire i_fbk_0 ;  
   wire i_fbk_f0 ;  
   wire i_fbk_1 ;  
   wire i_fbk_f1 ;  
  filtering instance_filt0(clock,v_fbk_0,rst,v_fbk_f0); 
  filtering instance_filt1(clock,v_fbk_1,rst,v_fbk_f1); 
  filtering instance_filt2(clock,v_fbk_2,rst,v_fbk_f2); 
  filtering instance_filt3(clock,v_fbk_3,rst,v_fbk_f3); 
  filtering instance_filt4(clock,v_fbk_4,rst,v_fbk_f4); 
  filtering instance_filt5(clock,v_fbk_5,rst,v_fbk_f5); 
  filtering instance_filt6(clock,i_fbk_0,rst,i_fbk_f0); 
  filtering instance_filt7(clock,i_fbk_1,rst,i_fbk_f1); 
  interface instance_interface(i_fbk,i_fbk_f0,i_fbk_f1,v_fbk,v_fbk_f0,v_fbk_f1,v_fbk_f2,v_fbk_f3,v_fbk_f4,v_fbk_f5,i_fbk_0,i_fbk_1,i_fbk_f,v_fbk_0,v_fbk_1,v_fbk_2,v_fbk_3,v_fbk_4,v_fbk_5,v_fbk_f); endmodule 
module filtering (
  output filtered_value,
  input rst,
  input new_value,
  input clock) ; 
  filter instance_filter(clock,new_value,rst,filtered_value); endmodule 
module fsm (
  output t3,
  output t2,
  output t1,
  output relpot,
  output hl,
  output [GLOB_STATE_BITS-1:0] global_state_store,
  output error,
  output en_state_store,
  output en_fbk_store,
  output cs8,
  output cs4,
  output cs2,
  output cs1,
  output [FOUR_BIT-1:0] cs0,
  input [SPLIT_NUMBER-1:0] v_fbk_mask,
  input v_fbk_cur,
  input th_0,
  input test_en_cur,
  input t4_0,
  input [ST_REG_NUM-1:0] status_reg,
  input sh_mode,
  input rst,
  input i_fbk,
  input [SPLIT_NUMBER-1:0] inj_cmd,
  input end_t0,
  input end_period,
  input end_on,
  input comp,
  input [SPLIT_NUMBER-1:0] cmd_stored,
  input clock) ; 
   wire [GLOB_STATE_BITS-1:0] global_state ;  
   wire enable_check ;  
   wire [FIVE_BIT-1:0] cur_state ;  
   wire cs11 ;  
   wire global1_state ;  
   wire cs111 ;  
   wire t31 ;  
   wire [TWO_BIT-1:0] global2_state ;  
   wire cs42 ;  
   wire t12 ;  
   wire [TWO_BIT-1:0] global4_state ;  
   wire cs44 ;  
   wire t14 ;  
   wire en_fbk_store_internal ;  
  enable_fbk_chk instance_enable_fbk_chk(clock,global_state,rst,test_en_cur,enable_check,en_fbk_store_internal,en_state_store,global_state_store); 
  fsm_output_handle instance_fsm_output_handle(cur_state,en_fbk_store_internal,cs0,cs11,error,relpot); 
  ph1_handle instance_ph1_handle(clock,cmd_stored,cur_state,end_t0,inj_cmd,rst,global1_state); 
  ph1_output_handle instance_ph1_output_handle(global1_state,cs111,t31); 
  ph2_handle instance_ph2_handle(clock,cur_state,end_on,end_period,i_fbk,rst,sh_mode,global2_state); 
  ph2_output_handle instance_ph2_output_handle(global2_state,cs42,t12); 
  ph4_handle instance_ph4_handle(clock,cur_state,end_on,end_period,i_fbk,rst,sh_mode,global4_state); 
  ph4_output_handle instance_ph4_output_handle(global4_state,cs44,t14); 
  sel_actuator instance_sel_actuator(cur_state,t12,t14,t31,hl,t1,t2,t3); 
  sel_chop_control instance_sel_chop_control(cs42,cs44,cur_state,cs4); 
  sel_glob_count_cs instance_sel_glob_count_cs(cs11,cs111,cur_state,global1_state,cs1,cs2,cs8); 
  sel_global_state instance_sel_global_state(cur_state,global1_state,global2_state,global4_state,global_state); 
  state_progression instance_state_progression(clock,cmd_stored,comp,enable_check,end_t0,global_state,inj_cmd,i_fbk,rst,sh_mode,status_reg,t4_0,th_0,v_fbk_cur,v_fbk_mask,cur_state); 
  assign en_fbk_store=en_fbk_store_internal; endmodule 
module fsm_output_handle (
  output relpot,
  output error,
  output reg  cs11,
  output [FOUR_BIT-1:0] cs0,
  input en_fbk_store,
  input [FIVE_BIT-1:0] cur_state) ; 
  assign relpot=cur_state[4]&cur_state[3]&cur_state[2]&cur_state[0]; 
  assign cs0=cur_state[4:1]; 
  assign error=cur_state[4]&cur_state[3]&cur_state[2]&(~(en_fbk_store)); 
  always @( cur_state)
       case (cur_state)
        5 'b00000:
           cs11 <=1'b1;
        5 'b00010:
           cs11 <=1'b1;
        5 'b00100:
           cs11 <=1'b1;
        5 'b00110:
           cs11 <=1'b1;
        5 'b01000:
           cs11 <=1'b1;
        5 'b01010:
           cs11 <=1'b1;
        5 'b01100:
           cs11 <=1'b1;
        5 'b01110:
           cs11 <=1'b1;
        5 'b11000:
           cs11 <=1'b1;
        default :
           cs11 <=1'b0;
       endcase
  endmodule 
module in_reg (d_bus,output[SEVEN_BIT-1:0]r_tp,output[SEVEN_BIT-1:0]r_tonl,output[SEVEN_BIT-1:0]r_tonh,output[REG_BITS-1:0]r_th_125,output[REG_BITS-1:0]r_th_034,output[TEN_BIT-1:0]r_tb_125,output[TEN_BIT-1:0]r_tb_034,output[SEVEN_BIT-1:0]r_t4_125,output[SEVEN_BIT-1:0]r_t4_034,output[EIGHT_BIT-1:0]r_t3_125,output[EIGHT_BIT-1:0]r_t3_034,output[SEVEN_BIT-1:0]r_t2,output[EIGHT_BIT-1:0]r_t1,inputwr_en,inputrst,inputrd_en,inputclock,input[THIRTEEN_BIT-1:0]add_decoded_r,input[THIRTEEN_BIT-1:0]add_decoded) ; 
   reg [REG_BITS-1:0] th_034 ;  
   reg [REG_BITS-1:0] th_125 ;  
   reg [SEVEN_BIT-1:0] t2 ;  
   reg [SEVEN_BIT-1:0] tp ;  
   reg [SEVEN_BIT-1:0] t4_034 ;  
   reg [SEVEN_BIT-1:0] t4_125 ;  
   reg [SEVEN_BIT-1:0] tonh ;  
   reg [SEVEN_BIT-1:0] tonl ;  
   reg [EIGHT_BIT-1:0] t1 ;  
   reg [EIGHT_BIT-1:0] t3_034 ;  
   reg [EIGHT_BIT-1:0] t3_125 ;  
   reg [TEN_BIT-1:0] tb_034 ;  
   reg [TEN_BIT-1:0] tb_125 ;  
  assign r_t1=t1; 
  assign r_t2=t2; 
  assign r_tb_034=tb_034; 
  assign r_th_034=th_034; 
  assign r_tb_125=tb_125; 
  assign r_th_125=th_125; 
  assign r_tonh=tonh; 
  assign r_tonl=tonl; 
  assign r_tp=tp; 
  assign r_t3_034=t3_034; 
  assign r_t3_125=t3_125; 
  assign r_t4_034=t4_034; 
  assign r_t4_125=t4_125; 
  always @(  posedge clock or  negedge rst)
       begin :vhdl_in_reg
 time prop_delay ;
         if (rst==1'b0)
            begin 
              t1 <={EIGHT_BIT{1'b0}};
              t2 <={SEVEN_BIT{1'b0}};
              tb_034 <={TEN_BIT{1'b0}};
              th_034 <={REG_BITS{1'b0}};
              tb_125 <={TEN_BIT{1'b0}};
              th_125 <={REG_BITS{1'b0}};
              tonh <={SEVEN_BIT{1'b0}};
              tonl <={SEVEN_BIT{1'b0}};
              tp <={SEVEN_BIT{1'b0}};
              t3_034 <={EIGHT_BIT{1'b0}};
              t3_125 <={EIGHT_BIT{1'b0}};
              t4_034 <={SEVEN_BIT{1'b0}};
              t4_125 <={SEVEN_BIT{1'b0}};
            end 
          else 
            begin 
              if (wr_en==1'b1)
                 begin 
                   if (add_decoded[0]==1'b1)
                      t1 <=d_bus[7:0];
                   if (add_decoded[1]==1'b1)
                      t2 <=d_bus[6:0];
                   if (add_decoded[2]==1'b1)
                      tb_034 <=d_bus[9:0];
                   if (add_decoded[3]==1'b1)
                      th_034 <=d_bus[11:0];
                   if (add_decoded[4]==1'b1)
                      tb_125 <=d_bus[9:0];
                   if (add_decoded[5]==1'b1)
                      th_125 <=d_bus[11:0];
                   if (add_decoded[6]==1'b1)
                      tonh <=d_bus[6:0];
                   if (add_decoded[7]==1'b1)
                      tonl <=d_bus[6:0];
                   if (add_decoded[8]==1'b1)
                      tp <=d_bus[6:0];
                   if (add_decoded[9]==1'b1)
                      t3_034 <=d_bus[7:0];
                   if (add_decoded[10]==1'b1)
                      t3_125 <=d_bus[7:0];
                   if (add_decoded[11]==1'b1)
                      t4_034 <=d_bus[6:0];
                   if (add_decoded[12]==1'b1)
                      t4_125 <=d_bus[6:0];
                 end 
            end 
       end
  
  assign d_bus=((add_decoded_r[0]==1'b1&rd_en==1'b1))?{8'b00000000,t1}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[1]==1'b1&rd_en==1'b1))?{9'b000000000,t2}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[2]==1'b1&rd_en==1'b1))?{6'b000000,tb_034}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[3]==1'b1&rd_en==1'b1))?{4'b0000,th_034}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[4]==1'b1&rd_en==1'b1))?{6'b000000,tb_125}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[5]==1'b1&rd_en==1'b1))?{4'b0000,th_125}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[6]==1'b1&rd_en==1'b1))?{9'b000000000,tonh}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[7]==1'b1&rd_en==1'b1))?{9'b000000000,tonl}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[8]==1'b1&rd_en==1'b1))?{9'b000000000,tp}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[9]==1'b1&rd_en==1'b1))?{8'b00000000,t3_034}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[10]==1'b1&rd_en==1'b1))?{8'b00000000,t3_125}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[11]==1'b1&rd_en==1'b1))?{9'b000000000,t4_034}:16'bZZZZZZZZZZZZZZZZ; 
  assign d_bus=((add_decoded_r[12]==1'b1&rd_en==1'b1))?{9'b000000000,t4_125}:16'bZZZZZZZZZZZZZZZZ; endmodule 
module inj_block (
  output t3,
  output t2c,
  output t2b,
  output t2a,
  output t1c,
  output t1b,
  output t1a,
  output relpot,
  output hl,
  output [GLOB_STATE_BITS-1:0] global_state_store,
  output error,
  output en_state_store,
  output en_fbk_store,
  input [SPLIT_NUMBER-1:0] v_fbk,
  input [THREE_BIT-1:0] test_en,
  input [ST_REG_NUM-1:0] status_reg,
  input [SEVEN_BIT-1:0] r_tp,
  input [SEVEN_BIT-1:0] r_tonl,
  input [SEVEN_BIT-1:0] r_tonh,
  input [REG_BITS-1:0] r_th,
  input [TEN_BIT-1:0] r_tb,
  input [SEVEN_BIT-1:0] r_t4,
  input [EIGHT_BIT-1:0] r_t3,
  input [SEVEN_BIT-1:0] r_t2,
  input [EIGHT_BIT-1:0] r_t1,
  input rst,
  input i_fbk,
  input [SPLIT_NUMBER-1:0] inj_cmd,
  input clock) ; 
   wire cs8 ;  
   wire end_t0 ;  
   wire cs4 ;  
   wire [SEVEN_BIT-1:0] chop_count ;  
   wire [REG_BITS-1:0] count ;  
   wire [REG_BITS-1:0] stop_count_bus ;  
   wire comp ;  
   wire cs1 ;  
   wire [SPLIT_NUMBER-1:0] cmd_stored ;  
   wire end_on ;  
   wire end_period ;  
   wire sh_mode ;  
   wire t4_0 ;  
   wire test_en_cur ;  
   wire th_0 ;  
   wire v_fbk_cur ;  
   wire [SPLIT_NUMBER-1:0] v_fbk_mask ;  
   wire [FOUR_BIT-1:0] cs0 ;  
   wire cs2 ;  
   wire t1 ;  
   wire t2 ;  
   wire [SEVEN_BIT-1:0] ton_reg ;  
   wire [SEVEN_BIT-1:0] tp_reg ;  
  anti_glitch instance_anti_glitch(clock,cs8,rst,end_t0); 
  chopper_count instance_chopper_count(clock,cs4,rst,chop_count); 
  comparator instance_comparator(count,stop_count_bus,comp); 
  counter instance_counter(clock,cs1,rst,count); 
  fsm instance_fsm(clock,cmd_stored,comp,end_on,end_period,end_t0,inj_cmd,i_fbk,rst,sh_mode,status_reg,t4_0,test_en_cur,th_0,v_fbk_cur,v_fbk_mask,cs0,cs1,cs2,cs4,cs8,en_fbk_store,en_state_store,error,global_state_store,hl,relpot,t1,t2,t3); 
  internal_register instance_internal_register(clock,cs0,cs2,rst,r_t1,r_t2,r_t3,r_t4,r_tb,r_th,r_tonh,r_tonl,r_tp,sh_mode,stop_count_bus,t4_0,th_0,ton_reg,tp_reg); 
  on_comp instance_on_comp(chop_count,ton_reg,end_on); 
  output_decoder instance_output_decoder(cmd_stored,t1,t2,t1a,t1b,t1c,t2a,t2b,t2c); 
  period_comp instance_period_comp(chop_count,tp_reg,end_period); 
  sel_cmd instance_sel_cmd(clock,cs2,inj_cmd,rst,test_en,v_fbk,cmd_stored,test_en_cur,v_fbk_cur,v_fbk_mask); endmodule 
module inj_ctrl (d_bus_ext,outputvehicle,outputturbo_speed_lev,outputturbo,output[BANKS_NUMBER-1:0]t3,output[INJ_NUMBER-1:0]t2,output[INJ_NUMBER-1:0]t1,outputsmot60,outputseg_speed_lev,outputrpm_out,outputrelpot,outputknock2u,output[BANKS_NUMBER-1:0]knock2,outputknock1u,output[BANKS_NUMBER-1:0]knock1,outputirq,outputin_speed_lev,output[BANKS_NUMBER-1:0]hlo,output[7:0]digital_output,outputcam_smot,input[INJ_NUMBER-1:0]v_fbk,inputvehicle_speed,inputturbo_speed,inputtrg_knock2,inputtrg_knock1,inputseg_speed_pickup,inputseg_speed_hall,inputr_w,inputrst,inputrpm_in,input[SEVEN_BIT-1:0]nssm_in,input[BANKS_NUMBER-1:0]i_fbk,inputin_speed,input[INJ_NUMBER-1:0]inj_cmd,input[SPLIT_NUMBER-1:0]fbk_pwm,inputds,input[TWENTYONE_BIT-1:0]digital_input,inputcs,inputclock,input[A_BUS_NUMBER-1:0]a_bus) ; 
   wire [SPLIT_NUMBER-1:0] inj_cmd_034 ;  
   wire i_fbk_034 ;  
   wire [EIGHT_BIT-1:0] r_t1 ;  
   wire [SEVEN_BIT-1:0] r_t2 ;  
   wire [EIGHT_BIT-1:0] r_t3_034 ;  
   wire [SEVEN_BIT-1:0] r_t4_034 ;  
   wire [TEN_BIT-1:0] r_tb_034 ;  
   wire [REG_BITS-1:0] r_th_034 ;  
   wire [SEVEN_BIT-1:0] r_tonh ;  
   wire [SEVEN_BIT-1:0] r_tonl ;  
   wire [SEVEN_BIT-1:0] r_tp ;  
   wire [ST_REG_NUM-1:0] status_reg_034 ;  
   wire [THREE_BIT-1:0] test_en_034 ;  
   wire [SPLIT_NUMBER-1:0] v_fbk_034 ;  
   wire en_fbk_store_034 ;  
   wire en_state_store_034 ;  
   wire error1 ;  
   wire [GLOB_STATE_BITS-1:0] global_state_034 ;  
   wire hl_034 ;  
   wire relpot1 ;  
   wire t1_0 ;  
   wire t1_3 ;  
   wire t1_4 ;  
   wire t2_0 ;  
   wire t2_3 ;  
   wire t2_4 ;  
   wire t3_034 ;  
   wire [SPLIT_NUMBER-1:0] inj_cmd_125 ;  
   wire i_fbk_125 ;  
   wire [EIGHT_BIT-1:0] r_t3_125 ;  
   wire [SEVEN_BIT-1:0] r_t4_125 ;  
   wire [TEN_BIT-1:0] r_tb_125 ;  
   wire [REG_BITS-1:0] r_th_125 ;  
   wire [ST_REG_NUM-1:0] status_reg_125 ;  
   wire [THREE_BIT-1:0] test_en_125 ;  
   wire [SPLIT_NUMBER-1:0] v_fbk_125 ;  
   wire en_fbk_store_125 ;  
   wire en_state_store_125 ;  
   wire error2 ;  
   wire [GLOB_STATE_BITS-1:0] global_state_125 ;  
   wire hl_125 ;  
   wire relpot2 ;  
   wire t1_1 ;  
   wire t1_2 ;  
   wire t1_5 ;  
   wire t2_1 ;  
   wire t2_2 ;  
   wire t2_5 ;  
   wire t3_125 ;  
   wire rd_en ;  
   wire wr_en ;  
   wire [D_BUS_NUMBER-1:0] d_bus ;  
   wire [BANKS_NUMBER-1:0] i_fbk_f ;  
   wire [INJ_NUMBER-1:0] v_fbk_f ;  
   wire rel_pot_en ;  
   wire pickup_hall ;  
   wire smot_camme_en ;  
   wire trg_knock_en ;  
   wire clock_internal ;  
  inj_block instance_block_034(clock_internal,inj_cmd_034,i_fbk_034,rst,r_t1,r_t2,r_t3_034,r_t4_034,r_tb_034,r_th_034,r_tonh,r_tonl,r_tp,status_reg_034,test_en_034,v_fbk_034,en_fbk_store_034,en_state_store_034,error1,global_state_034,hl_034,relpot1,t1_0,t1_3,t1_4,t2_0,t2_3,t2_4,t3_034); 
  inj_block instance_block_125(clock_internal,inj_cmd_125,i_fbk_125,rst,r_t1,r_t2,r_t3_125,r_t4_125,r_tb_125,r_th_125,r_tonh,r_tonl,r_tp,status_reg_125,test_en_125,v_fbk_125,en_fbk_store_125,en_state_store_125,error2,global_state_125,hl_125,relpot2,t1_1,t1_2,t1_5,t2_1,t2_2,t2_5,t3_125); 
  clock_gen instance_clock_gen(clock,rst,clock_internal); 
  d_bus_interface instance_d_bus_interface(clock,cs,ds,rst,r_w,rd_en,wr_en,d_bus,d_bus_ext); 
  filter_feedback instance_filter_feedback(clock_internal,i_fbk,rst,v_fbk,i_fbk_f,v_fbk_f); 
  merge instance_merge(error1,error2,hl_034,hl_125,relpot1,relpot2,hlo,irq,rel_pot_en); 
  merge_actuators instance_merge_actuators(t1_0,t1_1,t1_2,t1_3,t1_4,t1_5,t2_0,t2_1,t2_2,t2_3,t2_4,t2_5,t3_034,t3_125,t1,t2,t3); 
  registers instance_registers(a_bus,clock_internal,clock,digital_input,en_fbk_store_034,en_fbk_store_125,en_state_store_034,en_state_store_125,fbk_pwm,global_state_034,global_state_125,i_fbk_f,nssm_in,rd_en,rel_pot_en,rst,v_fbk_f,wr_en,digital_output,in_speed_lev,knock1u,knock2u,pickup_hall,relpot,r_t1,r_t2,r_t3_034,r_t3_125,r_t4_034,r_t4_125,r_tb_034,r_tb_125,r_th_034,r_th_125,r_tonh,r_tonl,r_tp,seg_speed_lev,smot_camme_en,status_reg_034,status_reg_125,test_en_034,test_en_125,trg_knock_en,turbo_speed_lev,d_bus); 
  smot_knock_handle instance_smot_knock_handle(clock_internal,in_speed,pickup_hall,rst,seg_speed_hall,seg_speed_pickup,smot_camme_en,trg_knock1,trg_knock2,trg_knock_en,cam_smot,knock1,knock2,smot60); 
  split instance_split(clock_internal,rst,inj_cmd,i_fbk_f,v_fbk_f,inj_cmd_034,inj_cmd_125,i_fbk_034,i_fbk_125,v_fbk_034,v_fbk_125); 
  turbo_vehicle_speed instance_turbo_vehicle_speed(rpm_in,turbo_speed,vehicle_speed,rpm_out,turbo,vehicle); 
  assign clock=clock_internal; endmodule 
module interface (
  output [INJ_NUMBER-1:0] v_fbk_f,
  output v_fbk_5,
  output v_fbk_4,
  output v_fbk_3,
  output v_fbk_2,
  output v_fbk_1,
  output v_fbk_0,
  output [BANKS_NUMBER-1:0] i_fbk_f,
  output i_fbk_1,
  output i_fbk_0,
  input v_fbk_f5,
  input v_fbk_f4,
  input v_fbk_f3,
  input v_fbk_f2,
  input v_fbk_f1,
  input v_fbk_f0,
  input [INJ_NUMBER-1:0] v_fbk,
  input i_fbk_f1,
  input i_fbk_f0,
  input [BANKS_NUMBER-1:0] i_fbk) ; 
  assign v_fbk_0=v_fbk[0]; 
  assign v_fbk_1=v_fbk[1]; 
  assign v_fbk_2=v_fbk[2]; 
  assign v_fbk_3=v_fbk[3]; 
  assign v_fbk_4=v_fbk[4]; 
  assign v_fbk_5=v_fbk[5]; 
  assign v_fbk_f[0]=v_fbk_f0; 
  assign v_fbk_f[1]=v_fbk_f1; 
  assign v_fbk_f[2]=v_fbk_f2; 
  assign v_fbk_f[3]=v_fbk_f3; 
  assign v_fbk_f[4]=v_fbk_f4; 
  assign v_fbk_f[5]=v_fbk_f5; 
  assign i_fbk_0=(~(i_fbk[0])); 
  assign i_fbk_1=(~(i_fbk[1])); 
  assign i_fbk_f[0]=i_fbk_f0; 
  assign i_fbk_f[1]=i_fbk_f1; endmodule 
module internal_register (
  output [SEVEN_BIT-1:0] tp_reg,
  output [SEVEN_BIT-1:0] ton_reg,
  output th_0,
  output t4_0,
  output [REG_BITS-1:0] stop_count_bus,
  output sh_mode,
  input [SEVEN_BIT-1:0] r_tp,
  input [SEVEN_BIT-1:0] r_tonl,
  input [SEVEN_BIT-1:0] r_tonh,
  input [REG_BITS-1:0] r_th,
  input [TEN_BIT-1:0] r_tb,
  input [SEVEN_BIT-1:0] r_t4,
  input [EIGHT_BIT-1:0] r_t3,
  input [SEVEN_BIT-1:0] r_t2,
  input [EIGHT_BIT-1:0] r_t1,
  input rst,
  input cs2,
  input [FOUR_BIT-1:0] cs0,
  input clock) ; 
   reg [REG_BITS-1:0] th ;  
   reg [TEN_BIT-1:0] tb ;  
   reg [SEVEN_BIT-1:0] tonh ;  
   reg [SEVEN_BIT-1:0] tonl ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_internal_register
 time prop_delay ;
         if (rst==1'b0)
            begin 
              tb <={TEN_BIT{1'b0}};
              th <={REG_BITS{1'b0}};
              tonh <={SEVEN_BIT{1'b0}};
              tonl <={SEVEN_BIT{1'b0}};
            end 
          else 
            begin 
              if (cs2==1'b1)
                 begin 
                   tb <=r_tb;
                   th <=r_th;
                   tonh <=r_tonh;
                   tonl <=r_tonl;
                 end 
            end 
       end
  
  assign tp_reg=r_tp; 
  assign sh_mode=tb[9]; 
  assign th_0=(~(th[0]|th[1]|th[2]|th[3]|th[4]|th[5]|th[6]|th[7]|th[8]|th[9]|th[10]|th[11])); 
  assign t4_0=(~(r_t4[6]|r_t4[5]|r_t4[4]|r_t4[3])); 
  assign stop_count_bus=(cs0==4'b0000)?{5'b00000,r_t1[7:1]}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b0000)?tonh:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0==4'b0001)?{5'b00000,r_t1[7:1]}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b0001)?tonh:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0==4'b0010)?{3'b000,tb[8:0]}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b0010)?tonh:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0==4'b0011)?{5'b00000,r_t2}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b0011)?tonl:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0==4'b0100)?th:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b0100)?tonl:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0==4'b0101)?{5'b00000,r_t1[7:1]}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b0101)?tonl:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0==4'b0110)?{4'b0000,r_t3}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b0110)?tonl:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0==4'b0111)?{3'b000,r_t1,1'b0}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b0111)?tonl:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0==4'b1100)?{5'b00000,r_t4}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0==4'b1100)?tonl:7'bZZZZZZZ; 
  assign stop_count_bus=(cs0[3:1]==3'b111)?{4'b0000,r_t1}:12'bZZZZZZZZZZZZ; 
  assign ton_reg=(cs0[3:1]==3'b111)?tonl:7'bZZZZZZZ; endmodule 
module knock_comp1 (
  output long,
  output impulse,
  input en_comp1,
  input [INJ_NUMBER-1:0] count1) ; 
  assign impulse=(count1[5]|count1[4]|count1[3])&(~(en_comp1)); 
  assign long=count1[0]&count1[1]&count1[2]&count1[3]&count1[4]&count1[5]; endmodule 
module knock_comp2 (
  output long,
  output impulse,
  input en_comp2,
  input [INJ_NUMBER-1:0] count2) ; 
  assign impulse=(count2[5]|count2[4]|count2[3])&(~(en_comp2)); 
  assign long=count2[0]&count2[1]&count2[2]&count2[3]&count2[4]&count2[5]; endmodule 
module knock_count1 (
  output en_comp1,
  output [INJ_NUMBER-1:0] count1,
  input rst,
  input internal_trg_knock1,
  input clock) ; 
   reg store_trg_knock1 ;  
   reg store_reset_trg ;  
   wire rst_int ;  
   reg [INJ_NUMBER-1:0] int_counter1 ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_knock_store
 time prop_delay ;
         if (rst==1'b0)
            begin 
              store_trg_knock1 <=1'b0;
              store_reset_trg <=1'b0;
            end 
          else 
            begin 
              store_trg_knock1 <=internal_trg_knock1;
              store_reset_trg <=(~(store_trg_knock1));
            end 
       end
  
  assign rst_int=rst&(~(store_reset_trg)); 
  assign en_comp1=store_trg_knock1; 
  always @(  posedge clock or  negedge rst_int)
       if (rst_int==1'b0)
          int_counter1 <={INJ_NUMBER{1'b0}};
        else 
          begin 
            if (store_trg_knock1==1'b1)
               int_counter1 <=int_counter1+6'b000001;
          end
  
  assign count1=int_counter1; endmodule 
module knock_count2 (
  output en_comp2,
  output [INJ_NUMBER-1:0] count2,
  input trg_knock2,
  input rst,
  input clock) ; 
   reg store_trg_knock2 ;  
   reg store_reset_trg ;  
   wire rst_int ;  
   reg [INJ_NUMBER-1:0] int_counter2 ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_knock_store
 time prop_delay ;
         if (rst==1'b0)
            begin 
              store_trg_knock2 <=1'b0;
              store_reset_trg <=1'b0;
            end 
          else 
            begin 
              store_trg_knock2 <=trg_knock2;
              store_reset_trg <=(~(store_trg_knock2));
            end 
       end
  
  assign rst_int=rst&(~(store_reset_trg)); 
  assign en_comp2=store_trg_knock2; 
  always @(  posedge clock or  negedge rst_int)
       if (rst_int==1'b0)
          int_counter2 <={INJ_NUMBER{1'b0}};
        else 
          begin 
            if (store_trg_knock2==1'b1)
               int_counter2 <=int_counter2+6'b000001;
          end
  
  assign count2=int_counter2; endmodule 
module knock_detection_fsm1 (
  output [BANKS_NUMBER-1:0] knock1,
  input rst,
  input internal_trg_knock1,
  input clock) ; 
   wire [INJ_NUMBER-1:0] count1 ;  
   wire en_comp1 ;  
   wire impulse ;  
   wire long ;  
  knock_comp1 instance_knock_comp1(count1,en_comp1,impulse,long); 
  knock_count1 instance_knock_count1(clock,internal_trg_knock1,rst,count1,en_comp1); 
  knock_fsm1 instance_knock_fsm1(clock,impulse,long,rst,knock1); endmodule 
module knock_detection_fsm2 (
  output [BANKS_NUMBER-1:0] knock2,
  input trg_knock2,
  input rst,
  input clock) ; 
   wire [INJ_NUMBER-1:0] count2 ;  
   wire en_comp2 ;  
   wire impulse ;  
   wire long ;  
  knock_comp2 instance_knock_comp2(count2,en_comp2,impulse,long); 
  knock_count2 instance_knock_count2(clock,rst,trg_knock2,count2,en_comp2); 
  knock_fsm2 instance_knock_fsm2(clock,impulse,long,rst,knock2); endmodule 
module knock_fsm1 (
  output reg  [BANKS_NUMBER-1:0] knock1,
  input rst,
  input long,
  input impulse,
  input clock) ; 
 parameter[1:0] knock_fsm1_state_type_start_state =0,knock_fsm1_state_type_off1_state=1,knock_fsm1_state_type_sample_state=2,knock_fsm1_state_type_off2_state=3; 
   reg [1:0] current_state ;  
   reg [1:0] next_state ;  
  always @(    posedge clock or  impulse or  long or  negedge rst)
       begin :clocked
         if (rst==1'b0)
            begin 
              current_state <=knock_fsm1_state_type_start_state;
              knock1 <=2'b01;
            end 
          else 
            begin 
              current_state <=next_state;
              case (next_state)
               knock_fsm1_state_type_start_state :
                  knock1 <=2'b01;
               knock_fsm1_state_type_off1_state :
                  knock1 <=2'b00;
               knock_fsm1_state_type_sample_state :
                  knock1 <=2'b10;
               knock_fsm1_state_type_off2_state :
                  knock1 <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(     current_state or  clock or  impulse or  long or  rst)
       begin :set_next_state
         next_state <=current_state;
         case (current_state)
          knock_fsm1_state_type_start_state :
             if (long==1'b1)
                next_state <=knock_fsm1_state_type_start_state;
              else 
                if (impulse==1'b1)
                   next_state <=knock_fsm1_state_type_off1_state;
          knock_fsm1_state_type_off1_state :
             if (impulse==1'b1)
                next_state <=knock_fsm1_state_type_sample_state;
              else 
                if (long==1'b1)
                   next_state <=knock_fsm1_state_type_start_state;
          knock_fsm1_state_type_sample_state :
             if (impulse==1'b1)
                next_state <=knock_fsm1_state_type_off2_state;
              else 
                if (long==1'b1)
                   next_state <=knock_fsm1_state_type_start_state;
          knock_fsm1_state_type_off2_state :
             if (long==1'b1)
                next_state <=knock_fsm1_state_type_start_state;
              else 
                if (impulse==1'b1)
                   next_state <=knock_fsm1_state_type_start_state;
          default :;
         endcase 
       end
  endmodule 
module knock_fsm2 (
  output reg  [BANKS_NUMBER-1:0] knock2,
  input rst,
  input long,
  input impulse,
  input clock) ; 
 parameter[1:0] knock_fsm2_state_type_start_state =0,knock_fsm2_state_type_off1_state=1,knock_fsm2_state_type_sample_state=2,knock_fsm2_state_type_off2_state=3; 
   reg [1:0] current_state ;  
   reg [1:0] next_state ;  
  always @(    posedge clock or  impulse or  long or  negedge rst)
       begin :clocked
         if (rst==1'b0)
            begin 
              current_state <=knock_fsm2_state_type_start_state;
              knock2 <=2'b01;
            end 
          else 
            begin 
              current_state <=next_state;
              case (next_state)
               knock_fsm2_state_type_start_state :
                  knock2 <=2'b01;
               knock_fsm2_state_type_off1_state :
                  knock2 <=2'b00;
               knock_fsm2_state_type_sample_state :
                  knock2 <=2'b10;
               knock_fsm2_state_type_off2_state :
                  knock2 <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(     current_state or  clock or  impulse or  long or  rst)
       begin :set_next_state
         next_state <=current_state;
         case (current_state)
          knock_fsm2_state_type_start_state :
             if (long==1'b1)
                next_state <=knock_fsm2_state_type_start_state;
              else 
                if (impulse==1'b1)
                   next_state <=knock_fsm2_state_type_off1_state;
          knock_fsm2_state_type_off1_state :
             if (impulse==1'b1)
                next_state <=knock_fsm2_state_type_sample_state;
              else 
                if (long==1'b1)
                   next_state <=knock_fsm2_state_type_start_state;
          knock_fsm2_state_type_sample_state :
             if (impulse==1'b1)
                next_state <=knock_fsm2_state_type_off2_state;
              else 
                if (long==1'b1)
                   next_state <=knock_fsm2_state_type_start_state;
          knock_fsm2_state_type_off2_state :
             if (long==1'b1)
                next_state <=knock_fsm2_state_type_start_state;
              else 
                if (impulse==1'b1)
                   next_state <=knock_fsm2_state_type_start_state;
          default :;
         endcase 
       end
  endmodule 
module merge (
  output rel_pot_en,
  output irq,
  output [BANKS_NUMBER-1:0] hlo,
  input relpot2,
  input relpot1,
  input hl_125,
  input hl_034,
  input error2,
  input error1) ; 
  assign rel_pot_en=relpot2|relpot1; 
  assign hlo[0]=(~(hl_034)); 
  assign hlo[1]=(~(hl_125)); 
  assign irq=(~(error1|error2)); endmodule 
module merge_actuators (
  output [BANKS_NUMBER-1:0] t3,
  output [INJ_NUMBER-1:0] t2,
  output [INJ_NUMBER-1:0] t1,
  input t3_125,
  input t3_034,
  input t2_5,
  input t2_4,
  input t2_3,
  input t2_2,
  input t2_1,
  input t2_0,
  input t1_5,
  input t1_4,
  input t1_3,
  input t1_2,
  input t1_1,
  input t1_0) ; 
  merge_t1 instance_merge_t1(t1_0,t1_1,t1_2,t1_3,t1_4,t1_5,t1); 
  merge_t2 instance_merge_t2(t2_0,t2_1,t2_2,t2_3,t2_4,t2_5,t2); 
  merge_t3 instance_merge_t3(t3_034,t3_125,t3); endmodule 
module merge_t1 (
  output reg  [INJ_NUMBER-1:0] t1,
  input t1_5,
  input t1_4,
  input t1_3,
  input t1_2,
  input t1_1,
  input t1_0) ; 
  always @(      t1_0 or  t1_1 or  t1_2 or  t1_3 or  t1_4 or  t1_5)
       begin :vhdl_merge_t1
 time prop_delay ;
         t1 [0]<=(~(t1_0));
         t1 [1]<=(~(t1_1));
         t1 [2]<=(~(t1_2));
         t1 [3]<=(~(t1_3));
         t1 [4]<=(~(t1_4));
         t1 [5]<=(~(t1_5));
       end
  endmodule 
module merge_t2 (
  output reg  [INJ_NUMBER-1:0] t2,
  input t2_5,
  input t2_4,
  input t2_3,
  input t2_2,
  input t2_1,
  input t2_0) ; 
  always @(      t2_0 or  t2_1 or  t2_2 or  t2_3 or  t2_4 or  t2_5)
       begin :vhdl_merge_t2
 time prop_delay ;
         t2 [0]<=t2_0;
         t2 [1]<=t2_1;
         t2 [2]<=t2_2;
         t2 [3]<=t2_3;
         t2 [4]<=t2_4;
         t2 [5]<=t2_5;
       end
  endmodule 
module merge_t3 (
  output reg  [BANKS_NUMBER-1:0] t3,
  input t3_125,
  input t3_034) ; 
  always @(  t3_034 or  t3_125)
       begin :vhdl_merge_t3
 time prop_delay ;
         t3 [0]<=(~(t3_034));
         t3 [1]<=(~(t3_125));
       end
  endmodule 
module on_comp (
  output reg  end_on,
  input [SEVEN_BIT-1:0] ton_reg,
  input [SEVEN_BIT-1:0] chop_count) ; 
  always @(  chop_count or  ton_reg)
       begin :vhdl_on_comp
 time prop_delay ;
         if (chop_count==ton_reg)
            end_on <=1'b1;
          else 
            end_on <=1'b0;
       end
  endmodule 
module output_decoder (
  output reg  t2c,
  output reg  t2b,
  output reg  t2a,
  output reg  t1c,
  output reg  t1b,
  output reg  t1a,
  input t2,
  input t1,
  input [SPLIT_NUMBER-1:0] cmd_stored) ; 
  always @(   cmd_stored or  t1 or  t2)
       begin :vhdl_output_decoder
 time prop_delay ;
         case (cmd_stored)
          3 'b001:
             begin 
               t1a <=t1;
               t2a <=t2;
               t1b <=1'b0;
               t2b <=1'b0;
               t1c <=1'b0;
               t2c <=1'b0;
             end 
          3 'b010:
             begin 
               t1b <=t1;
               t2b <=t2;
               t1a <=1'b0;
               t2a <=1'b0;
               t1c <=1'b0;
               t2c <=1'b0;
             end 
          3 'b100:
             begin 
               t1c <=t1;
               t2c <=t2;
               t1b <=1'b0;
               t2b <=1'b0;
               t1a <=1'b0;
               t2a <=1'b0;
             end 
          default :
             begin 
               t1a <=1'b0;
               t2a <=1'b0;
               t1b <=1'b0;
               t2b <=1'b0;
               t1c <=1'b0;
               t2c <=1'b0;
             end 
         endcase 
       end
  endmodule 
module period_comp (
  output reg  end_period,
  input [SEVEN_BIT-1:0] tp_reg,
  input [SEVEN_BIT-1:0] chop_count) ; 
  always @(  chop_count or  tp_reg)
       begin :vhdl_period_comp
 time prop_delay ;
         if (chop_count==tp_reg)
            end_period <=1'b1;
          else 
            end_period <=1'b0;
       end
  endmodule 
module ph1_handle (
  output reg  global1_state,
  input rst,
  input [SPLIT_NUMBER-1:0] inj_cmd,
  input end_t0,
  input [FIVE_BIT-1:0] cur_state,
  input [SPLIT_NUMBER-1:0] cmd_stored,
  input clock) ; 
 parameter[1:0] ph1_handle_state_type_ph1_1_state =0,ph1_handle_state_type_ph1_2_state=1; 
   reg [1:0] current_state ;  
   reg [1:0] next_state ;  
  always @(      posedge clock or  cmd_stored or  cur_state or  end_t0 or  inj_cmd or  negedge rst)
       begin :clocked
         if (rst==1'b0)
            begin 
              current_state <=ph1_handle_state_type_ph1_1_state;
              global1_state <=1'b0;
            end 
          else 
            begin 
              current_state <=next_state;
              case (next_state)
               ph1_handle_state_type_ph1_1_state :
                  global1_state <=1'b0;
               ph1_handle_state_type_ph1_2_state :
                  global1_state <=1'b1;
               default :;
              endcase 
            end 
       end
  
  always @(       current_state or  clock or  cmd_stored or  cur_state or  end_t0 or  inj_cmd or  rst)
       begin :set_next_state
         next_state <=current_state;
         case (current_state)
          ph1_handle_state_type_ph1_1_state :
             if (end_t0==1'b1&(inj_cmd==cmd_stored)&cur_state==5'b00001)
                next_state <=ph1_handle_state_type_ph1_2_state;
              else 
                if (cur_state!=5'b00001)
                   next_state <=ph1_handle_state_type_ph1_1_state;
          ph1_handle_state_type_ph1_2_state :
             if (cur_state!=5'b00001)
                next_state <=ph1_handle_state_type_ph1_1_state;
          default :;
         endcase 
       end
  endmodule 
module ph1_output_handle (
  output reg  t31,
  output reg  cs111,
  input global1_state) ; 
  always @( global1_state)
       if (global1_state==1'b1)
          begin 
            t31 <=1'b1;
            cs111 <=1'b0;
          end 
        else 
          begin 
            t31 <=1'b0;
            cs111 <=1'b1;
          end
  endmodule 
module ph2_handle (
  output reg  [TWO_BIT-1:0] global2_state,
  input sh_mode,
  input rst,
  input i_fbk,
  input end_period,
  input end_on,
  input [FIVE_BIT-1:0] cur_state,
  input clock) ; 
 parameter[1:0] ph2_handle_state_type_ph2_1_state =0,ph2_handle_state_type_ph2_2_state=1,ph2_handle_state_type_ph2_3_state=2,ph2_handle_state_type_ph2_4_state=3; 
   reg [1:0] current_state ;  
   reg [1:0] next_state ;  
  always @(       posedge clock or  cur_state or  end_on or  end_period or  i_fbk or  negedge rst or  sh_mode)
       begin :clocked
         if (rst==1'b0)
            begin 
              current_state <=ph2_handle_state_type_ph2_1_state;
              global2_state <=2'b01;
            end 
          else 
            begin 
              current_state <=next_state;
              case (next_state)
               ph2_handle_state_type_ph2_1_state :
                  global2_state <=2'b01;
               ph2_handle_state_type_ph2_2_state :
                  global2_state <=2'b10;
               ph2_handle_state_type_ph2_3_state :
                  global2_state <=2'b11;
               ph2_handle_state_type_ph2_4_state :
                  global2_state <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(        current_state or  clock or  cur_state or  end_on or  end_period or  i_fbk or  rst or  sh_mode)
       begin :set_next_state
         next_state <=current_state;
         case (current_state)
          ph2_handle_state_type_ph2_1_state :
             if (cur_state==5'b00101&((sh_mode==1'b1&i_fbk==1'b1)|(sh_mode==1'b0&end_on==1'b1)))
                next_state <=ph2_handle_state_type_ph2_2_state;
              else 
                if (cur_state!=5'b00101)
                   next_state <=ph2_handle_state_type_ph2_1_state;
          ph2_handle_state_type_ph2_2_state :
             if (cur_state==5'b00101)
                next_state <=ph2_handle_state_type_ph2_3_state;
              else 
                if (cur_state!=5'b00101)
                   next_state <=ph2_handle_state_type_ph2_1_state;
          ph2_handle_state_type_ph2_3_state :
             if (cur_state==5'b00101&((sh_mode==1'b1&i_fbk==1'b0)|(sh_mode==1'b0&end_period==1'b1)))
                next_state <=ph2_handle_state_type_ph2_4_state;
              else 
                if (cur_state!=5'b00101)
                   next_state <=ph2_handle_state_type_ph2_1_state;
          ph2_handle_state_type_ph2_4_state :
             if (1'b1)
                next_state <=ph2_handle_state_type_ph2_1_state;
          default :;
         endcase 
       end
  endmodule 
module ph2_output_handle (
  output reg  t12,
  output reg  cs42,
  input [TWO_BIT-1:0] global2_state) ; 
  always @( global2_state)
       begin 
         if (global2_state==2'b00)
            cs42 <=1'b1;
          else 
            cs42 <=1'b0;
         if (global2_state[1]==1'b1)
            t12 <=1'b0;
          else 
            t12 <=1'b1;
       end
  endmodule 
module ph4_handle (
  output reg  [TWO_BIT-1:0] global4_state,
  input sh_mode,
  input rst,
  input i_fbk,
  input end_period,
  input end_on,
  input [FIVE_BIT-1:0] cur_state,
  input clock) ; 
 parameter[1:0] ph4_handle_state_type_ph4_1_state =0,ph4_handle_state_type_ph4_2_state=1,ph4_handle_state_type_ph4_3_state=2,ph4_handle_state_type_ph4_4_state=3; 
   reg [1:0] current_state ;  
   reg [1:0] next_state ;  
  always @(       posedge clock or  cur_state or  end_on or  end_period or  i_fbk or  negedge rst or  sh_mode)
       begin :clocked
         if (rst==1'b0)
            begin 
              current_state <=ph4_handle_state_type_ph4_1_state;
              global4_state <=2'b01;
            end 
          else 
            begin 
              current_state <=next_state;
              case (next_state)
               ph4_handle_state_type_ph4_1_state :
                  global4_state <=2'b01;
               ph4_handle_state_type_ph4_2_state :
                  global4_state <=2'b10;
               ph4_handle_state_type_ph4_3_state :
                  global4_state <=2'b11;
               ph4_handle_state_type_ph4_4_state :
                  global4_state <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(        current_state or  clock or  cur_state or  end_on or  end_period or  i_fbk or  rst or  sh_mode)
       begin :set_next_state
         next_state <=current_state;
         case (current_state)
          ph4_handle_state_type_ph4_1_state :
             if (cur_state==5'b01001&((sh_mode==1'b1&i_fbk==1'b1)|(sh_mode==1'b0&end_on==1'b1)))
                next_state <=ph4_handle_state_type_ph4_2_state;
              else 
                if (cur_state!=5'b01001&cur_state!=5'b11001)
                   next_state <=ph4_handle_state_type_ph4_1_state;
                 else 
                   if (cur_state==5'b11001&((sh_mode==1'b1&i_fbk==1'b1)|(sh_mode==1'b0&end_on==1'b1)))
                      next_state <=ph4_handle_state_type_ph4_2_state;
          ph4_handle_state_type_ph4_2_state :
             if (cur_state==5'b01001|cur_state==5'b11001)
                next_state <=ph4_handle_state_type_ph4_3_state;
              else 
                if (cur_state!=5'b01001&cur_state!=5'b11001)
                   next_state <=ph4_handle_state_type_ph4_1_state;
          ph4_handle_state_type_ph4_3_state :
             if (cur_state==5'b01001&((sh_mode==1'b1&i_fbk==1'b0)|(sh_mode==1'b0&end_period==1'b1)))
                next_state <=ph4_handle_state_type_ph4_4_state;
              else 
                if (cur_state!=5'b01001&cur_state!=5'b11001)
                   next_state <=ph4_handle_state_type_ph4_1_state;
                 else 
                   if (cur_state==5'b11001&((sh_mode==1'b1&i_fbk==1'b0)|(sh_mode==1'b0&end_period==1'b1)))
                      next_state <=ph4_handle_state_type_ph4_4_state;
          ph4_handle_state_type_ph4_4_state :
             if (1'b1)
                next_state <=ph4_handle_state_type_ph4_1_state;
          default :;
         endcase 
       end
  endmodule 
module ph4_output_handle (
  output reg  t14,
  output reg  cs44,
  input [TWO_BIT-1:0] global4_state) ; 
  always @( global4_state)
       begin 
         if (global4_state==2'b00)
            cs44 <=1'b1;
          else 
            cs44 <=1'b0;
         if (global4_state[1]==1'b1)
            t14 <=1'b0;
          else 
            t14 <=1'b1;
       end
  endmodule 
module registers (d_bus,outputturbo_speed_lev,outputtrg_knock_en,output[THREE_BIT-1:0]test_en_125,output[THREE_BIT-1:0]test_en_034,output[ST_REG_NUM-1:0]status_reg_125,output[ST_REG_NUM-1:0]status_reg_034,outputsmot_camme_en,outputseg_speed_lev,output[SEVEN_BIT-1:0]r_tp,output[SEVEN_BIT-1:0]r_tonl,output[SEVEN_BIT-1:0]r_tonh,output[REG_BITS-1:0]r_th_125,output[REG_BITS-1:0]r_th_034,output[TEN_BIT-1:0]r_tb_125,output[TEN_BIT-1:0]r_tb_034,output[SEVEN_BIT-1:0]r_t4_125,output[SEVEN_BIT-1:0]r_t4_034,output[EIGHT_BIT-1:0]r_t3_125,output[EIGHT_BIT-1:0]r_t3_034,output[SEVEN_BIT-1:0]r_t2,output[EIGHT_BIT-1:0]r_t1,outputrelpot,outputpickup_hall,outputknock2u,outputknock1u,outputin_speed_lev,output[7:0]digital_output,inputwr_en,input[INJ_NUMBER-1:0]v_fbk_f,inputrst,inputrel_pot_en,inputrd_en,input[SEVEN_BIT-1:0]nssm_in,input[BANKS_NUMBER-1:0]i_fbk_f,input[GLOB_STATE_BITS-1:0]global_state_125,input[GLOB_STATE_BITS-1:0]global_state_034,input[SPLIT_NUMBER-1:0]fbk_pwm,inputen_state_store_125,inputen_state_store_034,inputen_fbk_store_125,inputen_fbk_store_034,input[TWENTYONE_BIT-1:0]digital_input,inputclock,input[A_BUS_NUMBER-1:0]a_bus) ; 
   wire [THIRTEEN_BIT-1:0] add_decoded ;  
   wire [THIRTEEN_BIT-1:0] add_decoded_r ;  
   wire add_test_en ;  
   wire [BANKS_NUMBER-1:0] a_dig_in ;  
   wire a_dig_out ;  
   wire [TWO_BIT-1:0] a_fault_dec ;  
   wire [TWO_BIT-1:0] a_fault_dec_r ;  
  add_dec instance_add_dec(a_bus,clock,rst,add_decoded,add_decoded_r,add_test_en,a_dig_in,a_dig_out,a_fault_dec,a_fault_dec_r); 
  digital_inputs_handle instance_digital_inputs_handle(a_dig_in,clock,digital_input,fbk_pwm,nssm_in,rd_en,rst,d_bus); 
  digital_outputs_handle instance_digital_outputs_handle(a_dig_out,clock,d_bus,rst,wr_en,digital_output,in_speed_lev,knock1u,knock2u,pickup_hall,seg_speed_lev,smot_camme_en,trg_knock_en,turbo_speed_lev); 
  error_handle instance_error_handle(a_fault_dec,a_fault_dec_r,clock,en_fbk_store_034,en_fbk_store_125,en_state_store_034,en_state_store_125,global_state_034,global_state_125,i_fbk_f,rd_en,rel_pot_en,rst,v_fbk_f,wr_en,relpot,status_reg_034,status_reg_125,d_bus); 
  in_reg instance_in_reg(add_decoded,add_decoded_r,clock,rd_en,rst,wr_en,r_t1,r_t2,r_t3_034,r_t3_125,r_t4_034,r_t4_125,r_tb_034,r_tb_125,r_th_034,r_th_125,r_tonh,r_tonl,r_tp,d_bus); 
  test_en instance_test_en(add_test_en,clock,d_bus,rd_en,rst,wr_en,test_en_034,test_en_125); endmodule 
module rst_inv (
  input reset) ; 
   wire rst_neg ;  
  assign rst_neg=(~(reset)); 
  startup u0(.gsr(rst_neg)); endmodule 
module sel_actuator (
  output reg  t3,
  output reg  t2,
  output reg  t1,
  output reg  hl,
  input t31,
  input t14,
  input t12,
  input [FIVE_BIT-1:0] cur_state) ; 
  always @(    t31 or  t12 or  t14 or  cur_state)
       begin :vhdl_sel_actuator
         case (cur_state)
          5 'b00000:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          5 'b00001:
             begin 
               hl <=1'b0;
               t1 <=1'b1;
               t2 <=1'b1;
               t3 <=t31;
             end 
          5 'b00010:
             begin 
               hl <=1'b1;
               t1 <=1'b1;
               t2 <=1'b1;
               t3 <=1'b1;
             end 
          5 'b00011:
             begin 
               hl <=1'b1;
               t1 <=1'b1;
               t2 <=1'b1;
               t3 <=1'b1;
             end 
          5 'b00100:
             begin 
               hl <=1'b1;
               t1 <=1'b1;
               t2 <=1'b1;
               t3 <=1'b0;
             end 
          5 'b00101:
             begin 
               hl <=1'b1;
               t1 <=t12;
               t2 <=1'b1;
               t3 <=1'b0;
             end 
          5 'b00110:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          5 'b00111:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          5 'b01000:
             begin 
               hl <=1'b0;
               t1 <=1'b1;
               t2 <=1'b1;
               t3 <=1'b0;
             end 
          5 'b01001:
             begin 
               hl <=1'b0;
               t1 <=t14;
               t2 <=1'b1;
               t3 <=1'b0;
             end 
          5 'b01010:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          5 'b01011:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          5 'b01100:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          5 'b01101:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          5 'b01110:
             begin 
               hl <=1'b0;
               t1 <=1'b1;
               t2 <=1'b1;
               t3 <=1'b0;
             end 
          5 'b01111:
             begin 
               hl <=1'b0;
               t1 <=1'b1;
               t2 <=1'b1;
               t3 <=1'b0;
             end 
          5 'b11000:
             begin 
               hl <=1'b0;
               t1 <=1'b1;
               t2 <=1'b1;
               t3 <=1'b0;
             end 
          5 'b11001:
             begin 
               hl <=1'b0;
               t1 <=t14;
               t2 <=1'b1;
               t3 <=1'b0;
             end 
          5 'b11100:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          5 'b11101:
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
          default :
             begin 
               hl <=1'b0;
               t1 <=1'b0;
               t2 <=1'b0;
               t3 <=1'b0;
             end 
         endcase 
       end
  endmodule 
module sel_chop_control (
  output reg  cs4,
  input [FIVE_BIT-1:0] cur_state,
  input cs44,
  input cs42) ; 
  always @(   cs42 or  cs44 or  cur_state)
       begin :vhdl_sel_chop_control
         case (cur_state)
          5 'b00101:
             cs4 <=cs42;
          5 'b01001:
             cs4 <=cs44;
          5 'b11001:
             cs4 <=cs44;
          default :
             cs4 <=1'b1;
         endcase 
       end
  endmodule 
module sel_cmd (
  output [SPLIT_NUMBER-1:0] v_fbk_mask,
  output reg  v_fbk_cur,
  output reg  test_en_cur,
  output [SPLIT_NUMBER-1:0] cmd_stored,
  input [SPLIT_NUMBER-1:0] v_fbk,
  input [THREE_BIT-1:0] test_en,
  input rst,
  input [SPLIT_NUMBER-1:0] inj_cmd,
  input cs2,
  input clock) ; 
   reg [2:0] cmd_stored_int ;  
  always @(  posedge clock or  negedge rst)
       begin :vhdl_sel_cmd
 time prop_delay ;
         if (rst==1'b0)
            cmd_stored_int <=3'b000;
          else 
            begin 
              if (cs2==1'b1)
                 cmd_stored_int <=inj_cmd;
            end 
       end
  
  always @(   v_fbk or  cmd_stored_int or  test_en)
       case (cmd_stored_int)
        3 'b001:
           begin 
             v_fbk_cur <=v_fbk[0];
             test_en_cur <=test_en[0];
           end 
        3 'b010:
           begin 
             v_fbk_cur <=v_fbk[1];
             test_en_cur <=test_en[1];
           end 
        3 'b100:
           begin 
             v_fbk_cur <=v_fbk[2];
             test_en_cur <=test_en[2];
           end 
        default :
           begin 
             v_fbk_cur <=1'b0;
             test_en_cur <=1'b1;
           end 
       endcase
  
  assign v_fbk_mask[0]=v_fbk[0]&test_en[0]; 
  assign v_fbk_mask[1]=v_fbk[1]&test_en[1]; 
  assign v_fbk_mask[2]=v_fbk[2]&test_en[2]; 
  assign cmd_stored=cmd_stored_int; endmodule 
module sel_glob_count_cs (
  output reg  cs8,
  output reg  cs2,
  output reg  cs1,
  input global1_state,
  input [FIVE_BIT-1:0] cur_state,
  input cs111,
  input cs11) ; 
  always @(    cs11 or  cs111 or  cur_state or  global1_state)
       begin :vhdl_sel_glob_count_cs
 time prop_delay ;
         if (cur_state==5'b00001)
            begin 
              cs1 <=cs111;
              if (global1_state==1'b0)
                 cs2 <=1'b1;
               else 
                 cs2 <=1'b0;
              cs8 <=1'b0;
            end 
          else 
            if (cur_state==5'b00000)
               begin 
                 cs1 <=cs11;
                 cs2 <=1'b1;
                 cs8 <=1'b1;
               end 
             else 
               begin 
                 cs1 <=cs11;
                 cs2 <=1'b0;
                 cs8 <=1'b1;
               end 
       end
  endmodule 
module sel_global_state (
  output reg  [GLOB_STATE_BITS-1:0] global_state,
  input [TWO_BIT-1:0] global4_state,
  input [TWO_BIT-1:0] global2_state,
  input global1_state,
  input [FIVE_BIT-1:0] cur_state) ; 
  always @(    cur_state or  global1_state or  global2_state or  global4_state)
       begin 
         global_state [6:2]<=cur_state;
         case (cur_state)
          5 'b00001:
             global_state [1:0]<={1'b0,global1_state};
          5 'b00101:
             global_state [1:0]<=global2_state;
          5 'b01001:
             global_state [1:0]<=global4_state;
          5 'b11001:
             global_state [1:0]<=global4_state;
          default :
             global_state [1:0]<=2'b00;
         endcase 
       end
  endmodule 
module smot_camme_mux (
  output reg  cam_smot,
  input smot_camme_en,
  input seg_speed_pickup,
  input seg_speed_hall,
  input pickup_hall,
  input in_speed) ; 
  always @(     seg_speed_pickup or  seg_speed_hall or  pickup_hall or  in_speed or  smot_camme_en)
       begin :vhdl_smot_camme_mux
 time prop_delay ;
         if (smot_camme_en==1'b0)
            cam_smot <=in_speed;
          else 
            if (pickup_hall==1'b1)
               cam_smot <=seg_speed_pickup;
             else 
               cam_smot <=seg_speed_hall;
       end
  endmodule 
module smot_knock_handle (
  output smot60,
  output [BANKS_NUMBER-1:0] knock2,
  output [BANKS_NUMBER-1:0] knock1,
  output cam_smot,
  input trg_knock_en,
  input trg_knock2,
  input trg_knock1,
  input smot_camme_en,
  input seg_speed_pickup,
  input seg_speed_hall,
  input rst,
  input pickup_hall,
  input in_speed,
  input clock) ; 
   wire internal_trg_knock1 ;  
  knock_detection_fsm1 instance_knock_detection_fsm1(clock,internal_trg_knock1,rst,knock1); 
  knock_detection_fsm2 instance_knock_detection_fsm2(clock,rst,trg_knock2,knock2); 
  smot_camme_mux instance_smot_camme_mux(in_speed,pickup_hall,seg_speed_hall,seg_speed_pickup,smot_camme_en,cam_smot); 
  trg_knock1_handle instance_trg_knock1_handle(in_speed,trg_knock1,trg_knock_en,internal_trg_knock1,smot60); endmodule 
module split (
  output reg  [SPLIT_NUMBER-1:0] v_fbk_125,
  output reg  [SPLIT_NUMBER-1:0] v_fbk_034,
  output reg  i_fbk_125,
  output reg  i_fbk_034,
  output reg  [SPLIT_NUMBER-1:0] inj_cmd_125,
  output reg  [SPLIT_NUMBER-1:0] inj_cmd_034,
  input [INJ_NUMBER-1:0] v_fbk_f,
  input [BANKS_NUMBER-1:0] i_fbk_f,
  input [INJ_NUMBER-1:0] inj_cmd,
  input rst,
  input clock) ; 
   reg [5:0] inj_cmd_int ;  
  always @(  posedge clock or  negedge rst)
       if (rst==1'b0)
          inj_cmd_int <={6{1'b0}};
        else 
          inj_cmd_int <=inj_cmd;
 
  always @(   i_fbk_f or  inj_cmd_int or  v_fbk_f)
       begin :vhdl_split
 time prop_delay ;
         i_fbk_034 <=i_fbk_f[0];
         i_fbk_125 <=i_fbk_f[1];
         inj_cmd_034 [0]<=inj_cmd_int[0];
         inj_cmd_034 [1]<=inj_cmd_int[3];
         inj_cmd_034 [2]<=inj_cmd_int[4];
         inj_cmd_125 [0]<=inj_cmd_int[1];
         inj_cmd_125 [1]<=inj_cmd_int[2];
         inj_cmd_125 [2]<=inj_cmd_int[5];
         v_fbk_034 [0]<=v_fbk_f[0];
         v_fbk_034 [1]<=v_fbk_f[3];
         v_fbk_034 [2]<=v_fbk_f[4];
         v_fbk_125 [0]<=v_fbk_f[1];
         v_fbk_125 [1]<=v_fbk_f[2];
         v_fbk_125 [2]<=v_fbk_f[5];
       end
  endmodule 
module startup (
  input gsr) ; endmodule 
module state_progression (
  output reg  [FIVE_BIT-1:0] cur_state,
  input [SPLIT_NUMBER-1:0] v_fbk_mask,
  input v_fbk_cur,
  input th_0,
  input t4_0,
  input [ST_REG_NUM-1:0] status_reg,
  input sh_mode,
  input rst,
  input i_fbk,
  input [SPLIT_NUMBER-1:0] inj_cmd,
  input [GLOB_STATE_BITS-1:0] global_state,
  input end_t0,
  input enable_check,
  input comp,
  input [SPLIT_NUMBER-1:0] cmd_stored,
  input clock) ; 
 parameter[4:0] state_progression_state_type_start_state =0,state_progression_state_type_ph1bis_state=1,state_progression_state_type_ph2_state=2,state_progression_state_type_ph3_state=3,state_progression_state_type_ph4_state=4,state_progression_state_type_ph5_state=5,state_progression_state_type_ph1_state=6,state_progression_state_type_cc_vcc_state=7,state_progression_state_type_cc_gnd_state=8,state_progression_state_type_int1_state=9,state_progression_state_type_int_2_state=10,state_progression_state_type_int3_state=11,state_progression_state_type_int4_state=12,state_progression_state_type_int5_state=13,state_progression_state_type_int6_state=14,state_progression_state_type_ph6_state=15,state_progression_state_type_int7_state=16,state_progression_state_type_ph7_state=17,state_progression_state_type_int8_state=18,state_progression_state_type_ph8_state=19,state_progression_state_type_int9_state=20,state_progression_state_type_ph9_state=21; 
   reg [4:0] current_state ;  
   reg [4:0] next_state ;  
  always @(               posedge clock or  cmd_stored or  comp or  enable_check or  end_t0 or  global_state or  inj_cmd or  i_fbk or  negedge rst or  sh_mode or  status_reg or  t4_0 or  th_0 or  v_fbk_cur or  v_fbk_mask)
       begin :clocked
         if (rst==1'b0)
            begin 
              current_state <=state_progression_state_type_start_state;
              cur_state <=5'b00000;
            end 
          else 
            begin 
              current_state <=next_state;
              case (next_state)
               state_progression_state_type_start_state :
                  cur_state <=5'b00000;
               state_progression_state_type_ph1bis_state :
                  cur_state <=5'b00011;
               state_progression_state_type_ph2_state :
                  cur_state <=5'b00101;
               state_progression_state_type_ph3_state :
                  cur_state <=5'b00111;
               state_progression_state_type_ph4_state :
                  cur_state <=5'b01001;
               state_progression_state_type_ph5_state :
                  cur_state <=5'b01011;
               state_progression_state_type_ph1_state :
                  cur_state <=5'b00001;
               state_progression_state_type_cc_vcc_state :
                  cur_state <=5'b11100;
               state_progression_state_type_cc_gnd_state :
                  cur_state <=5'b11101;
               state_progression_state_type_int1_state :
                  cur_state <=5'b00010;
               state_progression_state_type_int_2_state :
                  cur_state <=5'b00100;
               state_progression_state_type_int3_state :
                  cur_state <=5'b00110;
               state_progression_state_type_int4_state :
                  cur_state <=5'b01000;
               state_progression_state_type_int5_state :
                  cur_state <=5'b01010;
               state_progression_state_type_int6_state :
                  cur_state <=5'b01100;
               state_progression_state_type_ph6_state :
                  cur_state <=5'b01101;
               state_progression_state_type_int7_state :
                  cur_state <=5'b01110;
               state_progression_state_type_ph7_state :
                  cur_state <=5'b01111;
               state_progression_state_type_int8_state :
                  cur_state <=5'b11000;
               state_progression_state_type_ph8_state :
                  cur_state <=5'b11001;
               state_progression_state_type_int9_state :
                  cur_state <=5'b01010;
               state_progression_state_type_ph9_state :
                  cur_state <=5'b01011;
               default :;
              endcase 
            end 
       end
  
  always @(                current_state or  clock or  cmd_stored or  comp or  enable_check or  end_t0 or  global_state or  inj_cmd or  i_fbk or  rst or  sh_mode or  status_reg or  t4_0 or  th_0 or  v_fbk_cur or  v_fbk_mask)
       begin :set_next_state
         next_state <=current_state;
         case (current_state)
          state_progression_state_type_start_state :
             if (inj_cmd!=3'b000&v_fbk_mask==3'b000)
                next_state <=state_progression_state_type_ph1_state;
              else 
                if (inj_cmd!=3'b000&v_fbk_mask!=3'b000&enable_check==1'b0)
                   next_state <=state_progression_state_type_ph1_state;
                 else 
                   if (inj_cmd!=3'b000&v_fbk_mask!=3'b000&enable_check==1'b1)
                      next_state <=state_progression_state_type_cc_gnd_state;
          state_progression_state_type_ph1bis_state :
             if (comp==1'b1&v_fbk_cur==1'b1)
                next_state <=state_progression_state_type_int_2_state;
              else 
                if (v_fbk_cur==1'b0&enable_check==1'b1)
                   next_state <=state_progression_state_type_cc_gnd_state;
                 else 
                   if (comp==1'b1&v_fbk_cur==1'b0&enable_check==1'b0)
                      next_state <=state_progression_state_type_int_2_state;
          state_progression_state_type_ph2_state :
             if (comp==1'b1&((v_fbk_cur==1'b0&global_state[1:0]==2'b11)|(global_state[1:0]==2'b10)|(global_state[1:0]==2'b01&v_fbk_cur==1'b1)|(global_state[1:0]==2'b00)))
                next_state <=state_progression_state_type_int3_state;
              else 
                if (global_state[1:0]==2'b01&v_fbk_cur==1'b0&enable_check==1'b1)
                   next_state <=state_progression_state_type_cc_gnd_state;
                 else 
                   if (global_state[1:0]==2'b11&v_fbk_cur==1'b1&enable_check==1'b1)
                      next_state <=state_progression_state_type_cc_vcc_state;
                    else 
                      if (comp==1'b1&((v_fbk_cur==1'b1&global_state[1:0]==2'b11)|(global_state[1:0]==2'b10)|(global_state[1:0]==2'b01&v_fbk_cur==1'b0)|(global_state[1:0]==2'b00))&enable_check==1'b0)
                         next_state <=state_progression_state_type_int3_state;
          state_progression_state_type_ph3_state :
             if (v_fbk_cur==1'b0&comp==1'b1&th_0==1'b0)
                next_state <=state_progression_state_type_int4_state;
              else 
                if (v_fbk_cur==1'b1&enable_check==1'b1)
                   next_state <=state_progression_state_type_cc_vcc_state;
                 else 
                   if (v_fbk_cur==1'b0&th_0==1'b1&comp==1'b1)
                      next_state <=state_progression_state_type_int5_state;
                    else 
                      if (v_fbk_cur==1'b1&comp==1'b1&th_0==1'b0&enable_check==1'b0)
                         next_state <=state_progression_state_type_int4_state;
                       else 
                         if (v_fbk_cur==1'b1&th_0==1'b1&comp==1'b1&enable_check==1'b0)
                            next_state <=state_progression_state_type_int5_state;
          state_progression_state_type_ph4_state :
             if (comp==1'b1&((v_fbk_cur==1'b0&global_state[1:0]==2'b11)|(global_state[1:0]==2'b10)|(global_state[1:0]==2'b01&v_fbk_cur==1'b1)|(global_state[1:0]==2'b00)))
                next_state <=state_progression_state_type_int5_state;
              else 
                if (global_state[1:0]==2'b11&v_fbk_cur==1'b1&enable_check==1'b1)
                   next_state <=state_progression_state_type_cc_vcc_state;
                 else 
                   if (global_state[1:0]==2'b01&v_fbk_cur==1'b0&enable_check==1'b1)
                      next_state <=state_progression_state_type_cc_gnd_state;
                    else 
                      if (comp==1'b1&((v_fbk_cur==1'b1&global_state[1:0]==2'b11)|(global_state[1:0]==2'b10)|(global_state[1:0]==2'b01&v_fbk_cur==1'b0)|(global_state[1:0]==2'b00))&enable_check==1'b0)
                         next_state <=state_progression_state_type_int5_state;
          state_progression_state_type_ph5_state :
             if (comp==1'b1&t4_0==1'b1)
                next_state <=state_progression_state_type_start_state;
              else 
                if (comp==1'b1&t4_0==1'b0)
                   next_state <=state_progression_state_type_int6_state;
          state_progression_state_type_ph1_state :
             if (comp==1'b1&v_fbk_cur==1'b1&((i_fbk==1'b1&sh_mode==1'b1)|(sh_mode==1'b0)))
                next_state <=state_progression_state_type_int1_state;
              else 
                if (v_fbk_cur==1'b0&enable_check==1'b1)
                   next_state <=state_progression_state_type_cc_gnd_state;
                 else 
                   if (global_state[0]==1'b1&comp==1'b1&v_fbk_cur==1'b1&i_fbk==1'b0&sh_mode==1'b1&enable_check==1'b1)
                      next_state <=state_progression_state_type_cc_gnd_state;
                    else 
                      if (inj_cmd!=cmd_stored&global_state[0]==1'b0)
                         next_state <=state_progression_state_type_start_state;
                       else 
                         if (comp==1'b1&(v_fbk_cur==1'b0|((i_fbk==1'b0&sh_mode==1'b1)|(sh_mode==1'b0)))&enable_check==1'b0)
                            next_state <=state_progression_state_type_int1_state;
          state_progression_state_type_cc_vcc_state :
             if (status_reg==11'b00000000000)
                next_state <=state_progression_state_type_start_state;
          state_progression_state_type_cc_gnd_state :
             if (status_reg==11'b00000000000)
                next_state <=state_progression_state_type_start_state;
          state_progression_state_type_int1_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph1bis_state;
          state_progression_state_type_int_2_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph2_state;
          state_progression_state_type_int3_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph3_state;
          state_progression_state_type_int4_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph4_state;
          state_progression_state_type_int5_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph5_state;
          state_progression_state_type_int6_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph6_state;
          state_progression_state_type_ph6_state :
             if (comp==1'b1)
                next_state <=state_progression_state_type_int7_state;
          state_progression_state_type_int7_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph7_state;
          state_progression_state_type_ph7_state :
             if (comp==1'b1&v_fbk_cur==1'b0&enable_check==1'b0)
                next_state <=state_progression_state_type_int8_state;
              else 
                if (comp==1'b1&v_fbk_cur==1'b1)
                   next_state <=state_progression_state_type_int8_state;
                 else 
                   if (v_fbk_cur==1'b0&enable_check==1'b1)
                      next_state <=state_progression_state_type_cc_gnd_state;
          state_progression_state_type_int8_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph8_state;
          state_progression_state_type_ph8_state :
             if (comp==1'b1&((v_fbk_cur==1'b1&global_state[1:0]==2'b11)|(global_state[1:0]==2'b10)|(global_state[1:0]==2'b01&v_fbk_cur==1'b0)|(global_state[1:0]==2'b00))&enable_check==1'b0)
                next_state <=state_progression_state_type_int9_state;
              else 
                if (comp==1'b1&((v_fbk_cur==1'b0&global_state[1:0]==2'b11)|(global_state[1:0]==2'b10)|(global_state[1:0]==2'b01&v_fbk_cur==1'b1)|(global_state[1:0]==2'b00)))
                   next_state <=state_progression_state_type_int9_state;
                 else 
                   if (global_state[1:0]==2'b11&v_fbk_cur==1'b1&enable_check==1'b1)
                      next_state <=state_progression_state_type_cc_vcc_state;
                    else 
                      if (global_state[1:0]==2'b01&v_fbk_cur==1'b0&enable_check==1'b1)
                         next_state <=state_progression_state_type_cc_gnd_state;
          state_progression_state_type_int9_state :
             if (1'b1)
                next_state <=state_progression_state_type_ph9_state;
          state_progression_state_type_ph9_state :
             if (comp==1'b1)
                next_state <=state_progression_state_type_start_state;
          default :;
         endcase 
       end
  endmodule 
module test_en (
  output reg  [THREE_BIT-1:0] test_en_125,
  output reg  [THREE_BIT-1:0] test_en_034,
  input wr_en,
  input rst,
  input rd_en,
  input [D_BUS_NUMBER-1:0] d_bus,
  input clock,
  input add_test_en) ; 
  always @(  posedge clock or  negedge rst)
       begin :vhdl_test_en
 time prop_delay ;
         if (rst==1'b0)
            begin 
              test_en_034 <={THREE_BIT{1'b0}};
              test_en_125 <={THREE_BIT{1'b0}};
            end 
          else 
            begin 
              if (add_test_en==1'b1&wr_en==1'b1)
                 begin 
                   test_en_034 [0]<=d_bus[0];
                   test_en_034 [1]<=d_bus[3];
                   test_en_034 [2]<=d_bus[4];
                   test_en_125 [0]<=d_bus[1];
                   test_en_125 [1]<=d_bus[2];
                   test_en_125 [2]<=d_bus[5];
                 end 
            end 
       end
  endmodule 
module trg_knock1_handle (
  output reg  smot60,
  output reg  internal_trg_knock1,
  input trg_knock_en,
  input trg_knock1,
  input in_speed) ; 
  always @(   in_speed or  trg_knock1 or  trg_knock_en)
       begin :vhdl_trg_knock1_handle
 time prop_delay ;
         if (trg_knock_en==1'b0)
            begin 
              smot60 <=in_speed|trg_knock1;
              internal_trg_knock1 <=1'b0;
            end 
          else 
            begin 
              smot60 <=in_speed;
              internal_trg_knock1 <=trg_knock1;
            end 
       end
  endmodule 
module turbo_vehicle_speed (
  output vehicle,
  output turbo,
  output rpm_out,
  input vehicle_speed,
  input turbo_speed,
  input rpm_in) ; 
  assign turbo=turbo_speed; 
  assign vehicle=vehicle_speed; 
  assign rpm_out=rpm_in; endmodule 
