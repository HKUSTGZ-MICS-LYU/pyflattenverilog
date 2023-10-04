module usb_phy(clk, rst, phy_tx_mode, usb_rst,

		// Transciever Interface
		txdp, txdn, txoe,	
		rxd, rxdp, rxdn,

		// UTMI Interface
		DataOut_i, TxValid_i, TxReady_o, RxValid_o,
		RxActive_o, RxError_o, DataIn_o, LineState_o
		);

input		clk;
input		rst;
input		phy_tx_mode;
output		usb_rst;
output		txdp, txdn, txoe;
input		rxd, rxdp, rxdn;
input	[7:0]	DataOut_i;
input		TxValid_i;
output		TxReady_o;
output	[7:0]	DataIn_o;
output 		RxValid_o;
output		RxActive_o;
output		RxError_o;
output	[1:0]	LineState_o;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

reg	[4:0]	rst_cnt;
reg		usb_rst;
wire		fs_ce;
wire		rst;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

///////////////////////////////////////////////////////////////////
//
// TX Phy
//
wire usb_tx_phy_clk;
wire usb_tx_phy_rst;
wire usb_tx_phy_fs_ce;
wire usb_tx_phy_phy_mode;
reg		usb_tx_phy_txoe;
reg		usb_tx_phy_txdp;
reg		usb_tx_phy_txdn;
wire [7:0] usb_tx_phy_DataOut_i;
wire usb_tx_phy_TxValid_i;
reg    usb_tx_phy_TxReady_o;

assign usb_tx_phy_clk = clk;
assign usb_tx_phy_rst = rst;
assign usb_tx_phy_fs_ce = fs_ce;
assign usb_tx_phy_phy_mode = phy_tx_mode;
assign txdp = usb_tx_phy_txdp;
assign txdn = usb_tx_phy_txdn;
assign txoe = usb_tx_phy_txoe;
assign usb_tx_phy_DataOut_i = DataOut_i;
assign usb_tx_phy_TxValid_i = TxValid_i;

assign TxReady_o = usb_tx_phy_TxReady_o;
always @(*) TxReady_o = usb_tx_phy_TxReady_o;
///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//
parameter	IDLE	= 3'd0,
		SOP	= 3'h1,
		DATA	= 3'h2,
		EOP1	= 3'h3,
		EOP2	= 3'h4,
		WAIT	= 3'h5;


reg	[2:0]	usb_tx_phy_state, usb_tx_phy_next_state;
reg		usb_tx_phy_tx_ready_d;
reg		usb_tx_phy_ld_sop_d;
reg		usb_tx_phy_ld_data_d;
reg		usb_tx_phy_ld_eop_d;
reg		usb_tx_phy_tx_ip;
reg		usb_tx_phy_tx_ip_sync;
reg	[2:0]	usb_tx_phy_bit_cnt;
reg	[7:0]	usb_tx_phy_hold_reg;
reg	[7:0]	usb_tx_phy_hold_reg_d;

reg		usb_tx_phy_sd_raw_o;
wire		usb_tx_phy_hold;
reg		usb_tx_phy_data_done;
reg		usb_tx_phy_sft_done;
reg		usb_tx_phy_sft_done_r;
wire		usb_tx_phy_sft_done_e;
reg		usb_tx_phy_ld_data;
wire		usb_tx_phy_eop_done;
reg	[2:0]	usb_tx_phy_one_cnt;
wire		usb_tx_phy_stuff;
reg		usb_tx_phy_sd_bs_o;
reg		usb_tx_phy_sd_nrzi_o;
reg		usb_tx_phy_append_eop;
reg		usb_tx_phy_append_eop_sync1;
reg		usb_tx_phy_append_eop_sync2;
reg		usb_tx_phy_append_eop_sync3;
reg		usb_tx_phy_append_eop_sync4;
reg		usb_tx_phy_txoe_r1;
reg		usb_tx_phy_txoe_r2;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//
always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	
		usb_tx_phy_TxReady_o <= 1'b0;
	else	
		usb_tx_phy_TxReady_o <= usb_tx_phy_tx_ready_d & usb_tx_phy_TxValid_i;

