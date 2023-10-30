
module b14(clock, reset, addr, datai, datao, rd, wr);
   input         clock;
   input         reset;
   output [19:0] addr;
   reg [19:0]    addr;
   input [31:0]  datai;
   output        datao;
   integer       datao;
   output        rd;
   reg           rd;
   output        wr;
   reg           wr;
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
