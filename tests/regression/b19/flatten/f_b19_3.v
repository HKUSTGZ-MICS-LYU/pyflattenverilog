module b17 (
 input clock,
 input reset,
 input [31:0]datai,
 output integerdatao,
 input hold,
 input na,
 input bs16,
 output reg[29:0]address1,
 output reg[29:0]address2,
 output regwr,
 output regdc,
 output regmio,
 output regast1,
 output regast2,
 input ready1,
 input ready2) ; 
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
  
  b15  P1_P1_P1 ( P1_P1_be1 , P1_P1_addr1 , P1_P1_wr1 , P1_P1_dc1 , P1_P1_mio1 , P1_P1_ads1 , P1_P1_di1 , P1_P1_do1 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy1 , P1_P1_hold , P1_P1_reset ); 
  b15  P1_P1_P2 ( P1_P1_be2 , P1_P1_addr2 , P1_P1_wr2 , P1_P1_dc2 , P1_P1_mio2 , P1_P1_ads2 , P1_P1_di2 , P1_P1_do2 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy2 , P1_P1_hold , P1_P1_reset ); 
  b15  P1_P1_P3 ( P1_P1_be3 , P1_P1_addr3 , P1_P1_wr3 , P1_P1_dc3 , P1_P1_mio3 , P1_P1_ads3 , P1_P1_di3 , P1_P1_do3 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy3 , P1_P1_hold , P1_P1_reset ); endmodule 
module b17 (
 input clock,
 input reset,
 input [31:0]datai,
 output integerdatao,
 input hold,
 input na,
 input bs16,
 output reg[29:0]address1,
 output reg[29:0]address2,
 output regwr,
 output regdc,
 output regmio,
 output regast1,
 output regast2,
 input ready1,
 input ready2) ; 
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
  
  b15  P1_P1_P1 ( P1_P1_be1 , P1_P1_addr1 , P1_P1_wr1 , P1_P1_dc1 , P1_P1_mio1 , P1_P1_ads1 , P1_P1_di1 , P1_P1_do1 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy1 , P1_P1_hold , P1_P1_reset ); 
  b15  P1_P1_P2 ( P1_P1_be2 , P1_P1_addr2 , P1_P1_wr2 , P1_P1_dc2 , P1_P1_mio2 , P1_P1_ads2 , P1_P1_di2 , P1_P1_do2 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy2 , P1_P1_hold , P1_P1_reset ); 
  b15  P1_P1_P3 ( P1_P1_be3 , P1_P1_addr3 , P1_P1_wr3 , P1_P1_dc3 , P1_P1_mio3 , P1_P1_ads3 , P1_P1_di3 , P1_P1_do3 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy3 , P1_P1_hold , P1_P1_reset ); endmodule 
module b18 (
 input clock,
 input reset,
 input hold,
 input na,
 input bs,
 input sel,
 output reg[19:0]dout,
 input [31:0]din,
 output reg[2:0]aux) ; 
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
  b17  P1_P1 ( P1_clock , P1_reset , P1_di1 , P1_do1 , P1_hold , P1_na , P1_bs , P1_ad11 , P1_ad12 , P1_wr1 , P1_dc1 , P1_mio1 , P1_as11 , P1_as12 , P1_r11 , P1_r12 ); 
  b17  P1_P2 ( P1_clock , P1_reset , P1_di2 , P1_do2 , P1_hold , P1_na , P1_bs , P1_ad21 , P1_ad22 , P1_wr2 , P1_dc2 , P1_mio2 , P1_as21 , P1_as22 , P1_r21 , P1_r22 ); 
  b14  P1_P3 ( P1_clock , P1_reset , P1_ad31 , P1_di3 , P1_do3 , P1_rd3 , P1_wr3 ); 
  b14  P1_P4 ( P1_clock , P1_reset , P1_ad41 , P1_di4 , P1_do4 , P1_rd4 , P1_wr4 ); 
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
  endmodule 
module b18 (
 input clock,
 input reset,
 input hold,
 input na,
 input bs,
 input sel,
 output reg[19:0]dout,
 input [31:0]din,
 output reg[2:0]aux) ; 
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
  b17  P1_P1 ( P1_clock , P1_reset , P1_di1 , P1_do1 , P1_hold , P1_na , P1_bs , P1_ad11 , P1_ad12 , P1_wr1 , P1_dc1 , P1_mio1 , P1_as11 , P1_as12 , P1_r11 , P1_r12 ); 
  b17  P1_P2 ( P1_clock , P1_reset , P1_di2 , P1_do2 , P1_hold , P1_na , P1_bs , P1_ad21 , P1_ad22 , P1_wr2 , P1_dc2 , P1_mio2 , P1_as21 , P1_as22 , P1_r21 , P1_r22 ); 
  b14  P1_P3 ( P1_clock , P1_reset , P1_ad31 , P1_di3 , P1_do3 , P1_rd3 , P1_wr3 ); 
  b14  P1_P4 ( P1_clock , P1_reset , P1_ad41 , P1_di4 , P1_do4 , P1_rd4 , P1_wr4 ); 
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
  endmodule 