always @(posedge usb_tx_phy_clk)
	usb_tx_phy_ld_data <= usb_tx_phy_ld_data_d;

///////////////////////////////////////////////////////////////////
//
// Transmit in Progress indicator
//
always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	
		usb_tx_phy_tx_ip <= 1'b0;
	else
		if(usb_tx_phy_ld_sop_d)	
			usb_tx_phy_tx_ip <= 1'b1;
		else
			if(usb_tx_phy_eop_done)	
				usb_tx_phy_tx_ip <= 1'b0;

always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	
		usb_tx_phy_tx_ip_sync <= 1'b0;
	else
		if(usb_tx_phy_fs_ce)
			usb_tx_phy_tx_ip_sync <= usb_tx_phy_tx_ip;

always@(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	
		usb_tx_phy_data_done <= 1'b0;
	else
		if(usb_tx_phy_TxValid_i && ! usb_tx_phy_tx_ip)
			usb_tx_phy_data_done <= 1'b1;
		else
			if(!usb_tx_phy_TxValid_i)
				usb_tx_phy_data_done <= 1'b0;



///////////////////////////////////////////////////////////////////
//
// Shift Register
//

always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)		usb_tx_phy_bit_cnt <= 3'h0;
	else
	if(!usb_tx_phy_tx_ip_sync)		usb_tx_phy_bit_cnt <= 3'h0;
	else
	if(usb_tx_phy_fs_ce && !usb_tx_phy_hold)	usb_tx_phy_bit_cnt <= usb_tx_phy_bit_cnt + 3'h1;

assign usb_tx_phy_hold = usb_tx_phy_stuff;

always @(posedge  usb_tx_phy_clk)
	if(! usb_tx_phy_tx_ip_sync)		 usb_tx_phy_sd_raw_o <= 1'b0;
	else
	case( usb_tx_phy_bit_cnt)	// synopsys full_case parallel_case
	   3'h0:  usb_tx_phy_sd_raw_o <=  usb_tx_phy_hold_reg_d[0];
	   3'h1:  usb_tx_phy_sd_raw_o <=  usb_tx_phy_hold_reg_d[1];
	   3'h2:  usb_tx_phy_sd_raw_o <=  usb_tx_phy_hold_reg_d[2];
	   3'h3:  usb_tx_phy_sd_raw_o <=  usb_tx_phy_hold_reg_d[3];
	   3'h4:  usb_tx_phy_sd_raw_o <=  usb_tx_phy_hold_reg_d[4];
	   3'h5:  usb_tx_phy_sd_raw_o <=  usb_tx_phy_hold_reg_d[5];
	   3'h6:  usb_tx_phy_sd_raw_o <=  usb_tx_phy_hold_reg_d[6];
	   3'h7:  usb_tx_phy_sd_raw_o <=  usb_tx_phy_hold_reg_d[7];
	endcase

