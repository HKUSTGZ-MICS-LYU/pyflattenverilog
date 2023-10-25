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

    wire  byte_controller_clk;
    wire  byte_controller_nReset;
    wire  byte_controller_ena;
    wire [15:0] byte_controller_clk_cnt;
    wire  byte_controller_start;
    wire  byte_controller_stop;
    wire  byte_controller_read;
    wire  byte_controller_write;
    wire  byte_controller_ack_in;
    wire [7:0] byte_controller_din;
    reg  byte_controller_cmd_ack;
    reg  byte_controller_ack_out;
    wire [7:0] byte_controller_dout;
    wire  byte_controller_i2c_busy;
    wire  byte_controller_i2c_al;
    wire  byte_controller_scl_i;
    wire  byte_controller_scl_o;
    wire  byte_controller_scl_oen;
    wire  byte_controller_sda_i;
    wire  byte_controller_sda_o;
    wire  byte_controller_sda_oen;
    assign byte_controller_clk = wb_clk_i;
    assign byte_controller_nReset = rst_i;
    assign byte_controller_ena = core_en;
    assign byte_controller_clk_cnt = prer;
    assign byte_controller_start = sta;
    assign byte_controller_stop = sto;
    assign byte_controller_read = rd;
    assign byte_controller_write = wr;
    assign byte_controller_ack_in = ack;
    assign byte_controller_din = txr;
    assign done = byte_controller_cmd_ack;
    assign irxack = byte_controller_ack_out;
    assign rxr = byte_controller_dout;
    assign i2c_busy = byte_controller_i2c_busy;
    assign i2c_al = byte_controller_i2c_al;
    assign byte_controller_scl_i = scl_pad_i;
    assign scl_pad_o = byte_controller_scl_o;
    assign scl_padoen_o = byte_controller_scl_oen;
    assign byte_controller_sda_i = sda_pad_i;
    assign sda_pad_o = byte_controller_sda_o;
    assign sda_padoen_o = byte_controller_sda_oen;

    parameter[4:0] byte_controller_ST_IDLE =5'b0_0000;
    parameter[4:0] byte_controller_ST_START =5'b0_0001;
    parameter[4:0] byte_controller_ST_READ =5'b0_0010;
    parameter[4:0] byte_controller_ST_WRITE =5'b0_0100;
    parameter[4:0] byte_controller_ST_ACK =5'b0_1000;
    parameter[4:0] byte_controller_ST_STOP =5'b1_0000;
    reg[3:0] byte_controller_core_cmd ;
    reg byte_controller_core_txd ;
    wire byte_controller_core_ack , byte_controller_core_rxd ;
    reg[7:0] byte_controller_sr ;
    reg byte_controller_shift , byte_controller_ld ;
    wire byte_controller_go ;
    reg[2:0] byte_controller_dcnt ;
    wire byte_controller_cnt_done ;

    wire  byte_controller_bit_controller_clk;
    wire  byte_controller_bit_controller_nReset;
    wire [15:0] byte_controller_bit_controller_clk_cnt;
    wire  byte_controller_bit_controller_ena;
    wire [3:0] byte_controller_bit_controller_cmd;
    reg  byte_controller_bit_controller_cmd_ack;
    reg  byte_controller_bit_controller_busy;
    reg  byte_controller_bit_controller_al;
    wire  byte_controller_bit_controller_din;
    reg  byte_controller_bit_controller_dout;
    wire  byte_controller_bit_controller_scl_i;
    wire  byte_controller_bit_controller_scl_o;
    reg  byte_controller_bit_controller_scl_oen;
    wire  byte_controller_bit_controller_sda_i;
    wire  byte_controller_bit_controller_sda_o;
    reg  byte_controller_bit_controller_sda_oen;
    assign byte_controller_bit_controller_clk = byte_controller_clk;
    assign byte_controller_bit_controller_nReset = byte_controller_nReset;
    assign byte_controller_bit_controller_clk_cnt = byte_controller_ena;
    assign byte_controller_bit_controller_ena = byte_controller_clk_cnt;
    assign byte_controller_bit_controller_cmd = byte_controller_core_cmd;
    assign byte_controller_core_ack = byte_controller_bit_controller_cmd_ack;
    assign byte_controller_i2c_busy = byte_controller_bit_controller_busy;
    assign byte_controller_i2c_al = byte_controller_bit_controller_al;
    assign byte_controller_bit_controller_din = byte_controller_core_txd;
    assign byte_controller_core_rxd = byte_controller_bit_controller_dout;
    assign byte_controller_bit_controller_scl_i = byte_controller_scl_i;
    assign byte_controller_scl_o = byte_controller_bit_controller_scl_o;
    assign byte_controller_scl_oen = byte_controller_bit_controller_scl_oen;
    assign byte_controller_bit_controller_sda_i = byte_controller_sda_i;
    assign byte_controller_sda_o = byte_controller_bit_controller_sda_o;
    assign byte_controller_sda_oen = byte_controller_bit_controller_sda_oen;

    reg byte_controller_bit_controller_sSCL , byte_controller_bit_controller_sSDB ;
    reg byte_controller_bit_controller_dscl_oen ;
    reg byte_controller_bit_controller_sda_chk ;
    reg byte_controller_bit_controller_clk_en ;
    wire byte_controller_bit_controller_slave_wait ;
    reg[15:0] byte_controller_bit_controller_cnt ;
    reg[16:0] byte_controller_bit_controller_c_state ;
    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (~ byte_controller_bit_controller_nReset )
            byte_controller_bit_controller_dscl_oen  <=1'b0;
        else
            byte_controller_bit_controller_dscl_oen  <= byte_controller_bit_controller_scl_oen ;

    assign  byte_controller_bit_controller_slave_wait = byte_controller_bit_controller_dscl_oen &&! byte_controller_bit_controller_sSCL ;
    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (~ byte_controller_bit_controller_nReset )
        begin
            byte_controller_bit_controller_cnt  <=16'h0;
            byte_controller_bit_controller_clk_en  <=1'b1;
        end
        else
            if (~| byte_controller_bit_controller_cnt ||~ byte_controller_bit_controller_ena )
                if (~ byte_controller_bit_controller_slave_wait )
                begin
                    byte_controller_bit_controller_cnt  <= byte_controller_bit_controller_clk_cnt ;
                    byte_controller_bit_controller_clk_en  <=1'b1;
                end
                else
                begin
                    byte_controller_bit_controller_cnt  <= byte_controller_bit_controller_cnt ;
                    byte_controller_bit_controller_clk_en  <=1'b0;
                end
            else
            begin
                byte_controller_bit_controller_cnt  <= byte_controller_bit_controller_cnt -16'h1;
                byte_controller_bit_controller_clk_en  <=1'b0;
            end

    reg byte_controller_bit_controller_dSCL , byte_controller_bit_controller_dSDA ;
    reg byte_controller_bit_controller_sta_condition ;
    reg byte_controller_bit_controller_sto_condition ;
    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (~ byte_controller_bit_controller_nReset )
        begin
            byte_controller_bit_controller_sSCL  <=1'b1;
            byte_controller_bit_controller_sSDB  <=1'b1;
            byte_controller_bit_controller_dSCL  <=1'b1;
            byte_controller_bit_controller_dSDA  <=1'b1;
        end
        else
        begin
            byte_controller_bit_controller_sSCL  <= byte_controller_bit_controller_scl_i ;
            byte_controller_bit_controller_sSDB  <= byte_controller_bit_controller_sda_i ;
            byte_controller_bit_controller_dSCL  <= byte_controller_bit_controller_sSCL ;
            byte_controller_bit_controller_dSDA  <= byte_controller_bit_controller_sSDB ;
        end

    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (~ byte_controller_bit_controller_nReset )
        begin
            byte_controller_bit_controller_sta_condition  <=1'b0;
            byte_controller_bit_controller_sto_condition  <=1'b0;
        end
        else
        begin
            byte_controller_bit_controller_sta_condition  <=~ byte_controller_bit_controller_sSDB & byte_controller_bit_controller_dSDA & byte_controller_bit_controller_sSCL ;
            byte_controller_bit_controller_sto_condition  <= byte_controller_bit_controller_sSDB &~ byte_controller_bit_controller_dSDA & byte_controller_bit_controller_sSCL ;
        end

    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (! byte_controller_bit_controller_nReset )
            byte_controller_bit_controller_busy  <=1'b0;
        else
            byte_controller_bit_controller_busy  <=( byte_controller_bit_controller_sta_condition | byte_controller_bit_controller_busy )&~ byte_controller_bit_controller_sto_condition ;

    reg byte_controller_bit_controller_cmd_stop ;
    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (~ byte_controller_bit_controller_nReset )
            byte_controller_bit_controller_cmd_stop  <=1'b0;
        else
            if ( byte_controller_bit_controller_clk_en )
                byte_controller_bit_controller_cmd_stop  <= byte_controller_bit_controller_cmd ==;

    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (~ byte_controller_bit_controller_nReset )
            byte_controller_bit_controller_al  <=1'b0;
        else
            byte_controller_bit_controller_al  <=( byte_controller_bit_controller_sda_chk &~ byte_controller_bit_controller_sSDB & byte_controller_bit_controller_sda_oen )|(| byte_controller_bit_controller_c_state & byte_controller_bit_controller_sto_condition &~ byte_controller_bit_controller_cmd_stop );

    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (~ byte_controller_bit_controller_nReset )
            byte_controller_bit_controller_dout  <=1'b0;
        else
            if ( byte_controller_bit_controller_sSCL &~ byte_controller_bit_controller_dSCL )
                byte_controller_bit_controller_dout  <= byte_controller_bit_controller_sSDB ;

    parameter[16:0] byte_controller_bit_controller_idle =17'b0_0000_0000_0000_0000;
    parameter[16:0] byte_controller_bit_controller_start_a =17'b0_0000_0000_0000_0001;
    parameter[16:0] byte_controller_bit_controller_start_b =17'b0_0000_0000_0000_0010;
    parameter[16:0] byte_controller_bit_controller_start_c =17'b0_0000_0000_0000_0100;
    parameter[16:0] byte_controller_bit_controller_start_d =17'b0_0000_0000_0000_1000;
    parameter[16:0] byte_controller_bit_controller_start_e =17'b0_0000_0000_0001_0000;
    parameter[16:0] byte_controller_bit_controller_stop_a =17'b0_0000_0000_0010_0000;
    parameter[16:0] byte_controller_bit_controller_stop_b =17'b0_0000_0000_0100_0000;
    parameter[16:0] byte_controller_bit_controller_stop_c =17'b0_0000_0000_1000_0000;
    parameter[16:0] byte_controller_bit_controller_stop_d =17'b0_0000_0001_0000_0000;
    parameter[16:0] byte_controller_bit_controller_rd_a =17'b0_0000_0010_0000_0000;
    parameter[16:0] byte_controller_bit_controller_rd_b =17'b0_0000_0100_0000_0000;
    parameter[16:0] byte_controller_bit_controller_rd_c =17'b0_0000_1000_0000_0000;
    parameter[16:0] byte_controller_bit_controller_rd_d =17'b0_0001_0000_0000_0000;
    parameter[16:0] byte_controller_bit_controller_wr_a =17'b0_0010_0000_0000_0000;
    parameter[16:0] byte_controller_bit_controller_wr_b =17'b0_0100_0000_0000_0000;
    parameter[16:0] byte_controller_bit_controller_wr_c =17'b0_1000_0000_0000_0000;
    parameter[16:0] byte_controller_bit_controller_wr_d =17'b1_0000_0000_0000_0000;
    always @(  posedge   byte_controller_bit_controller_clk or negedge  byte_controller_bit_controller_nReset )
        if (! byte_controller_bit_controller_nReset )
        begin
            byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_idle ;
            byte_controller_bit_controller_cmd_ack  <=1'b0;
            byte_controller_bit_controller_scl_oen  <=1'b1;
            byte_controller_bit_controller_sda_oen  <=1'b1;
            byte_controller_bit_controller_sda_chk  <=1'b0;
        end
        else
            if ( byte_controller_bit_controller_al )
            begin
                byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_idle ;
                byte_controller_bit_controller_cmd_ack  <=1'b0;
                byte_controller_bit_controller_scl_oen  <=1'b1;
                byte_controller_bit_controller_sda_oen  <=1'b1;
                byte_controller_bit_controller_sda_chk  <=1'b0;
            end
            else
            begin
                byte_controller_bit_controller_cmd_ack  <=1'b0;
                if ( byte_controller_bit_controller_clk_en )
                case ( byte_controller_bit_controller_c_state )
                    byte_controller_bit_controller_idle  :
                    begin
                        case ( byte_controller_bit_controller_cmd )
                            :
                                byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_start_a ;
                            :
                                byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_stop_a ;
                            :
                                byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_wr_a ;
                            :
                                byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_rd_a ;
                            default :
                                byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_idle ;
                        endcase
                        byte_controller_bit_controller_scl_oen  <= byte_controller_bit_controller_scl_oen ;
                        byte_controller_bit_controller_sda_oen  <= byte_controller_bit_controller_sda_oen ;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_start_a  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_start_b ;
                        byte_controller_bit_controller_scl_oen  <= byte_controller_bit_controller_scl_oen ;
                        byte_controller_bit_controller_sda_oen  <=1'b1;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_start_b  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_start_c ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <=1'b1;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_start_c  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_start_d ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <=1'b0;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_start_d  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_start_e ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <=1'b0;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_start_e  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_idle ;
                        byte_controller_bit_controller_cmd_ack  <=1'b1;
                        byte_controller_bit_controller_scl_oen  <=1'b0;
                        byte_controller_bit_controller_sda_oen  <=1'b0;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_stop_a  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_stop_b ;
                        byte_controller_bit_controller_scl_oen  <=1'b0;
                        byte_controller_bit_controller_sda_oen  <=1'b0;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_stop_b  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_stop_c ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <=1'b0;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_stop_c  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_stop_d ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <=1'b0;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_stop_d  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_idle ;
                        byte_controller_bit_controller_cmd_ack  <=1'b1;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <=1'b1;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_rd_a  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_rd_b ;
                        byte_controller_bit_controller_scl_oen  <=1'b0;
                        byte_controller_bit_controller_sda_oen  <=1'b1;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_rd_b  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_rd_c ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <=1'b1;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_rd_c  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_rd_d ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <=1'b1;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_rd_d  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_idle ;
                        byte_controller_bit_controller_cmd_ack  <=1'b1;
                        byte_controller_bit_controller_scl_oen  <=1'b0;
                        byte_controller_bit_controller_sda_oen  <=1'b1;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_wr_a  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_wr_b ;
                        byte_controller_bit_controller_scl_oen  <=1'b0;
                        byte_controller_bit_controller_sda_oen  <= byte_controller_bit_controller_din ;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                    byte_controller_bit_controller_wr_b  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_wr_c ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <= byte_controller_bit_controller_din ;
                        byte_controller_bit_controller_sda_chk  <=1'b1;
                    end
                    byte_controller_bit_controller_wr_c  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_wr_d ;
                        byte_controller_bit_controller_scl_oen  <=1'b1;
                        byte_controller_bit_controller_sda_oen  <= byte_controller_bit_controller_din ;
                        byte_controller_bit_controller_sda_chk  <=1'b1;
                    end
                    byte_controller_bit_controller_wr_d  :
                    begin
                        byte_controller_bit_controller_c_state  <= byte_controller_bit_controller_idle ;
                        byte_controller_bit_controller_cmd_ack  <=1'b1;
                        byte_controller_bit_controller_scl_oen  <=1'b0;
                        byte_controller_bit_controller_sda_oen  <= byte_controller_bit_controller_din ;
                        byte_controller_bit_controller_sda_chk  <=1'b0;
                    end
                endcase
            end

    assign  byte_controller_bit_controller_scl_o =1'b0;
    assign  byte_controller_bit_controller_sda_o =1'b0;

    assign  byte_controller_go =( byte_controller_read | byte_controller_write | byte_controller_stop )&~ byte_controller_cmd_ack ;
    assign  byte_controller_dout = byte_controller_sr ;
    always @(  posedge   byte_controller_clk or negedge  byte_controller_nReset )
        if (! byte_controller_nReset )
            byte_controller_sr  <=8'h0;
        else
            if ( byte_controller_ld )
                byte_controller_sr  <= byte_controller_din ;
            else
                if ( byte_controller_shift )
                    byte_controller_sr  <={ byte_controller_sr [6:0], byte_controller_core_rxd };

    always @(  posedge   byte_controller_clk or negedge  byte_controller_nReset )
        if (! byte_controller_nReset )
            byte_controller_dcnt  <=3'h0;
        else
            if ( byte_controller_ld )
                byte_controller_dcnt  <=3'h7;
            else
                if ( byte_controller_shift )
                    byte_controller_dcnt  <= byte_controller_dcnt -3'h1;

    assign  byte_controller_cnt_done =~(| byte_controller_dcnt );
    reg[4:0] byte_controller_c_state ;
    always @(  posedge   byte_controller_clk or negedge  byte_controller_nReset )
        if (! byte_controller_nReset )
        begin
            byte_controller_core_cmd  <=;
            byte_controller_core_txd <=1'b0;
            byte_controller_shift  <=1'b0;
            byte_controller_ld  <=1'b0;
            byte_controller_cmd_ack  <=1'b0;
            byte_controller_c_state  <= byte_controller_ST_IDLE ;
            byte_controller_ack_out  <=1'b0;
        end
        else
            if ( byte_controller_i2c_al )
            begin
                byte_controller_core_cmd  <=;
                byte_controller_core_txd <=1'b0;
                byte_controller_shift  <=1'b0;
                byte_controller_ld  <=1'b0;
                byte_controller_cmd_ack  <=1'b0;
                byte_controller_c_state  <= byte_controller_ST_IDLE ;
                byte_controller_ack_out  <=1'b0;
            end
            else
            begin
                byte_controller_core_txd  <= byte_controller_sr [7];
                byte_controller_shift  <=1'b0;
                byte_controller_ld  <=1'b0;
                byte_controller_cmd_ack  <=1'b0;
                case ( byte_controller_c_state )
                    byte_controller_ST_IDLE  :
                        if ( byte_controller_go )
                        begin
                            if ( byte_controller_start )
                            begin
                                byte_controller_c_state  <= byte_controller_ST_START ;
                                byte_controller_core_cmd  <=;
                            end
                            else
                                if ( byte_controller_read )
                                begin
                                    byte_controller_c_state  <= byte_controller_ST_READ ;
                                    byte_controller_core_cmd  <=;
                                end
                                else
                                    if ( byte_controller_write )
                                    begin
                                        byte_controller_c_state  <= byte_controller_ST_WRITE ;
                                        byte_controller_core_cmd  <=;
                                    end
                                    else
                                    begin
                                        byte_controller_c_state  <= byte_controller_ST_STOP ;
                                        byte_controller_core_cmd  <=;
                                    end
                            byte_controller_ld  <=1'b1;
                        end
                    byte_controller_ST_START  :
                        if ( byte_controller_core_ack )
                        begin
                            if ( byte_controller_read )
                            begin
                                byte_controller_c_state  <= byte_controller_ST_READ ;
                                byte_controller_core_cmd  <=;
                            end
                            else
                            begin
                                byte_controller_c_state  <= byte_controller_ST_WRITE ;
                                byte_controller_core_cmd  <=;
                            end
                            byte_controller_ld  <=1'b1;
                        end
                    byte_controller_ST_WRITE  :
                        if ( byte_controller_core_ack )
                            if ( byte_controller_cnt_done )
                            begin
                                byte_controller_c_state  <= byte_controller_ST_ACK ;
                                byte_controller_core_cmd  <=;
                            end
                            else
                            begin
                                byte_controller_c_state  <= byte_controller_ST_WRITE ;
                                byte_controller_core_cmd  <=;
                                byte_controller_shift <=1'b1;
                            end
                    byte_controller_ST_READ  :
                        if ( byte_controller_core_ack )
                        begin
                            if ( byte_controller_cnt_done )
                            begin
                                byte_controller_c_state  <= byte_controller_ST_ACK ;
                                byte_controller_core_cmd  <=;
                            end
                            else
                            begin
                                byte_controller_c_state  <= byte_controller_ST_READ ;
                                byte_controller_core_cmd  <=;
                            end
                            byte_controller_shift  <=1'b1;
                            byte_controller_core_txd  <= byte_controller_ack_in ;
                        end
                    byte_controller_ST_ACK  :
                        if ( byte_controller_core_ack )
                        begin
                            if ( byte_controller_stop )
                            begin
                                byte_controller_c_state  <= byte_controller_ST_STOP ;
                                byte_controller_core_cmd  <=;
                            end
                            else
                            begin
                                byte_controller_c_state  <= byte_controller_ST_IDLE ;
                                byte_controller_core_cmd  <=;
                                byte_controller_cmd_ack <=1'b1;
                            end
                            byte_controller_ack_out  <= byte_controller_core_rxd ;
                            byte_controller_core_txd  <=1'b1;
                        end
                        else
                            byte_controller_core_txd  <= byte_controller_ack_in ;
                    byte_controller_ST_STOP  :
                        if ( byte_controller_core_ack )
                        begin
                            byte_controller_c_state  <= byte_controller_ST_IDLE ;
                            byte_controller_core_cmd  <=;
                            byte_controller_cmd_ack <=1'b1;
                        end
                endcase
            end


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
