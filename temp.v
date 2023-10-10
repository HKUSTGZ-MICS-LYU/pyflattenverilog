 
   reg i_rx_phy_rxd_s0 ; 
   reg i_rx_phy_rxd_s1 ; 
   reg i_rx_phy_rxd_s ; 
   reg i_rx_phy_rxdp_s0 ; 
   reg i_rx_phy_rxdp_s1 ; 
   reg i_rx_phy_rxdp_s ; 
   reg i_rx_phy_rxdp_s_r ; 
   reg i_rx_phy_rxdn_s0 ; 
   reg i_rx_phy_rxdn_s1 ; 
   reg i_rx_phy_rxdn_s ; 
   reg i_rx_phy_rxdn_s_r ; 
   reg i_rx_phy_synced_d ; 
   wire i_rx_phy_k ; 
   wire i_rx_phy_j ; 
   wire i_rx_phy_se0 ; 
   reg i_rx_phy_rxd_r ; 
   reg i_rx_phy_rx_en ; 
   reg i_rx_phy_rx_active ; 
   reg[2:0] i_rx_phy_bit_cnt ; 
   reg i_rx_phy_rx_valid1 ; 
   reg i_rx_phy_rx_valid ; 
   reg i_rx_phy_shift_en ; 
   reg i_rx_phy_sd_r ; 
   reg i_rx_phy_sd_nrzi ; 
   reg[7:0] i_rx_phy_hold_reg ; 
   wire i_rx_phy_drop_bit ; 
   reg[2:0] i_rx_phy_one_cnt ; 
   reg[1:0] i_rx_phy_dpll_state ; 
   reg[1:0] i_rx_phy_dpll_next_state ; 
   reg i_rx_phy_fs_ce_d ; 
   wire i_rx_phy_change ; 
   wire i_rx_phy_lock_en ; 
   reg[2:0] i_rx_phy_fs_state ; 
   reg[2:0] i_rx_phy_fs_next_state ; 
   reg i_rx_phy_rx_valid_r ; 
   reg i_rx_phy_sync_err_d ; 
   reg i_rx_phy_sync_err ; 
   reg i_rx_phy_bit_stuff_err ; 
   reg i_rx_phy_se0_r ; 
   reg i_rx_phy_byte_err ; 
   reg i_rx_phy_se0_s ; 
  assign  i_rx_phy_RxActive_o = i_rx_phy_rx_active ; 
  assign  i_rx_phy_RxValid_o = i_rx_phy_rx_valid ; 
  assign  i_rx_phy_RxError_o = i_rx_phy_sync_err | i_rx_phy_bit_stuff_err | i_rx_phy_byte_err ; 
  assign  i_rx_phy_DataIn_o = i_rx_phy_hold_reg ; 
  assign  i_rx_phy_LineState ={ i_rx_phy_rxdn_s1 , i_rx_phy_rxdp_s1 }; 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rx_en  <= i_rx_phy_RxEn_i ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_sync_err  <=! i_rx_phy_rx_active & i_rx_phy_sync_err_d ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxd_s0  <= i_rx_phy_rxd ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxd_s1  <= i_rx_phy_rxd_s0 ;
 
  always @(posedge i_rx_phy_clk )
       if ( i_rx_phy_rxd_s0 && i_rx_phy_rxd_s1 )
           i_rx_phy_rxd_s  <=1'b1;
        else if(! i_rx_phy_rxd_s0 &&! i_rx_phy_rxd_s1 )
           i_rx_phy_rxd_s  <=1'b0;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxdp_s0  <= i_rx_phy_rxdp ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxdp_s1  <= i_rx_phy_rxdp_s0 ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxdp_s_r  <= i_rx_phy_rxdp_s0 & i_rx_phy_rxdp_s1 ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxdp_s  <=( i_rx_phy_rxdp_s0 & i_rx_phy_rxdp_s1 )| i_rx_phy_rxdp_s_r ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxdn_s0  <= i_rx_phy_rxdn ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxdn_s1  <= i_rx_phy_rxdn_s0 ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxdn_s_r  <= i_rx_phy_rxdn_s0 & i_rx_phy_rxdn_s1 ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxdn_s  <=( i_rx_phy_rxdn_s0 & i_rx_phy_rxdn_s1 )| i_rx_phy_rxdn_s_r ;
 
  assign  i_rx_phy_k =! i_rx_phy_rxdp_s & i_rx_phy_rxdn_s ; 
  assign  i_rx_phy_j = i_rx_phy_rxdp_s &! i_rx_phy_rxdn_s ; 
  assign  i_rx_phy_se0 =! i_rx_phy_rxdp_s &! i_rx_phy_rxdn_s ; 
  always @(posedge i_rx_phy_clk )
       if ( i_rx_phy_fs_ce )
           i_rx_phy_se0_s  <= i_rx_phy_se0 ;
 
  assign  i_rx_phy_lock_en = i_rx_phy_rx_en ; 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rxd_r  <= i_rx_phy_rxd_s ;
 
  assign  i_rx_phy_change = i_rx_phy_rxd_r != i_rx_phy_rxd_s ; 
  always @(posedge i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_dpll_state  <=2'h1;
        else 
           i_rx_phy_dpll_state  <= i_rx_phy_dpll_next_state ;
 
  always @( i_rx_phy_dpll_state or i_rx_phy_lock_en or i_rx_phy_change )
       begin 
          i_rx_phy_fs_ce_d  =1'b0;
         case ( i_rx_phy_dpll_state )
          2'h0 :
             if ( i_rx_phy_lock_en && i_rx_phy_change )
                 i_rx_phy_dpll_next_state  =2'h0;
              else 
                 i_rx_phy_dpll_next_state  =2'h1;
          2'h1 :
             begin 
                i_rx_phy_fs_ce_d  =1'b1;
               if ( i_rx_phy_lock_en && i_rx_phy_change )
                   i_rx_phy_dpll_next_state  =2'h3;
                else 
                   i_rx_phy_dpll_next_state  =2'h2;
             end 
          2'h2 :
             if ( i_rx_phy_lock_en && i_rx_phy_change )
                 i_rx_phy_dpll_next_state  =2'h0;
              else 
                 i_rx_phy_dpll_next_state  =2'h3;
          2'h3 :
             if ( i_rx_phy_lock_en && i_rx_phy_change )
                 i_rx_phy_dpll_next_state  =2'h0;
              else 
                 i_rx_phy_dpll_next_state  =2'h0;
         endcase 
       end
  
   reg i_rx_phy_fs_ce_r1 , i_rx_phy_fs_ce_r2 ; 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_fs_ce_r1  <= i_rx_phy_fs_ce_d ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_fs_ce_r2  <= i_rx_phy_fs_ce_r1 ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_fs_ce  <= i_rx_phy_fs_ce_r2 ;
 parameter
    i_rx_phy_FS_IDLE =3'h0,
    i_rx_phy_K1 =3'h1,
    i_rx_phy_J1 =3'h2,
    i_rx_phy_K2 =3'h3,
    i_rx_phy_J2 =3'h4,
    i_rx_phy_K3 =3'h5,
    i_rx_phy_J3 =3'h6,
    i_rx_phy_K4 =3'h7; 
  always @(posedge i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_fs_state  <= i_rx_phy_FS_IDLE ;
        else 
           i_rx_phy_fs_state  <= i_rx_phy_fs_next_state ;
 
  always @( i_rx_phy_fs_state or i_rx_phy_fs_ce or i_rx_phy_k or i_rx_phy_j or i_rx_phy_rx_en or i_rx_phy_rx_active or i_rx_phy_se0 or i_rx_phy_se0_s )
       begin 
          i_rx_phy_synced_d  =1'b0;
          i_rx_phy_sync_err_d  =1'b0;
          i_rx_phy_fs_next_state  = i_rx_phy_fs_state ;
         if ( i_rx_phy_fs_ce &&! i_rx_phy_rx_active &&! i_rx_phy_se0 &&! i_rx_phy_se0_s )
            case ( i_rx_phy_fs_state )
              i_rx_phy_FS_IDLE  :
                begin 
                  if ( i_rx_phy_k && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_K1 ;
                end 
              i_rx_phy_K1  :
                begin 
                  if ( i_rx_phy_j && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_J1 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_J1  :
                begin 
                  if ( i_rx_phy_k && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_K2 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_K2  :
                begin 
                  if ( i_rx_phy_j && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_J2 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_J2  :
                begin 
                  if ( i_rx_phy_k && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_K3 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_K3  :
                begin 
                  if ( i_rx_phy_j && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_J3 ;
                   else if( i_rx_phy_k && i_rx_phy_rx_en )
                     begin 
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                        i_rx_phy_synced_d  =1'b1;
                     end 
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_J3  :
                begin 
                  if ( i_rx_phy_k && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_K4 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_K4  :
                begin 
                  if ( i_rx_phy_k )
                      i_rx_phy_synced_d  =1'b1;
                   i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                end 
            endcase 
       end
  
  always @(posedge i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_rx_active  <=1'b0;
        else if( i_rx_phy_synced_d && i_rx_phy_rx_en )
           i_rx_phy_rx_active  <=1'b1;
        else if( i_rx_phy_se0 && i_rx_phy_rx_valid_r )
           i_rx_phy_rx_active  <=1'b0;
 
  always @(posedge i_rx_phy_clk )
       if ( i_rx_phy_rx_valid )
           i_rx_phy_rx_valid_r  <=1'b1;
        else if( i_rx_phy_fs_ce )
           i_rx_phy_rx_valid_r  <=1'b0;
 
  always @(posedge i_rx_phy_clk )
       if ( i_rx_phy_fs_ce )
           i_rx_phy_sd_r  <= i_rx_phy_rxd_s ;
 
  always @(posedge i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_sd_nrzi  <=1'b0;
        else if(! i_rx_phy_rx_active )
           i_rx_phy_sd_nrzi  <=1'b1;
        else if( i_rx_phy_rx_active && i_rx_phy_fs_ce )
           i_rx_phy_sd_nrzi  <=!( i_rx_phy_rxd_s ^ i_rx_phy_sd_r );
 
  always @(posedge i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_one_cnt  <=3'h0;
        else if(! i_rx_phy_shift_en )
           i_rx_phy_one_cnt  <=3'h0;
        else if( i_rx_phy_fs_ce )
          begin 
            if (! i_rx_phy_sd_nrzi || i_rx_phy_drop_bit )
                i_rx_phy_one_cnt  <=3'h0;
             else 
                i_rx_phy_one_cnt  <= i_rx_phy_one_cnt +3'h1;
          end
  
  assign  i_rx_phy_drop_bit =( i_rx_phy_one_cnt ==3'h6); 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_bit_stuff_err  <= i_rx_phy_drop_bit & i_rx_phy_sd_nrzi & i_rx_phy_fs_ce &! i_rx_phy_se0 & i_rx_phy_rx_active ;
 
  always @(posedge i_rx_phy_clk )
       if ( i_rx_phy_fs_ce )
           i_rx_phy_shift_en  <= i_rx_phy_synced_d | i_rx_phy_rx_active ;
 
  always @(posedge i_rx_phy_clk )
       if ( i_rx_phy_fs_ce && i_rx_phy_shift_en &&! i_rx_phy_drop_bit )
           i_rx_phy_hold_reg  <={ i_rx_phy_sd_nrzi , i_rx_phy_hold_reg [7:1]};
 
  always @(posedge i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_bit_cnt  <=3'b0;
        else if(! i_rx_phy_shift_en )
           i_rx_phy_bit_cnt  <=3'h0;
        else if( i_rx_phy_fs_ce &&! i_rx_phy_drop_bit )
           i_rx_phy_bit_cnt  <= i_rx_phy_bit_cnt +3'h1;
 
  always @(posedge i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_rx_valid1  <=1'b0;
        else if( i_rx_phy_fs_ce &&! i_rx_phy_drop_bit &&( i_rx_phy_bit_cnt ==3'h7))
           i_rx_phy_rx_valid1  <=1'b1;
        else if( i_rx_phy_rx_valid1 && i_rx_phy_fs_ce &&! i_rx_phy_drop_bit )
           i_rx_phy_rx_valid1  <=1'b0;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_rx_valid  <=! i_rx_phy_drop_bit & i_rx_phy_rx_valid1 & i_rx_phy_fs_ce ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_se0_r  <= i_rx_phy_se0 ;
 
  always @(posedge i_rx_phy_clk )
        i_rx_phy_byte_err  <= i_rx_phy_se0 &! i_rx_phy_se0_r &(| i_rx_phy_bit_cnt [2:1])& i_rx_phy_rx_active ;