always @(posedge  usb_tx_phy_clk)
	 usb_tx_phy_sft_done <= ! usb_tx_phy_hold & ( usb_tx_phy_bit_cnt == 3'h7);

always @(posedge  usb_tx_phy_clk)
	 usb_tx_phy_sft_done_r <=  usb_tx_phy_sft_done;

assign  usb_tx_phy_sft_done_e =  usb_tx_phy_sft_done & ! usb_tx_phy_sft_done_r;


// Out Data Hold Register
always @(posedge usb_tx_phy_clk)
	if(usb_tx_phy_ld_sop_d)	
		usb_tx_phy_hold_reg <= 8'h80;
	else
	if(usb_tx_phy_ld_data)	
		usb_tx_phy_hold_reg <= usb_tx_phy_DataOut_i;

always @(posedge usb_tx_phy_clk) 
	usb_tx_phy_hold_reg_d <= usb_tx_phy_hold_reg;

///////////////////////////////////////////////////////////////////
//
// Bit Stuffer
//

always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_one_cnt <= 3'h0;
	else
		if(!usb_tx_phy_tx_ip_sync)	
			usb_tx_phy_one_cnt <= 3'h0;
		else
			if(usb_tx_phy_fs_ce)
	   			begin
				if(!usb_tx_phy_sd_raw_o || usb_tx_phy_stuff)	
					usb_tx_phy_one_cnt <= 3'h0;
				else			
					usb_tx_phy_one_cnt <= usb_tx_phy_one_cnt + 3'h1;
	  		 	end

assign usb_tx_phy_stuff = (usb_tx_phy_one_cnt==3'h6);

always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	
		usb_tx_phy_sd_bs_o <= 1'h0;
	else
		if(usb_tx_phy_fs_ce)	
			usb_tx_phy_sd_bs_o <= !usb_tx_phy_tx_ip_sync ? 1'b0 : (usb_tx_phy_stuff ? 1'b0 : usb_tx_phy_sd_raw_o);

///////////////////////////////////////////////////////////////////
//
// NRZI Encoder
//

always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)			
		usb_tx_phy_sd_nrzi_o <= 1'b1;
	else
		if(!usb_tx_phy_tx_ip_sync || !usb_tx_phy_txoe_r1)	
			usb_tx_phy_sd_nrzi_o <= 1'b1;
		else
			if(usb_tx_phy_fs_ce)			
				usb_tx_phy_sd_nrzi_o <= usb_tx_phy_sd_bs_o ? usb_tx_phy_sd_nrzi_o : ~usb_tx_phy_sd_nrzi_o;

///////////////////////////////////////////////////////////////////
//
// EOP append logic
//

always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)		
		usb_tx_phy_append_eop <= 1'b0;
	else
		if(usb_tx_phy_ld_eop_d)		
			usb_tx_phy_append_eop <= 1'b1;
		else
			if(usb_tx_phy_append_eop_sync2)	
				usb_tx_phy_append_eop <= 1'b0;


always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_append_eop_sync1 <= 1'b0;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_append_eop_sync1 <= usb_tx_phy_append_eop;


always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_append_eop_sync2 <= 1'b0;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_append_eop_sync2 <= usb_tx_phy_append_eop_sync1;

always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_append_eop_sync3 <= 1'b0;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_append_eop_sync3 <= usb_tx_phy_append_eop_sync2 |
			(usb_tx_phy_append_eop_sync3 & !usb_tx_phy_append_eop_sync4);	// Make sure always 2 bit wide


always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_append_eop_sync4 <= 1'b0;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_append_eop_sync4 <= usb_tx_phy_append_eop_sync3;

assign usb_tx_phy_eop_done = usb_tx_phy_append_eop_sync3;



///////////////////////////////////////////////////////////////////
//
// Output Enable Logic
//


always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_txoe_r1 <= 1'b0;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_txoe_r1 <= usb_tx_phy_tx_ip_sync;


always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_txoe_r2 <= 1'b0;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_txoe_r2 <= usb_tx_phy_txoe_r1;


always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_txoe <= 1'b1;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_txoe <= !(usb_tx_phy_txoe_r1 | usb_tx_phy_txoe_r2);



///////////////////////////////////////////////////////////////////
//
// Output Registers
//

always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_txdp <= 1'b1;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_txdp <= usb_tx_phy_phy_mode ?
					(!usb_tx_phy_append_eop_sync3 &  usb_tx_phy_sd_nrzi_o) :
					usb_tx_phy_sd_nrzi_o;


always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_txdn <= 1'b0;
	else
	if(usb_tx_phy_fs_ce)	usb_tx_phy_txdn <= usb_tx_phy_phy_mode ?
					(!usb_tx_phy_append_eop_sync3 & ~usb_tx_phy_sd_nrzi_o) :
					usb_tx_phy_append_eop_sync3;

///////////////////////////////////////////////////////////////////
//
// Tx Statemashine
//


always @(posedge usb_tx_phy_clk or negedge usb_tx_phy_rst)
	if(!usb_tx_phy_rst)	usb_tx_phy_state <= IDLE;
	else		usb_tx_phy_state <= usb_tx_phy_next_state;