module b14(
   input                   clock,
   input                   reset,
   output   reg   [19:0]   addr,
   input          [31:0]   datai,
   output   integer        datao,
   output   reg            rd,
   output   reg            wr
);
   
   always @(posedge clock or posedge reset)
      begin: xhdl0
      
         integer       reg0;
         integer       reg1;
         integer       reg2;
         integer       reg3;
      
         reg           B;
         
         reg [19:0]    MAR;
         integer       MBR;
         
         reg [1:0]     mf;
         reg [2:0]     df;
         reg [0:0]     cf;
         
         reg [3:0]     ff;
         reg [19:0]    tail;
         integer       IR;
         
         reg [0:0]     state;
         
         integer       r;
         integer       m;
         integer       t;
         integer       d;
         integer       temp;
         reg [1:0]     s;
         
         parameter     FETCH = 0;
         parameter     EXEC = 1;
         
         if (reset == 1'b1)
         begin
            MAR = 0;
            MBR = 0;
            IR = 0;
            d = 0;
            r = 0;
            m = 0;
            s = 0;
            temp = 0;
            mf = 0;
            df = 0;
            ff = 0;
            cf = 0;
            tail = 0;
            B = 1'b0;
            reg0 = 0;
            reg1 = 0;
            reg2 = 0;
            reg3 = 0;
            addr <= 0;
            rd <= 1'b0;
            wr <= 1'b0;
            datao <= 0;
            state = FETCH;
         end
         else 
         begin
            rd <= 1'b0;
            wr <= 1'b0;
            case (state)
               FETCH :
                  begin
                     MAR = reg3 % 2 ** 20;
                     addr <= MAR;
                     rd <= 1'b1;
                     MBR = datai;
                     IR = MBR;
                     state = EXEC;
                  end
               EXEC :
                  begin
                     if (IR < 0)
                        IR = -IR;
                     mf = (IR/2 ** 27) % 4;
                     
                     df = (IR/2 ** 24) % 2 ** 3;
                     
                     ff = (IR/2 ** 19) % 2 ** 4;
                     
                     cf = (IR/2 ** 23) % 2;
                     
                     tail = IR % 2 ** 20;
                     reg3 = ((reg3 % 2 ** 29) + 8);
                     s = (IR/2 ** 29) % 4;
                     case (s)
                        0 :
                           r = reg0;
                        1 :
                           r = reg1;
                        2 :
                           r = reg2;
                        3 :
                           r = reg3;
                     endcase
                     case (cf)
                        1 :
                           begin
                              case (mf)
                                 0 :
                                    m = tail;
                                 1 :
                                    begin
                                       m = datai;
                                       addr <= tail;
                                       rd <= 1'b1;
                                    end
                                 2 :
                                    begin
                                       addr <= (tail + reg1) % 2 ** 20;
                                       rd <= 1'b1;
                                       m = datai;
                                    end
                                 3 :
                                    begin
                                       addr <= (tail + reg2) % 2 ** 20;
                                       rd <= 1'b1;
                                       m = datai;
                                    end
                              endcase
                              case (ff)
                                 0 :
                                    if (r < m)
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 1 :
                                    if (~(r < m))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 2 :
                                    if (r == m)
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 3 :
                                    if (~(r == m))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 4 :
                                    if (~(r > m))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 5 :
                                    if (r > m)
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 6 :
                                    begin
                                       if (r > 2 ** 30 - 1)
                                          r = r - 2 ** 30;
                                       if (r < m)
                                          B = 1'b1;
                                       else
                                          B = 1'b0;
                                    end
                                 7 :
                                    begin
                                       if (r > 2 ** 30 - 1)
                                          r = r - 2 ** 30;
                                       if (~(r < m))
                                          B = 1'b1;
                                       else
                                          B = 1'b0;
                                    end
                                 8 :
                                    if ((r < m) | (B == 1'b1))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 9 :
                                    if ((~(r < m)) | (B == 1'b1))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 10 :
                                    if ((r == m) | (B == 1'b1))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 11 :
                                    if ((~(r == m)) | (B == 1'b1))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 12 :
                                    if ((~(r > m)) | (B == 1'b1))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 13 :
                                    if ((r > m) | (B == 1'b1))
                                       B = 1'b1;
                                    else
                                       B = 1'b0;
                                 14 :
                                    begin
                                       if (r > 2 ** 30 - 1)
                                          r = r - 2 ** 30;
                                       if ((r < m) | (B == 1'b1))
                                          B = 1'b1;
                                       else
                                          B = 1'b0;
                                    end
                                 15 :
                                    begin
                                       if (r > 2 ** 30 - 1)
                                          r = r - 2 ** 30;
                                       if ((~(r < m)) | (B == 1'b1))
                                          B = 1'b1;
                                       else
                                          B = 1'b0;
                                    end
                              endcase
                           end
                        0 :
                           if (~(df == 7))
                           begin
                              if (df == 5)
                              begin
                                 if ((~(B)) == 1'b1)
                                    d = 3;
                              end
                              else if (df == 4)
                              begin
                                 if (B == 1'b1)
                                    d = 3;
                              end
                              else if (df == 3)
                                 d = 3;
                              else if (df == 2)
                                 d = 2;
                              else if (df == 1)
                                 d = 1;
                              else if (df == 0)
                                 d = 0;
                              case (ff)
                                 0 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       t = 0;
                                       case (d)
                                          0 :
                                             reg0 = t - m;
                                          1 :
                                             reg1 = t - m;
                                          2 :
                                             reg2 = t - m;
                                          3 :
                                             reg3 = t - m;
                                          default :
                                             ;
                                       endcase
                                    end
                                 1 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       reg2 = reg3;
                                       reg3 = m;
                                    end
                                 2 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = m;
                                          1 :
                                             reg1 = m;
                                          2 :
                                             reg2 = m;
                                          3 :
                                             reg3 = m;
                                          default :
                                             ;
                                       endcase
                                    end
                                 3 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = m;
                                          1 :
                                             reg1 = m;
                                          2 :
                                             reg2 = m;
                                          3 :
                                             reg3 = m;
                                          default :
                                             ;
                                       endcase
                                    end
                                 4 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = (r + m) % 2 ** 30;
                                          1 :
                                             reg1 = (r + m) % 2 ** 30;
                                          2 :
                                             reg2 = (r + m) % 2 ** 30;
                                          3 :
                                             reg3 = (r + m) % 2 ** 30;
                                          default :
                                             ;
                                       endcase
                                    end
                                 5 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = (r + m) % 2 ** 30;
                                          1 :
                                             reg1 = (r + m) % 2 ** 30;
                                          2 :
                                             reg2 = (r + m) % 2 ** 30;
                                          3 :
                                             reg3 = (r + m) % 2 ** 30;
                                          default :
                                             ;
                                       endcase
                                    end
                                 6 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = (r - m) % 2 ** 30;
                                          1 :
                                             reg1 = (r - m) % 2 ** 30;
                                          2 :
                                             reg2 = (r - m) % 2 ** 30;
                                          3 :
                                             reg3 = (r - m) % 2 ** 30;
                                          default :
                                             ;
                                       endcase
                                    end
                                 7 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = (r - m) % 2 ** 30;
                                          1 :
                                             reg1 = (r - m) % 2 ** 30;
                                          2 :
                                             reg2 = (r - m) % 2 ** 30;
                                          3 :
                                             reg3 = (r - m) % 2 ** 30;
                                          default :
                                             ;
                                       endcase
                                    end
                                 8 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = (r + m) % 2 ** 30;
                                          1 :
                                             reg1 = (r + m) % 2 ** 30;
                                          2 :
                                             reg2 = (r + m) % 2 ** 30;
                                          3 :
                                             reg3 = (r + m) % 2 ** 30;
                                          default :
                                             ;
                                       endcase
                                    end
                                 9 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = (r - m) % 2 ** 30;
                                          1 :
                                             reg1 = (r - m) % 2 ** 30;
                                          2 :
                                             reg2 = (r - m) % 2 ** 30;
                                          3 :
                                             reg3 = (r - m) % 2 ** 30;
                                          default :
                                             ;
                                       endcase
                                    end
                                 10 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = (r + m) % 2 ** 30;
                                          1 :
                                             reg1 = (r + m) % 2 ** 30;
                                          2 :
                                             reg2 = (r + m) % 2 ** 30;
                                          3 :
                                             reg3 = (r + m) % 2 ** 30;
                                          default :
                                             ;
                                       endcase
                                    end
                                 11 :
                                    begin
                                       case (mf)
                                          0 :
                                             m = tail;
                                          1 :
                                             begin
                                                m = datai;
                                                addr <= tail;
                                                rd <= 1'b1;
                                             end
                                          2 :
                                             begin
                                                addr <= (tail + reg1) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                          3 :
                                             begin
                                                addr <= (tail + reg2) % 2 ** 20;
                                                rd <= 1'b1;
                                                m = datai;
                                             end
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = (r - m) % 2 ** 30;
                                          1 :
                                             reg1 = (r - m) % 2 ** 30;
                                          2 :
                                             reg2 = (r - m) % 2 ** 30;
                                          3 :
                                             reg3 = (r - m) % 2 ** 30;
                                          default :
                                             ;
                                       endcase
                                    end
                                 12 :
                                    begin
                                       case (mf)
                                          0 :
                                             t = r/2;
                                          1 :
                                             begin
                                                t = r/2;
                                                if (B == 1'b1)
                                                   t = t % 2 ** 29;
                                             end
                                          2 :
                                             t = (r % 2 ** 29) * 2;
                                          3 :
                                             begin
                                                t = (r % 2 ** 29) * 2;
                                                if (t > 2 ** 30 - 1)
                                                   B = 1'b1;
                                                else
                                                   B = 1'b0;
                                             end
                                          default :
                                             ;
                                       endcase
                                       case (d)
                                          0 :
                                             reg0 = t;
                                          1 :
                                             reg1 = t;
                                          2 :
                                             reg2 = t;
                                          3 :
                                             reg3 = t;
                                          default :
                                             ;
                                       endcase
                                    end
                                 13, 14, 15 :
                                    ;
                              endcase
                           end
                           else if (df == 7)
                           begin
                              case (mf)
                                 0 :
                                    m = tail;
                                 1 :
                                    m = tail;
                                 2 :
                                    m = (reg1 % 2 ** 20) + (tail % 2 ** 20);
                                 3 :
                                    m = (reg2 % 2 ** 20) + (tail % 2 ** 20);
                              endcase
                              addr <= m % 2 * 20;
                              wr <= 1'b1;
                              datao <= r;
                           end
                     endcase
                     state = FETCH;
                  end
            endcase
         end
      end
      
   endmodule


module b15(
   output   reg      [3:0]    BE_n,
   output   reg      [29:0]   Address,
   output   reg               W_R_n,
   output   reg               D_C_n,
   output   reg               M_IO_n,
   output   reg               ADS_n,
   input             [31:0]   Datai,
   output   integer           Datao,
   input                      CLOCK,
   input                      NA_n,
   input                      BS16_n,
   input                      READY_n,
   input                      HOLD,
   input                      RESET
);
 

   
   reg           StateNA;
   reg           StateBS16;
   reg           RequestPending;
   parameter     Pending = 1'b1;
   parameter     NotPending = 1'b0;
   reg           NonAligned;
   reg           ReadRequest;
   reg           MemoryFetch;
   reg           CodeFetch;
   reg [3:0]     ByteEnable;
   integer       DataWidth;
   parameter     WidthByte = 0;
   parameter     WidthWord = 1;
   parameter     WidthDword = 2;
   
   reg [2:0]     State;
   
   parameter     StateInit = 0;
   parameter     StateTi = 1;
   parameter     StateT1 = 2;
   parameter     StateT2 = 3;
   parameter     StateT1P = 4;
   parameter     StateTh = 5;
   parameter     StateT2P = 6;
   parameter     StateT2I = 7;
   
   integer       EAX;
   integer       EBX;
   
   integer       rEIP;
   
   parameter     REP = 8'hF3;
   parameter     REPNE = 8'hF2;
   parameter     LOCK = 8'hF0;
   
   parameter     CSsop = 8'h2E;
   parameter     SSsop = 8'h36;
   parameter     DSsop = 8'h3E;
   parameter     ESsop = 8'h26;
   parameter     FSsop = 8'h64;
   parameter     GSsop = 8'h65;
   parameter     OPsop = 8'h66;
   parameter     ADsop = 8'h67;
   
   parameter     MOV_al_b = 8'hB0;
   parameter     MOV_eax_dw = 8'hB8;
   parameter     MOV_ebx_dw = 8'hBB;
   parameter     MOV_ebx_eax = 8'h89;
   parameter     MOV_eax_ebx = 8'h8B;
   parameter     IN_al = 8'hE4;
   parameter     OUT_al = 8'hE6;
   parameter     ADD_al_b = 8'h04;
   parameter     ADD_ax_w = 8'h05;
   parameter     ROL_eax_b = 8'hD1;
   parameter     ROL_al_1 = 8'hD0;
   parameter     ROL_al_n = 8'hC0;
   parameter     INC_eax = 8'h40;
   parameter     INC_ebx = 8'h43;
   parameter     JMP_rel_short = 8'hEB;
   parameter     JMP_rel_near = 8'hE9;
   parameter     JMP_intseg_immed = 8'hEA;
   parameter     HLT = 8'hF4;
   parameter     WAITx = 8'h9B;
   parameter     NOP = 8'h90;
   
   
   always @(posedge CLOCK or posedge RESET)
   begin: P0
      if (RESET == 1'b1)
      begin
         BE_n <= 4'b0000;
         Address <= 0;
         W_R_n <= 1'b0;
         D_C_n <= 1'b0;
         M_IO_n <= 1'b0;
         ADS_n <= 1'b0;
         
         State <= StateInit;
         
         StateNA <= 1'b0;
         StateBS16 <= 1'b0;
         DataWidth <= 0;
      end
      
      else 
         case (State)
            StateInit :
               begin
                  D_C_n <= 1'b1;
                  ADS_n <= 1'b1;
                  State <= StateTi;
                  StateNA <= 1'b1;
                  StateBS16 <= 1'b1;
                  DataWidth <= 2;
                  State <= StateTi;
               end
            
            StateTi :
               if (RequestPending == Pending)
                  State <= StateT1;
               else if (HOLD == 1'b1)
                  State <= StateTh;
               else
                  State <= StateTi;
            
            StateT1 :
               begin
                  Address <= rEIP/4 % 2 ** 30;
                  BE_n <= ByteEnable;
                  M_IO_n <= MemoryFetch;
                  if (ReadRequest == Pending)
                     W_R_n <= 1'b0;
                  else
                     W_R_n <= 1'b1;
                  if (CodeFetch == Pending)
                     D_C_n <= 1'b0;
                  else
                     D_C_n <= 1'b1;
                  ADS_n <= 1'b0;
                  State <= StateT2;
               end
            
            StateT2 :
               begin
                  if (READY_n == 1'b0 & HOLD == 1'b0 & RequestPending == Pending)
                     State <= StateT1;
                  else if (READY_n == 1'b1 & NA_n == 1'b1)
                     ;
                  else if ((RequestPending == Pending | HOLD == 1'b1) & (READY_n == 1'b1 & NA_n == 1'b0))
                     State <= StateT2I;
                  else if (RequestPending == Pending & HOLD == 1'b0 & READY_n == 1'b1 & NA_n == 1'b0)
                     State <= StateT2P;
                  else if (RequestPending == NotPending & HOLD == 1'b0 & READY_n == 1'b0)
                     State <= StateTi;
                  else if (HOLD == 1'b1 & READY_n == 1'b1)
                     State <= StateTh;
                  else
                     State <= StateT2;
                  StateBS16 <= BS16_n;
                  if (BS16_n == 1'b0)
                     DataWidth <= WidthWord;
                  else
                     DataWidth <= WidthDword;
                  StateNA <= NA_n;
                  ADS_n <= 1'b1;
               end
            
            StateT1P :
               begin
                  if (NA_n == 1'b0 & HOLD == 1'b0 & RequestPending == Pending)
                     State <= StateT2P;
                  else if (NA_n == 1'b0 & (HOLD == 1'b1 | RequestPending == NotPending))
                     State <= StateT2I;
                  else if (NA_n == 1'b1)
                     State <= StateT2;
                  else
                     State <= StateT1P;
                  StateBS16 <= BS16_n;
                  if (BS16_n == 1'b0)
                     DataWidth <= WidthWord;
                  else
                     DataWidth <= WidthDword;
                  StateNA <= NA_n;
                  ADS_n <= 1'b1;
               end
            
            StateTh :
               if (HOLD == 1'b0 & RequestPending == Pending)
                  State <= StateT1;
               else if (HOLD == 1'b0 & RequestPending == NotPending)
                  State <= StateTi;
               else
                  State <= StateTh;
            
            StateT2P :
               begin
                  Address <= rEIP/2 % 2 ** 30;
                  BE_n <= ByteEnable;
                  M_IO_n <= MemoryFetch;
                  if (ReadRequest == Pending)
                     W_R_n <= 1'b0;
                  else
                     W_R_n <= 1'b1;
                  if (CodeFetch == Pending)
                     D_C_n <= 1'b0;
                  else
                     D_C_n <= 1'b1;
                  ADS_n <= 1'b0;
                  if (READY_n == 1'b0)
                     State <= StateT1P;
                  else
                     State <= StateT2P;
               end
            
            StateT2I :
               if (READY_n == 1'b1 & RequestPending == Pending & HOLD == 1'b0)
                  State <= StateT2P;
               else if (READY_n == 1'b0 & HOLD == 1'b1)
                  State <= StateTh;
               else if (READY_n == 1'b0 & HOLD == 1'b0 & RequestPending == Pending)
                  State <= StateT1;
               else if (READY_n == 1'b0 & HOLD == 1'b0 & RequestPending == NotPending)
                  State <= StateTi;
               else
                  State <= StateT2I;
         endcase
   end
   
   
   always @(posedge CLOCK or posedge RESET)
   begin: P1
      reg [7:0]     InstQueue[15:0];
      reg [4:0]     InstQueueRd_Addr;
      reg [4:0]     InstQueueWr_Addr;
      parameter     InstQueueLimit = 15;
      integer       InstAddrPointer;
      integer       PhyAddrPointer;
      reg           Extended;
      reg           More;
      reg           Flush;
      reg [15:0]    lWord;
      reg [14:0]    uWord;
      integer       fWord;
      reg [3:0]     State2;
      parameter     Si = 0;
      parameter     S1 = 1;
      parameter     S2 = 2;
      parameter     S3 = 3;
      parameter     S4 = 4;
      parameter     S5 = 5;
      parameter     S6 = 6;
      parameter     S7 = 7;
      parameter     S8 = 8;
      parameter     S9 = 9;
      
      if (RESET == 1'b1)
      begin
         State2 = Si;
         InstQueue[0] = 16*{0};
         InstQueue[1] = 16*{0};
         InstQueue[2] = 16*{0};
         InstQueue[3] = 16*{0};
         InstQueue[4] = 16*{0};
         InstQueue[5] = 16*{0};
         InstQueue[6] = 16*{0};
         InstQueue[7] = 16*{0};

         InstQueueRd_Addr = 0;
         InstQueueWr_Addr = 0;
         InstAddrPointer = 0;
         PhyAddrPointer = 0;
         Extended = 1'b0;
         More = 1'b0;
         Flush = 1'b0;
         lWord = 0;
         uWord = 0;
         fWord = 0;
         CodeFetch <= 1'b0;
         Datao <= 0;
         EAX <= 0;
         EBX <= 0;
         rEIP <= 0;
         ReadRequest <= 1'b0;
         MemoryFetch <= 1'b0;
         RequestPending <= 1'b0;
      end
      
      else 
         case (State2)
            Si :
               begin
                  PhyAddrPointer = rEIP;
                  InstAddrPointer = PhyAddrPointer;
                  State2 = S1;
                  rEIP <= 20'hFFFF0;
                  ReadRequest <= 1'b1;
                  MemoryFetch <= 1'b1;
                  RequestPending <= 1'b1;
               end
            S1 :
               begin
                  RequestPending <= Pending;
                  ReadRequest <= Pending;
                  MemoryFetch <= Pending;
                  CodeFetch <= Pending;
                  if (READY_n == 1'b0)
                     State2 = S2;
                  else
                     State2 = S1;
               end
            S2 :
               begin
                  RequestPending <= NotPending;
                  InstQueue[InstQueueWr_Addr] = Datai % (2 ** 8);
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  InstQueue[InstQueueWr_Addr] = Datai % 2 ** 8;
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  if (StateBS16 == 1'b1)
                  begin
                     InstQueue[InstQueueWr_Addr] = (Datai/(2 ** 16)) % (2 ** 8);
                     InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                     InstQueue[InstQueueWr_Addr] = (Datai/(2 ** 24)) % (2 ** 8);
                     InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                     PhyAddrPointer = PhyAddrPointer + 4;
                     State2 = S5;
                  end
                  else
                  begin
                     PhyAddrPointer = PhyAddrPointer + 2;
                     if (PhyAddrPointer < 0)
                        rEIP <= -PhyAddrPointer;
                     else
                        rEIP <= PhyAddrPointer;
                     State2 = S3;
                  end
               end
            S3 :
               begin
                  RequestPending <= Pending;
                  if (READY_n == 1'b0)
                     State2 = S4;
                  else
                     State2 = S3;
               end
            S4 :
               begin
                  RequestPending <= NotPending;
                  InstQueue[InstQueueWr_Addr] = Datai % (2 ** 8);
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  InstQueue[InstQueueWr_Addr] = Datai % (2 ** 8);
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  PhyAddrPointer = PhyAddrPointer + 2;
                  State2 = S5;
               end
            S5 :
               begin
                  case (InstQueue[InstQueueRd_Addr])
                     NOP :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     OPsop :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Extended = 1'b1;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     JMP_rel_short :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 3)
                        begin
                           if (InstQueue[(InstQueueRd_Addr + 1) % 16] > 127)
                           begin
                              PhyAddrPointer = InstAddrPointer + 1 - (8'hFF - InstQueue[(InstQueueRd_Addr + 1) % 16]);
                              InstAddrPointer = PhyAddrPointer;
                           end
                           else
                           begin
                              PhyAddrPointer = InstAddrPointer + 2 + InstQueue[(InstQueueRd_Addr + 1) % 16];
                              InstAddrPointer = PhyAddrPointer;
                           end
                           Flush = 1'b1;
                           More = 1'b0;
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     JMP_rel_near :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 5)
                        begin
                           PhyAddrPointer = InstAddrPointer + 5 + InstQueue[(InstQueueRd_Addr + 1) % 16];
                           InstAddrPointer = PhyAddrPointer;
                           Flush = 1'b1;
                           More = 1'b0;
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     JMP_intseg_immed :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     MOV_al_b :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     MOV_eax_dw :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 5)
                        begin
                           EAX <= InstQueue[(InstQueueRd_Addr + 4) % 16] * (2 ** 23) + InstQueue[(InstQueueRd_Addr + 3) % 16] * (2 ** 16) + InstQueue[(InstQueueRd_Addr + 2) % 16] * (2 ** 8) + InstQueue[(InstQueueRd_Addr + 1) % 16];
                           More = 1'b0;
                           Flush = 1'b0;
                           InstAddrPointer = InstAddrPointer + 5;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 5) % 16;
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     MOV_ebx_dw :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 5)
                        begin
                           EBX <= InstQueue[(InstQueueRd_Addr + 4) % 16] * (2 ** 23) + InstQueue[(InstQueueRd_Addr + 3) % 16] * (2 ** 16) + InstQueue[(InstQueueRd_Addr + 2) % 16] * (2 ** 8) + InstQueue[(InstQueueRd_Addr + 1) % 1];
                           More = 1'b0;
                           Flush = 1'b0;
                           InstAddrPointer = InstAddrPointer + 5;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 5) % 16;
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     MOV_eax_ebx :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 2)
                        begin
                           if (EBX < 0)
                              rEIP <= -EBX;
                           else
                              rEIP <= EBX;
                           RequestPending <= Pending;
                           ReadRequest <= Pending;
                           MemoryFetch <= Pending;
                           CodeFetch <= NotPending;
                           if (READY_n == 1'b0)
                           begin
                              RequestPending <= NotPending;
                              uWord = Datai % (2 ** 15);
                              if (StateBS16 == 1'b1)
                                 lWord = Datai % (2 ** 16);
                              else
                              begin
                                 rEIP <= rEIP + 2;
                                 RequestPending <= Pending;
                                 if (READY_n == 1'b0)
                                 begin
                                    RequestPending <= NotPending;
                                    lWord = Datai % (2 ** 16);
                                 end
                              end
                              if (READY_n == 1'b0)
                              begin
                                 EAX <= uWord * (2 ** 16) + lWord;
                                 More = 1'b0;
                                 Flush = 1'b0;
                                 InstAddrPointer = InstAddrPointer + 2;
                                 InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                              end
                           end
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     MOV_ebx_eax :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 2)
                        begin
                           if (EBX < 0)
                              rEIP <= EBX;
                           else
                              rEIP <= EBX;
                           lWord = EAX % (2 ** 16);
                           uWord = (EAX/(2 ** 16)) % (2 ** 15);
                           RequestPending <= Pending;
                           ReadRequest <= NotPending;
                           MemoryFetch <= Pending;
                           CodeFetch <= NotPending;
                           if (State == StateT1 | State == StateT1P)
                           begin
                              Datao <= (uWord * (2 ** 16) + lWord);
                              if (READY_n == 1'b0)
                              begin
                                 RequestPending <= NotPending;
                                 if (StateBS16 == 1'b0)
                                 begin
                                    rEIP <= rEIP + 2;
                                    RequestPending <= Pending;
                                    ReadRequest <= NotPending;
                                    MemoryFetch <= Pending;
                                    CodeFetch <= NotPending;
                                    State2 = S6;
                                 end
                                 More = 1'b0;
                                 Flush = 1'b0;
                                 InstAddrPointer = InstAddrPointer + 2;
                                 InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                              end
                           end
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     IN_al :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 2)
                        begin
                           rEIP <= InstQueueRd_Addr + 1;
                           RequestPending <= Pending;
                           ReadRequest <= Pending;
                           MemoryFetch <= NotPending;
                           CodeFetch <= NotPending;
                           if (READY_n == 1'b0)
                           begin
                              RequestPending <= NotPending;
                              EAX <= Datai;
                              InstAddrPointer = InstAddrPointer + 2;
                              InstQueueRd_Addr = (InstQueueRd_Addr + 2);
                              Flush = 1'b0;
                              More = 1'b0;
                           end
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     OUT_al :
                        if ((InstQueueWr_Addr - InstQueueRd_Addr) >= 2)
                        begin
                           rEIP <= InstQueueRd_Addr + 1;
                           RequestPending <= Pending;
                           ReadRequest <= NotPending;
                           MemoryFetch <= NotPending;
                           CodeFetch <= NotPending;
                           if (State == StateT1 | State == StateT1P)
                           begin
                              fWord = EAX % (2 ** 16);
                              Datao <= fWord;
                              if (READY_n == 1'b0)
                              begin
                                 RequestPending <= NotPending;
                                 InstAddrPointer = InstAddrPointer + 2;
                                 InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                                 Flush = 1'b0;
                                 More = 1'b0;
                              end
                           end
                        end
                        else
                        begin
                           Flush = 1'b0;
                           More = 1'b1;
                        end
                     ADD_al_b :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     ADD_ax_w :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     ROL_al_1 :
                        begin
                           InstAddrPointer = InstAddrPointer + 2;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     ROL_al_n :
                        begin
                           InstAddrPointer = InstAddrPointer + 2;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 2) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     INC_eax :
                        begin
                           EAX <= EAX + 1;
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     INC_ebx :
                        begin
                           EBX <= EBX + 1;
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                     default :
                        begin
                           InstAddrPointer = InstAddrPointer + 1;
                           InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                           Flush = 1'b0;
                           More = 1'b0;
                        end
                  endcase
                  if ((~(InstQueueRd_Addr < InstQueueWr_Addr)) | (((InstQueueLimit - InstQueueRd_Addr) < 4) | Flush | More))
                     State2 = S7;
               end
            
            S6 :
               begin
                  Datao <= (uWord * (2 ** 16) + lWord);
                  if (READY_n == 1'b0)
                  begin
                     RequestPending <= NotPending;
                     State2 = S5;
                  end
               end
            
            S7 :
               begin
                  if (Flush)
                  begin
                     InstQueueRd_Addr = 1;
                     InstQueueWr_Addr = 1;
                     
                     if (InstAddrPointer < 0)
                        fWord = -InstAddrPointer;
                     else
                        fWord = InstAddrPointer;
                     
                     if (fWord % 2 == 1)
                        InstQueueRd_Addr = (InstQueueRd_Addr + fWord % 4) % 16;
                  end
                  if ((InstQueueLimit - InstQueueRd_Addr) < 3)
                  begin
                     State2 = S8;
                     InstQueueWr_Addr = 0;
                  end
                  else
                     State2 = S9;
               end
            
            S8 :
               if (InstQueueRd_Addr <= InstQueueLimit)
               begin
                  InstQueue[InstQueueWr_Addr] = InstQueue[InstQueueRd_Addr];
                  InstQueueRd_Addr = (InstQueueRd_Addr + 1) % 16;
                  InstQueueWr_Addr = (InstQueueWr_Addr + 1) % 16;
                  State2 = S8;
               end
               else
               begin
                  InstQueueRd_Addr = 0;
                  State2 = S9;
               end
            
            S9 :
               begin
                  rEIP <= PhyAddrPointer;
                  State2 = S1;
               end
         endcase
   end
   
   
   always @(posedge CLOCK or posedge RESET)
   begin: P2
      if (RESET == 1'b1)
      begin
         ByteEnable <= 4'b0000;
         NonAligned <= 1'b0;
      end
      else 
         case (DataWidth)
            WidthByte :
               case (rEIP % 4)
                  0 :
                     ByteEnable <= 4'b1110;
                  1 :
                     ByteEnable <= 4'b1101;
                  2 :
                     ByteEnable <= 4'b1011;
                  3 :
                     ByteEnable <= 4'b0111;
                  default :
                     ;
               endcase
            WidthWord :
               case (rEIP % 4)
                  0 :
                     begin
                        ByteEnable <= 4'b1100;
                        NonAligned <= NotPending;
                     end
                  1 :
                     begin
                        ByteEnable <= 4'b1001;
                        NonAligned <= NotPending;
                     end
                  2 :
                     begin
                        ByteEnable <= 4'b0011;
                        NonAligned <= NotPending;
                     end
                  3 :
                     begin
                        ByteEnable <= 4'b0111;
                        NonAligned <= Pending;
                     end
                  default :
                     ;
               endcase
            WidthDword :
               case (rEIP % 4)
                  0 :
                     begin
                        ByteEnable <= 4'b0000;
                        NonAligned <= NotPending;
                     end
                  1 :
                     begin
                        ByteEnable <= 4'b0001;
                        NonAligned <= Pending;
                     end
                  2 :
                     begin
                        NonAligned <= Pending;
                        ByteEnable <= 4'b0011;
                     end
                  3 :
                     begin
                        NonAligned <= Pending;
                        ByteEnable <= 4'b0111;
                     end
                  default :
                     ;
               endcase
            default :
               ;
         endcase
   end

endmodule

module b17(
   input                         clock,
   input                         reset,
   input                [31:0]   datai,
   output   integer              datao,
   input                         hold,
   input                         na,
   input                         bs16,
   output   reg          [29:0]  address1,
   output   reg          [29:0]  address2,
   output   reg                  wr,
   output   reg                  dc,
   output   reg                  mio,
   output   reg                  ast1,
   output   reg                  ast2,
   input                         ready1,
   input                         ready2
   );

   integer       buf1;
   integer       buf2;
   wire [3:0]    be1;
   wire [3:0]    be2;
   wire [3:0]    be3;
   wire [29:0]   addr1;
   wire [29:0]   addr2;
   wire [29:0]   addr3;
   wire          wr1;
   wire          wr2;
   wire          wr3;
   wire          dc1;
   wire          dc2;
   wire          dc3;
   wire          mio1;
   wire          mio2;
   wire          mio3;
   wire          ads1;
   wire          ads2;
   wire          ads3;
   integer       di1;
   integer       di2;
   integer       di3;
   wire [31:0]   do1;
   wire [31:0]   do2;
   wire [31:0]   do3;
   reg           rdy1;
   reg           rdy2;
   reg           rdy3;
   reg           ready11;
   reg           ready12;
   reg           ready21;
   reg           ready22;
   
   
   always @(posedge clock or posedge reset)
      if (reset == 1'b1)
      begin
         buf1 <= 0;
         ready11 <= 1'b0;
         ready12 <= 1'b0;
      end
      else 
      begin
         if (addr1 > 2 ** 29 & ads1 == 1'b0 & mio1 == 1'b1 & dc1 == 1'b0 & wr1 == 1'b1 & be1 == 4'b0000)
         begin
            buf1 <= do1;
            ready11 <= 1'b0;
            ready12 <= 1'b1;
         end
         else if (addr2 > 2 ** 29 & ads2 == 1'b0 & mio2 == 1'b1 & dc2 == 1'b0 & wr2 == 1'b1 & be2 == 4'b0000)
         begin
            buf1 <= do2;
            ready11 <= 1'b1;
            ready12 <= 1'b0;
         end
         else
         begin
            ready11 <= 1'b1;
            ready12 <= 1'b1;
         end
      end
   
   
   always @(posedge clock or posedge reset)
      if (reset == 1'b1)
      begin
         buf2 <= 0;
         ready21 <= 1'b0;
         ready22 <= 1'b0;
      end
      else 
      begin
         if (addr2 < 2 ** 29 & ads2 == 1'b0 & mio2 == 1'b1 & dc2 == 1'b0 & wr2 == 1'b1 & be2 == 4'b0000)
         begin
            buf2 <= do2;
            ready21 <= 1'b0;
            ready22 <= 1'b1;
         end
         else if (ads3 == 1'b0 & mio3 == 1'b1 & dc3 == 1'b0 & wr3 == 1'b0 & be3 == 4'b0000)
         begin
            ready21 <= 1'b1;
            ready22 <= 1'b0;
         end
         else
         begin
            ready21 <= 1'b1;
            ready22 <= 1'b1;
         end
      end
   
   
   always @(addr1 or buf1 or datai)
      if (addr1 > 2 ** 29)
         di1 <= buf1;
      else
         di1 <= datai;
   
   
   always @(addr2 or buf1 or buf2)
      if (addr2 > 2 ** 29)
         di2 <= buf1;
      else
         di2 <= buf2;
   
   
   always @(addr2 or addr3 or do1 or do2 or do3)
      if ((do1 < 2 ** 30) & (do2 < 2 ** 30) & (do3 < 2 ** 30))
         address2 <= addr3;
      else
         address2 <= addr2;
   
   
   always @(buf2 or do3 or addr1 or wr3 or dc3 or mio3 or ads1 or ads3 or ready1 or ready2 or ready11 or ready12 or ready21 or ready22)
   begin
      di3 <= buf2;
      datao <= do3;
      address1 <= addr1;
      wr <= wr3;
      dc <= dc3;
      mio <= mio3;
      ast1 <= ads1;
      ast2 <= ads3;
      rdy1 <= ready11 & ready1;
      rdy2 <= ready12 & ready21;
      rdy3 <= ready22 & ready2;
   end
   
   
   b15 P1(be1, addr1, wr1, dc1, mio1, ads1, di1, do1, clock, na, bs16, rdy1, hold, reset);
   
   b15 P2(be2, addr2, wr2, dc2, mio2, ads2, di2, do2, clock, na, bs16, rdy2, hold, reset);
   
   b15 P3(be3, addr3, wr3, dc3, mio3, ads3, di3, do3, clock, na, bs16, rdy3, hold, reset);
   
endmodule


module b18(
   input                            clock,
   input                            reset,
   input                            hold,
   input                            na,
   input                            bs,
   input                            sel,
   output    reg   [19:0]           dout,
   input           [31:0]           din,
   output    reg   [2:0]            aux
);
   
   
   integer       di1;
   integer       di2;
   wire [31:0]   do1;
   wire [31:0]   do2;
   integer       td1;
   integer       td2;
   integer       di3;
   integer       di4;
   wire [31:0]   do3;
   wire [31:0]   do4;
   reg [29:0]    tad1;
   reg [29:0]    tad2;
   wire [29:0]   ad11;
   wire [29:0]   ad12;
   wire [29:0]   ad21;
   wire [29:0]   ad22;
   wire [19:0]   ad31;
   wire [19:0]   ad41;
   reg [19:0]    tad3;
   reg [19:0]    tad4;
   wire          wr1;
   wire          wr2;
   wire          wr3;
   wire          wr4;
   wire          dc1;
   wire          dc2;
   wire          mio1;
   wire          mio2;
   wire          as11;
   wire          as12;
   wire          as21;
   wire          as22;
   reg           r11;
   reg           r12;
   reg           r21;
   reg           r22;
   wire          rd3;
   wire          rd4;
   
   
   b17 P1(clock, reset, di1, do1, hold, na, bs, ad11, ad12, wr1, dc1, mio1, as11, as12, r11, r12);
   
   b17 P2(clock, reset, di2, do2, hold, na, bs, ad21, ad22, wr2, dc2, mio2, as21, as22, r21, r22);
   
   b14 P3(clock, reset, ad31, di3, do3, rd3, wr3);
   
   b14 P4(clock, reset, ad41, di4, do4, rd4, wr4);
   
   
   always @(do1 or rd3 or wr1 or mio1 or dc1 or as12 or do2 or rd4 or wr2 or mio2 or dc2 or as22 or as21 or as11 or wr3 or ad31 or tad2 or wr4 or ad41 or tad1 or do3 or do4 or ad11 or ad12 or ad21 or ad22 or tad3 or tad4 or sel or din or td1 or td2)
   begin
      di3 <= do1 % 2 ** 20;
      
      r12 <= (~(rd3 & wr1 & mio1 & dc1 & (~as12)));
      di4 <= do2;
      r22 <= (~(rd4 & wr2 & mio2 & dc2 & (~as22)));
      r11 <= as21;
      r21 <= as11;
      if (wr3 == 1'b1)
         tad3 <= ad31;
      else
         tad3 <= tad2 % 2 ** 20;
      if (wr4 == 1'b1)
         tad4 <= ad41;
      else
         tad4 <= tad1 % 2 ** 20;
      if (do3 > 2 ** 28)
         tad1 <= ad11;
      else
         tad1 <= ad12;
      if (do4 > 2 ** 29)
         tad2 <= ad21;
      else
         tad2 <= ad22;
      dout <= (tad3 * tad4) % 2 ** 19;
      if (sel == 1'b0)
      begin
         td1 <= 0;
         td2 <= din;
      end
      else
      begin
         td1 <= din;
         td2 <= 0;
      end
      di1 <= do4 * td1;
      di2 <= do3 * td2;
      aux <= (tad1 * tad2) % 2 ** 3;
   end
   
endmodule


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
  b17  P1_P1 ( P1_clock , P1_reset , P1_di1 , P1_do1 , P1_hold , P1_na , P1_bs , P1_ad11 , P1_ad12 , P1_wr1 , P1_dc1 , P1_mio1 , P1_as11 , P1_as12 , P1_r11 , P1_r12 ); 
  b17  P1_P2 ( P1_clock , P1_reset , P1_di2 , P1_do2 , P1_hold , P1_na , P1_bs , P1_ad21 , P1_ad22 , P1_wr2 , P1_dc2 , P1_mio2 , P1_as21 , P1_as22 , P1_r21 , P1_r22 ); 
  b14  P1_P3 ( P1_clock , P1_reset , P1_ad31 , P1_di3 , P1_do3 , P1_rd3 , P1_wr3 ); 
  b14  P1_P4 ( P1_clock , P1_reset , P1_ad41 , P1_di4 , P1_do4 , P1_rd4 , P1_wr4 ); 
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
  
  b15  P1_P1_P1 ( P1_P1_be1 , P1_P1_addr1 , P1_P1_wr1 , P1_P1_dc1 , P1_P1_mio1 , P1_P1_ads1 , P1_P1_di1 , P1_P1_do1 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy1 , P1_P1_hold , P1_P1_reset ); 
  b15  P1_P1_P2 ( P1_P1_be2 , P1_P1_addr2 , P1_P1_wr2 , P1_P1_dc2 , P1_P1_mio2 , P1_P1_ads2 , P1_P1_di2 , P1_P1_do2 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy2 , P1_P1_hold , P1_P1_reset ); 
  b15  P1_P1_P3 ( P1_P1_be3 , P1_P1_addr3 , P1_P1_wr3 , P1_P1_dc3 , P1_P1_mio3 , P1_P1_ads3 , P1_P1_di3 , P1_P1_do3 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy3 , P1_P1_hold , P1_P1_reset );
 
  
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
  
  b15  P1_P1_P1 ( P1_P1_be1 , P1_P1_addr1 , P1_P1_wr1 , P1_P1_dc1 , P1_P1_mio1 , P1_P1_ads1 , P1_P1_di1 , P1_P1_do1 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy1 , P1_P1_hold , P1_P1_reset ); 
  b15  P1_P1_P2 ( P1_P1_be2 , P1_P1_addr2 , P1_P1_wr2 , P1_P1_dc2 , P1_P1_mio2 , P1_P1_ads2 , P1_P1_di2 , P1_P1_do2 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy2 , P1_P1_hold , P1_P1_reset ); 
  b15  P1_P1_P3 ( P1_P1_be3 , P1_P1_addr3 , P1_P1_wr3 , P1_P1_dc3 , P1_P1_mio3 , P1_P1_ads3 , P1_P1_di3 , P1_P1_do3 , P1_P1_clock , P1_P1_na , P1_P1_bs16 , P1_P1_rdy3 , P1_P1_hold , P1_P1_reset );
 
  b14  P1_P3 ( P1_clock , P1_reset , P1_ad31 , P1_di3 , P1_do3 , P1_rd3 , P1_wr3 ); 
  b14  P1_P4 ( P1_clock , P1_reset , P1_ad41 , P1_di4 , P1_do4 , P1_rd4 , P1_wr4 ); 
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