always @(usb_tx_phy_state or usb_tx_phy_TxValid_i or usb_tx_phy_data_done or usb_tx_phy_sft_done_e or usb_tx_phy_eop_done or usb_tx_phy_fs_ce)
   begin
	usb_tx_phy_next_state = usb_tx_phy_state;
	usb_tx_phy_tx_ready_d = 1'b0;

	usb_tx_phy_ld_sop_d = 1'b0;
	usb_tx_phy_ld_data_d = 1'b0;
	usb_tx_phy_ld_eop_d = 1'b0;

	case(usb_tx_phy_state)	// synopsys full_case parallel_case
	   IDLE:
			if(usb_tx_phy_TxValid_i)
			   begin
				usb_tx_phy_ld_sop_d = 1'b1;
				usb_tx_phy_next_state = SOP;
			   end
	   SOP:
			if(usb_tx_phy_sft_done_e)
			   begin
				usb_tx_phy_tx_ready_d = 1'b1;
				usb_tx_phy_ld_data_d = 1'b1;
				usb_tx_phy_next_state = DATA;
			   end
	   DATA:
		   begin
			if(!usb_tx_phy_data_done && usb_tx_phy_sft_done_e)
			   begin
				usb_tx_phy_ld_eop_d = 1'b1;
				usb_tx_phy_next_state = EOP1;
			   end
			
			if(usb_tx_phy_data_done && usb_tx_phy_sft_done_e)
			   begin
				usb_tx_phy_tx_ready_d = 1'b1;
				usb_tx_phy_ld_data_d = 1'b1;
			   end
		   end
	   EOP1:
			if(usb_tx_phy_eop_done)		usb_tx_phy_next_state = EOP2;
	   EOP2:
			if(!usb_tx_phy_eop_done && usb_tx_phy_fs_ce)	usb_tx_phy_next_state = WAIT;
	   WAIT:
			if(usb_tx_phy_fs_ce)		usb_tx_phy_next_state = IDLE;
	endcase
   end


///////////////////////////////////////////////////////////////////
//
// RX Phy and DPLL
//

wire usb_rx_phy_clk;
wire usb_rx_phy_rst;
reg  usb_rx_phy_fs_ce;
wire usb_rx_phy_rxd;
wire usb_rx_phy_rxdp;
wire usb_rx_phy_rxdn;
wire [7:0] usb_rx_phy_DataIn_o;
wire usb_rx_phy_RxValid_o;
wire usb_rx_phy_RxActive_o;
wire usb_rx_phy_RxError_o;
wire usb_rx_phy_RxEn_i;
wire [1:0] usb_rx_phy_LineState;

assign usb_rx_phy_clk = clk;
assign usb_rx_phy_rst = rst;
assign fs_ce = usb_rx_phy_fs_ce;
assign usb_rx_phy_rxd = rxd;
assign usb_rx_phy_rxdp = rxdp;
assign usb_rx_phy_rxdn = rxdn;
assign DataIn_o = usb_rx_phy_DataIn_o;
assign RxValid_o = usb_rx_phy_RxValid_o;
assign RxActive_o = usb_rx_phy_RxActive_o;
assign RxError_o = usb_rx_phy_RxError_o;
assign usb_rx_phy_RxEn_i = txoe;
assign LineState_o = usb_rx_phy_LineState;
///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//
reg   usb_rx_phy_rxd_s0, usb_rx_phy_rxd_s1,  usb_rx_phy_rxd_s;
reg   usb_rx_phy_rxdp_s0, usb_rx_phy_rxdp_s1, usb_rx_phy_rxdp_s, usb_rx_phy_rxdp_s_r;
reg   usb_rx_phy_rxdn_s0, usb_rx_phy_rxdn_s1, usb_rx_phy_rxdn_s, usb_rx_phy_rxdn_s_r;
reg   usb_rx_phy_synced_d;
wire  usb_rx_phy_k, usb_rx_phy_j, usb_rx_phy_se0;
reg   usb_rx_phy_rxd_r;
reg   usb_rx_phy_rx_en;
reg   usb_rx_phy_rx_active;
reg   [2:0] usb_rx_phy_bit_cnt;
reg   usb_rx_phy_rx_valid1, usb_rx_phy_rx_valid;
reg   usb_rx_phy_shift_en;
reg   usb_rx_phy_sd_r;
reg   usb_rx_phy_sd_nrzi;
reg   [7:0] usb_rx_phy_hold_reg;
wire  usb_rx_phy_drop_bit;   // Indicates a stuffed bit
reg   [2:0] usb_rx_phy_one_cnt;

reg   [1:0] usb_rx_phy_dpll_state, usb_rx_phy_dpll_next_state;
reg   usb_rx_phy_fs_ce_d;

wire  usb_rx_phy_change;
wire  usb_rx_phy_lock_en;
reg   [2:0] usb_rx_phy_fs_state, usb_rx_phy_fs_next_state;
reg   usb_rx_phy_rx_valid_r;
reg   usb_rx_phy_sync_err_d, usb_rx_phy_sync_err;
reg   usb_rx_phy_bit_stuff_err;
reg   usb_rx_phy_se0_r, usb_rx_phy_byte_err;
reg   usb_rx_phy_se0_s;
///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

assign usb_rx_phy_RxValid_o = usb_rx_phy_rx_active;
assign usb_rx_phy_RxActive_o = usb_rx_phy_rx_active;
assign usb_rx_phy_RxError_o = usb_rx_phy_sync_err | usb_rx_phy_bit_stuff_err | usb_rx_phy_byte_err;
assign usb_rx_phy_DataIn_o = usb_rx_phy_hold_reg;
assign usb_rx_phy_LineState = {usb_rx_phy_rxdn_s1, usb_rx_phy_rxdp_s1};

always @(posedge usb_rx_phy_clk)	usb_rx_phy_rx_en <= usb_rx_phy_RxEn_i;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_sync_err <= !usb_rx_phy_rx_active & usb_rx_phy_sync_err_d;

///////////////////////////////////////////////////////////////////
//
// Synchronize Inputs
//
always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxd_s0  <= usb_rx_phy_rxd;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxd_s1  <= usb_rx_phy_rxd_s0;
always @(posedge usb_rx_phy_clk)						// Avoid detecting Line Glitches and noise
	if(usb_rx_phy_rxd_s0 && usb_rx_phy_rxd_s1)	usb_rx_phy_rxd_s <= 1'b1;
	else
	if(!usb_rx_phy_rxd_s0 && !usb_rx_phy_rxd_s1)	usb_rx_phy_rxd_s <= 1'b0;

always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxdp_s0  <= usb_rx_phy_rxdp;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxdp_s1  <= usb_rx_phy_rxdp_s0;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxdp_s_r <= usb_rx_phy_rxdp_s0 & usb_rx_phy_rxdp_s1;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxdp_s   <= (usb_rx_phy_rxdp_s0 & usb_rx_phy_rxdp_s1) | usb_rx_phy_rxdp_s_r;	// Avoid detecting Line Glitches and noise

always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxdn_s0  <= usb_rx_phy_rxdn;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxdn_s1  <= usb_rx_phy_rxdn_s0;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxdn_s_r <= usb_rx_phy_rxdn_s0 & usb_rx_phy_rxdn_s1;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxdn_s   <= (usb_rx_phy_rxdn_s0 & usb_rx_phy_rxdn_s1) | usb_rx_phy_rxdn_s_r;	// Avoid detecting Line Glitches and noise

assign usb_rx_phy_k = !usb_rx_phy_rxdp_s &  usb_rx_phy_rxdn_s;
assign usb_rx_phy_j =  usb_rx_phy_rxdp_s & !usb_rx_phy_rxdn_s;
assign usb_rx_phy_se0 = !usb_rx_phy_rxdp_s & !usb_rx_phy_rxdn_s;

always @(posedge usb_rx_phy_clk)	if(usb_rx_phy_fs_ce)	usb_rx_phy_se0_s <= usb_rx_phy_se0;


///////////////////////////////////////////////////////////////////
//
// DPLL
//
assign	usb_rx_phy_lock_en = usb_rx_phy_rx_en;

always @(posedge usb_rx_phy_clk)	usb_rx_phy_rxd_r <= usb_rx_phy_rxd_s;

// Edge detector
assign usb_rx_phy_change = usb_rx_phy_rxd_r != usb_rx_phy_rxd_s;

always @(posedge usb_rx_phy_clk or negedge usb_rx_phy_rst)
	if(!usb_rx_phy_rst)	usb_rx_phy_dpll_state <= 2'h1;
	else		usb_rx_phy_dpll_state <= usb_rx_phy_dpll_next_state;

always @(usb_rx_phy_dpll_state or usb_rx_phy_lock_en or usb_rx_phy_change)
   begin
	usb_rx_phy_fs_ce_d = 1'b0;
	case(usb_rx_phy_dpll_state)	// synopsys full_case parallel_case
	   2'h0:
		if(usb_rx_phy_lock_en && usb_rx_phy_change)	usb_rx_phy_dpll_next_state = 2'h0;
		else			usb_rx_phy_dpll_next_state = 2'h1;
	   2'h1:begin
		usb_rx_phy_fs_ce_d = 1'b1;
		if(usb_rx_phy_lock_en && usb_rx_phy_change)	usb_rx_phy_dpll_next_state = 2'h3;
		else			usb_rx_phy_dpll_next_state = 2'h2;
		end
	   2'h2:
		if(usb_rx_phy_lock_en && usb_rx_phy_change)	usb_rx_phy_dpll_next_state = 2'h0;
		else			usb_rx_phy_dpll_next_state = 2'h3;
	   2'h3:
		if(usb_rx_phy_lock_en && usb_rx_phy_change)	usb_rx_phy_dpll_next_state = 2'h0;
		else			usb_rx_phy_dpll_next_state = 2'h0;
	endcase
   end

// Compensate for sync registers at the input - allign full speed
// clock enable to be in the middle between two bit changes ...
reg	usb_rx_phy_fs_ce_r1, usb_rx_phy_fs_ce_r2;

always @(posedge usb_rx_phy_clk)	usb_rx_phy_fs_ce_r1 <= usb_rx_phy_fs_ce_d;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_fs_ce_r2 <= usb_rx_phy_fs_ce_r1;
always @(posedge usb_rx_phy_clk)	usb_rx_phy_fs_ce <= usb_rx_phy_fs_ce_r2;


///////////////////////////////////////////////////////////////////
//
// Find Sync Pattern FSM
//

parameter	FS_IDLE	= 3'h0,
		K1	= 3'h1,
		J1	= 3'h2,
		K2	= 3'h3,
		J2	= 3'h4,
		K3	= 3'h5,
		J3	= 3'h6,
		K4	= 3'h7;

always @(posedge usb_rx_phy_clk or negedge usb_rx_phy_rst)
	if(!usb_rx_phy_rst)	usb_rx_phy_fs_state <= FS_IDLE;
	else		usb_rx_phy_fs_state <= usb_rx_phy_fs_next_state;

always @(usb_rx_phy_fs_state or usb_rx_phy_fs_ce or usb_rx_phy_k or usb_rx_phy_j or usb_rx_phy_rx_en or usb_rx_phy_rx_active or usb_rx_phy_se0 or usb_rx_phy_se0_s)
   begin
	usb_rx_phy_synced_d = 1'b0;
	usb_rx_phy_sync_err_d = 1'b0;
	usb_rx_phy_fs_next_state = usb_rx_phy_fs_state;
	if(usb_rx_phy_fs_ce && !usb_rx_phy_rx_active && !usb_rx_phy_se0 && !usb_rx_phy_se0_s)
	   case(usb_rx_phy_fs_state)	// synopsys full_case parallel_case
		FS_IDLE:
		     begin
			if(usb_rx_phy_k && usb_rx_phy_rx_en)	usb_rx_phy_fs_next_state = K1;
		     end
		K1:
		     begin
			if(usb_rx_phy_j && usb_rx_phy_rx_en)	usb_rx_phy_fs_next_state = J1;
			else
			   begin
					usb_rx_phy_sync_err_d = 1'b1;
					usb_rx_phy_fs_next_state = FS_IDLE;
			   end
		     end
		J1:
		     begin
			if(usb_rx_phy_k && usb_rx_phy_rx_en)	usb_rx_phy_fs_next_state = K2;
			else
			   begin
					usb_rx_phy_sync_err_d = 1'b1;
					usb_rx_phy_fs_next_state = FS_IDLE;
			   end
		     end
		K2:
		     begin
			if(usb_rx_phy_j && usb_rx_phy_rx_en)	usb_rx_phy_fs_next_state = J2;
			else
			   begin
					usb_rx_phy_sync_err_d = 1'b1;
					usb_rx_phy_fs_next_state = FS_IDLE;
			   end
		     end
		J2:
		     begin
			if(usb_rx_phy_k && usb_rx_phy_rx_en)	usb_rx_phy_fs_next_state = K3;
			else
			   begin
					usb_rx_phy_sync_err_d = 1'b1;
					usb_rx_phy_fs_next_state = FS_IDLE;
			   end
		     end
		K3:
		     begin
			if(usb_rx_phy_j && usb_rx_phy_rx_en)	usb_rx_phy_fs_next_state = J3;
			else
			if(usb_rx_phy_k && usb_rx_phy_rx_en)
			   begin
					usb_rx_phy_fs_next_state = FS_IDLE;	// Allow missing first K-J
					usb_rx_phy_synced_d = 1'b1;
			   end
			else
			   begin
					usb_rx_phy_sync_err_d = 1'b1;
					usb_rx_phy_fs_next_state = FS_IDLE;
			   end
		     end
		J3:
		     begin
			if(usb_rx_phy_k && usb_rx_phy_rx_en)	usb_rx_phy_fs_next_state = K4;
			else
			   begin
					usb_rx_phy_sync_err_d = 1'b1;
					usb_rx_phy_fs_next_state = FS_IDLE;
			   end
		     end
		K4:
			begin
			if(usb_rx_phy_k)	usb_rx_phy_synced_d = 1'b1;
			usb_rx_phy_fs_next_state = FS_IDLE;
			end
	   endcase
   end

///////////////////////////////////////////////////////////////////
//
// Generate RxActive
//

always @(posedge usb_rx_phy_clk or negedge usb_rx_phy_rst)

	if(!usb_rx_phy_rst)		usb_rx_phy_rx_active <= 1'b0;
	else
	if(usb_rx_phy_synced_d && usb_rx_phy_rx_en)	usb_rx_phy_rx_active <= 1'b1;
	else
	if(usb_rx_phy_se0 && usb_rx_phy_rx_valid_r)	usb_rx_phy_rx_active <= 1'b0;

always @(posedge usb_rx_phy_clk)
	if(usb_rx_phy_rx_valid)	usb_rx_phy_rx_valid_r <= 1'b1;
	else
	if(usb_rx_phy_fs_ce)	usb_rx_phy_rx_valid_r <= 1'b0;

///////////////////////////////////////////////////////////////////
//
// NRZI Decoder
//

always @(posedge usb_rx_phy_clk)
	if(usb_rx_phy_fs_ce)	usb_rx_phy_sd_r <= usb_rx_phy_rxd_s;

always @(posedge usb_rx_phy_clk or negedge usb_rx_phy_rst)
	if(!usb_rx_phy_rst)		usb_rx_phy_sd_nrzi <= 1'b0;
	else
	if(!usb_rx_phy_rx_active)		usb_rx_phy_sd_nrzi <= 1'b1;
	else
	if(usb_rx_phy_rx_active && usb_rx_phy_fs_ce)	usb_rx_phy_sd_nrzi <= !(usb_rx_phy_rxd_s ^ usb_rx_phy_sd_r);

///////////////////////////////////////////////////////////////////
//
// Bit Stuff Detect
//

always @(posedge usb_rx_phy_clk or negedge usb_rx_phy_rst)

	if(!usb_rx_phy_rst)	usb_rx_phy_one_cnt <= 3'h0;
	else
	if(!usb_rx_phy_shift_en)	usb_rx_phy_one_cnt <= 3'h0;
	else
	if(usb_rx_phy_fs_ce)
	   begin
		if(!usb_rx_phy_sd_nrzi || usb_rx_phy_drop_bit)	usb_rx_phy_one_cnt <= 3'h0;
		else				usb_rx_phy_one_cnt <= usb_rx_phy_one_cnt + 3'h1;
	   end

assign usb_rx_phy_drop_bit = (usb_rx_phy_one_cnt==3'h6);

always @(posedge usb_rx_phy_clk)	usb_rx_phy_bit_stuff_err <= usb_rx_phy_drop_bit & usb_rx_phy_sd_nrzi & usb_rx_phy_fs_ce & !usb_rx_phy_se0 & usb_rx_phy_rx_active; // Bit Stuff Error

///////////////////////////////////////////////////////////////////
//
// Serial => Parallel converter
//

always @(posedge usb_rx_phy_clk)
	if(usb_rx_phy_fs_ce)	usb_rx_phy_shift_en <= usb_rx_phy_synced_d | usb_rx_phy_rx_active;

always @(posedge usb_rx_phy_clk)
	if(usb_rx_phy_fs_ce && usb_rx_phy_shift_en && !usb_rx_phy_drop_bit)
		usb_rx_phy_hold_reg <= {usb_rx_phy_sd_nrzi, usb_rx_phy_hold_reg[7:1]};

///////////////////////////////////////////////////////////////////
//
// Generate RxValid
//

always @(posedge usb_rx_phy_clk or negedge usb_rx_phy_rst)
	if(!usb_rx_phy_rst)		usb_rx_phy_bit_cnt <= 3'b0;
	else
	if(!usb_rx_phy_shift_en)		usb_rx_phy_bit_cnt <= 3'h0;
	else
	if(usb_rx_phy_fs_ce && !usb_rx_phy_drop_bit)	usb_rx_phy_bit_cnt <= usb_rx_phy_bit_cnt + 3'h1;

always @(posedge usb_rx_phy_clk or negedge usb_rx_phy_rst)
	if(!usb_rx_phy_rst)					usb_rx_phy_rx_valid1 <= 1'b0;
	else
	if(usb_rx_phy_fs_ce && !usb_rx_phy_drop_bit && (usb_rx_phy_bit_cnt==3'h7))	usb_rx_phy_rx_valid1 <= 1'b1;
	else
	if(usb_rx_phy_rx_valid1 && usb_rx_phy_fs_ce && !usb_rx_phy_drop_bit)		usb_rx_phy_rx_valid1 <= 1'b0;

always @(posedge usb_rx_phy_clk)	usb_rx_phy_rx_valid <= !usb_rx_phy_drop_bit & usb_rx_phy_rx_valid1 & usb_rx_phy_fs_ce;

always @(posedge usb_rx_phy_clk)	usb_rx_phy_se0_r <= usb_rx_phy_se0;

always @(posedge usb_rx_phy_clk)	usb_rx_phy_byte_err <= usb_rx_phy_se0 & !usb_rx_phy_se0_r & (|usb_rx_phy_bit_cnt[2:1]) & usb_rx_phy_rx_active;


///////////////////////////////////////////////////////////////////
//
// Generate an USB Reset is we see SE0 for at least 2.5uS
//

always @(posedge clk or negedge rst)
	if(!rst)			rst_cnt <= 5'h0;
	else
	if(LineState_o != 2'h0)		rst_cnt <= 5'h0;
	else	
	if(!usb_rst && fs_ce)		rst_cnt <= rst_cnt + 5'h1;

always @(posedge clk or negedge rst)
	if(!rst)	usb_rst <= 1'b0;
	else usb_rst <= (rst_cnt == 5'h1f);

endmodule

