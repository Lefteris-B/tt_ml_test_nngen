

module mnist_model
(
  input CLK,
  input RESETN,
  output reg irq,
  output reg [32-1:0] maxi_awaddr,
  output reg [8-1:0] maxi_awlen,
  output [3-1:0] maxi_awsize,
  output [2-1:0] maxi_awburst,
  output [1-1:0] maxi_awlock,
  output [4-1:0] maxi_awcache,
  output [3-1:0] maxi_awprot,
  output [4-1:0] maxi_awqos,
  output [2-1:0] maxi_awuser,
  output reg maxi_awvalid,
  input maxi_awready,
  output [32-1:0] maxi_wdata,
  output [4-1:0] maxi_wstrb,
  output maxi_wlast,
  output maxi_wvalid,
  input maxi_wready,
  input [2-1:0] maxi_bresp,
  input maxi_bvalid,
  output maxi_bready,
  output reg [32-1:0] maxi_araddr,
  output reg [8-1:0] maxi_arlen,
  output [3-1:0] maxi_arsize,
  output [2-1:0] maxi_arburst,
  output [1-1:0] maxi_arlock,
  output [4-1:0] maxi_arcache,
  output [3-1:0] maxi_arprot,
  output [4-1:0] maxi_arqos,
  output [2-1:0] maxi_aruser,
  output reg maxi_arvalid,
  input maxi_arready,
  input [32-1:0] maxi_rdata,
  input [2-1:0] maxi_rresp,
  input maxi_rlast,
  input maxi_rvalid,
  output maxi_rready,
  input [32-1:0] saxi_awaddr,
  input [4-1:0] saxi_awcache,
  input [3-1:0] saxi_awprot,
  input saxi_awvalid,
  output saxi_awready,
  input [32-1:0] saxi_wdata,
  input [4-1:0] saxi_wstrb,
  input saxi_wvalid,
  output saxi_wready,
  output [2-1:0] saxi_bresp,
  output reg saxi_bvalid,
  input saxi_bready,
  input [32-1:0] saxi_araddr,
  input [4-1:0] saxi_arcache,
  input [3-1:0] saxi_arprot,
  input saxi_arvalid,
  output saxi_arready,
  output reg [32-1:0] saxi_rdata,
  output [2-1:0] saxi_rresp,
  output reg saxi_rvalid,
  input saxi_rready
);

  wire RESETN_inv;
  assign RESETN_inv = !RESETN;
  wire RESETN_inv_buf;
  reg _RESETN_inv_1;
  reg _RESETN_inv_2;
  assign RESETN_inv_buf = _RESETN_inv_2;
  assign maxi_awsize = 2;
  assign maxi_awburst = 1;
  assign maxi_awlock = 0;
  assign maxi_awcache = 3;
  assign maxi_awprot = 0;
  assign maxi_awqos = 0;
  assign maxi_awuser = 0;
  reg [32-1:0] _maxi_wdata_sb_0;
  reg [4-1:0] _maxi_wstrb_sb_0;
  reg _maxi_wlast_sb_0;
  reg _maxi_wvalid_sb_0;
  wire _maxi_wready_sb_0;
  wire _sb_maxi_writedata_s_value_0;
  assign _sb_maxi_writedata_s_value_0 = _maxi_wlast_sb_0;
  wire [4-1:0] _sb_maxi_writedata_s_value_1;
  assign _sb_maxi_writedata_s_value_1 = _maxi_wstrb_sb_0;
  wire [32-1:0] _sb_maxi_writedata_s_value_2;
  assign _sb_maxi_writedata_s_value_2 = _maxi_wdata_sb_0;
  wire [37-1:0] _sb_maxi_writedata_s_data_3;
  assign _sb_maxi_writedata_s_data_3 = { _sb_maxi_writedata_s_value_0, _sb_maxi_writedata_s_value_1, _sb_maxi_writedata_s_value_2 };
  wire _sb_maxi_writedata_s_valid_4;
  assign _sb_maxi_writedata_s_valid_4 = _maxi_wvalid_sb_0;
  wire _sb_maxi_writedata_m_ready_5;
  assign _sb_maxi_writedata_m_ready_5 = maxi_wready;
  reg [37-1:0] _sb_maxi_writedata_data_6;
  reg _sb_maxi_writedata_valid_7;
  wire _sb_maxi_writedata_ready_8;
  reg [37-1:0] _sb_maxi_writedata_tmp_data_9;
  reg _sb_maxi_writedata_tmp_valid_10;
  wire [37-1:0] _sb_maxi_writedata_next_data_11;
  wire _sb_maxi_writedata_next_valid_12;
  assign _sb_maxi_writedata_ready_8 = !_sb_maxi_writedata_tmp_valid_10;
  assign _sb_maxi_writedata_next_data_11 = (_sb_maxi_writedata_tmp_valid_10)? _sb_maxi_writedata_tmp_data_9 : _sb_maxi_writedata_s_data_3;
  assign _sb_maxi_writedata_next_valid_12 = _sb_maxi_writedata_tmp_valid_10 || _sb_maxi_writedata_s_valid_4;
  wire _sb_maxi_writedata_m_value_13;
  assign _sb_maxi_writedata_m_value_13 = _sb_maxi_writedata_data_6[36:36];
  wire [4-1:0] _sb_maxi_writedata_m_value_14;
  assign _sb_maxi_writedata_m_value_14 = _sb_maxi_writedata_data_6[35:32];
  wire [32-1:0] _sb_maxi_writedata_m_value_15;
  assign _sb_maxi_writedata_m_value_15 = _sb_maxi_writedata_data_6[31:0];
  assign _maxi_wready_sb_0 = _sb_maxi_writedata_ready_8;
  assign maxi_wdata = _sb_maxi_writedata_m_value_15;
  assign maxi_wstrb = _sb_maxi_writedata_m_value_14;
  assign maxi_wlast = _sb_maxi_writedata_m_value_13;
  assign maxi_wvalid = _sb_maxi_writedata_valid_7;
  assign maxi_bready = 1;
  assign maxi_arsize = 2;
  assign maxi_arburst = 1;
  assign maxi_arlock = 0;
  assign maxi_arcache = 3;
  assign maxi_arprot = 0;
  assign maxi_arqos = 0;
  assign maxi_aruser = 0;
  wire [32-1:0] _maxi_rdata_sb_0;
  wire _maxi_rlast_sb_0;
  wire _maxi_rvalid_sb_0;
  wire _maxi_rready_sb_0;
  wire _sb_maxi_readdata_s_value_16;
  assign _sb_maxi_readdata_s_value_16 = maxi_rlast;
  wire [32-1:0] _sb_maxi_readdata_s_value_17;
  assign _sb_maxi_readdata_s_value_17 = maxi_rdata;
  wire [33-1:0] _sb_maxi_readdata_s_data_18;
  assign _sb_maxi_readdata_s_data_18 = { _sb_maxi_readdata_s_value_16, _sb_maxi_readdata_s_value_17 };
  wire _sb_maxi_readdata_s_valid_19;
  assign _sb_maxi_readdata_s_valid_19 = maxi_rvalid;
  wire _sb_maxi_readdata_m_ready_20;
  assign _sb_maxi_readdata_m_ready_20 = _maxi_rready_sb_0;
  reg [33-1:0] _sb_maxi_readdata_data_21;
  reg _sb_maxi_readdata_valid_22;
  wire _sb_maxi_readdata_ready_23;
  reg [33-1:0] _sb_maxi_readdata_tmp_data_24;
  reg _sb_maxi_readdata_tmp_valid_25;
  wire [33-1:0] _sb_maxi_readdata_next_data_26;
  wire _sb_maxi_readdata_next_valid_27;
  assign _sb_maxi_readdata_ready_23 = !_sb_maxi_readdata_tmp_valid_25;
  assign _sb_maxi_readdata_next_data_26 = (_sb_maxi_readdata_tmp_valid_25)? _sb_maxi_readdata_tmp_data_24 : _sb_maxi_readdata_s_data_18;
  assign _sb_maxi_readdata_next_valid_27 = _sb_maxi_readdata_tmp_valid_25 || _sb_maxi_readdata_s_valid_19;
  wire _sb_maxi_readdata_m_value_28;
  assign _sb_maxi_readdata_m_value_28 = _sb_maxi_readdata_data_21[32:32];
  wire [32-1:0] _sb_maxi_readdata_m_value_29;
  assign _sb_maxi_readdata_m_value_29 = _sb_maxi_readdata_data_21[31:0];
  assign _maxi_rdata_sb_0 = _sb_maxi_readdata_m_value_29;
  assign _maxi_rlast_sb_0 = _sb_maxi_readdata_m_value_28;
  assign _maxi_rvalid_sb_0 = _sb_maxi_readdata_valid_22;
  assign maxi_rready = _sb_maxi_readdata_ready_23;
  reg [3-1:0] _maxi_outstanding_wcount;
  wire _maxi_has_outstanding_write;
  assign _maxi_has_outstanding_write = (_maxi_outstanding_wcount > 0) || maxi_awvalid;
  reg _maxi_read_start;
  reg [8-1:0] _maxi_read_op_sel;
  reg [32-1:0] _maxi_read_global_addr;
  reg [33-1:0] _maxi_read_global_size;
  reg [32-1:0] _maxi_read_local_addr;
  reg [32-1:0] _maxi_read_local_stride;
  reg [33-1:0] _maxi_read_local_size;
  reg [32-1:0] _maxi_read_local_blocksize;
  wire _maxi_read_req_fifo_enq;
  wire [137-1:0] _maxi_read_req_fifo_wdata;
  wire _maxi_read_req_fifo_full;
  wire _maxi_read_req_fifo_almost_full;
  wire _maxi_read_req_fifo_deq;
  wire [137-1:0] _maxi_read_req_fifo_rdata;
  wire _maxi_read_req_fifo_empty;
  wire _maxi_read_req_fifo_almost_empty;

  _maxi_read_req_fifo
  inst__maxi_read_req_fifo
  (
    .CLK(CLK),
    .RST(RESETN_inv_buf),
    ._maxi_read_req_fifo_enq(_maxi_read_req_fifo_enq),
    ._maxi_read_req_fifo_wdata(_maxi_read_req_fifo_wdata),
    ._maxi_read_req_fifo_full(_maxi_read_req_fifo_full),
    ._maxi_read_req_fifo_almost_full(_maxi_read_req_fifo_almost_full),
    ._maxi_read_req_fifo_deq(_maxi_read_req_fifo_deq),
    ._maxi_read_req_fifo_rdata(_maxi_read_req_fifo_rdata),
    ._maxi_read_req_fifo_empty(_maxi_read_req_fifo_empty),
    ._maxi_read_req_fifo_almost_empty(_maxi_read_req_fifo_almost_empty)
  );

  reg [4-1:0] count__maxi_read_req_fifo;
  wire [8-1:0] _maxi_read_op_sel_fifo;
  wire [32-1:0] _maxi_read_local_addr_fifo;
  wire [32-1:0] _maxi_read_local_stride_fifo;
  wire [33-1:0] _maxi_read_local_size_fifo;
  wire [32-1:0] _maxi_read_local_blocksize_fifo;
  wire [8-1:0] unpack_read_req_op_sel_30;
  wire [32-1:0] unpack_read_req_local_addr_31;
  wire [32-1:0] unpack_read_req_local_stride_32;
  wire [33-1:0] unpack_read_req_local_size_33;
  wire [32-1:0] unpack_read_req_local_blocksize_34;
  assign unpack_read_req_op_sel_30 = _maxi_read_req_fifo_rdata[136:129];
  assign unpack_read_req_local_addr_31 = _maxi_read_req_fifo_rdata[128:97];
  assign unpack_read_req_local_stride_32 = _maxi_read_req_fifo_rdata[96:65];
  assign unpack_read_req_local_size_33 = _maxi_read_req_fifo_rdata[64:32];
  assign unpack_read_req_local_blocksize_34 = _maxi_read_req_fifo_rdata[31:0];
  assign _maxi_read_op_sel_fifo = unpack_read_req_op_sel_30;
  assign _maxi_read_local_addr_fifo = unpack_read_req_local_addr_31;
  assign _maxi_read_local_stride_fifo = unpack_read_req_local_stride_32;
  assign _maxi_read_local_size_fifo = unpack_read_req_local_size_33;
  assign _maxi_read_local_blocksize_fifo = unpack_read_req_local_blocksize_34;
  reg [8-1:0] _maxi_read_op_sel_buf;
  reg [32-1:0] _maxi_read_local_addr_buf;
  reg [32-1:0] _maxi_read_local_stride_buf;
  reg [33-1:0] _maxi_read_local_size_buf;
  reg [32-1:0] _maxi_read_local_blocksize_buf;
  reg _maxi_read_req_busy;
  reg _maxi_read_data_busy;
  wire _maxi_read_req_idle;
  wire _maxi_read_data_idle;
  wire _maxi_read_idle;
  assign _maxi_read_req_idle = !_maxi_read_start && !_maxi_read_req_busy;
  assign _maxi_read_data_idle = _maxi_read_req_fifo_empty && !_maxi_read_data_busy;
  assign _maxi_read_idle = _maxi_read_req_idle && _maxi_read_data_idle;
  reg _maxi_write_start;
  reg [8-1:0] _maxi_write_op_sel;
  reg [32-1:0] _maxi_write_global_addr;
  reg [33-1:0] _maxi_write_global_size;
  reg [32-1:0] _maxi_write_local_addr;
  reg [32-1:0] _maxi_write_local_stride;
  reg [33-1:0] _maxi_write_local_size;
  reg [32-1:0] _maxi_write_local_blocksize;
  wire _maxi_write_req_fifo_enq;
  wire [137-1:0] _maxi_write_req_fifo_wdata;
  wire _maxi_write_req_fifo_full;
  wire _maxi_write_req_fifo_almost_full;
  wire _maxi_write_req_fifo_deq;
  wire [137-1:0] _maxi_write_req_fifo_rdata;
  wire _maxi_write_req_fifo_empty;
  wire _maxi_write_req_fifo_almost_empty;

  _maxi_write_req_fifo
  inst__maxi_write_req_fifo
  (
    .CLK(CLK),
    .RST(RESETN_inv_buf),
    ._maxi_write_req_fifo_enq(_maxi_write_req_fifo_enq),
    ._maxi_write_req_fifo_wdata(_maxi_write_req_fifo_wdata),
    ._maxi_write_req_fifo_full(_maxi_write_req_fifo_full),
    ._maxi_write_req_fifo_almost_full(_maxi_write_req_fifo_almost_full),
    ._maxi_write_req_fifo_deq(_maxi_write_req_fifo_deq),
    ._maxi_write_req_fifo_rdata(_maxi_write_req_fifo_rdata),
    ._maxi_write_req_fifo_empty(_maxi_write_req_fifo_empty),
    ._maxi_write_req_fifo_almost_empty(_maxi_write_req_fifo_almost_empty)
  );

  reg [4-1:0] count__maxi_write_req_fifo;
  wire [8-1:0] _maxi_write_op_sel_fifo;
  wire [32-1:0] _maxi_write_local_addr_fifo;
  wire [32-1:0] _maxi_write_local_stride_fifo;
  wire [33-1:0] _maxi_write_size_fifo;
  wire [32-1:0] _maxi_write_local_blocksize_fifo;
  wire [8-1:0] unpack_write_req_op_sel_35;
  wire [32-1:0] unpack_write_req_local_addr_36;
  wire [32-1:0] unpack_write_req_local_stride_37;
  wire [33-1:0] unpack_write_req_size_38;
  wire [32-1:0] unpack_write_req_local_blocksize_39;
  assign unpack_write_req_op_sel_35 = _maxi_write_req_fifo_rdata[136:129];
  assign unpack_write_req_local_addr_36 = _maxi_write_req_fifo_rdata[128:97];
  assign unpack_write_req_local_stride_37 = _maxi_write_req_fifo_rdata[96:65];
  assign unpack_write_req_size_38 = _maxi_write_req_fifo_rdata[64:32];
  assign unpack_write_req_local_blocksize_39 = _maxi_write_req_fifo_rdata[31:0];
  assign _maxi_write_op_sel_fifo = unpack_write_req_op_sel_35;
  assign _maxi_write_local_addr_fifo = unpack_write_req_local_addr_36;
  assign _maxi_write_local_stride_fifo = unpack_write_req_local_stride_37;
  assign _maxi_write_size_fifo = unpack_write_req_size_38;
  assign _maxi_write_local_blocksize_fifo = unpack_write_req_local_blocksize_39;
  reg [8-1:0] _maxi_write_op_sel_buf;
  reg [32-1:0] _maxi_write_local_addr_buf;
  reg [32-1:0] _maxi_write_local_stride_buf;
  reg [33-1:0] _maxi_write_size_buf;
  reg [32-1:0] _maxi_write_local_blocksize_buf;
  reg _maxi_write_req_busy;
  reg _maxi_write_data_busy;
  wire _maxi_write_req_idle;
  wire _maxi_write_data_idle;
  wire _maxi_write_idle;
  assign _maxi_write_req_idle = !_maxi_write_start && !_maxi_write_req_busy;
  assign _maxi_write_data_idle = _maxi_write_req_fifo_empty && !_maxi_write_data_busy;
  assign _maxi_write_idle = _maxi_write_req_idle && _maxi_write_data_idle;
  reg [32-1:0] _maxi_global_base_addr;
  assign saxi_bresp = 0;
  assign saxi_rresp = 0;
  reg signed [32-1:0] _saxi_register_0;
  reg signed [32-1:0] _saxi_register_1;
  reg signed [32-1:0] _saxi_register_2;
  reg signed [32-1:0] _saxi_register_3;
  reg signed [32-1:0] _saxi_register_4;
  reg signed [32-1:0] _saxi_register_5;
  reg signed [32-1:0] _saxi_register_6;
  reg signed [32-1:0] _saxi_register_7;
  reg signed [32-1:0] _saxi_register_8;
  reg signed [32-1:0] _saxi_register_9;
  reg signed [32-1:0] _saxi_register_10;
  reg signed [32-1:0] _saxi_register_11;
  reg signed [32-1:0] _saxi_register_12;
  reg signed [32-1:0] _saxi_register_13;
  reg signed [32-1:0] _saxi_register_14;
  reg signed [32-1:0] _saxi_register_15;
  reg signed [32-1:0] _saxi_register_16;
  reg signed [32-1:0] _saxi_register_17;
  reg signed [32-1:0] _saxi_register_18;
  reg signed [32-1:0] _saxi_register_19;
  reg signed [32-1:0] _saxi_register_20;
  reg signed [32-1:0] _saxi_register_21;
  reg signed [32-1:0] _saxi_register_22;
  reg signed [32-1:0] _saxi_register_23;
  reg signed [32-1:0] _saxi_register_24;
  reg signed [32-1:0] _saxi_register_25;
  reg signed [32-1:0] _saxi_register_26;
  reg signed [32-1:0] _saxi_register_27;
  reg signed [32-1:0] _saxi_register_28;
  reg signed [32-1:0] _saxi_register_29;
  reg signed [32-1:0] _saxi_register_30;
  reg signed [32-1:0] _saxi_register_31;
  reg signed [32-1:0] _saxi_register_32;
  reg signed [32-1:0] _saxi_register_33;
  reg signed [32-1:0] _saxi_register_34;
  reg signed [32-1:0] _saxi_register_35;
  reg signed [32-1:0] _saxi_register_36;
  reg _saxi_flag_0;
  reg _saxi_flag_1;
  reg _saxi_flag_2;
  reg _saxi_flag_3;
  reg _saxi_flag_4;
  reg _saxi_flag_5;
  reg _saxi_flag_6;
  reg _saxi_flag_7;
  reg _saxi_flag_8;
  reg _saxi_flag_9;
  reg _saxi_flag_10;
  reg _saxi_flag_11;
  reg _saxi_flag_12;
  reg _saxi_flag_13;
  reg _saxi_flag_14;
  reg _saxi_flag_15;
  reg _saxi_flag_16;
  reg _saxi_flag_17;
  reg _saxi_flag_18;
  reg _saxi_flag_19;
  reg _saxi_flag_20;
  reg _saxi_flag_21;
  reg _saxi_flag_22;
  reg _saxi_flag_23;
  reg _saxi_flag_24;
  reg _saxi_flag_25;
  reg _saxi_flag_26;
  reg _saxi_flag_27;
  reg _saxi_flag_28;
  reg _saxi_flag_29;
  reg _saxi_flag_30;
  reg _saxi_flag_31;
  reg _saxi_flag_32;
  reg _saxi_flag_33;
  reg _saxi_flag_34;
  reg _saxi_flag_35;
  reg _saxi_flag_36;
  reg signed [32-1:0] _saxi_resetval_0;
  reg signed [32-1:0] _saxi_resetval_1;
  reg signed [32-1:0] _saxi_resetval_2;
  reg signed [32-1:0] _saxi_resetval_3;
  reg signed [32-1:0] _saxi_resetval_4;
  reg signed [32-1:0] _saxi_resetval_5;
  reg signed [32-1:0] _saxi_resetval_6;
  reg signed [32-1:0] _saxi_resetval_7;
  reg signed [32-1:0] _saxi_resetval_8;
  reg signed [32-1:0] _saxi_resetval_9;
  reg signed [32-1:0] _saxi_resetval_10;
  reg signed [32-1:0] _saxi_resetval_11;
  reg signed [32-1:0] _saxi_resetval_12;
  reg signed [32-1:0] _saxi_resetval_13;
  reg signed [32-1:0] _saxi_resetval_14;
  reg signed [32-1:0] _saxi_resetval_15;
  reg signed [32-1:0] _saxi_resetval_16;
  reg signed [32-1:0] _saxi_resetval_17;
  reg signed [32-1:0] _saxi_resetval_18;
  reg signed [32-1:0] _saxi_resetval_19;
  reg signed [32-1:0] _saxi_resetval_20;
  reg signed [32-1:0] _saxi_resetval_21;
  reg signed [32-1:0] _saxi_resetval_22;
  reg signed [32-1:0] _saxi_resetval_23;
  reg signed [32-1:0] _saxi_resetval_24;
  reg signed [32-1:0] _saxi_resetval_25;
  reg signed [32-1:0] _saxi_resetval_26;
  reg signed [32-1:0] _saxi_resetval_27;
  reg signed [32-1:0] _saxi_resetval_28;
  reg signed [32-1:0] _saxi_resetval_29;
  reg signed [32-1:0] _saxi_resetval_30;
  reg signed [32-1:0] _saxi_resetval_31;
  reg signed [32-1:0] _saxi_resetval_32;
  reg signed [32-1:0] _saxi_resetval_33;
  reg signed [32-1:0] _saxi_resetval_34;
  reg signed [32-1:0] _saxi_resetval_35;
  reg signed [32-1:0] _saxi_resetval_36;
  localparam _saxi_maskwidth = 6;
  localparam _saxi_mask = { _saxi_maskwidth{ 1'd1 } };
  localparam _saxi_shift = 2;
  reg [32-1:0] _saxi_register_fsm;
  localparam _saxi_register_fsm_init = 0;
  reg [32-1:0] addr_40;
  reg writevalid_41;
  reg readvalid_42;
  reg prev_awvalid_43;
  reg prev_arvalid_44;
  assign saxi_awready = (_saxi_register_fsm == 0) && (!writevalid_41 && !readvalid_42 && !saxi_bvalid && prev_awvalid_43);
  assign saxi_arready = (_saxi_register_fsm == 0) && (!readvalid_42 && !writevalid_41 && prev_arvalid_44 && !prev_awvalid_43);
  reg [_saxi_maskwidth-1:0] axis_maskaddr_45;
  wire signed [32-1:0] axislite_rdata_46;
  assign axislite_rdata_46 = (axis_maskaddr_45 == 0)? _saxi_register_0 : 
                             (axis_maskaddr_45 == 1)? _saxi_register_1 : 
                             (axis_maskaddr_45 == 2)? _saxi_register_2 : 
                             (axis_maskaddr_45 == 3)? _saxi_register_3 : 
                             (axis_maskaddr_45 == 4)? _saxi_register_4 : 
                             (axis_maskaddr_45 == 5)? _saxi_register_5 : 
                             (axis_maskaddr_45 == 6)? _saxi_register_6 : 
                             (axis_maskaddr_45 == 7)? _saxi_register_7 : 
                             (axis_maskaddr_45 == 8)? _saxi_register_8 : 
                             (axis_maskaddr_45 == 9)? _saxi_register_9 : 
                             (axis_maskaddr_45 == 10)? _saxi_register_10 : 
                             (axis_maskaddr_45 == 11)? _saxi_register_11 : 
                             (axis_maskaddr_45 == 12)? _saxi_register_12 : 
                             (axis_maskaddr_45 == 13)? _saxi_register_13 : 
                             (axis_maskaddr_45 == 14)? _saxi_register_14 : 
                             (axis_maskaddr_45 == 15)? _saxi_register_15 : 
                             (axis_maskaddr_45 == 16)? _saxi_register_16 : 
                             (axis_maskaddr_45 == 17)? _saxi_register_17 : 
                             (axis_maskaddr_45 == 18)? _saxi_register_18 : 
                             (axis_maskaddr_45 == 19)? _saxi_register_19 : 
                             (axis_maskaddr_45 == 20)? _saxi_register_20 : 
                             (axis_maskaddr_45 == 21)? _saxi_register_21 : 
                             (axis_maskaddr_45 == 22)? _saxi_register_22 : 
                             (axis_maskaddr_45 == 23)? _saxi_register_23 : 
                             (axis_maskaddr_45 == 24)? _saxi_register_24 : 
                             (axis_maskaddr_45 == 25)? _saxi_register_25 : 
                             (axis_maskaddr_45 == 26)? _saxi_register_26 : 
                             (axis_maskaddr_45 == 27)? _saxi_register_27 : 
                             (axis_maskaddr_45 == 28)? _saxi_register_28 : 
                             (axis_maskaddr_45 == 29)? _saxi_register_29 : 
                             (axis_maskaddr_45 == 30)? _saxi_register_30 : 
                             (axis_maskaddr_45 == 31)? _saxi_register_31 : 
                             (axis_maskaddr_45 == 32)? _saxi_register_32 : 
                             (axis_maskaddr_45 == 33)? _saxi_register_33 : 
                             (axis_maskaddr_45 == 34)? _saxi_register_34 : 
                             (axis_maskaddr_45 == 35)? _saxi_register_35 : 
                             (axis_maskaddr_45 == 36)? _saxi_register_36 : 'hx;
  wire axislite_flag_47;
  assign axislite_flag_47 = (axis_maskaddr_45 == 0)? _saxi_flag_0 : 
                            (axis_maskaddr_45 == 1)? _saxi_flag_1 : 
                            (axis_maskaddr_45 == 2)? _saxi_flag_2 : 
                            (axis_maskaddr_45 == 3)? _saxi_flag_3 : 
                            (axis_maskaddr_45 == 4)? _saxi_flag_4 : 
                            (axis_maskaddr_45 == 5)? _saxi_flag_5 : 
                            (axis_maskaddr_45 == 6)? _saxi_flag_6 : 
                            (axis_maskaddr_45 == 7)? _saxi_flag_7 : 
                            (axis_maskaddr_45 == 8)? _saxi_flag_8 : 
                            (axis_maskaddr_45 == 9)? _saxi_flag_9 : 
                            (axis_maskaddr_45 == 10)? _saxi_flag_10 : 
                            (axis_maskaddr_45 == 11)? _saxi_flag_11 : 
                            (axis_maskaddr_45 == 12)? _saxi_flag_12 : 
                            (axis_maskaddr_45 == 13)? _saxi_flag_13 : 
                            (axis_maskaddr_45 == 14)? _saxi_flag_14 : 
                            (axis_maskaddr_45 == 15)? _saxi_flag_15 : 
                            (axis_maskaddr_45 == 16)? _saxi_flag_16 : 
                            (axis_maskaddr_45 == 17)? _saxi_flag_17 : 
                            (axis_maskaddr_45 == 18)? _saxi_flag_18 : 
                            (axis_maskaddr_45 == 19)? _saxi_flag_19 : 
                            (axis_maskaddr_45 == 20)? _saxi_flag_20 : 
                            (axis_maskaddr_45 == 21)? _saxi_flag_21 : 
                            (axis_maskaddr_45 == 22)? _saxi_flag_22 : 
                            (axis_maskaddr_45 == 23)? _saxi_flag_23 : 
                            (axis_maskaddr_45 == 24)? _saxi_flag_24 : 
                            (axis_maskaddr_45 == 25)? _saxi_flag_25 : 
                            (axis_maskaddr_45 == 26)? _saxi_flag_26 : 
                            (axis_maskaddr_45 == 27)? _saxi_flag_27 : 
                            (axis_maskaddr_45 == 28)? _saxi_flag_28 : 
                            (axis_maskaddr_45 == 29)? _saxi_flag_29 : 
                            (axis_maskaddr_45 == 30)? _saxi_flag_30 : 
                            (axis_maskaddr_45 == 31)? _saxi_flag_31 : 
                            (axis_maskaddr_45 == 32)? _saxi_flag_32 : 
                            (axis_maskaddr_45 == 33)? _saxi_flag_33 : 
                            (axis_maskaddr_45 == 34)? _saxi_flag_34 : 
                            (axis_maskaddr_45 == 35)? _saxi_flag_35 : 
                            (axis_maskaddr_45 == 36)? _saxi_flag_36 : 'hx;
  wire signed [32-1:0] axislite_resetval_48;
  assign axislite_resetval_48 = (axis_maskaddr_45 == 0)? _saxi_resetval_0 : 
                                (axis_maskaddr_45 == 1)? _saxi_resetval_1 : 
                                (axis_maskaddr_45 == 2)? _saxi_resetval_2 : 
                                (axis_maskaddr_45 == 3)? _saxi_resetval_3 : 
                                (axis_maskaddr_45 == 4)? _saxi_resetval_4 : 
                                (axis_maskaddr_45 == 5)? _saxi_resetval_5 : 
                                (axis_maskaddr_45 == 6)? _saxi_resetval_6 : 
                                (axis_maskaddr_45 == 7)? _saxi_resetval_7 : 
                                (axis_maskaddr_45 == 8)? _saxi_resetval_8 : 
                                (axis_maskaddr_45 == 9)? _saxi_resetval_9 : 
                                (axis_maskaddr_45 == 10)? _saxi_resetval_10 : 
                                (axis_maskaddr_45 == 11)? _saxi_resetval_11 : 
                                (axis_maskaddr_45 == 12)? _saxi_resetval_12 : 
                                (axis_maskaddr_45 == 13)? _saxi_resetval_13 : 
                                (axis_maskaddr_45 == 14)? _saxi_resetval_14 : 
                                (axis_maskaddr_45 == 15)? _saxi_resetval_15 : 
                                (axis_maskaddr_45 == 16)? _saxi_resetval_16 : 
                                (axis_maskaddr_45 == 17)? _saxi_resetval_17 : 
                                (axis_maskaddr_45 == 18)? _saxi_resetval_18 : 
                                (axis_maskaddr_45 == 19)? _saxi_resetval_19 : 
                                (axis_maskaddr_45 == 20)? _saxi_resetval_20 : 
                                (axis_maskaddr_45 == 21)? _saxi_resetval_21 : 
                                (axis_maskaddr_45 == 22)? _saxi_resetval_22 : 
                                (axis_maskaddr_45 == 23)? _saxi_resetval_23 : 
                                (axis_maskaddr_45 == 24)? _saxi_resetval_24 : 
                                (axis_maskaddr_45 == 25)? _saxi_resetval_25 : 
                                (axis_maskaddr_45 == 26)? _saxi_resetval_26 : 
                                (axis_maskaddr_45 == 27)? _saxi_resetval_27 : 
                                (axis_maskaddr_45 == 28)? _saxi_resetval_28 : 
                                (axis_maskaddr_45 == 29)? _saxi_resetval_29 : 
                                (axis_maskaddr_45 == 30)? _saxi_resetval_30 : 
                                (axis_maskaddr_45 == 31)? _saxi_resetval_31 : 
                                (axis_maskaddr_45 == 32)? _saxi_resetval_32 : 
                                (axis_maskaddr_45 == 33)? _saxi_resetval_33 : 
                                (axis_maskaddr_45 == 34)? _saxi_resetval_34 : 
                                (axis_maskaddr_45 == 35)? _saxi_resetval_35 : 
                                (axis_maskaddr_45 == 36)? _saxi_resetval_36 : 'hx;
  reg _saxi_rdata_cond_0_1;
  assign saxi_wready = _saxi_register_fsm == 3;
  wire maxi_idle;
  assign maxi_idle = _maxi_write_idle & _maxi_read_idle;
  wire sw_rst_logic;
  assign sw_rst_logic = maxi_idle & _saxi_register_6;
  wire rst_logic;
  assign rst_logic = RESETN_inv_buf | sw_rst_logic;
  reg RST;
  reg _rst_logic_1;
  reg _rst_logic_2;
  wire signed [32-1:0] irq_49;
  assign irq_49 = _saxi_register_9 & _saxi_register_10;
  wire irq_busy;
  assign irq_busy = _saxi_register_5[0];
  reg irq_busy_edge_50;
  wire irq_busy_edge_51;
  assign irq_busy_edge_51 = irq_busy_edge_50 & !irq_busy;
  wire irq_extern;
  assign irq_extern = |_saxi_register_7;
  reg irq_extern_edge_52;
  wire irq_extern_edge_53;
  assign irq_extern_edge_53 = !irq_extern_edge_52 & irq_extern;
  wire [10-1:0] ram_w32_l1024_id0_0_addr;
  wire [32-1:0] ram_w32_l1024_id0_0_rdata;
  wire [32-1:0] ram_w32_l1024_id0_0_wdata;
  wire ram_w32_l1024_id0_0_wenable;
  wire ram_w32_l1024_id0_0_enable;
  wire [10-1:0] ram_w32_l1024_id0_1_addr;
  wire [32-1:0] ram_w32_l1024_id0_1_rdata;
  wire [32-1:0] ram_w32_l1024_id0_1_wdata;
  wire ram_w32_l1024_id0_1_wenable;
  wire ram_w32_l1024_id0_1_enable;
  assign ram_w32_l1024_id0_0_wdata = 'hx;
  assign ram_w32_l1024_id0_0_wenable = 0;

  ram_w32_l1024_id0
  inst_ram_w32_l1024_id0
  (
    .CLK(CLK),
    .ram_w32_l1024_id0_0_addr(ram_w32_l1024_id0_0_addr),
    .ram_w32_l1024_id0_0_rdata(ram_w32_l1024_id0_0_rdata),
    .ram_w32_l1024_id0_0_wdata(ram_w32_l1024_id0_0_wdata),
    .ram_w32_l1024_id0_0_wenable(ram_w32_l1024_id0_0_wenable),
    .ram_w32_l1024_id0_0_enable(ram_w32_l1024_id0_0_enable),
    .ram_w32_l1024_id0_1_addr(ram_w32_l1024_id0_1_addr),
    .ram_w32_l1024_id0_1_rdata(ram_w32_l1024_id0_1_rdata),
    .ram_w32_l1024_id0_1_wdata(ram_w32_l1024_id0_1_wdata),
    .ram_w32_l1024_id0_1_wenable(ram_w32_l1024_id0_1_wenable),
    .ram_w32_l1024_id0_1_enable(ram_w32_l1024_id0_1_enable)
  );

  wire [10-1:0] ram_w32_l1024_id1_0_addr;
  wire [32-1:0] ram_w32_l1024_id1_0_rdata;
  wire [32-1:0] ram_w32_l1024_id1_0_wdata;
  wire ram_w32_l1024_id1_0_wenable;
  wire ram_w32_l1024_id1_0_enable;
  wire [10-1:0] ram_w32_l1024_id1_1_addr;
  wire [32-1:0] ram_w32_l1024_id1_1_rdata;
  wire [32-1:0] ram_w32_l1024_id1_1_wdata;
  wire ram_w32_l1024_id1_1_wenable;
  wire ram_w32_l1024_id1_1_enable;
  assign ram_w32_l1024_id1_0_wdata = 'hx;
  assign ram_w32_l1024_id1_0_wenable = 0;

  ram_w32_l1024_id1
  inst_ram_w32_l1024_id1
  (
    .CLK(CLK),
    .ram_w32_l1024_id1_0_addr(ram_w32_l1024_id1_0_addr),
    .ram_w32_l1024_id1_0_rdata(ram_w32_l1024_id1_0_rdata),
    .ram_w32_l1024_id1_0_wdata(ram_w32_l1024_id1_0_wdata),
    .ram_w32_l1024_id1_0_wenable(ram_w32_l1024_id1_0_wenable),
    .ram_w32_l1024_id1_0_enable(ram_w32_l1024_id1_0_enable),
    .ram_w32_l1024_id1_1_addr(ram_w32_l1024_id1_1_addr),
    .ram_w32_l1024_id1_1_rdata(ram_w32_l1024_id1_1_rdata),
    .ram_w32_l1024_id1_1_wdata(ram_w32_l1024_id1_1_wdata),
    .ram_w32_l1024_id1_1_wenable(ram_w32_l1024_id1_1_wenable),
    .ram_w32_l1024_id1_1_enable(ram_w32_l1024_id1_1_enable)
  );

  wire [9-1:0] ram_w16_l1024_id0_0_0_addr;
  wire [16-1:0] ram_w16_l1024_id0_0_0_rdata;
  wire [16-1:0] ram_w16_l1024_id0_0_0_wdata;
  wire ram_w16_l1024_id0_0_0_wenable;
  wire ram_w16_l1024_id0_0_0_enable;
  wire [9-1:0] ram_w16_l1024_id0_0_1_addr;
  wire [16-1:0] ram_w16_l1024_id0_0_1_rdata;
  wire [16-1:0] ram_w16_l1024_id0_0_1_wdata;
  wire ram_w16_l1024_id0_0_1_wenable;
  wire ram_w16_l1024_id0_0_1_enable;
  assign ram_w16_l1024_id0_0_0_wdata = 'hx;
  assign ram_w16_l1024_id0_0_0_wenable = 0;

  ram_w16_l1024_id0_0
  inst_ram_w16_l1024_id0_0
  (
    .CLK(CLK),
    .ram_w16_l1024_id0_0_0_addr(ram_w16_l1024_id0_0_0_addr),
    .ram_w16_l1024_id0_0_0_rdata(ram_w16_l1024_id0_0_0_rdata),
    .ram_w16_l1024_id0_0_0_wdata(ram_w16_l1024_id0_0_0_wdata),
    .ram_w16_l1024_id0_0_0_wenable(ram_w16_l1024_id0_0_0_wenable),
    .ram_w16_l1024_id0_0_0_enable(ram_w16_l1024_id0_0_0_enable),
    .ram_w16_l1024_id0_0_1_addr(ram_w16_l1024_id0_0_1_addr),
    .ram_w16_l1024_id0_0_1_rdata(ram_w16_l1024_id0_0_1_rdata),
    .ram_w16_l1024_id0_0_1_wdata(ram_w16_l1024_id0_0_1_wdata),
    .ram_w16_l1024_id0_0_1_wenable(ram_w16_l1024_id0_0_1_wenable),
    .ram_w16_l1024_id0_0_1_enable(ram_w16_l1024_id0_0_1_enable)
  );

  wire [9-1:0] ram_w16_l1024_id0_1_0_addr;
  wire [16-1:0] ram_w16_l1024_id0_1_0_rdata;
  wire [16-1:0] ram_w16_l1024_id0_1_0_wdata;
  wire ram_w16_l1024_id0_1_0_wenable;
  wire ram_w16_l1024_id0_1_0_enable;
  wire [9-1:0] ram_w16_l1024_id0_1_1_addr;
  wire [16-1:0] ram_w16_l1024_id0_1_1_rdata;
  wire [16-1:0] ram_w16_l1024_id0_1_1_wdata;
  wire ram_w16_l1024_id0_1_1_wenable;
  wire ram_w16_l1024_id0_1_1_enable;
  assign ram_w16_l1024_id0_1_0_wdata = 'hx;
  assign ram_w16_l1024_id0_1_0_wenable = 0;

  ram_w16_l1024_id0_1
  inst_ram_w16_l1024_id0_1
  (
    .CLK(CLK),
    .ram_w16_l1024_id0_1_0_addr(ram_w16_l1024_id0_1_0_addr),
    .ram_w16_l1024_id0_1_0_rdata(ram_w16_l1024_id0_1_0_rdata),
    .ram_w16_l1024_id0_1_0_wdata(ram_w16_l1024_id0_1_0_wdata),
    .ram_w16_l1024_id0_1_0_wenable(ram_w16_l1024_id0_1_0_wenable),
    .ram_w16_l1024_id0_1_0_enable(ram_w16_l1024_id0_1_0_enable),
    .ram_w16_l1024_id0_1_1_addr(ram_w16_l1024_id0_1_1_addr),
    .ram_w16_l1024_id0_1_1_rdata(ram_w16_l1024_id0_1_1_rdata),
    .ram_w16_l1024_id0_1_1_wdata(ram_w16_l1024_id0_1_1_wdata),
    .ram_w16_l1024_id0_1_1_wenable(ram_w16_l1024_id0_1_1_wenable),
    .ram_w16_l1024_id0_1_1_enable(ram_w16_l1024_id0_1_1_enable)
  );

  wire [9-1:0] ram_w16_l1024_id1_0_0_addr;
  wire [16-1:0] ram_w16_l1024_id1_0_0_rdata;
  wire [16-1:0] ram_w16_l1024_id1_0_0_wdata;
  wire ram_w16_l1024_id1_0_0_wenable;
  wire ram_w16_l1024_id1_0_0_enable;
  wire [9-1:0] ram_w16_l1024_id1_0_1_addr;
  wire [16-1:0] ram_w16_l1024_id1_0_1_rdata;
  wire [16-1:0] ram_w16_l1024_id1_0_1_wdata;
  wire ram_w16_l1024_id1_0_1_wenable;
  wire ram_w16_l1024_id1_0_1_enable;

  ram_w16_l1024_id1_0
  inst_ram_w16_l1024_id1_0
  (
    .CLK(CLK),
    .ram_w16_l1024_id1_0_0_addr(ram_w16_l1024_id1_0_0_addr),
    .ram_w16_l1024_id1_0_0_rdata(ram_w16_l1024_id1_0_0_rdata),
    .ram_w16_l1024_id1_0_0_wdata(ram_w16_l1024_id1_0_0_wdata),
    .ram_w16_l1024_id1_0_0_wenable(ram_w16_l1024_id1_0_0_wenable),
    .ram_w16_l1024_id1_0_0_enable(ram_w16_l1024_id1_0_0_enable),
    .ram_w16_l1024_id1_0_1_addr(ram_w16_l1024_id1_0_1_addr),
    .ram_w16_l1024_id1_0_1_rdata(ram_w16_l1024_id1_0_1_rdata),
    .ram_w16_l1024_id1_0_1_wdata(ram_w16_l1024_id1_0_1_wdata),
    .ram_w16_l1024_id1_0_1_wenable(ram_w16_l1024_id1_0_1_wenable),
    .ram_w16_l1024_id1_0_1_enable(ram_w16_l1024_id1_0_1_enable)
  );

  wire [9-1:0] ram_w16_l1024_id1_1_0_addr;
  wire [16-1:0] ram_w16_l1024_id1_1_0_rdata;
  wire [16-1:0] ram_w16_l1024_id1_1_0_wdata;
  wire ram_w16_l1024_id1_1_0_wenable;
  wire ram_w16_l1024_id1_1_0_enable;
  wire [9-1:0] ram_w16_l1024_id1_1_1_addr;
  wire [16-1:0] ram_w16_l1024_id1_1_1_rdata;
  wire [16-1:0] ram_w16_l1024_id1_1_1_wdata;
  wire ram_w16_l1024_id1_1_1_wenable;
  wire ram_w16_l1024_id1_1_1_enable;

  ram_w16_l1024_id1_1
  inst_ram_w16_l1024_id1_1
  (
    .CLK(CLK),
    .ram_w16_l1024_id1_1_0_addr(ram_w16_l1024_id1_1_0_addr),
    .ram_w16_l1024_id1_1_0_rdata(ram_w16_l1024_id1_1_0_rdata),
    .ram_w16_l1024_id1_1_0_wdata(ram_w16_l1024_id1_1_0_wdata),
    .ram_w16_l1024_id1_1_0_wenable(ram_w16_l1024_id1_1_0_wenable),
    .ram_w16_l1024_id1_1_0_enable(ram_w16_l1024_id1_1_0_enable),
    .ram_w16_l1024_id1_1_1_addr(ram_w16_l1024_id1_1_1_addr),
    .ram_w16_l1024_id1_1_1_rdata(ram_w16_l1024_id1_1_1_rdata),
    .ram_w16_l1024_id1_1_1_wdata(ram_w16_l1024_id1_1_1_wdata),
    .ram_w16_l1024_id1_1_1_wenable(ram_w16_l1024_id1_1_1_wenable),
    .ram_w16_l1024_id1_1_1_enable(ram_w16_l1024_id1_1_1_enable)
  );

  wire [9-1:0] ram_w32_l512_id0_0_addr;
  wire [32-1:0] ram_w32_l512_id0_0_rdata;
  wire [32-1:0] ram_w32_l512_id0_0_wdata;
  wire ram_w32_l512_id0_0_wenable;
  wire ram_w32_l512_id0_0_enable;
  wire [9-1:0] ram_w32_l512_id0_1_addr;
  wire [32-1:0] ram_w32_l512_id0_1_rdata;
  wire [32-1:0] ram_w32_l512_id0_1_wdata;
  wire ram_w32_l512_id0_1_wenable;
  wire ram_w32_l512_id0_1_enable;
  assign ram_w32_l512_id0_0_wdata = 'hx;
  assign ram_w32_l512_id0_0_wenable = 0;

  ram_w32_l512_id0
  inst_ram_w32_l512_id0
  (
    .CLK(CLK),
    .ram_w32_l512_id0_0_addr(ram_w32_l512_id0_0_addr),
    .ram_w32_l512_id0_0_rdata(ram_w32_l512_id0_0_rdata),
    .ram_w32_l512_id0_0_wdata(ram_w32_l512_id0_0_wdata),
    .ram_w32_l512_id0_0_wenable(ram_w32_l512_id0_0_wenable),
    .ram_w32_l512_id0_0_enable(ram_w32_l512_id0_0_enable),
    .ram_w32_l512_id0_1_addr(ram_w32_l512_id0_1_addr),
    .ram_w32_l512_id0_1_rdata(ram_w32_l512_id0_1_rdata),
    .ram_w32_l512_id0_1_wdata(ram_w32_l512_id0_1_wdata),
    .ram_w32_l512_id0_1_wenable(ram_w32_l512_id0_1_wenable),
    .ram_w32_l512_id0_1_enable(ram_w32_l512_id0_1_enable)
  );

  wire [7-1:0] ram_w32_l128_id0_0_addr;
  wire [32-1:0] ram_w32_l128_id0_0_rdata;
  wire [32-1:0] ram_w32_l128_id0_0_wdata;
  wire ram_w32_l128_id0_0_wenable;
  wire ram_w32_l128_id0_0_enable;
  wire [7-1:0] ram_w32_l128_id0_1_addr;
  wire [32-1:0] ram_w32_l128_id0_1_rdata;
  wire [32-1:0] ram_w32_l128_id0_1_wdata;
  wire ram_w32_l128_id0_1_wenable;
  wire ram_w32_l128_id0_1_enable;
  assign ram_w32_l128_id0_1_wdata = 'hx;
  assign ram_w32_l128_id0_1_wenable = 0;

  ram_w32_l128_id0
  inst_ram_w32_l128_id0
  (
    .CLK(CLK),
    .ram_w32_l128_id0_0_addr(ram_w32_l128_id0_0_addr),
    .ram_w32_l128_id0_0_rdata(ram_w32_l128_id0_0_rdata),
    .ram_w32_l128_id0_0_wdata(ram_w32_l128_id0_0_wdata),
    .ram_w32_l128_id0_0_wenable(ram_w32_l128_id0_0_wenable),
    .ram_w32_l128_id0_0_enable(ram_w32_l128_id0_0_enable),
    .ram_w32_l128_id0_1_addr(ram_w32_l128_id0_1_addr),
    .ram_w32_l128_id0_1_rdata(ram_w32_l128_id0_1_rdata),
    .ram_w32_l128_id0_1_wdata(ram_w32_l128_id0_1_wdata),
    .ram_w32_l128_id0_1_wenable(ram_w32_l128_id0_1_wenable),
    .ram_w32_l128_id0_1_enable(ram_w32_l128_id0_1_enable)
  );

  wire [7-1:0] ram_w32_l128_id1_0_addr;
  wire [32-1:0] ram_w32_l128_id1_0_rdata;
  wire [32-1:0] ram_w32_l128_id1_0_wdata;
  wire ram_w32_l128_id1_0_wenable;
  wire ram_w32_l128_id1_0_enable;
  wire [7-1:0] ram_w32_l128_id1_1_addr;
  wire [32-1:0] ram_w32_l128_id1_1_rdata;
  wire [32-1:0] ram_w32_l128_id1_1_wdata;
  wire ram_w32_l128_id1_1_wenable;
  wire ram_w32_l128_id1_1_enable;
  assign ram_w32_l128_id1_0_wdata = 'hx;
  assign ram_w32_l128_id1_0_wenable = 0;

  ram_w32_l128_id1
  inst_ram_w32_l128_id1
  (
    .CLK(CLK),
    .ram_w32_l128_id1_0_addr(ram_w32_l128_id1_0_addr),
    .ram_w32_l128_id1_0_rdata(ram_w32_l128_id1_0_rdata),
    .ram_w32_l128_id1_0_wdata(ram_w32_l128_id1_0_wdata),
    .ram_w32_l128_id1_0_wenable(ram_w32_l128_id1_0_wenable),
    .ram_w32_l128_id1_0_enable(ram_w32_l128_id1_0_enable),
    .ram_w32_l128_id1_1_addr(ram_w32_l128_id1_1_addr),
    .ram_w32_l128_id1_1_rdata(ram_w32_l128_id1_1_rdata),
    .ram_w32_l128_id1_1_wdata(ram_w32_l128_id1_1_wdata),
    .ram_w32_l128_id1_1_wenable(ram_w32_l128_id1_1_wenable),
    .ram_w32_l128_id1_1_enable(ram_w32_l128_id1_1_enable)
  );

  reg [2-1:0] transpose_14_control_param_index;
  wire [10-1:0] cparam__lazy_reshape_1_total_size;
  wire [1-1:0] cparam__lazy_reshape_1_read_size;
  wire [3-1:0] cparam__lazy_reshape_1_in_offset_inc;
  wire [10-1:0] cparam__lazy_reshape_1_write_size;
  wire [11-1:0] cparam__lazy_reshape_1_out_offset_inc;
  assign cparam__lazy_reshape_1_total_size = 784;
  assign cparam__lazy_reshape_1_read_size = 1;
  assign cparam__lazy_reshape_1_in_offset_inc = 4;
  assign cparam__lazy_reshape_1_write_size = 784;
  assign cparam__lazy_reshape_1_out_offset_inc = 1568;
  wire [1-1:0] cparam_matmul_5_act_num_col;
  wire [1-1:0] cparam_matmul_5_act_num_row;
  wire [8-1:0] cparam_matmul_5_filter_num_och;
  wire [1-1:0] cparam_matmul_5_bias_scala;
  wire [7-1:0] cparam_matmul_5_bias_num;
  wire [1-1:0] cparam_matmul_5_scale_scala;
  wire [1-1:0] cparam_matmul_5_scale_num;
  wire [1-1:0] cparam_matmul_5_vshamt_mul_scala;
  wire [1-1:0] cparam_matmul_5_vshamt_mul_num;
  wire [1-1:0] cparam_matmul_5_vshamt_sum_scala;
  wire [1-1:0] cparam_matmul_5_vshamt_sum_num;
  wire [1-1:0] cparam_matmul_5_vshamt_out_scala;
  wire [1-1:0] cparam_matmul_5_vshamt_out_num;
  wire [1-1:0] cparam_matmul_5_cshamt_mul_value;
  wire [1-1:0] cparam_matmul_5_cshamt_sum_value;
  wire [5-1:0] cparam_matmul_5_cshamt_out_value;
  wire [1-1:0] cparam_matmul_5_act_func_index;
  wire [1-1:0] cparam_matmul_5_out_num_col;
  wire [1-1:0] cparam_matmul_5_out_num_row;
  wire [1-1:0] cparam_matmul_5_pad_col_left;
  wire [1-1:0] cparam_matmul_5_pad_row_top;
  wire [1-1:0] cparam_matmul_5_max_col_count;
  wire [1-1:0] cparam_matmul_5_max_row_count;
  wire [1-1:0] cparam_matmul_5_max_bat_count;
  wire [6-1:0] cparam_matmul_5_max_och_count;
  wire [5-1:0] cparam_matmul_5_och_count_step;
  wire [1-1:0] cparam_matmul_5_dma_flag_conds_0;
  wire signed [32-1:0] cparam_matmul_5_act_offset_values_0;
  wire [11-1:0] cparam_matmul_5_act_row_step;
  wire [11-1:0] cparam_matmul_5_act_bat_step;
  wire [9-1:0] cparam_matmul_5_act_read_size;
  wire [9-1:0] cparam_matmul_5_act_read_block;
  wire [9-1:0] cparam_matmul_5_act_read_step;
  wire [13-1:0] cparam_matmul_5_filter_base_step;
  wire [11-1:0] cparam_matmul_5_filter_read_size;
  wire [9-1:0] cparam_matmul_5_filter_read_block;
  wire [10-1:0] cparam_matmul_5_filter_read_step;
  wire [1-1:0] cparam_matmul_5_out_offset_values_0;
  wire [9-1:0] cparam_matmul_5_out_col_step;
  wire [9-1:0] cparam_matmul_5_out_row_step;
  wire [9-1:0] cparam_matmul_5_out_bat_step;
  wire [6-1:0] cparam_matmul_5_out_och_step;
  wire [4-1:0] cparam_matmul_5_out_write_size;
  wire [4-1:0] cparam_matmul_5_out_write_size_res;
  wire [3-1:0] cparam_matmul_5_out_write_block;
  wire [1-1:0] cparam_matmul_5_keep_filter;
  wire [1-1:0] cparam_matmul_5_keep_input;
  wire [1-1:0] cparam_matmul_5_data_stationary;
  wire [4-1:0] cparam_matmul_5_stream_num_ops;
  wire [4-1:0] cparam_matmul_5_stream_num_ops_res;
  wire [4-1:0] cparam_matmul_5_stream_num_ops_par;
  wire [4-1:0] cparam_matmul_5_stream_num_ops_res_par;
  wire [9-1:0] cparam_matmul_5_stream_reduce_size;
  wire [9-1:0] cparam_matmul_5_stream_aligned_reduce_size;
  wire [1-1:0] cparam_matmul_5_stream_omit_mask;
  wire [1-1:0] cparam_matmul_5_col_select_initval;
  wire [1-1:0] cparam_matmul_5_stride_col_par_col;
  wire [1-1:0] cparam_matmul_5_stride_row_par_row;
  wire [1-1:0] cparam_matmul_5_stride_col_mod_filter_num;
  wire [1-1:0] cparam_matmul_5_filter_num_col_minus_stride_col_mod;
  wire [1-1:0] cparam_matmul_5_inc_act_laddr_conds_0;
  wire [9-1:0] cparam_matmul_5_inc_act_laddr_small;
  wire [9-1:0] cparam_matmul_5_inc_act_laddr_large;
  wire [7-1:0] cparam_matmul_5_inc_out_laddr_col;
  wire [1-1:0] cparam_matmul_5_stream_act_local_small_offset;
  wire [1-1:0] cparam_matmul_5_stream_act_local_large_offset;
  wire [1-1:0] cparam_matmul_5_stream_act_local_small_flags_0;
  wire [1-1:0] cparam_matmul_5_stream_act_local_large_flags_0;
  wire [1-1:0] cparam_matmul_5_inc_sync_out;
  wire [1-1:0] cparam_matmul_5_inc_sync_out_res;
  reg [2-1:0] matmul_5_control_param_index;
  assign cparam_matmul_5_act_num_col = (matmul_5_control_param_index == 0)? 32'h1 : 
                                       (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_act_num_row = (matmul_5_control_param_index == 0)? 32'h1 : 
                                       (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_filter_num_och = (matmul_5_control_param_index == 0)? 32'h80 : 
                                          (matmul_5_control_param_index == 1)? 32'h40 : 32'ha;
  assign cparam_matmul_5_bias_scala = (matmul_5_control_param_index == 0)? 32'h0 : 
                                      (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_bias_num = (matmul_5_control_param_index == 0)? 32'h40 : 
                                    (matmul_5_control_param_index == 1)? 32'h20 : 32'h5;
  assign cparam_matmul_5_scale_scala = (matmul_5_control_param_index == 0)? 32'h0 : 
                                       (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_scale_num = (matmul_5_control_param_index == 0)? 32'h0 : 
                                     (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_vshamt_mul_scala = (matmul_5_control_param_index == 0)? 32'h0 : 
                                            (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_vshamt_mul_num = (matmul_5_control_param_index == 0)? 32'h0 : 
                                          (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_vshamt_sum_scala = (matmul_5_control_param_index == 0)? 32'h0 : 
                                            (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_vshamt_sum_num = (matmul_5_control_param_index == 0)? 32'h0 : 
                                          (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_vshamt_out_scala = (matmul_5_control_param_index == 0)? 32'h0 : 
                                            (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_vshamt_out_num = (matmul_5_control_param_index == 0)? 32'h0 : 
                                          (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_cshamt_mul_value = (matmul_5_control_param_index == 0)? 32'h0 : 
                                            (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_cshamt_sum_value = (matmul_5_control_param_index == 0)? 32'h0 : 
                                            (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_cshamt_out_value = (matmul_5_control_param_index == 0)? 32'h11 : 
                                            (matmul_5_control_param_index == 1)? 32'h11 : 32'h11;
  assign cparam_matmul_5_act_func_index = (matmul_5_control_param_index == 0)? 32'h0 : 
                                          (matmul_5_control_param_index == 1)? 32'h0 : 32'h1;
  assign cparam_matmul_5_out_num_col = (matmul_5_control_param_index == 0)? 32'h1 : 
                                       (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_out_num_row = (matmul_5_control_param_index == 0)? 32'h1 : 
                                       (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_pad_col_left = (matmul_5_control_param_index == 0)? 32'h0 : 
                                        (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_pad_row_top = (matmul_5_control_param_index == 0)? 32'h0 : 
                                       (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_max_col_count = (matmul_5_control_param_index == 0)? 32'h0 : 
                                         (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_max_row_count = (matmul_5_control_param_index == 0)? 32'h0 : 
                                         (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_max_bat_count = (matmul_5_control_param_index == 0)? 32'h0 : 
                                         (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_max_och_count = (matmul_5_control_param_index == 0)? 32'h3f : 
                                         (matmul_5_control_param_index == 1)? 32'h18 : 32'h0;
  assign cparam_matmul_5_och_count_step = (matmul_5_control_param_index == 0)? 32'h1 : 
                                          (matmul_5_control_param_index == 1)? 32'h8 : 32'h10;
  assign cparam_matmul_5_dma_flag_conds_0 = (matmul_5_control_param_index == 0)? 32'h1 : 
                                            (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_act_offset_values_0 = (matmul_5_control_param_index == 0)? 32'h0 : 
                                               (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_act_row_step = (matmul_5_control_param_index == 0)? 32'h620 : 
                                        (matmul_5_control_param_index == 1)? 32'h100 : 32'h80;
  assign cparam_matmul_5_act_bat_step = (matmul_5_control_param_index == 0)? 32'h620 : 
                                        (matmul_5_control_param_index == 1)? 32'h100 : 32'h80;
  assign cparam_matmul_5_act_read_size = (matmul_5_control_param_index == 0)? 32'h188 : 
                                         (matmul_5_control_param_index == 1)? 32'h40 : 32'h20;
  assign cparam_matmul_5_act_read_block = (matmul_5_control_param_index == 0)? 32'h188 : 
                                          (matmul_5_control_param_index == 1)? 32'h40 : 32'h20;
  assign cparam_matmul_5_act_read_step = (matmul_5_control_param_index == 0)? 32'h188 : 
                                         (matmul_5_control_param_index == 1)? 32'h40 : 32'h20;
  assign cparam_matmul_5_filter_base_step = (matmul_5_control_param_index == 0)? 32'hc40 : 
                                            (matmul_5_control_param_index == 1)? 32'h1000 : 32'h500;
  assign cparam_matmul_5_filter_read_size = (matmul_5_control_param_index == 0)? 32'h310 : 
                                            (matmul_5_control_param_index == 1)? 32'h400 : 32'h140;
  assign cparam_matmul_5_filter_read_block = (matmul_5_control_param_index == 0)? 32'h188 : 
                                             (matmul_5_control_param_index == 1)? 32'h40 : 32'h20;
  assign cparam_matmul_5_filter_read_step = (matmul_5_control_param_index == 0)? 32'h188 : 
                                            (matmul_5_control_param_index == 1)? 32'h200 : 32'ha0;
  assign cparam_matmul_5_out_offset_values_0 = (matmul_5_control_param_index == 0)? 32'h0 : 
                                               (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_out_col_step = (matmul_5_control_param_index == 0)? 32'h100 : 
                                        (matmul_5_control_param_index == 1)? 32'h80 : 32'h14;
  assign cparam_matmul_5_out_row_step = (matmul_5_control_param_index == 0)? 32'h100 : 
                                        (matmul_5_control_param_index == 1)? 32'h80 : 32'h14;
  assign cparam_matmul_5_out_bat_step = (matmul_5_control_param_index == 0)? 32'h100 : 
                                        (matmul_5_control_param_index == 1)? 32'h80 : 32'h14;
  assign cparam_matmul_5_out_och_step = (matmul_5_control_param_index == 0)? 32'h4 : 
                                        (matmul_5_control_param_index == 1)? 32'h20 : 32'h14;
  assign cparam_matmul_5_out_write_size = (matmul_5_control_param_index == 0)? 32'h1 : 
                                          (matmul_5_control_param_index == 1)? 32'h8 : 32'h5;
  assign cparam_matmul_5_out_write_size_res = (matmul_5_control_param_index == 0)? 32'h1 : 
                                              (matmul_5_control_param_index == 1)? 32'h8 : 32'h5;
  assign cparam_matmul_5_out_write_block = (matmul_5_control_param_index == 0)? 32'h0 : 
                                           (matmul_5_control_param_index == 1)? 32'h0 : 32'h5;
  assign cparam_matmul_5_keep_filter = (matmul_5_control_param_index == 0)? 32'h0 : 
                                       (matmul_5_control_param_index == 1)? 32'h0 : 32'h1;
  assign cparam_matmul_5_keep_input = (matmul_5_control_param_index == 0)? 32'h1 : 
                                      (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_data_stationary = (matmul_5_control_param_index == 0)? 32'h0 : 
                                           (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_stream_num_ops = (matmul_5_control_param_index == 0)? 32'h1 : 
                                          (matmul_5_control_param_index == 1)? 32'h8 : 32'h5;
  assign cparam_matmul_5_stream_num_ops_res = (matmul_5_control_param_index == 0)? 32'h1 : 
                                              (matmul_5_control_param_index == 1)? 32'h8 : 32'h5;
  assign cparam_matmul_5_stream_num_ops_par = (matmul_5_control_param_index == 0)? 32'h1 : 
                                              (matmul_5_control_param_index == 1)? 32'h8 : 32'h5;
  assign cparam_matmul_5_stream_num_ops_res_par = (matmul_5_control_param_index == 0)? 32'h1 : 
                                                  (matmul_5_control_param_index == 1)? 32'h8 : 32'h5;
  assign cparam_matmul_5_stream_reduce_size = (matmul_5_control_param_index == 0)? 32'h188 : 
                                              (matmul_5_control_param_index == 1)? 32'h40 : 32'h20;
  assign cparam_matmul_5_stream_aligned_reduce_size = (matmul_5_control_param_index == 0)? 32'h188 : 
                                                      (matmul_5_control_param_index == 1)? 32'h40 : 32'h20;
  assign cparam_matmul_5_stream_omit_mask = (matmul_5_control_param_index == 0)? 32'h0 : 
                                            (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_col_select_initval = (matmul_5_control_param_index == 0)? 32'h0 : 
                                              (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_stride_col_par_col = (matmul_5_control_param_index == 0)? 32'h1 : 
                                              (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_stride_row_par_row = (matmul_5_control_param_index == 0)? 32'h1 : 
                                              (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_stride_col_mod_filter_num = (matmul_5_control_param_index == 0)? 32'h0 : 
                                                     (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_filter_num_col_minus_stride_col_mod = (matmul_5_control_param_index == 0)? 32'h1 : 
                                                               (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_inc_act_laddr_conds_0 = (matmul_5_control_param_index == 0)? 32'h0 : 
                                                 (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_inc_act_laddr_small = (matmul_5_control_param_index == 0)? 32'h188 : 
                                               (matmul_5_control_param_index == 1)? 32'h40 : 32'h20;
  assign cparam_matmul_5_inc_act_laddr_large = (matmul_5_control_param_index == 0)? 32'h188 : 
                                               (matmul_5_control_param_index == 1)? 32'h40 : 32'h20;
  assign cparam_matmul_5_inc_out_laddr_col = (matmul_5_control_param_index == 0)? 32'h40 : 
                                             (matmul_5_control_param_index == 1)? 32'h20 : 32'h5;
  assign cparam_matmul_5_stream_act_local_small_offset = (matmul_5_control_param_index == 0)? 32'h0 : 
                                                         (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_stream_act_local_large_offset = (matmul_5_control_param_index == 0)? 32'h0 : 
                                                         (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_stream_act_local_small_flags_0 = (matmul_5_control_param_index == 0)? 32'h0 : 
                                                          (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_stream_act_local_large_flags_0 = (matmul_5_control_param_index == 0)? 32'h0 : 
                                                          (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  assign cparam_matmul_5_inc_sync_out = (matmul_5_control_param_index == 0)? 32'h1 : 
                                        (matmul_5_control_param_index == 1)? 32'h1 : 32'h1;
  assign cparam_matmul_5_inc_sync_out_res = (matmul_5_control_param_index == 0)? 32'h0 : 
                                            (matmul_5_control_param_index == 1)? 32'h0 : 32'h0;
  reg _acc_0_stream_ivalid;
  wire _acc_0_stream_oready;
  wire _acc_0_stream_internal_oready;
  assign _acc_0_stream_internal_oready = 1;
  reg [32-1:0] _acc_0_fsm;
  localparam _acc_0_fsm_init = 0;
  wire _acc_0_run_flag;
  assign _acc_0_run_flag = 0;
  reg _acc_0_source_start;
  wire _acc_0_source_stop;
  reg _acc_0_source_busy;
  wire _acc_0_sink_start;
  wire _acc_0_sink_stop;
  wire _acc_0_sink_busy;
  wire _acc_0_busy;
  reg _acc_0_busy_reg;
  wire _acc_0_is_root;
  reg _acc_0_x_idle;
  reg [33-1:0] _acc_0_x_source_count;
  reg [5-1:0] _acc_0_x_source_mode;
  reg [16-1:0] _acc_0_x_source_generator_id;
  reg [32-1:0] _acc_0_x_source_offset;
  reg [33-1:0] _acc_0_x_source_size;
  reg [32-1:0] _acc_0_x_source_stride;
  reg [32-1:0] _acc_0_x_source_offset_buf;
  reg [33-1:0] _acc_0_x_source_size_buf;
  reg [32-1:0] _acc_0_x_source_stride_buf;
  reg [8-1:0] _acc_0_x_source_sel;
  reg [32-1:0] _acc_0_x_source_ram_raddr;
  reg _acc_0_x_source_ram_renable;
  wire [32-1:0] _acc_0_x_source_ram_rdata;
  reg _acc_0_x_source_fifo_deq;
  wire [32-1:0] _acc_0_x_source_fifo_rdata;
  reg [32-1:0] _acc_0_x_source_empty_data;
  reg _acc_0_rshift_idle;
  reg [33-1:0] _acc_0_rshift_source_count;
  reg [5-1:0] _acc_0_rshift_source_mode;
  reg [16-1:0] _acc_0_rshift_source_generator_id;
  reg [32-1:0] _acc_0_rshift_source_offset;
  reg [33-1:0] _acc_0_rshift_source_size;
  reg [32-1:0] _acc_0_rshift_source_stride;
  reg [32-1:0] _acc_0_rshift_source_offset_buf;
  reg [33-1:0] _acc_0_rshift_source_size_buf;
  reg [32-1:0] _acc_0_rshift_source_stride_buf;
  reg [8-1:0] _acc_0_rshift_source_sel;
  reg [32-1:0] _acc_0_rshift_source_ram_raddr;
  reg _acc_0_rshift_source_ram_renable;
  wire [32-1:0] _acc_0_rshift_source_ram_rdata;
  reg _acc_0_rshift_source_fifo_deq;
  wire [32-1:0] _acc_0_rshift_source_fifo_rdata;
  reg [32-1:0] _acc_0_rshift_source_empty_data;
  reg [32-1:0] _acc_0_size_next_parameter_data;
  reg [33-1:0] _acc_0_sum_sink_count;
  reg [5-1:0] _acc_0_sum_sink_mode;
  reg [16-1:0] _acc_0_sum_sink_generator_id;
  reg [32-1:0] _acc_0_sum_sink_offset;
  reg [33-1:0] _acc_0_sum_sink_size;
  reg [32-1:0] _acc_0_sum_sink_stride;
  reg [32-1:0] _acc_0_sum_sink_offset_buf;
  reg [33-1:0] _acc_0_sum_sink_size_buf;
  reg [32-1:0] _acc_0_sum_sink_stride_buf;
  reg [8-1:0] _acc_0_sum_sink_sel;
  reg [32-1:0] _acc_0_sum_sink_waddr;
  reg _acc_0_sum_sink_wenable;
  reg [32-1:0] _acc_0_sum_sink_wdata;
  reg _acc_0_sum_sink_fifo_enq;
  reg [32-1:0] _acc_0_sum_sink_fifo_wdata;
  reg [32-1:0] _acc_0_sum_sink_immediate;
  reg [33-1:0] _acc_0_valid_sink_count;
  reg [5-1:0] _acc_0_valid_sink_mode;
  reg [16-1:0] _acc_0_valid_sink_generator_id;
  reg [32-1:0] _acc_0_valid_sink_offset;
  reg [33-1:0] _acc_0_valid_sink_size;
  reg [32-1:0] _acc_0_valid_sink_stride;
  reg [32-1:0] _acc_0_valid_sink_offset_buf;
  reg [33-1:0] _acc_0_valid_sink_size_buf;
  reg [32-1:0] _acc_0_valid_sink_stride_buf;
  reg [8-1:0] _acc_0_valid_sink_sel;
  reg [32-1:0] _acc_0_valid_sink_waddr;
  reg _acc_0_valid_sink_wenable;
  reg [1-1:0] _acc_0_valid_sink_wdata;
  reg _acc_0_valid_sink_fifo_enq;
  reg [1-1:0] _acc_0_valid_sink_fifo_wdata;
  reg [1-1:0] _acc_0_valid_sink_immediate;
  reg _acc_1_stream_ivalid;
  wire _acc_1_stream_oready;
  wire _acc_1_stream_internal_oready;
  assign _acc_1_stream_internal_oready = 1;
  reg [32-1:0] _acc_1_fsm;
  localparam _acc_1_fsm_init = 0;
  wire _acc_1_run_flag;
  assign _acc_1_run_flag = 0;
  reg _acc_1_source_start;
  wire _acc_1_source_stop;
  reg _acc_1_source_busy;
  wire _acc_1_sink_start;
  wire _acc_1_sink_stop;
  wire _acc_1_sink_busy;
  wire _acc_1_busy;
  reg _acc_1_busy_reg;
  wire _acc_1_is_root;
  reg _acc_1_x_idle;
  reg [33-1:0] _acc_1_x_source_count;
  reg [5-1:0] _acc_1_x_source_mode;
  reg [16-1:0] _acc_1_x_source_generator_id;
  reg [32-1:0] _acc_1_x_source_offset;
  reg [33-1:0] _acc_1_x_source_size;
  reg [32-1:0] _acc_1_x_source_stride;
  reg [32-1:0] _acc_1_x_source_offset_buf;
  reg [33-1:0] _acc_1_x_source_size_buf;
  reg [32-1:0] _acc_1_x_source_stride_buf;
  reg [8-1:0] _acc_1_x_source_sel;
  reg [32-1:0] _acc_1_x_source_ram_raddr;
  reg _acc_1_x_source_ram_renable;
  wire [32-1:0] _acc_1_x_source_ram_rdata;
  reg _acc_1_x_source_fifo_deq;
  wire [32-1:0] _acc_1_x_source_fifo_rdata;
  reg [32-1:0] _acc_1_x_source_empty_data;
  reg _acc_1_rshift_idle;
  reg [33-1:0] _acc_1_rshift_source_count;
  reg [5-1:0] _acc_1_rshift_source_mode;
  reg [16-1:0] _acc_1_rshift_source_generator_id;
  reg [32-1:0] _acc_1_rshift_source_offset;
  reg [33-1:0] _acc_1_rshift_source_size;
  reg [32-1:0] _acc_1_rshift_source_stride;
  reg [32-1:0] _acc_1_rshift_source_offset_buf;
  reg [33-1:0] _acc_1_rshift_source_size_buf;
  reg [32-1:0] _acc_1_rshift_source_stride_buf;
  reg [8-1:0] _acc_1_rshift_source_sel;
  reg [32-1:0] _acc_1_rshift_source_ram_raddr;
  reg _acc_1_rshift_source_ram_renable;
  wire [32-1:0] _acc_1_rshift_source_ram_rdata;
  reg _acc_1_rshift_source_fifo_deq;
  wire [32-1:0] _acc_1_rshift_source_fifo_rdata;
  reg [32-1:0] _acc_1_rshift_source_empty_data;
  reg [32-1:0] _acc_1_size_next_parameter_data;
  reg [33-1:0] _acc_1_sum_sink_count;
  reg [5-1:0] _acc_1_sum_sink_mode;
  reg [16-1:0] _acc_1_sum_sink_generator_id;
  reg [32-1:0] _acc_1_sum_sink_offset;
  reg [33-1:0] _acc_1_sum_sink_size;
  reg [32-1:0] _acc_1_sum_sink_stride;
  reg [32-1:0] _acc_1_sum_sink_offset_buf;
  reg [33-1:0] _acc_1_sum_sink_size_buf;
  reg [32-1:0] _acc_1_sum_sink_stride_buf;
  reg [8-1:0] _acc_1_sum_sink_sel;
  reg [32-1:0] _acc_1_sum_sink_waddr;
  reg _acc_1_sum_sink_wenable;
  reg [32-1:0] _acc_1_sum_sink_wdata;
  reg _acc_1_sum_sink_fifo_enq;
  reg [32-1:0] _acc_1_sum_sink_fifo_wdata;
  reg [32-1:0] _acc_1_sum_sink_immediate;
  reg [33-1:0] _acc_1_valid_sink_count;
  reg [5-1:0] _acc_1_valid_sink_mode;
  reg [16-1:0] _acc_1_valid_sink_generator_id;
  reg [32-1:0] _acc_1_valid_sink_offset;
  reg [33-1:0] _acc_1_valid_sink_size;
  reg [32-1:0] _acc_1_valid_sink_stride;
  reg [32-1:0] _acc_1_valid_sink_offset_buf;
  reg [33-1:0] _acc_1_valid_sink_size_buf;
  reg [32-1:0] _acc_1_valid_sink_stride_buf;
  reg [8-1:0] _acc_1_valid_sink_sel;
  reg [32-1:0] _acc_1_valid_sink_waddr;
  reg _acc_1_valid_sink_wenable;
  reg [1-1:0] _acc_1_valid_sink_wdata;
  reg _acc_1_valid_sink_fifo_enq;
  reg [1-1:0] _acc_1_valid_sink_fifo_wdata;
  reg [1-1:0] _acc_1_valid_sink_immediate;
  reg _add_tree_2_stream_ivalid;
  wire _add_tree_2_stream_oready;
  wire _add_tree_2_stream_internal_oready;
  assign _add_tree_2_stream_internal_oready = 1;
  reg [32-1:0] _add_tree_2_fsm;
  localparam _add_tree_2_fsm_init = 0;
  wire _add_tree_2_run_flag;
  assign _add_tree_2_run_flag = 0;
  reg _add_tree_2_source_start;
  wire _add_tree_2_source_stop;
  reg _add_tree_2_source_busy;
  wire _add_tree_2_sink_start;
  wire _add_tree_2_sink_stop;
  wire _add_tree_2_sink_busy;
  wire _add_tree_2_busy;
  reg _add_tree_2_busy_reg;
  wire _add_tree_2_is_root;
  reg _add_tree_2_var0_idle;
  reg [33-1:0] _add_tree_2_var0_source_count;
  reg [5-1:0] _add_tree_2_var0_source_mode;
  reg [16-1:0] _add_tree_2_var0_source_generator_id;
  reg [32-1:0] _add_tree_2_var0_source_offset;
  reg [33-1:0] _add_tree_2_var0_source_size;
  reg [32-1:0] _add_tree_2_var0_source_stride;
  reg [32-1:0] _add_tree_2_var0_source_offset_buf;
  reg [33-1:0] _add_tree_2_var0_source_size_buf;
  reg [32-1:0] _add_tree_2_var0_source_stride_buf;
  reg [8-1:0] _add_tree_2_var0_source_sel;
  reg [32-1:0] _add_tree_2_var0_source_ram_raddr;
  reg _add_tree_2_var0_source_ram_renable;
  wire [32-1:0] _add_tree_2_var0_source_ram_rdata;
  reg _add_tree_2_var0_source_fifo_deq;
  wire [32-1:0] _add_tree_2_var0_source_fifo_rdata;
  reg [32-1:0] _add_tree_2_var0_source_empty_data;
  reg _add_tree_2_var1_idle;
  reg [33-1:0] _add_tree_2_var1_source_count;
  reg [5-1:0] _add_tree_2_var1_source_mode;
  reg [16-1:0] _add_tree_2_var1_source_generator_id;
  reg [32-1:0] _add_tree_2_var1_source_offset;
  reg [33-1:0] _add_tree_2_var1_source_size;
  reg [32-1:0] _add_tree_2_var1_source_stride;
  reg [32-1:0] _add_tree_2_var1_source_offset_buf;
  reg [33-1:0] _add_tree_2_var1_source_size_buf;
  reg [32-1:0] _add_tree_2_var1_source_stride_buf;
  reg [8-1:0] _add_tree_2_var1_source_sel;
  reg [32-1:0] _add_tree_2_var1_source_ram_raddr;
  reg _add_tree_2_var1_source_ram_renable;
  wire [32-1:0] _add_tree_2_var1_source_ram_rdata;
  reg _add_tree_2_var1_source_fifo_deq;
  wire [32-1:0] _add_tree_2_var1_source_fifo_rdata;
  reg [32-1:0] _add_tree_2_var1_source_empty_data;
  reg [33-1:0] _add_tree_2_sum_sink_count;
  reg [5-1:0] _add_tree_2_sum_sink_mode;
  reg [16-1:0] _add_tree_2_sum_sink_generator_id;
  reg [32-1:0] _add_tree_2_sum_sink_offset;
  reg [33-1:0] _add_tree_2_sum_sink_size;
  reg [32-1:0] _add_tree_2_sum_sink_stride;
  reg [32-1:0] _add_tree_2_sum_sink_offset_buf;
  reg [33-1:0] _add_tree_2_sum_sink_size_buf;
  reg [32-1:0] _add_tree_2_sum_sink_stride_buf;
  reg [8-1:0] _add_tree_2_sum_sink_sel;
  reg [32-1:0] _add_tree_2_sum_sink_waddr;
  reg _add_tree_2_sum_sink_wenable;
  reg [32-1:0] _add_tree_2_sum_sink_wdata;
  reg _add_tree_2_sum_sink_fifo_enq;
  reg [32-1:0] _add_tree_2_sum_sink_fifo_wdata;
  reg [32-1:0] _add_tree_2_sum_sink_immediate;
  reg _add_tree_3_stream_ivalid;
  wire _add_tree_3_stream_oready;
  wire _add_tree_3_stream_internal_oready;
  assign _add_tree_3_stream_internal_oready = 1;
  reg [32-1:0] _add_tree_3_fsm;
  localparam _add_tree_3_fsm_init = 0;
  wire _add_tree_3_run_flag;
  assign _add_tree_3_run_flag = 0;
  reg _add_tree_3_source_start;
  wire _add_tree_3_source_stop;
  reg _add_tree_3_source_busy;
  wire _add_tree_3_sink_start;
  wire _add_tree_3_sink_stop;
  wire _add_tree_3_sink_busy;
  wire _add_tree_3_busy;
  reg _add_tree_3_busy_reg;
  wire _add_tree_3_is_root;
  reg _add_tree_3_var0_idle;
  reg [33-1:0] _add_tree_3_var0_source_count;
  reg [5-1:0] _add_tree_3_var0_source_mode;
  reg [16-1:0] _add_tree_3_var0_source_generator_id;
  reg [32-1:0] _add_tree_3_var0_source_offset;
  reg [33-1:0] _add_tree_3_var0_source_size;
  reg [32-1:0] _add_tree_3_var0_source_stride;
  reg [32-1:0] _add_tree_3_var0_source_offset_buf;
  reg [33-1:0] _add_tree_3_var0_source_size_buf;
  reg [32-1:0] _add_tree_3_var0_source_stride_buf;
  reg [8-1:0] _add_tree_3_var0_source_sel;
  reg [32-1:0] _add_tree_3_var0_source_ram_raddr;
  reg _add_tree_3_var0_source_ram_renable;
  wire [32-1:0] _add_tree_3_var0_source_ram_rdata;
  reg _add_tree_3_var0_source_fifo_deq;
  wire [32-1:0] _add_tree_3_var0_source_fifo_rdata;
  reg [32-1:0] _add_tree_3_var0_source_empty_data;
  reg _add_tree_3_var1_idle;
  reg [33-1:0] _add_tree_3_var1_source_count;
  reg [5-1:0] _add_tree_3_var1_source_mode;
  reg [16-1:0] _add_tree_3_var1_source_generator_id;
  reg [32-1:0] _add_tree_3_var1_source_offset;
  reg [33-1:0] _add_tree_3_var1_source_size;
  reg [32-1:0] _add_tree_3_var1_source_stride;
  reg [32-1:0] _add_tree_3_var1_source_offset_buf;
  reg [33-1:0] _add_tree_3_var1_source_size_buf;
  reg [32-1:0] _add_tree_3_var1_source_stride_buf;
  reg [8-1:0] _add_tree_3_var1_source_sel;
  reg [32-1:0] _add_tree_3_var1_source_ram_raddr;
  reg _add_tree_3_var1_source_ram_renable;
  wire [32-1:0] _add_tree_3_var1_source_ram_rdata;
  reg _add_tree_3_var1_source_fifo_deq;
  wire [32-1:0] _add_tree_3_var1_source_fifo_rdata;
  reg [32-1:0] _add_tree_3_var1_source_empty_data;
  reg [33-1:0] _add_tree_3_sum_sink_count;
  reg [5-1:0] _add_tree_3_sum_sink_mode;
  reg [16-1:0] _add_tree_3_sum_sink_generator_id;
  reg [32-1:0] _add_tree_3_sum_sink_offset;
  reg [33-1:0] _add_tree_3_sum_sink_size;
  reg [32-1:0] _add_tree_3_sum_sink_stride;
  reg [32-1:0] _add_tree_3_sum_sink_offset_buf;
  reg [33-1:0] _add_tree_3_sum_sink_size_buf;
  reg [32-1:0] _add_tree_3_sum_sink_stride_buf;
  reg [8-1:0] _add_tree_3_sum_sink_sel;
  reg [32-1:0] _add_tree_3_sum_sink_waddr;
  reg _add_tree_3_sum_sink_wenable;
  reg [32-1:0] _add_tree_3_sum_sink_wdata;
  reg _add_tree_3_sum_sink_fifo_enq;
  reg [32-1:0] _add_tree_3_sum_sink_fifo_wdata;
  reg [32-1:0] _add_tree_3_sum_sink_immediate;
  reg _mul_rshift_round_clip_4_stream_ivalid;
  wire _mul_rshift_round_clip_4_stream_oready;
  wire _mul_rshift_round_clip_4_stream_internal_oready;
  assign _mul_rshift_round_clip_4_stream_internal_oready = 1;
  reg [32-1:0] _mul_rshift_round_clip_4_fsm;
  localparam _mul_rshift_round_clip_4_fsm_init = 0;
  wire _mul_rshift_round_clip_4_run_flag;
  assign _mul_rshift_round_clip_4_run_flag = 0;
  reg _mul_rshift_round_clip_4_source_start;
  wire _mul_rshift_round_clip_4_source_stop;
  reg _mul_rshift_round_clip_4_source_busy;
  wire _mul_rshift_round_clip_4_sink_start;
  wire _mul_rshift_round_clip_4_sink_stop;
  wire _mul_rshift_round_clip_4_sink_busy;
  wire _mul_rshift_round_clip_4_busy;
  reg _mul_rshift_round_clip_4_busy_reg;
  wire _mul_rshift_round_clip_4_is_root;
  reg _mul_rshift_round_clip_4_x_idle;
  reg [33-1:0] _mul_rshift_round_clip_4_x_source_count;
  reg [5-1:0] _mul_rshift_round_clip_4_x_source_mode;
  reg [16-1:0] _mul_rshift_round_clip_4_x_source_generator_id;
  reg [32-1:0] _mul_rshift_round_clip_4_x_source_offset;
  reg [33-1:0] _mul_rshift_round_clip_4_x_source_size;
  reg [32-1:0] _mul_rshift_round_clip_4_x_source_stride;
  reg [32-1:0] _mul_rshift_round_clip_4_x_source_offset_buf;
  reg [33-1:0] _mul_rshift_round_clip_4_x_source_size_buf;
  reg [32-1:0] _mul_rshift_round_clip_4_x_source_stride_buf;
  reg [8-1:0] _mul_rshift_round_clip_4_x_source_sel;
  reg [32-1:0] _mul_rshift_round_clip_4_x_source_ram_raddr;
  reg _mul_rshift_round_clip_4_x_source_ram_renable;
  wire [32-1:0] _mul_rshift_round_clip_4_x_source_ram_rdata;
  reg _mul_rshift_round_clip_4_x_source_fifo_deq;
  wire [32-1:0] _mul_rshift_round_clip_4_x_source_fifo_rdata;
  reg [32-1:0] _mul_rshift_round_clip_4_x_source_empty_data;
  reg _mul_rshift_round_clip_4_y_idle;
  reg [33-1:0] _mul_rshift_round_clip_4_y_source_count;
  reg [5-1:0] _mul_rshift_round_clip_4_y_source_mode;
  reg [16-1:0] _mul_rshift_round_clip_4_y_source_generator_id;
  reg [32-1:0] _mul_rshift_round_clip_4_y_source_offset;
  reg [33-1:0] _mul_rshift_round_clip_4_y_source_size;
  reg [32-1:0] _mul_rshift_round_clip_4_y_source_stride;
  reg [32-1:0] _mul_rshift_round_clip_4_y_source_offset_buf;
  reg [33-1:0] _mul_rshift_round_clip_4_y_source_size_buf;
  reg [32-1:0] _mul_rshift_round_clip_4_y_source_stride_buf;
  reg [8-1:0] _mul_rshift_round_clip_4_y_source_sel;
  reg [32-1:0] _mul_rshift_round_clip_4_y_source_ram_raddr;
  reg _mul_rshift_round_clip_4_y_source_ram_renable;
  wire [16-1:0] _mul_rshift_round_clip_4_y_source_ram_rdata;
  reg _mul_rshift_round_clip_4_y_source_fifo_deq;
  wire [16-1:0] _mul_rshift_round_clip_4_y_source_fifo_rdata;
  reg [16-1:0] _mul_rshift_round_clip_4_y_source_empty_data;
  reg _mul_rshift_round_clip_4_rshift_idle;
  reg [33-1:0] _mul_rshift_round_clip_4_rshift_source_count;
  reg [5-1:0] _mul_rshift_round_clip_4_rshift_source_mode;
  reg [16-1:0] _mul_rshift_round_clip_4_rshift_source_generator_id;
  reg [32-1:0] _mul_rshift_round_clip_4_rshift_source_offset;
  reg [33-1:0] _mul_rshift_round_clip_4_rshift_source_size;
  reg [32-1:0] _mul_rshift_round_clip_4_rshift_source_stride;
  reg [32-1:0] _mul_rshift_round_clip_4_rshift_source_offset_buf;
  reg [33-1:0] _mul_rshift_round_clip_4_rshift_source_size_buf;
  reg [32-1:0] _mul_rshift_round_clip_4_rshift_source_stride_buf;
  reg [8-1:0] _mul_rshift_round_clip_4_rshift_source_sel;
  reg [32-1:0] _mul_rshift_round_clip_4_rshift_source_ram_raddr;
  reg _mul_rshift_round_clip_4_rshift_source_ram_renable;
  wire [32-1:0] _mul_rshift_round_clip_4_rshift_source_ram_rdata;
  reg _mul_rshift_round_clip_4_rshift_source_fifo_deq;
  wire [32-1:0] _mul_rshift_round_clip_4_rshift_source_fifo_rdata;
  reg [32-1:0] _mul_rshift_round_clip_4_rshift_source_empty_data;
  reg [33-1:0] _mul_rshift_round_clip_4_z_sink_count;
  reg [5-1:0] _mul_rshift_round_clip_4_z_sink_mode;
  reg [16-1:0] _mul_rshift_round_clip_4_z_sink_generator_id;
  reg [32-1:0] _mul_rshift_round_clip_4_z_sink_offset;
  reg [33-1:0] _mul_rshift_round_clip_4_z_sink_size;
  reg [32-1:0] _mul_rshift_round_clip_4_z_sink_stride;
  reg [32-1:0] _mul_rshift_round_clip_4_z_sink_offset_buf;
  reg [33-1:0] _mul_rshift_round_clip_4_z_sink_size_buf;
  reg [32-1:0] _mul_rshift_round_clip_4_z_sink_stride_buf;
  reg [8-1:0] _mul_rshift_round_clip_4_z_sink_sel;
  reg [32-1:0] _mul_rshift_round_clip_4_z_sink_waddr;
  reg _mul_rshift_round_clip_4_z_sink_wenable;
  reg [16-1:0] _mul_rshift_round_clip_4_z_sink_wdata;
  reg _mul_rshift_round_clip_4_z_sink_fifo_enq;
  reg [16-1:0] _mul_rshift_round_clip_4_z_sink_fifo_wdata;
  reg [16-1:0] _mul_rshift_round_clip_4_z_sink_immediate;
  reg _mul_rshift_round_clip_5_stream_ivalid;
  wire _mul_rshift_round_clip_5_stream_oready;
  wire _mul_rshift_round_clip_5_stream_internal_oready;
  assign _mul_rshift_round_clip_5_stream_internal_oready = 1;
  reg [32-1:0] _mul_rshift_round_clip_5_fsm;
  localparam _mul_rshift_round_clip_5_fsm_init = 0;
  wire _mul_rshift_round_clip_5_run_flag;
  assign _mul_rshift_round_clip_5_run_flag = 0;
  reg _mul_rshift_round_clip_5_source_start;
  wire _mul_rshift_round_clip_5_source_stop;
  reg _mul_rshift_round_clip_5_source_busy;
  wire _mul_rshift_round_clip_5_sink_start;
  wire _mul_rshift_round_clip_5_sink_stop;
  wire _mul_rshift_round_clip_5_sink_busy;
  wire _mul_rshift_round_clip_5_busy;
  reg _mul_rshift_round_clip_5_busy_reg;
  wire _mul_rshift_round_clip_5_is_root;
  reg _mul_rshift_round_clip_5_x_idle;
  reg [33-1:0] _mul_rshift_round_clip_5_x_source_count;
  reg [5-1:0] _mul_rshift_round_clip_5_x_source_mode;
  reg [16-1:0] _mul_rshift_round_clip_5_x_source_generator_id;
  reg [32-1:0] _mul_rshift_round_clip_5_x_source_offset;
  reg [33-1:0] _mul_rshift_round_clip_5_x_source_size;
  reg [32-1:0] _mul_rshift_round_clip_5_x_source_stride;
  reg [32-1:0] _mul_rshift_round_clip_5_x_source_offset_buf;
  reg [33-1:0] _mul_rshift_round_clip_5_x_source_size_buf;
  reg [32-1:0] _mul_rshift_round_clip_5_x_source_stride_buf;
  reg [8-1:0] _mul_rshift_round_clip_5_x_source_sel;
  reg [32-1:0] _mul_rshift_round_clip_5_x_source_ram_raddr;
  reg _mul_rshift_round_clip_5_x_source_ram_renable;
  wire [32-1:0] _mul_rshift_round_clip_5_x_source_ram_rdata;
  reg _mul_rshift_round_clip_5_x_source_fifo_deq;
  wire [32-1:0] _mul_rshift_round_clip_5_x_source_fifo_rdata;
  reg [32-1:0] _mul_rshift_round_clip_5_x_source_empty_data;
  reg _mul_rshift_round_clip_5_y_idle;
  reg [33-1:0] _mul_rshift_round_clip_5_y_source_count;
  reg [5-1:0] _mul_rshift_round_clip_5_y_source_mode;
  reg [16-1:0] _mul_rshift_round_clip_5_y_source_generator_id;
  reg [32-1:0] _mul_rshift_round_clip_5_y_source_offset;
  reg [33-1:0] _mul_rshift_round_clip_5_y_source_size;
  reg [32-1:0] _mul_rshift_round_clip_5_y_source_stride;
  reg [32-1:0] _mul_rshift_round_clip_5_y_source_offset_buf;
  reg [33-1:0] _mul_rshift_round_clip_5_y_source_size_buf;
  reg [32-1:0] _mul_rshift_round_clip_5_y_source_stride_buf;
  reg [8-1:0] _mul_rshift_round_clip_5_y_source_sel;
  reg [32-1:0] _mul_rshift_round_clip_5_y_source_ram_raddr;
  reg _mul_rshift_round_clip_5_y_source_ram_renable;
  wire [16-1:0] _mul_rshift_round_clip_5_y_source_ram_rdata;
  reg _mul_rshift_round_clip_5_y_source_fifo_deq;
  wire [16-1:0] _mul_rshift_round_clip_5_y_source_fifo_rdata;
  reg [16-1:0] _mul_rshift_round_clip_5_y_source_empty_data;
  reg _mul_rshift_round_clip_5_rshift_idle;
  reg [33-1:0] _mul_rshift_round_clip_5_rshift_source_count;
  reg [5-1:0] _mul_rshift_round_clip_5_rshift_source_mode;
  reg [16-1:0] _mul_rshift_round_clip_5_rshift_source_generator_id;
  reg [32-1:0] _mul_rshift_round_clip_5_rshift_source_offset;
  reg [33-1:0] _mul_rshift_round_clip_5_rshift_source_size;
  reg [32-1:0] _mul_rshift_round_clip_5_rshift_source_stride;
  reg [32-1:0] _mul_rshift_round_clip_5_rshift_source_offset_buf;
  reg [33-1:0] _mul_rshift_round_clip_5_rshift_source_size_buf;
  reg [32-1:0] _mul_rshift_round_clip_5_rshift_source_stride_buf;
  reg [8-1:0] _mul_rshift_round_clip_5_rshift_source_sel;
  reg [32-1:0] _mul_rshift_round_clip_5_rshift_source_ram_raddr;
  reg _mul_rshift_round_clip_5_rshift_source_ram_renable;
  wire [32-1:0] _mul_rshift_round_clip_5_rshift_source_ram_rdata;
  reg _mul_rshift_round_clip_5_rshift_source_fifo_deq;
  wire [32-1:0] _mul_rshift_round_clip_5_rshift_source_fifo_rdata;
  reg [32-1:0] _mul_rshift_round_clip_5_rshift_source_empty_data;
  reg [33-1:0] _mul_rshift_round_clip_5_z_sink_count;
  reg [5-1:0] _mul_rshift_round_clip_5_z_sink_mode;
  reg [16-1:0] _mul_rshift_round_clip_5_z_sink_generator_id;
  reg [32-1:0] _mul_rshift_round_clip_5_z_sink_offset;
  reg [33-1:0] _mul_rshift_round_clip_5_z_sink_size;
  reg [32-1:0] _mul_rshift_round_clip_5_z_sink_stride;
  reg [32-1:0] _mul_rshift_round_clip_5_z_sink_offset_buf;
  reg [33-1:0] _mul_rshift_round_clip_5_z_sink_size_buf;
  reg [32-1:0] _mul_rshift_round_clip_5_z_sink_stride_buf;
  reg [8-1:0] _mul_rshift_round_clip_5_z_sink_sel;
  reg [32-1:0] _mul_rshift_round_clip_5_z_sink_waddr;
  reg _mul_rshift_round_clip_5_z_sink_wenable;
  reg [16-1:0] _mul_rshift_round_clip_5_z_sink_wdata;
  reg _mul_rshift_round_clip_5_z_sink_fifo_enq;
  reg [16-1:0] _mul_rshift_round_clip_5_z_sink_fifo_wdata;
  reg [16-1:0] _mul_rshift_round_clip_5_z_sink_immediate;
  reg _mul_6_stream_ivalid;
  wire _mul_6_stream_oready;
  wire _mul_6_stream_internal_oready;
  assign _mul_6_stream_internal_oready = 1;
  reg [32-1:0] _mul_6_fsm;
  localparam _mul_6_fsm_init = 0;
  wire _mul_6_run_flag;
  assign _mul_6_run_flag = 0;
  reg _mul_6_source_start;
  wire _mul_6_source_stop;
  reg _mul_6_source_busy;
  wire _mul_6_sink_start;
  wire _mul_6_sink_stop;
  wire _mul_6_sink_busy;
  wire _mul_6_busy;
  reg _mul_6_busy_reg;
  wire _mul_6_is_root;
  reg _mul_6_x_idle;
  reg [33-1:0] _mul_6_x_source_count;
  reg [5-1:0] _mul_6_x_source_mode;
  reg [16-1:0] _mul_6_x_source_generator_id;
  reg [32-1:0] _mul_6_x_source_offset;
  reg [33-1:0] _mul_6_x_source_size;
  reg [32-1:0] _mul_6_x_source_stride;
  reg [32-1:0] _mul_6_x_source_offset_buf;
  reg [33-1:0] _mul_6_x_source_size_buf;
  reg [32-1:0] _mul_6_x_source_stride_buf;
  reg [8-1:0] _mul_6_x_source_sel;
  reg [32-1:0] _mul_6_x_source_ram_raddr;
  reg _mul_6_x_source_ram_renable;
  wire [16-1:0] _mul_6_x_source_ram_rdata;
  reg _mul_6_x_source_fifo_deq;
  wire [16-1:0] _mul_6_x_source_fifo_rdata;
  reg [16-1:0] _mul_6_x_source_empty_data;
  reg _mul_6_y_idle;
  reg [33-1:0] _mul_6_y_source_count;
  reg [5-1:0] _mul_6_y_source_mode;
  reg [16-1:0] _mul_6_y_source_generator_id;
  reg [32-1:0] _mul_6_y_source_offset;
  reg [33-1:0] _mul_6_y_source_size;
  reg [32-1:0] _mul_6_y_source_stride;
  reg [32-1:0] _mul_6_y_source_offset_buf;
  reg [33-1:0] _mul_6_y_source_size_buf;
  reg [32-1:0] _mul_6_y_source_stride_buf;
  reg [8-1:0] _mul_6_y_source_sel;
  reg [32-1:0] _mul_6_y_source_ram_raddr;
  reg _mul_6_y_source_ram_renable;
  wire [16-1:0] _mul_6_y_source_ram_rdata;
  reg _mul_6_y_source_fifo_deq;
  wire [16-1:0] _mul_6_y_source_fifo_rdata;
  reg [16-1:0] _mul_6_y_source_empty_data;
  reg _mul_6_rshift_idle;
  reg [33-1:0] _mul_6_rshift_source_count;
  reg [5-1:0] _mul_6_rshift_source_mode;
  reg [16-1:0] _mul_6_rshift_source_generator_id;
  reg [32-1:0] _mul_6_rshift_source_offset;
  reg [33-1:0] _mul_6_rshift_source_size;
  reg [32-1:0] _mul_6_rshift_source_stride;
  reg [32-1:0] _mul_6_rshift_source_offset_buf;
  reg [33-1:0] _mul_6_rshift_source_size_buf;
  reg [32-1:0] _mul_6_rshift_source_stride_buf;
  reg [8-1:0] _mul_6_rshift_source_sel;
  reg [32-1:0] _mul_6_rshift_source_ram_raddr;
  reg _mul_6_rshift_source_ram_renable;
  wire [32-1:0] _mul_6_rshift_source_ram_rdata;
  reg _mul_6_rshift_source_fifo_deq;
  wire [32-1:0] _mul_6_rshift_source_fifo_rdata;
  reg [32-1:0] _mul_6_rshift_source_empty_data;
  reg [33-1:0] _mul_6_z_sink_count;
  reg [5-1:0] _mul_6_z_sink_mode;
  reg [16-1:0] _mul_6_z_sink_generator_id;
  reg [32-1:0] _mul_6_z_sink_offset;
  reg [33-1:0] _mul_6_z_sink_size;
  reg [32-1:0] _mul_6_z_sink_stride;
  reg [32-1:0] _mul_6_z_sink_offset_buf;
  reg [33-1:0] _mul_6_z_sink_size_buf;
  reg [32-1:0] _mul_6_z_sink_stride_buf;
  reg [8-1:0] _mul_6_z_sink_sel;
  reg [32-1:0] _mul_6_z_sink_waddr;
  reg _mul_6_z_sink_wenable;
  reg [32-1:0] _mul_6_z_sink_wdata;
  reg _mul_6_z_sink_fifo_enq;
  reg [32-1:0] _mul_6_z_sink_fifo_wdata;
  reg [32-1:0] _mul_6_z_sink_immediate;
  reg _mul_7_stream_ivalid;
  wire _mul_7_stream_oready;
  wire _mul_7_stream_internal_oready;
  assign _mul_7_stream_internal_oready = 1;
  reg [32-1:0] _mul_7_fsm;
  localparam _mul_7_fsm_init = 0;
  wire _mul_7_run_flag;
  assign _mul_7_run_flag = 0;
  reg _mul_7_source_start;
  wire _mul_7_source_stop;
  reg _mul_7_source_busy;
  wire _mul_7_sink_start;
  wire _mul_7_sink_stop;
  wire _mul_7_sink_busy;
  wire _mul_7_busy;
  reg _mul_7_busy_reg;
  wire _mul_7_is_root;
  reg _mul_7_x_idle;
  reg [33-1:0] _mul_7_x_source_count;
  reg [5-1:0] _mul_7_x_source_mode;
  reg [16-1:0] _mul_7_x_source_generator_id;
  reg [32-1:0] _mul_7_x_source_offset;
  reg [33-1:0] _mul_7_x_source_size;
  reg [32-1:0] _mul_7_x_source_stride;
  reg [32-1:0] _mul_7_x_source_offset_buf;
  reg [33-1:0] _mul_7_x_source_size_buf;
  reg [32-1:0] _mul_7_x_source_stride_buf;
  reg [8-1:0] _mul_7_x_source_sel;
  reg [32-1:0] _mul_7_x_source_ram_raddr;
  reg _mul_7_x_source_ram_renable;
  wire [16-1:0] _mul_7_x_source_ram_rdata;
  reg _mul_7_x_source_fifo_deq;
  wire [16-1:0] _mul_7_x_source_fifo_rdata;
  reg [16-1:0] _mul_7_x_source_empty_data;
  reg _mul_7_y_idle;
  reg [33-1:0] _mul_7_y_source_count;
  reg [5-1:0] _mul_7_y_source_mode;
  reg [16-1:0] _mul_7_y_source_generator_id;
  reg [32-1:0] _mul_7_y_source_offset;
  reg [33-1:0] _mul_7_y_source_size;
  reg [32-1:0] _mul_7_y_source_stride;
  reg [32-1:0] _mul_7_y_source_offset_buf;
  reg [33-1:0] _mul_7_y_source_size_buf;
  reg [32-1:0] _mul_7_y_source_stride_buf;
  reg [8-1:0] _mul_7_y_source_sel;
  reg [32-1:0] _mul_7_y_source_ram_raddr;
  reg _mul_7_y_source_ram_renable;
  wire [16-1:0] _mul_7_y_source_ram_rdata;
  reg _mul_7_y_source_fifo_deq;
  wire [16-1:0] _mul_7_y_source_fifo_rdata;
  reg [16-1:0] _mul_7_y_source_empty_data;
  reg _mul_7_rshift_idle;
  reg [33-1:0] _mul_7_rshift_source_count;
  reg [5-1:0] _mul_7_rshift_source_mode;
  reg [16-1:0] _mul_7_rshift_source_generator_id;
  reg [32-1:0] _mul_7_rshift_source_offset;
  reg [33-1:0] _mul_7_rshift_source_size;
  reg [32-1:0] _mul_7_rshift_source_stride;
  reg [32-1:0] _mul_7_rshift_source_offset_buf;
  reg [33-1:0] _mul_7_rshift_source_size_buf;
  reg [32-1:0] _mul_7_rshift_source_stride_buf;
  reg [8-1:0] _mul_7_rshift_source_sel;
  reg [32-1:0] _mul_7_rshift_source_ram_raddr;
  reg _mul_7_rshift_source_ram_renable;
  wire [32-1:0] _mul_7_rshift_source_ram_rdata;
  reg _mul_7_rshift_source_fifo_deq;
  wire [32-1:0] _mul_7_rshift_source_fifo_rdata;
  reg [32-1:0] _mul_7_rshift_source_empty_data;
  reg [33-1:0] _mul_7_z_sink_count;
  reg [5-1:0] _mul_7_z_sink_mode;
  reg [16-1:0] _mul_7_z_sink_generator_id;
  reg [32-1:0] _mul_7_z_sink_offset;
  reg [33-1:0] _mul_7_z_sink_size;
  reg [32-1:0] _mul_7_z_sink_stride;
  reg [32-1:0] _mul_7_z_sink_offset_buf;
  reg [33-1:0] _mul_7_z_sink_size_buf;
  reg [32-1:0] _mul_7_z_sink_stride_buf;
  reg [8-1:0] _mul_7_z_sink_sel;
  reg [32-1:0] _mul_7_z_sink_waddr;
  reg _mul_7_z_sink_wenable;
  reg [32-1:0] _mul_7_z_sink_wdata;
  reg _mul_7_z_sink_fifo_enq;
  reg [32-1:0] _mul_7_z_sink_fifo_wdata;
  reg [32-1:0] _mul_7_z_sink_immediate;
  reg _mul_8_stream_ivalid;
  wire _mul_8_stream_oready;
  wire _mul_8_stream_internal_oready;
  assign _mul_8_stream_internal_oready = 1;
  reg [32-1:0] _mul_8_fsm;
  localparam _mul_8_fsm_init = 0;
  wire _mul_8_run_flag;
  assign _mul_8_run_flag = 0;
  reg _mul_8_source_start;
  wire _mul_8_source_stop;
  reg _mul_8_source_busy;
  wire _mul_8_sink_start;
  wire _mul_8_sink_stop;
  wire _mul_8_sink_busy;
  wire _mul_8_busy;
  reg _mul_8_busy_reg;
  wire _mul_8_is_root;
  reg _mul_8_x_idle;
  reg [33-1:0] _mul_8_x_source_count;
  reg [5-1:0] _mul_8_x_source_mode;
  reg [16-1:0] _mul_8_x_source_generator_id;
  reg [32-1:0] _mul_8_x_source_offset;
  reg [33-1:0] _mul_8_x_source_size;
  reg [32-1:0] _mul_8_x_source_stride;
  reg [32-1:0] _mul_8_x_source_offset_buf;
  reg [33-1:0] _mul_8_x_source_size_buf;
  reg [32-1:0] _mul_8_x_source_stride_buf;
  reg [8-1:0] _mul_8_x_source_sel;
  reg [32-1:0] _mul_8_x_source_ram_raddr;
  reg _mul_8_x_source_ram_renable;
  wire [16-1:0] _mul_8_x_source_ram_rdata;
  reg _mul_8_x_source_fifo_deq;
  wire [16-1:0] _mul_8_x_source_fifo_rdata;
  reg [16-1:0] _mul_8_x_source_empty_data;
  reg _mul_8_y_idle;
  reg [33-1:0] _mul_8_y_source_count;
  reg [5-1:0] _mul_8_y_source_mode;
  reg [16-1:0] _mul_8_y_source_generator_id;
  reg [32-1:0] _mul_8_y_source_offset;
  reg [33-1:0] _mul_8_y_source_size;
  reg [32-1:0] _mul_8_y_source_stride;
  reg [32-1:0] _mul_8_y_source_offset_buf;
  reg [33-1:0] _mul_8_y_source_size_buf;
  reg [32-1:0] _mul_8_y_source_stride_buf;
  reg [8-1:0] _mul_8_y_source_sel;
  reg [32-1:0] _mul_8_y_source_ram_raddr;
  reg _mul_8_y_source_ram_renable;
  wire [16-1:0] _mul_8_y_source_ram_rdata;
  reg _mul_8_y_source_fifo_deq;
  wire [16-1:0] _mul_8_y_source_fifo_rdata;
  reg [16-1:0] _mul_8_y_source_empty_data;
  reg _mul_8_rshift_idle;
  reg [33-1:0] _mul_8_rshift_source_count;
  reg [5-1:0] _mul_8_rshift_source_mode;
  reg [16-1:0] _mul_8_rshift_source_generator_id;
  reg [32-1:0] _mul_8_rshift_source_offset;
  reg [33-1:0] _mul_8_rshift_source_size;
  reg [32-1:0] _mul_8_rshift_source_stride;
  reg [32-1:0] _mul_8_rshift_source_offset_buf;
  reg [33-1:0] _mul_8_rshift_source_size_buf;
  reg [32-1:0] _mul_8_rshift_source_stride_buf;
  reg [8-1:0] _mul_8_rshift_source_sel;
  reg [32-1:0] _mul_8_rshift_source_ram_raddr;
  reg _mul_8_rshift_source_ram_renable;
  wire [32-1:0] _mul_8_rshift_source_ram_rdata;
  reg _mul_8_rshift_source_fifo_deq;
  wire [32-1:0] _mul_8_rshift_source_fifo_rdata;
  reg [32-1:0] _mul_8_rshift_source_empty_data;
  reg [33-1:0] _mul_8_z_sink_count;
  reg [5-1:0] _mul_8_z_sink_mode;
  reg [16-1:0] _mul_8_z_sink_generator_id;
  reg [32-1:0] _mul_8_z_sink_offset;
  reg [33-1:0] _mul_8_z_sink_size;
  reg [32-1:0] _mul_8_z_sink_stride;
  reg [32-1:0] _mul_8_z_sink_offset_buf;
  reg [33-1:0] _mul_8_z_sink_size_buf;
  reg [32-1:0] _mul_8_z_sink_stride_buf;
  reg [8-1:0] _mul_8_z_sink_sel;
  reg [32-1:0] _mul_8_z_sink_waddr;
  reg _mul_8_z_sink_wenable;
  reg [32-1:0] _mul_8_z_sink_wdata;
  reg _mul_8_z_sink_fifo_enq;
  reg [32-1:0] _mul_8_z_sink_fifo_wdata;
  reg [32-1:0] _mul_8_z_sink_immediate;
  reg _mul_9_stream_ivalid;
  wire _mul_9_stream_oready;
  wire _mul_9_stream_internal_oready;
  assign _mul_9_stream_internal_oready = 1;
  reg [32-1:0] _mul_9_fsm;
  localparam _mul_9_fsm_init = 0;
  wire _mul_9_run_flag;
  assign _mul_9_run_flag = 0;
  reg _mul_9_source_start;
  wire _mul_9_source_stop;
  reg _mul_9_source_busy;
  wire _mul_9_sink_start;
  wire _mul_9_sink_stop;
  wire _mul_9_sink_busy;
  wire _mul_9_busy;
  reg _mul_9_busy_reg;
  wire _mul_9_is_root;
  reg _mul_9_x_idle;
  reg [33-1:0] _mul_9_x_source_count;
  reg [5-1:0] _mul_9_x_source_mode;
  reg [16-1:0] _mul_9_x_source_generator_id;
  reg [32-1:0] _mul_9_x_source_offset;
  reg [33-1:0] _mul_9_x_source_size;
  reg [32-1:0] _mul_9_x_source_stride;
  reg [32-1:0] _mul_9_x_source_offset_buf;
  reg [33-1:0] _mul_9_x_source_size_buf;
  reg [32-1:0] _mul_9_x_source_stride_buf;
  reg [8-1:0] _mul_9_x_source_sel;
  reg [32-1:0] _mul_9_x_source_ram_raddr;
  reg _mul_9_x_source_ram_renable;
  wire [16-1:0] _mul_9_x_source_ram_rdata;
  reg _mul_9_x_source_fifo_deq;
  wire [16-1:0] _mul_9_x_source_fifo_rdata;
  reg [16-1:0] _mul_9_x_source_empty_data;
  reg _mul_9_y_idle;
  reg [33-1:0] _mul_9_y_source_count;
  reg [5-1:0] _mul_9_y_source_mode;
  reg [16-1:0] _mul_9_y_source_generator_id;
  reg [32-1:0] _mul_9_y_source_offset;
  reg [33-1:0] _mul_9_y_source_size;
  reg [32-1:0] _mul_9_y_source_stride;
  reg [32-1:0] _mul_9_y_source_offset_buf;
  reg [33-1:0] _mul_9_y_source_size_buf;
  reg [32-1:0] _mul_9_y_source_stride_buf;
  reg [8-1:0] _mul_9_y_source_sel;
  reg [32-1:0] _mul_9_y_source_ram_raddr;
  reg _mul_9_y_source_ram_renable;
  wire [16-1:0] _mul_9_y_source_ram_rdata;
  reg _mul_9_y_source_fifo_deq;
  wire [16-1:0] _mul_9_y_source_fifo_rdata;
  reg [16-1:0] _mul_9_y_source_empty_data;
  reg _mul_9_rshift_idle;
  reg [33-1:0] _mul_9_rshift_source_count;
  reg [5-1:0] _mul_9_rshift_source_mode;
  reg [16-1:0] _mul_9_rshift_source_generator_id;
  reg [32-1:0] _mul_9_rshift_source_offset;
  reg [33-1:0] _mul_9_rshift_source_size;
  reg [32-1:0] _mul_9_rshift_source_stride;
  reg [32-1:0] _mul_9_rshift_source_offset_buf;
  reg [33-1:0] _mul_9_rshift_source_size_buf;
  reg [32-1:0] _mul_9_rshift_source_stride_buf;
  reg [8-1:0] _mul_9_rshift_source_sel;
  reg [32-1:0] _mul_9_rshift_source_ram_raddr;
  reg _mul_9_rshift_source_ram_renable;
  wire [32-1:0] _mul_9_rshift_source_ram_rdata;
  reg _mul_9_rshift_source_fifo_deq;
  wire [32-1:0] _mul_9_rshift_source_fifo_rdata;
  reg [32-1:0] _mul_9_rshift_source_empty_data;
  reg [33-1:0] _mul_9_z_sink_count;
  reg [5-1:0] _mul_9_z_sink_mode;
  reg [16-1:0] _mul_9_z_sink_generator_id;
  reg [32-1:0] _mul_9_z_sink_offset;
  reg [33-1:0] _mul_9_z_sink_size;
  reg [32-1:0] _mul_9_z_sink_stride;
  reg [32-1:0] _mul_9_z_sink_offset_buf;
  reg [33-1:0] _mul_9_z_sink_size_buf;
  reg [32-1:0] _mul_9_z_sink_stride_buf;
  reg [8-1:0] _mul_9_z_sink_sel;
  reg [32-1:0] _mul_9_z_sink_waddr;
  reg _mul_9_z_sink_wenable;
  reg [32-1:0] _mul_9_z_sink_wdata;
  reg _mul_9_z_sink_fifo_enq;
  reg [32-1:0] _mul_9_z_sink_fifo_wdata;
  reg [32-1:0] _mul_9_z_sink_immediate;
  reg _stream__lazy_reshape_1_stream_ivalid;
  wire _stream__lazy_reshape_1_stream_oready;
  wire _stream__lazy_reshape_1_stream_internal_oready;
  assign _stream__lazy_reshape_1_stream_internal_oready = 1;
  assign _stream__lazy_reshape_1_stream_oready = _stream__lazy_reshape_1_stream_internal_oready;
  reg [32-1:0] _stream__lazy_reshape_1_fsm;
  localparam _stream__lazy_reshape_1_fsm_init = 0;
  wire _stream__lazy_reshape_1_run_flag;
  reg _stream__lazy_reshape_1_source_start;
  wire _stream__lazy_reshape_1_source_stop;
  reg _stream__lazy_reshape_1_source_busy;
  wire _stream__lazy_reshape_1_sink_start;
  wire _stream__lazy_reshape_1_sink_stop;
  wire _stream__lazy_reshape_1_sink_busy;
  wire _stream__lazy_reshape_1_busy;
  reg _stream__lazy_reshape_1_busy_reg;
  wire _stream__lazy_reshape_1_is_root;
  assign _stream__lazy_reshape_1_is_root = 1;
  reg _stream__lazy_reshape_1_source_0_idle;
  reg [33-1:0] _stream__lazy_reshape_1_source_0_source_count;
  reg [5-1:0] _stream__lazy_reshape_1_source_0_source_mode;
  reg [16-1:0] _stream__lazy_reshape_1_source_0_source_generator_id;
  reg [32-1:0] _stream__lazy_reshape_1_source_0_source_offset;
  reg [33-1:0] _stream__lazy_reshape_1_source_0_source_size;
  reg [32-1:0] _stream__lazy_reshape_1_source_0_source_stride;
  reg [32-1:0] _stream__lazy_reshape_1_source_0_source_offset_buf;
  reg [33-1:0] _stream__lazy_reshape_1_source_0_source_size_buf;
  reg [32-1:0] _stream__lazy_reshape_1_source_0_source_stride_buf;
  reg [8-1:0] _stream__lazy_reshape_1_source_0_source_sel;
  reg [32-1:0] _stream__lazy_reshape_1_source_0_source_ram_raddr;
  reg _stream__lazy_reshape_1_source_0_source_ram_renable;
  wire [16-1:0] _stream__lazy_reshape_1_source_0_source_ram_rdata;
  reg _stream__lazy_reshape_1_source_0_source_fifo_deq;
  wire [16-1:0] _stream__lazy_reshape_1_source_0_source_fifo_rdata;
  reg [16-1:0] _stream__lazy_reshape_1_source_0_source_empty_data;
  reg [33-1:0] _stream__lazy_reshape_1_sink_1_sink_count;
  reg [5-1:0] _stream__lazy_reshape_1_sink_1_sink_mode;
  reg [16-1:0] _stream__lazy_reshape_1_sink_1_sink_generator_id;
  reg [32-1:0] _stream__lazy_reshape_1_sink_1_sink_offset;
  reg [33-1:0] _stream__lazy_reshape_1_sink_1_sink_size;
  reg [32-1:0] _stream__lazy_reshape_1_sink_1_sink_stride;
  reg [32-1:0] _stream__lazy_reshape_1_sink_1_sink_offset_buf;
  reg [33-1:0] _stream__lazy_reshape_1_sink_1_sink_size_buf;
  reg [32-1:0] _stream__lazy_reshape_1_sink_1_sink_stride_buf;
  reg [8-1:0] _stream__lazy_reshape_1_sink_1_sink_sel;
  reg [32-1:0] _stream__lazy_reshape_1_sink_1_sink_waddr;
  reg _stream__lazy_reshape_1_sink_1_sink_wenable;
  reg [16-1:0] _stream__lazy_reshape_1_sink_1_sink_wdata;
  reg _stream__lazy_reshape_1_sink_1_sink_fifo_enq;
  reg [16-1:0] _stream__lazy_reshape_1_sink_1_sink_fifo_wdata;
  reg [16-1:0] _stream__lazy_reshape_1_sink_1_sink_immediate;
  reg _stream_matmul_5_stream_ivalid;
  wire _stream_matmul_5_stream_oready;
  wire _stream_matmul_5_stream_internal_oready;
  assign _stream_matmul_5_stream_oready = _stream_matmul_5_stream_internal_oready;
  reg [32-1:0] _stream_matmul_5_fsm;
  localparam _stream_matmul_5_fsm_init = 0;
  wire _stream_matmul_5_run_flag;
  reg _stream_matmul_5_source_start;
  wire _stream_matmul_5_source_stop;
  reg _stream_matmul_5_source_busy;
  wire _stream_matmul_5_sink_start;
  wire _stream_matmul_5_sink_stop;
  wire _stream_matmul_5_sink_busy;
  wire _stream_matmul_5_busy;
  reg _stream_matmul_5_busy_reg;
  wire _stream_matmul_5_is_root;
  assign _stream_matmul_5_is_root = 1;
  reg [9-1:0] _stream_matmul_5_parameter_0_next_parameter_data;
  reg [1-1:0] _stream_matmul_5_parameter_1_next_parameter_data;
  reg [1-1:0] _stream_matmul_5_parameter_2_next_parameter_data;
  reg [1-1:0] _stream_matmul_5_parameter_3_next_parameter_data;
  reg [2-1:0] _stream_matmul_5_parameter_4_next_parameter_data;
  reg [1-1:0] _stream_matmul_5_parameter_6_next_parameter_data;
  reg _stream_matmul_5_source_7_idle;
  reg [33-1:0] _stream_matmul_5_source_7_source_count;
  reg [5-1:0] _stream_matmul_5_source_7_source_mode;
  reg [16-1:0] _stream_matmul_5_source_7_source_generator_id;
  reg [32-1:0] _stream_matmul_5_source_7_source_offset;
  reg [33-1:0] _stream_matmul_5_source_7_source_size;
  reg [32-1:0] _stream_matmul_5_source_7_source_stride;
  reg [32-1:0] _stream_matmul_5_source_7_source_offset_buf;
  reg [33-1:0] _stream_matmul_5_source_7_source_size_buf;
  reg [32-1:0] _stream_matmul_5_source_7_source_stride_buf;
  reg [8-1:0] _stream_matmul_5_source_7_source_sel;
  reg [32-1:0] _stream_matmul_5_source_7_source_ram_raddr;
  reg _stream_matmul_5_source_7_source_ram_renable;
  wire [32-1:0] _stream_matmul_5_source_7_source_ram_rdata;
  reg _stream_matmul_5_source_7_source_fifo_deq;
  wire [32-1:0] _stream_matmul_5_source_7_source_fifo_rdata;
  reg [32-1:0] _stream_matmul_5_source_7_source_empty_data;
  reg [1-1:0] _stream_matmul_5_parameter_8_next_parameter_data;
  reg _stream_matmul_5_source_9_idle;
  reg [33-1:0] _stream_matmul_5_source_9_source_count;
  reg [5-1:0] _stream_matmul_5_source_9_source_mode;
  reg [16-1:0] _stream_matmul_5_source_9_source_generator_id;
  reg [32-1:0] _stream_matmul_5_source_9_source_offset;
  reg [33-1:0] _stream_matmul_5_source_9_source_size;
  reg [32-1:0] _stream_matmul_5_source_9_source_stride;
  reg [32-1:0] _stream_matmul_5_source_9_source_offset_buf;
  reg [33-1:0] _stream_matmul_5_source_9_source_size_buf;
  reg [32-1:0] _stream_matmul_5_source_9_source_stride_buf;
  reg [8-1:0] _stream_matmul_5_source_9_source_sel;
  reg [32-1:0] _stream_matmul_5_source_9_source_ram_raddr;
  reg _stream_matmul_5_source_9_source_ram_renable;
  wire [32-1:0] _stream_matmul_5_source_9_source_ram_rdata;
  reg _stream_matmul_5_source_9_source_fifo_deq;
  wire [32-1:0] _stream_matmul_5_source_9_source_fifo_rdata;
  reg [32-1:0] _stream_matmul_5_source_9_source_empty_data;
  reg [1-1:0] _stream_matmul_5_parameter_10_next_parameter_data;
  reg _stream_matmul_5_source_11_idle;
  reg [33-1:0] _stream_matmul_5_source_11_source_count;
  reg [5-1:0] _stream_matmul_5_source_11_source_mode;
  reg [16-1:0] _stream_matmul_5_source_11_source_generator_id;
  reg [32-1:0] _stream_matmul_5_source_11_source_offset;
  reg [33-1:0] _stream_matmul_5_source_11_source_size;
  reg [32-1:0] _stream_matmul_5_source_11_source_stride;
  reg [32-1:0] _stream_matmul_5_source_11_source_offset_buf;
  reg [33-1:0] _stream_matmul_5_source_11_source_size_buf;
  reg [32-1:0] _stream_matmul_5_source_11_source_stride_buf;
  reg [8-1:0] _stream_matmul_5_source_11_source_sel;
  reg [32-1:0] _stream_matmul_5_source_11_source_ram_raddr;
  reg _stream_matmul_5_source_11_source_ram_renable;
  wire [32-1:0] _stream_matmul_5_source_11_source_ram_rdata;
  reg _stream_matmul_5_source_11_source_fifo_deq;
  wire [32-1:0] _stream_matmul_5_source_11_source_fifo_rdata;
  reg [32-1:0] _stream_matmul_5_source_11_source_empty_data;
  reg [1-1:0] _stream_matmul_5_parameter_12_next_parameter_data;
  reg _stream_matmul_5_source_13_idle;
  reg [33-1:0] _stream_matmul_5_source_13_source_count;
  reg [5-1:0] _stream_matmul_5_source_13_source_mode;
  reg [16-1:0] _stream_matmul_5_source_13_source_generator_id;
  reg [32-1:0] _stream_matmul_5_source_13_source_offset;
  reg [33-1:0] _stream_matmul_5_source_13_source_size;
  reg [32-1:0] _stream_matmul_5_source_13_source_stride;
  reg [32-1:0] _stream_matmul_5_source_13_source_offset_buf;
  reg [33-1:0] _stream_matmul_5_source_13_source_size_buf;
  reg [32-1:0] _stream_matmul_5_source_13_source_stride_buf;
  reg [8-1:0] _stream_matmul_5_source_13_source_sel;
  reg [32-1:0] _stream_matmul_5_source_13_source_ram_raddr;
  reg _stream_matmul_5_source_13_source_ram_renable;
  wire [32-1:0] _stream_matmul_5_source_13_source_ram_rdata;
  reg _stream_matmul_5_source_13_source_fifo_deq;
  wire [32-1:0] _stream_matmul_5_source_13_source_fifo_rdata;
  reg [32-1:0] _stream_matmul_5_source_13_source_empty_data;
  reg [1-1:0] _stream_matmul_5_parameter_14_next_parameter_data;
  reg _stream_matmul_5_source_15_idle;
  reg [33-1:0] _stream_matmul_5_source_15_source_count;
  reg [5-1:0] _stream_matmul_5_source_15_source_mode;
  reg [16-1:0] _stream_matmul_5_source_15_source_generator_id;
  reg [32-1:0] _stream_matmul_5_source_15_source_offset;
  reg [33-1:0] _stream_matmul_5_source_15_source_size;
  reg [32-1:0] _stream_matmul_5_source_15_source_stride;
  reg [32-1:0] _stream_matmul_5_source_15_source_offset_buf;
  reg [33-1:0] _stream_matmul_5_source_15_source_size_buf;
  reg [32-1:0] _stream_matmul_5_source_15_source_stride_buf;
  reg [8-1:0] _stream_matmul_5_source_15_source_sel;
  reg [32-1:0] _stream_matmul_5_source_15_source_ram_raddr;
  reg _stream_matmul_5_source_15_source_ram_renable;
  wire [32-1:0] _stream_matmul_5_source_15_source_ram_rdata;
  reg _stream_matmul_5_source_15_source_fifo_deq;
  wire [32-1:0] _stream_matmul_5_source_15_source_fifo_rdata;
  reg [32-1:0] _stream_matmul_5_source_15_source_empty_data;
  reg [1-1:0] _stream_matmul_5_parameter_16_next_parameter_data;
  reg [1-1:0] _stream_matmul_5_parameter_17_next_parameter_data;
  reg [5-1:0] _stream_matmul_5_parameter_18_next_parameter_data;
  reg [2-1:0] _stream_matmul_5_parameter_19_next_parameter_data;
  reg _stream_matmul_5_source_20_idle;
  reg [33-1:0] _stream_matmul_5_source_20_source_count;
  reg [5-1:0] _stream_matmul_5_source_20_source_mode;
  reg [16-1:0] _stream_matmul_5_source_20_source_generator_id;
  reg [32-1:0] _stream_matmul_5_source_20_source_offset;
  reg [33-1:0] _stream_matmul_5_source_20_source_size;
  reg [32-1:0] _stream_matmul_5_source_20_source_stride;
  reg [32-1:0] _stream_matmul_5_source_20_source_offset_buf;
  reg [33-1:0] _stream_matmul_5_source_20_source_size_buf;
  reg [32-1:0] _stream_matmul_5_source_20_source_stride_buf;
  reg [8-1:0] _stream_matmul_5_source_20_source_sel;
  reg [32-1:0] _stream_matmul_5_source_20_source_ram_raddr;
  reg _stream_matmul_5_source_20_source_ram_renable;
  wire [32-1:0] _stream_matmul_5_source_20_source_ram_rdata;
  reg _stream_matmul_5_source_20_source_fifo_deq;
  wire [32-1:0] _stream_matmul_5_source_20_source_fifo_rdata;
  reg [32-1:0] _stream_matmul_5_source_20_source_empty_data;
  reg _stream_matmul_5_source_21_idle;
  reg [33-1:0] _stream_matmul_5_source_21_source_count;
  reg [5-1:0] _stream_matmul_5_source_21_source_mode;
  reg [16-1:0] _stream_matmul_5_source_21_source_generator_id;
  reg [32-1:0] _stream_matmul_5_source_21_source_offset;
  reg [33-1:0] _stream_matmul_5_source_21_source_size;
  reg [32-1:0] _stream_matmul_5_source_21_source_stride;
  reg [32-1:0] _stream_matmul_5_source_21_source_offset_buf;
  reg [33-1:0] _stream_matmul_5_source_21_source_size_buf;
  reg [32-1:0] _stream_matmul_5_source_21_source_stride_buf;
  reg [8-1:0] _stream_matmul_5_source_21_source_sel;
  reg [32-1:0] _stream_matmul_5_source_21_source_ram_raddr;
  reg _stream_matmul_5_source_21_source_ram_renable;
  wire [32-1:0] _stream_matmul_5_source_21_source_ram_rdata;
  reg _stream_matmul_5_source_21_source_fifo_deq;
  wire [32-1:0] _stream_matmul_5_source_21_source_fifo_rdata;
  reg [32-1:0] _stream_matmul_5_source_21_source_empty_data;
  reg _stream_matmul_5_source_22_idle;
  reg [33-1:0] _stream_matmul_5_source_22_source_count;
  reg [5-1:0] _stream_matmul_5_source_22_source_mode;
  reg [16-1:0] _stream_matmul_5_source_22_source_generator_id;
  reg [32-1:0] _stream_matmul_5_source_22_source_offset;
  reg [33-1:0] _stream_matmul_5_source_22_source_size;
  reg [32-1:0] _stream_matmul_5_source_22_source_stride;
  reg [32-1:0] _stream_matmul_5_source_22_source_offset_buf;
  reg [33-1:0] _stream_matmul_5_source_22_source_size_buf;
  reg [32-1:0] _stream_matmul_5_source_22_source_stride_buf;
  reg [8-1:0] _stream_matmul_5_source_22_source_sel;
  reg [32-1:0] _stream_matmul_5_source_22_source_ram_raddr;
  reg _stream_matmul_5_source_22_source_ram_renable;
  wire [32-1:0] _stream_matmul_5_source_22_source_ram_rdata;
  reg _stream_matmul_5_source_22_source_fifo_deq;
  wire [32-1:0] _stream_matmul_5_source_22_source_fifo_rdata;
  reg [32-1:0] _stream_matmul_5_source_22_source_empty_data;
  wire signed [16-1:0] mul_6_x_data;
  wire signed [16-1:0] mul_6_y_data;
  wire [5-1:0] mul_6_rshift_data;
  reg __mul_6_stream_ivalid_1;
  reg __mul_6_stream_ivalid_2;
  reg __mul_6_stream_ivalid_3;
  reg __mul_6_stream_ivalid_4;
  reg __mul_6_stream_ivalid_5;
  reg __mul_6_stream_ivalid_6;
  reg __mul_6_stream_ivalid_7;
  reg __mul_6_stream_ivalid_8;
  reg [1-1:0] _greaterthan_data_123;
  reg [5-1:0] _minus_data_125;
  reg [1-1:0] _greatereq_data_136;
  reg signed [16-1:0] __delay_data_345__variable_120;
  reg signed [16-1:0] __delay_data_348__variable_121;
  reg [5-1:0] __delay_data_351__variable_122;
  reg signed [34-1:0] _sll_data_127;
  reg [1-1:0] __delay_data_342_greaterthan_123;
  reg [1-1:0] __delay_data_343_greatereq_136;
  reg signed [16-1:0] __delay_data_346__delay_345__variable_120;
  reg signed [16-1:0] __delay_data_349__delay_348__variable_121;
  reg [5-1:0] __delay_data_352__delay_351__variable_122;
  reg signed [32-1:0] _cond_data_133;
  reg [1-1:0] __delay_data_344__delay_343_greatereq_136;
  reg signed [16-1:0] __delay_data_347__delay_346__delay_345__variable_120;
  reg signed [16-1:0] __delay_data_350__delay_349__delay_348__variable_121;
  reg [5-1:0] __delay_data_353__delay_352__delay_351__variable_122;
  wire signed [16-1:0] _uminus_data_135;
  assign _uminus_data_135 = -_cond_data_133;
  wire signed [16-1:0] _cond_data_138;
  assign _cond_data_138 = (__delay_data_344__delay_343_greatereq_136)? _cond_data_133 : _uminus_data_135;
  wire signed [32-1:0] __muladd_madd_odata_139;
  reg signed [32-1:0] __muladd_madd_odata_reg_139;
  wire signed [32-1:0] __muladd_data_139;
  assign __muladd_data_139 = __muladd_madd_odata_reg_139;
  wire __muladd_madd_update_139;
  assign __muladd_madd_update_139 = _mul_6_stream_oready;

  madd_0
  __muladd_madd_139
  (
    .CLK(CLK),
    .update(__muladd_madd_update_139),
    .a(__delay_data_347__delay_346__delay_345__variable_120),
    .b(__delay_data_350__delay_349__delay_348__variable_121),
    .c(_cond_data_138),
    .d(__muladd_madd_odata_139)
  );

  reg [5-1:0] __delay_data_354__delay_353__delay_352____variable_122;
  reg [5-1:0] __delay_data_355__delay_354__delay_353____variable_122;
  reg [5-1:0] __delay_data_356__delay_355__delay_354____variable_122;
  reg [5-1:0] __delay_data_357__delay_356__delay_355____variable_122;
  reg signed [32-1:0] _sra_data_140;
  wire signed [32-1:0] mul_6_z_data;
  assign mul_6_z_data = _sra_data_140;
  wire signed [16-1:0] mul_7_x_data;
  wire signed [16-1:0] mul_7_y_data;
  wire [5-1:0] mul_7_rshift_data;
  reg __mul_7_stream_ivalid_1;
  reg __mul_7_stream_ivalid_2;
  reg __mul_7_stream_ivalid_3;
  reg __mul_7_stream_ivalid_4;
  reg __mul_7_stream_ivalid_5;
  reg __mul_7_stream_ivalid_6;
  reg __mul_7_stream_ivalid_7;
  reg __mul_7_stream_ivalid_8;
  reg [1-1:0] _greaterthan_data_144;
  reg [5-1:0] _minus_data_146;
  reg [1-1:0] _greatereq_data_157;
  reg signed [16-1:0] __delay_data_366__variable_141;
  reg signed [16-1:0] __delay_data_369__variable_142;
  reg [5-1:0] __delay_data_372__variable_143;
  reg signed [34-1:0] _sll_data_148;
  reg [1-1:0] __delay_data_363_greaterthan_144;
  reg [1-1:0] __delay_data_364_greatereq_157;
  reg signed [16-1:0] __delay_data_367__delay_366__variable_141;
  reg signed [16-1:0] __delay_data_370__delay_369__variable_142;
  reg [5-1:0] __delay_data_373__delay_372__variable_143;
  reg signed [32-1:0] _cond_data_154;
  reg [1-1:0] __delay_data_365__delay_364_greatereq_157;
  reg signed [16-1:0] __delay_data_368__delay_367__delay_366__variable_141;
  reg signed [16-1:0] __delay_data_371__delay_370__delay_369__variable_142;
  reg [5-1:0] __delay_data_374__delay_373__delay_372__variable_143;
  wire signed [16-1:0] _uminus_data_156;
  assign _uminus_data_156 = -_cond_data_154;
  wire signed [16-1:0] _cond_data_159;
  assign _cond_data_159 = (__delay_data_365__delay_364_greatereq_157)? _cond_data_154 : _uminus_data_156;
  wire signed [32-1:0] __muladd_madd_odata_160;
  reg signed [32-1:0] __muladd_madd_odata_reg_160;
  wire signed [32-1:0] __muladd_data_160;
  assign __muladd_data_160 = __muladd_madd_odata_reg_160;
  wire __muladd_madd_update_160;
  assign __muladd_madd_update_160 = _mul_7_stream_oready;

  madd_1
  __muladd_madd_160
  (
    .CLK(CLK),
    .update(__muladd_madd_update_160),
    .a(__delay_data_368__delay_367__delay_366__variable_141),
    .b(__delay_data_371__delay_370__delay_369__variable_142),
    .c(_cond_data_159),
    .d(__muladd_madd_odata_160)
  );

  reg [5-1:0] __delay_data_375__delay_374__delay_373____variable_143;
  reg [5-1:0] __delay_data_376__delay_375__delay_374____variable_143;
  reg [5-1:0] __delay_data_377__delay_376__delay_375____variable_143;
  reg [5-1:0] __delay_data_378__delay_377__delay_376____variable_143;
  reg signed [32-1:0] _sra_data_161;
  wire signed [32-1:0] mul_7_z_data;
  assign mul_7_z_data = _sra_data_161;
  wire signed [32-1:0] add_tree_2_var0_data;
  wire signed [32-1:0] add_tree_2_var1_data;
  reg __add_tree_2_stream_ivalid_1;
  reg signed [32-1:0] __plusn_data_47;
  wire signed [32-1:0] add_tree_2_sum_data;
  assign add_tree_2_sum_data = __plusn_data_47;
  wire signed [32-1:0] acc_0_x_data;
  wire [6-1:0] acc_0_rshift_data;
  wire [32-1:0] acc_0_size_data;
  wire [1-1:0] acc_0__reduce_reset_data;
  reg __acc_0_stream_ivalid_1;
  reg __acc_0_stream_ivalid_2;
  reg __acc_0_stream_ivalid_3;
  reg __acc_0_stream_ivalid_4;
  reg __acc_0_stream_ivalid_5;
  reg [1-1:0] _greaterthan_data_3;
  reg [6-1:0] _minus_data_5;
  reg signed [32-1:0] _reduceadd_data_16;
  reg [33-1:0] _reduceadd_count_16;
  reg _reduceadd_prev_count_max_16;
  wire _reduceadd_reset_cond_16;
  assign _reduceadd_reset_cond_16 = acc_0__reduce_reset_data || _reduceadd_prev_count_max_16;
  wire [33-1:0] _reduceadd_current_count_16;
  assign _reduceadd_current_count_16 = (_reduceadd_reset_cond_16)? 0 : _reduceadd_count_16;
  wire signed [32-1:0] _reduceadd_current_data_16;
  assign _reduceadd_current_data_16 = (_reduceadd_reset_cond_16)? 1'sd0 : _reduceadd_data_16;
  reg [1-1:0] _pulse_data_18;
  reg [33-1:0] _pulse_count_18;
  reg _pulse_prev_count_max_18;
  wire _pulse_reset_cond_18;
  assign _pulse_reset_cond_18 = acc_0__reduce_reset_data || _pulse_prev_count_max_18;
  wire [33-1:0] _pulse_current_count_18;
  assign _pulse_current_count_18 = (_pulse_reset_cond_18)? 0 : _pulse_count_18;
  wire [1-1:0] _pulse_current_data_18;
  assign _pulse_current_data_18 = (_pulse_reset_cond_18)? 1'sd0 : _pulse_data_18;
  reg [6-1:0] __delay_data_387__variable_1;
  reg signed [66-1:0] _sll_data_7;
  reg [1-1:0] __delay_data_384_greaterthan_3;
  reg signed [32-1:0] __delay_data_385_reduceadd_16;
  reg [6-1:0] __delay_data_388__delay_387__variable_1;
  reg [1-1:0] __delay_data_391_pulse_18;
  reg signed [32-1:0] _cond_data_13;
  reg signed [32-1:0] __delay_data_386__delay_385_reduceadd_16;
  reg [6-1:0] __delay_data_389__delay_388__delay_387__variable_1;
  reg [1-1:0] __delay_data_392__delay_391_pulse_18;
  reg signed [32-1:0] _plus_data_20;
  reg [6-1:0] __delay_data_390__delay_389__delay_388__delay_387__variable_1;
  reg [1-1:0] __delay_data_393__delay_392__delay_391_pulse_18;
  reg signed [32-1:0] _sra_data_21;
  reg [1-1:0] __delay_data_394__delay_393__delay_392__delay_391_pulse_18;
  wire signed [32-1:0] acc_0_sum_data;
  assign acc_0_sum_data = _sra_data_21;
  wire [1-1:0] acc_0_valid_data;
  assign acc_0_valid_data = __delay_data_394__delay_393__delay_392__delay_391_pulse_18;
  wire signed [32-1:0] mul_rshift_round_clip_4_x_data;
  wire signed [16-1:0] mul_rshift_round_clip_4_y_data;
  wire [6-1:0] mul_rshift_round_clip_4_rshift_data;
  reg __mul_rshift_round_clip_4_stream_ivalid_1;
  reg __mul_rshift_round_clip_4_stream_ivalid_2;
  reg __mul_rshift_round_clip_4_stream_ivalid_3;
  reg __mul_rshift_round_clip_4_stream_ivalid_4;
  reg __mul_rshift_round_clip_4_stream_ivalid_5;
  reg __mul_rshift_round_clip_4_stream_ivalid_6;
  reg __mul_rshift_round_clip_4_stream_ivalid_7;
  reg __mul_rshift_round_clip_4_stream_ivalid_8;
  wire signed [48-1:0] _times_mul_odata_55;
  reg signed [48-1:0] _times_mul_odata_reg_55;
  wire signed [48-1:0] _times_data_55;
  assign _times_data_55 = _times_mul_odata_reg_55;
  wire _times_mul_update_55;
  assign _times_mul_update_55 = _mul_rshift_round_clip_4_stream_oready;

  multiplier_0
  _times_mul_55
  (
    .CLK(CLK),
    .update(_times_mul_update_55),
    .a(mul_rshift_round_clip_4_x_data),
    .b(mul_rshift_round_clip_4_y_data),
    .c(_times_mul_odata_55)
  );

  wire [6-1:0] _minus_data_58;
  assign _minus_data_58 = mul_rshift_round_clip_4_rshift_data - 2'sd1;
  wire signed [66-1:0] _sll_data_61;
  assign _sll_data_61 = 2'sd1 << _minus_data_58;
  wire [1-1:0] _eq_data_73;
  assign _eq_data_73 = mul_rshift_round_clip_4_rshift_data == 1'sd0;
  reg signed [66-1:0] __delay_data_400_sll_61;
  reg [6-1:0] __delay_data_404__variable_54;
  reg [1-1:0] __delay_data_408_eq_73;
  reg signed [66-1:0] __delay_data_401__delay_400_sll_61;
  reg [6-1:0] __delay_data_405__delay_404__variable_54;
  reg [1-1:0] __delay_data_409__delay_408_eq_73;
  reg signed [66-1:0] __delay_data_402__delay_401__delay_400_sll_61;
  reg [6-1:0] __delay_data_406__delay_405__delay_404__variable_54;
  reg [1-1:0] __delay_data_410__delay_409__delay_408_eq_73;
  reg signed [66-1:0] __delay_data_403__delay_402__delay_401__delay_400_sll_61;
  reg [6-1:0] __delay_data_407__delay_406__delay_405__delay_404__variable_54;
  reg [1-1:0] __delay_data_411__delay_410__delay_409__delay_408_eq_73;
  wire [1-1:0] _pointer_data_56;
  assign _pointer_data_56 = _times_data_55[7'sd47];
  wire signed [2-1:0] _cond_data_68;
  assign _cond_data_68 = (_pointer_data_56)? -2'sd1 : 1'sd0;
  wire signed [49-1:0] _plus_data_69;
  assign _plus_data_69 = _times_data_55 + __delay_data_403__delay_402__delay_401__delay_400_sll_61;
  wire signed [49-1:0] _plus_data_70;
  assign _plus_data_70 = _plus_data_69 + _cond_data_68;
  wire signed [48-1:0] _sra_data_71;
  assign _sra_data_71 = _plus_data_70 >>> __delay_data_407__delay_406__delay_405__delay_404__variable_54;
  reg signed [48-1:0] _cond_data_74;
  reg [1-1:0] _greaterthan_data_75;
  reg [1-1:0] _lessthan_data_79;
  reg [1-1:0] _greatereq_data_83;
  reg signed [48-1:0] __delay_data_412_cond_74;
  reg signed [48-1:0] _cond_data_77;
  reg signed [48-1:0] _cond_data_81;
  reg [1-1:0] __delay_data_413_greatereq_83;
  reg signed [16-1:0] _cond_data_85;
  wire signed [16-1:0] mul_rshift_round_clip_4_z_data;
  assign mul_rshift_round_clip_4_z_data = _cond_data_85;
  wire signed [16-1:0] mul_8_x_data;
  wire signed [16-1:0] mul_8_y_data;
  wire [5-1:0] mul_8_rshift_data;
  reg __mul_8_stream_ivalid_1;
  reg __mul_8_stream_ivalid_2;
  reg __mul_8_stream_ivalid_3;
  reg __mul_8_stream_ivalid_4;
  reg __mul_8_stream_ivalid_5;
  reg __mul_8_stream_ivalid_6;
  reg __mul_8_stream_ivalid_7;
  reg __mul_8_stream_ivalid_8;
  reg [1-1:0] _greaterthan_data_165;
  reg [5-1:0] _minus_data_167;
  reg [1-1:0] _greatereq_data_178;
  reg signed [16-1:0] __delay_data_433__variable_162;
  reg signed [16-1:0] __delay_data_436__variable_163;
  reg [5-1:0] __delay_data_439__variable_164;
  reg signed [34-1:0] _sll_data_169;
  reg [1-1:0] __delay_data_430_greaterthan_165;
  reg [1-1:0] __delay_data_431_greatereq_178;
  reg signed [16-1:0] __delay_data_434__delay_433__variable_162;
  reg signed [16-1:0] __delay_data_437__delay_436__variable_163;
  reg [5-1:0] __delay_data_440__delay_439__variable_164;
  reg signed [32-1:0] _cond_data_175;
  reg [1-1:0] __delay_data_432__delay_431_greatereq_178;
  reg signed [16-1:0] __delay_data_435__delay_434__delay_433__variable_162;
  reg signed [16-1:0] __delay_data_438__delay_437__delay_436__variable_163;
  reg [5-1:0] __delay_data_441__delay_440__delay_439__variable_164;
  wire signed [16-1:0] _uminus_data_177;
  assign _uminus_data_177 = -_cond_data_175;
  wire signed [16-1:0] _cond_data_180;
  assign _cond_data_180 = (__delay_data_432__delay_431_greatereq_178)? _cond_data_175 : _uminus_data_177;
  wire signed [32-1:0] __muladd_madd_odata_181;
  reg signed [32-1:0] __muladd_madd_odata_reg_181;
  wire signed [32-1:0] __muladd_data_181;
  assign __muladd_data_181 = __muladd_madd_odata_reg_181;
  wire __muladd_madd_update_181;
  assign __muladd_madd_update_181 = _mul_8_stream_oready;

  madd_2
  __muladd_madd_181
  (
    .CLK(CLK),
    .update(__muladd_madd_update_181),
    .a(__delay_data_435__delay_434__delay_433__variable_162),
    .b(__delay_data_438__delay_437__delay_436__variable_163),
    .c(_cond_data_180),
    .d(__muladd_madd_odata_181)
  );

  reg [5-1:0] __delay_data_442__delay_441__delay_440____variable_164;
  reg [5-1:0] __delay_data_443__delay_442__delay_441____variable_164;
  reg [5-1:0] __delay_data_444__delay_443__delay_442____variable_164;
  reg [5-1:0] __delay_data_445__delay_444__delay_443____variable_164;
  reg signed [32-1:0] _sra_data_182;
  wire signed [32-1:0] mul_8_z_data;
  assign mul_8_z_data = _sra_data_182;
  wire signed [16-1:0] mul_9_x_data;
  wire signed [16-1:0] mul_9_y_data;
  wire [5-1:0] mul_9_rshift_data;
  reg __mul_9_stream_ivalid_1;
  reg __mul_9_stream_ivalid_2;
  reg __mul_9_stream_ivalid_3;
  reg __mul_9_stream_ivalid_4;
  reg __mul_9_stream_ivalid_5;
  reg __mul_9_stream_ivalid_6;
  reg __mul_9_stream_ivalid_7;
  reg __mul_9_stream_ivalid_8;
  reg [1-1:0] _greaterthan_data_186;
  reg [5-1:0] _minus_data_188;
  reg [1-1:0] _greatereq_data_199;
  reg signed [16-1:0] __delay_data_454__variable_183;
  reg signed [16-1:0] __delay_data_457__variable_184;
  reg [5-1:0] __delay_data_460__variable_185;
  reg signed [34-1:0] _sll_data_190;
  reg [1-1:0] __delay_data_451_greaterthan_186;
  reg [1-1:0] __delay_data_452_greatereq_199;
  reg signed [16-1:0] __delay_data_455__delay_454__variable_183;
  reg signed [16-1:0] __delay_data_458__delay_457__variable_184;
  reg [5-1:0] __delay_data_461__delay_460__variable_185;
  reg signed [32-1:0] _cond_data_196;
  reg [1-1:0] __delay_data_453__delay_452_greatereq_199;
  reg signed [16-1:0] __delay_data_456__delay_455__delay_454__variable_183;
  reg signed [16-1:0] __delay_data_459__delay_458__delay_457__variable_184;
  reg [5-1:0] __delay_data_462__delay_461__delay_460__variable_185;
  wire signed [16-1:0] _uminus_data_198;
  assign _uminus_data_198 = -_cond_data_196;
  wire signed [16-1:0] _cond_data_201;
  assign _cond_data_201 = (__delay_data_453__delay_452_greatereq_199)? _cond_data_196 : _uminus_data_198;
  wire signed [32-1:0] __muladd_madd_odata_202;
  reg signed [32-1:0] __muladd_madd_odata_reg_202;
  wire signed [32-1:0] __muladd_data_202;
  assign __muladd_data_202 = __muladd_madd_odata_reg_202;
  wire __muladd_madd_update_202;
  assign __muladd_madd_update_202 = _mul_9_stream_oready;

  madd_3
  __muladd_madd_202
  (
    .CLK(CLK),
    .update(__muladd_madd_update_202),
    .a(__delay_data_456__delay_455__delay_454__variable_183),
    .b(__delay_data_459__delay_458__delay_457__variable_184),
    .c(_cond_data_201),
    .d(__muladd_madd_odata_202)
  );

  reg [5-1:0] __delay_data_463__delay_462__delay_461____variable_185;
  reg [5-1:0] __delay_data_464__delay_463__delay_462____variable_185;
  reg [5-1:0] __delay_data_465__delay_464__delay_463____variable_185;
  reg [5-1:0] __delay_data_466__delay_465__delay_464____variable_185;
  reg signed [32-1:0] _sra_data_203;
  wire signed [32-1:0] mul_9_z_data;
  assign mul_9_z_data = _sra_data_203;
  wire signed [32-1:0] add_tree_3_var0_data;
  wire signed [32-1:0] add_tree_3_var1_data;
  reg __add_tree_3_stream_ivalid_1;
  reg signed [32-1:0] __plusn_data_51;
  wire signed [32-1:0] add_tree_3_sum_data;
  assign add_tree_3_sum_data = __plusn_data_51;
  wire signed [32-1:0] acc_1_x_data;
  wire [6-1:0] acc_1_rshift_data;
  wire [32-1:0] acc_1_size_data;
  wire [1-1:0] acc_1__reduce_reset_data;
  reg __acc_1_stream_ivalid_1;
  reg __acc_1_stream_ivalid_2;
  reg __acc_1_stream_ivalid_3;
  reg __acc_1_stream_ivalid_4;
  reg __acc_1_stream_ivalid_5;
  reg [1-1:0] _greaterthan_data_25;
  reg [6-1:0] _minus_data_27;
  reg signed [32-1:0] _reduceadd_data_38;
  reg [33-1:0] _reduceadd_count_38;
  reg _reduceadd_prev_count_max_38;
  wire _reduceadd_reset_cond_38;
  assign _reduceadd_reset_cond_38 = acc_1__reduce_reset_data || _reduceadd_prev_count_max_38;
  wire [33-1:0] _reduceadd_current_count_38;
  assign _reduceadd_current_count_38 = (_reduceadd_reset_cond_38)? 0 : _reduceadd_count_38;
  wire signed [32-1:0] _reduceadd_current_data_38;
  assign _reduceadd_current_data_38 = (_reduceadd_reset_cond_38)? 1'sd0 : _reduceadd_data_38;
  reg [1-1:0] _pulse_data_40;
  reg [33-1:0] _pulse_count_40;
  reg _pulse_prev_count_max_40;
  wire _pulse_reset_cond_40;
  assign _pulse_reset_cond_40 = acc_1__reduce_reset_data || _pulse_prev_count_max_40;
  wire [33-1:0] _pulse_current_count_40;
  assign _pulse_current_count_40 = (_pulse_reset_cond_40)? 0 : _pulse_count_40;
  wire [1-1:0] _pulse_current_data_40;
  assign _pulse_current_data_40 = (_pulse_reset_cond_40)? 1'sd0 : _pulse_data_40;
  reg [6-1:0] __delay_data_475__variable_23;
  reg signed [66-1:0] _sll_data_29;
  reg [1-1:0] __delay_data_472_greaterthan_25;
  reg signed [32-1:0] __delay_data_473_reduceadd_38;
  reg [6-1:0] __delay_data_476__delay_475__variable_23;
  reg [1-1:0] __delay_data_479_pulse_40;
  reg signed [32-1:0] _cond_data_35;
  reg signed [32-1:0] __delay_data_474__delay_473_reduceadd_38;
  reg [6-1:0] __delay_data_477__delay_476__delay_475__variable_23;
  reg [1-1:0] __delay_data_480__delay_479_pulse_40;
  reg signed [32-1:0] _plus_data_42;
  reg [6-1:0] __delay_data_478__delay_477__delay_476__delay_475__variable_23;
  reg [1-1:0] __delay_data_481__delay_480__delay_479_pulse_40;
  reg signed [32-1:0] _sra_data_43;
  reg [1-1:0] __delay_data_482__delay_481__delay_480__delay_479_pulse_40;
  wire signed [32-1:0] acc_1_sum_data;
  assign acc_1_sum_data = _sra_data_43;
  wire [1-1:0] acc_1_valid_data;
  assign acc_1_valid_data = __delay_data_482__delay_481__delay_480__delay_479_pulse_40;
  wire signed [32-1:0] mul_rshift_round_clip_5_x_data;
  wire signed [16-1:0] mul_rshift_round_clip_5_y_data;
  wire [6-1:0] mul_rshift_round_clip_5_rshift_data;
  reg __mul_rshift_round_clip_5_stream_ivalid_1;
  reg __mul_rshift_round_clip_5_stream_ivalid_2;
  reg __mul_rshift_round_clip_5_stream_ivalid_3;
  reg __mul_rshift_round_clip_5_stream_ivalid_4;
  reg __mul_rshift_round_clip_5_stream_ivalid_5;
  reg __mul_rshift_round_clip_5_stream_ivalid_6;
  reg __mul_rshift_round_clip_5_stream_ivalid_7;
  reg __mul_rshift_round_clip_5_stream_ivalid_8;
  wire signed [48-1:0] _times_mul_odata_89;
  reg signed [48-1:0] _times_mul_odata_reg_89;
  wire signed [48-1:0] _times_data_89;
  assign _times_data_89 = _times_mul_odata_reg_89;
  wire _times_mul_update_89;
  assign _times_mul_update_89 = _mul_rshift_round_clip_5_stream_oready;

  multiplier_1
  _times_mul_89
  (
    .CLK(CLK),
    .update(_times_mul_update_89),
    .a(mul_rshift_round_clip_5_x_data),
    .b(mul_rshift_round_clip_5_y_data),
    .c(_times_mul_odata_89)
  );

  wire [6-1:0] _minus_data_92;
  assign _minus_data_92 = mul_rshift_round_clip_5_rshift_data - 2'sd1;
  wire signed [66-1:0] _sll_data_95;
  assign _sll_data_95 = 2'sd1 << _minus_data_92;
  wire [1-1:0] _eq_data_107;
  assign _eq_data_107 = mul_rshift_round_clip_5_rshift_data == 1'sd0;
  reg signed [66-1:0] __delay_data_488_sll_95;
  reg [6-1:0] __delay_data_492__variable_88;
  reg [1-1:0] __delay_data_496_eq_107;
  reg signed [66-1:0] __delay_data_489__delay_488_sll_95;
  reg [6-1:0] __delay_data_493__delay_492__variable_88;
  reg [1-1:0] __delay_data_497__delay_496_eq_107;
  reg signed [66-1:0] __delay_data_490__delay_489__delay_488_sll_95;
  reg [6-1:0] __delay_data_494__delay_493__delay_492__variable_88;
  reg [1-1:0] __delay_data_498__delay_497__delay_496_eq_107;
  reg signed [66-1:0] __delay_data_491__delay_490__delay_489__delay_488_sll_95;
  reg [6-1:0] __delay_data_495__delay_494__delay_493__delay_492__variable_88;
  reg [1-1:0] __delay_data_499__delay_498__delay_497__delay_496_eq_107;
  wire [1-1:0] _pointer_data_90;
  assign _pointer_data_90 = _times_data_89[7'sd47];
  wire signed [2-1:0] _cond_data_102;
  assign _cond_data_102 = (_pointer_data_90)? -2'sd1 : 1'sd0;
  wire signed [49-1:0] _plus_data_103;
  assign _plus_data_103 = _times_data_89 + __delay_data_491__delay_490__delay_489__delay_488_sll_95;
  wire signed [49-1:0] _plus_data_104;
  assign _plus_data_104 = _plus_data_103 + _cond_data_102;
  wire signed [48-1:0] _sra_data_105;
  assign _sra_data_105 = _plus_data_104 >>> __delay_data_495__delay_494__delay_493__delay_492__variable_88;
  reg signed [48-1:0] _cond_data_108;
  reg [1-1:0] _greaterthan_data_109;
  reg [1-1:0] _lessthan_data_113;
  reg [1-1:0] _greatereq_data_117;
  reg signed [48-1:0] __delay_data_500_cond_108;
  reg signed [48-1:0] _cond_data_111;
  reg signed [48-1:0] _cond_data_115;
  reg [1-1:0] __delay_data_501_greatereq_117;
  reg signed [16-1:0] _cond_data_119;
  wire signed [16-1:0] mul_rshift_round_clip_5_z_data;
  assign mul_rshift_round_clip_5_z_data = _cond_data_119;
  reg [33-1:0] _stream_matmul_5_sink_33_sink_count;
  reg [5-1:0] _stream_matmul_5_sink_33_sink_mode;
  reg [16-1:0] _stream_matmul_5_sink_33_sink_generator_id;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_offset;
  reg [33-1:0] _stream_matmul_5_sink_33_sink_size;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_stride;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_offset_buf;
  reg [33-1:0] _stream_matmul_5_sink_33_sink_size_buf;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_stride_buf;
  reg [8-1:0] _stream_matmul_5_sink_33_sink_sel;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_waddr;
  reg _stream_matmul_5_sink_33_sink_wenable;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_wdata;
  reg _stream_matmul_5_sink_33_sink_fifo_enq;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_fifo_wdata;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_immediate;
  reg [33-1:0] _stream_matmul_5_sink_34_sink_count;
  reg [5-1:0] _stream_matmul_5_sink_34_sink_mode;
  reg [16-1:0] _stream_matmul_5_sink_34_sink_generator_id;
  reg [32-1:0] _stream_matmul_5_sink_34_sink_offset;
  reg [33-1:0] _stream_matmul_5_sink_34_sink_size;
  reg [32-1:0] _stream_matmul_5_sink_34_sink_stride;
  reg [32-1:0] _stream_matmul_5_sink_34_sink_offset_buf;
  reg [33-1:0] _stream_matmul_5_sink_34_sink_size_buf;
  reg [32-1:0] _stream_matmul_5_sink_34_sink_stride_buf;
  reg [8-1:0] _stream_matmul_5_sink_34_sink_sel;
  reg [32-1:0] _stream_matmul_5_sink_34_sink_waddr;
  reg _stream_matmul_5_sink_34_sink_wenable;
  reg [1-1:0] _stream_matmul_5_sink_34_sink_wdata;
  reg _stream_matmul_5_sink_34_sink_fifo_enq;
  reg [1-1:0] _stream_matmul_5_sink_34_sink_fifo_wdata;
  reg [1-1:0] _stream_matmul_5_sink_34_sink_immediate;
  reg [32-1:0] main_fsm;
  localparam main_fsm_init = 0;
  reg [32-1:0] internal_state_counter;
  reg [32-1:0] transpose_14_objaddr;
  reg [32-1:0] transpose_14_arg_objaddr_0;
  reg [32-1:0] control_transpose_14;
  localparam control_transpose_14_init = 0;
  reg _control_transpose_14_called;
  reg [32-1:0] _tmp_54;
  reg [32-1:0] _tmp_55;
  reg [32-1:0] _tmp_56;
  reg [32-1:0] _tmp_57;
  reg [32-1:0] _tmp_58;
  wire [5-1:0] _dma_read_packed_high_local_size_59;
  assign _dma_read_packed_high_local_size_59 = 5;
  wire [1-1:0] _dma_read_packed_low_local_size_60;
  assign _dma_read_packed_low_local_size_60 = 10 & { 1{ 1'd1 } };
  wire [5-1:0] _dma_read_packed_local_packed_size_61;
  assign _dma_read_packed_local_packed_size_61 = (_dma_read_packed_low_local_size_60 > 0)? _dma_read_packed_high_local_size_59 + 1 : _dma_read_packed_high_local_size_59;
  wire [32-1:0] mask_addr_shifted_62;
  assign mask_addr_shifted_62 = transpose_14_arg_objaddr_0 + _tmp_54 + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_63;
  assign mask_addr_masked_63 = mask_addr_shifted_62 << 2;
  reg [32-1:0] _maxi_read_req_fsm;
  localparam _maxi_read_req_fsm_init = 0;
  reg [33-1:0] _maxi_read_cur_global_size;
  reg _maxi_read_cont;
  wire [8-1:0] pack_read_req_op_sel_64;
  wire [32-1:0] pack_read_req_local_addr_65;
  wire [32-1:0] pack_read_req_local_stride_66;
  wire [33-1:0] pack_read_req_local_size_67;
  wire [32-1:0] pack_read_req_local_blocksize_68;
  assign pack_read_req_op_sel_64 = _maxi_read_op_sel;
  assign pack_read_req_local_addr_65 = _maxi_read_local_addr;
  assign pack_read_req_local_stride_66 = _maxi_read_local_stride;
  assign pack_read_req_local_size_67 = _maxi_read_local_size;
  assign pack_read_req_local_blocksize_68 = _maxi_read_local_blocksize;
  wire [137-1:0] pack_read_req_packed_69;
  assign pack_read_req_packed_69 = { pack_read_req_op_sel_64, pack_read_req_local_addr_65, pack_read_req_local_stride_66, pack_read_req_local_size_67, pack_read_req_local_blocksize_68 };
  assign _maxi_read_req_fifo_wdata = ((_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full)? pack_read_req_packed_69 : 'hx;
  assign _maxi_read_req_fifo_enq = ((_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full)? (_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full && !_maxi_read_req_fifo_almost_full : 0;
  localparam _tmp_70 = 1;
  wire [_tmp_70-1:0] _tmp_71;
  assign _tmp_71 = !_maxi_read_req_fifo_almost_full;
  reg [_tmp_70-1:0] __tmp_71_1;
  wire [32-1:0] mask_addr_shifted_72;
  assign mask_addr_shifted_72 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_73;
  assign mask_addr_masked_73 = mask_addr_shifted_72 << 2;
  wire [32-1:0] mask_addr_shifted_74;
  assign mask_addr_shifted_74 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_75;
  assign mask_addr_masked_75 = mask_addr_shifted_74 << 2;
  wire [32-1:0] mask_addr_shifted_76;
  assign mask_addr_shifted_76 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_77;
  assign mask_addr_masked_77 = mask_addr_shifted_76 << 2;
  wire [32-1:0] mask_addr_shifted_78;
  assign mask_addr_shifted_78 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_79;
  assign mask_addr_masked_79 = mask_addr_shifted_78 << 2;
  wire [32-1:0] mask_addr_shifted_80;
  assign mask_addr_shifted_80 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_81;
  assign mask_addr_masked_81 = mask_addr_shifted_80 << 2;
  wire [32-1:0] mask_addr_shifted_82;
  assign mask_addr_shifted_82 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_83;
  assign mask_addr_masked_83 = mask_addr_shifted_82 << 2;
  reg _maxi_raddr_cond_0_1;
  reg [32-1:0] _maxi_read_data_fsm;
  localparam _maxi_read_data_fsm_init = 0;
  reg [32-1:0] write_burst_packed_fsm_0;
  localparam write_burst_packed_fsm_0_init = 0;
  reg [10-1:0] write_burst_packed_addr_84;
  reg [10-1:0] write_burst_packed_stride_85;
  reg [33-1:0] write_burst_packed_length_86;
  reg write_burst_packed_done_87;
  wire [9-1:0] write_burst_packed_ram_addr_88;
  assign write_burst_packed_ram_addr_88 = write_burst_packed_addr_84 >> 1;
  wire [16-1:0] write_burst_packed_ram_wdata_89;
  assign write_burst_packed_ram_wdata_89 = _maxi_rdata_sb_0 >> 0;
  assign ram_w16_l1024_id0_0_1_addr = ((write_burst_packed_fsm_0 == 1) && _maxi_rvalid_sb_0)? write_burst_packed_ram_addr_88 : 'hx;
  assign ram_w16_l1024_id0_0_1_wdata = ((write_burst_packed_fsm_0 == 1) && _maxi_rvalid_sb_0)? write_burst_packed_ram_wdata_89 : 'hx;
  assign ram_w16_l1024_id0_0_1_wenable = ((write_burst_packed_fsm_0 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  assign ram_w16_l1024_id0_0_1_enable = ((write_burst_packed_fsm_0 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  wire [9-1:0] write_burst_packed_ram_addr_90;
  assign write_burst_packed_ram_addr_90 = write_burst_packed_addr_84 >> 1;
  wire [16-1:0] write_burst_packed_ram_wdata_91;
  assign write_burst_packed_ram_wdata_91 = _maxi_rdata_sb_0 >> 16;
  assign ram_w16_l1024_id0_1_1_addr = ((write_burst_packed_fsm_0 == 1) && _maxi_rvalid_sb_0)? write_burst_packed_ram_addr_90 : 'hx;
  assign ram_w16_l1024_id0_1_1_wdata = ((write_burst_packed_fsm_0 == 1) && _maxi_rvalid_sb_0)? write_burst_packed_ram_wdata_91 : 'hx;
  assign ram_w16_l1024_id0_1_1_wenable = ((write_burst_packed_fsm_0 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  assign ram_w16_l1024_id0_1_1_enable = ((write_burst_packed_fsm_0 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  wire [32-1:0] _dma_read_packed_high_local_size_92;
  assign _dma_read_packed_high_local_size_92 = 1 >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_93;
  assign _dma_read_packed_low_local_size_93 = 1 & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_94;
  assign _dma_read_packed_local_packed_size_94 = (_dma_read_packed_low_local_size_93 > 0)? _dma_read_packed_high_local_size_92 + 1 : _dma_read_packed_high_local_size_92;
  wire [32-1:0] mask_addr_shifted_95;
  assign mask_addr_shifted_95 = transpose_14_objaddr + _tmp_55 + _tmp_56 + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_96;
  assign mask_addr_masked_96 = mask_addr_shifted_95 << 2;
  reg [32-1:0] write_burst_packed_fsm_1;
  localparam write_burst_packed_fsm_1_init = 0;
  reg [10-1:0] write_burst_packed_addr_97;
  reg [10-1:0] write_burst_packed_stride_98;
  reg [33-1:0] write_burst_packed_length_99;
  reg write_burst_packed_done_100;
  wire [9-1:0] write_burst_packed_ram_addr_101;
  assign write_burst_packed_ram_addr_101 = write_burst_packed_addr_97 >> 1;
  wire [16-1:0] write_burst_packed_ram_wdata_102;
  assign write_burst_packed_ram_wdata_102 = _maxi_rdata_sb_0 >> 0;
  assign ram_w16_l1024_id1_0_1_wdata = ((write_burst_packed_fsm_1 == 1) && _maxi_rvalid_sb_0)? write_burst_packed_ram_wdata_102 : 'hx;
  assign ram_w16_l1024_id1_0_1_wenable = ((write_burst_packed_fsm_1 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  wire [9-1:0] write_burst_packed_ram_addr_103;
  assign write_burst_packed_ram_addr_103 = write_burst_packed_addr_97 >> 1;
  wire [16-1:0] write_burst_packed_ram_wdata_104;
  assign write_burst_packed_ram_wdata_104 = _maxi_rdata_sb_0 >> 16;
  assign ram_w16_l1024_id1_1_1_wdata = ((write_burst_packed_fsm_1 == 1) && _maxi_rvalid_sb_0)? write_burst_packed_ram_wdata_104 : 'hx;
  assign ram_w16_l1024_id1_1_1_wenable = ((write_burst_packed_fsm_1 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  wire [1-1:0] read_rtl_bank_105;
  assign read_rtl_bank_105 = _tmp_57;
  reg [1-1:0] _tmp_106;
  localparam _tmp_107 = 1;
  wire [_tmp_107-1:0] _tmp_108;
  assign _tmp_108 = control_transpose_14 == 7;
  reg [_tmp_107-1:0] __tmp_108_1;
  localparam _tmp_109 = 1;
  wire [_tmp_109-1:0] _tmp_110;
  assign _tmp_110 = control_transpose_14 == 7;
  reg [_tmp_109-1:0] __tmp_110_1;
  wire signed [16-1:0] read_rtl_rdata_111;
  wire read_rtl_rvalid_112;
  assign read_rtl_rdata_111 = (_tmp_106 == 0)? ram_w16_l1024_id0_0_0_rdata : 
                              (_tmp_106 == 1)? ram_w16_l1024_id0_1_0_rdata : 0;
  assign read_rtl_rvalid_112 = __tmp_108_1;
  reg signed [16-1:0] read_rdata_113;
  wire [1-1:0] _tmp_114;
  assign _tmp_114 = transpose_14_objaddr + _tmp_55 + _tmp_56 >> 1;
  wire [1-1:0] write_rtl_bank_115;
  assign write_rtl_bank_115 = _tmp_114;
  wire [32-1:0] _dma_write_packed_high_local_size_116;
  assign _dma_write_packed_high_local_size_116 = 1 >> 1;
  wire [1-1:0] _dma_write_packed_low_local_size_117;
  assign _dma_write_packed_low_local_size_117 = 1 & { 1{ 1'd1 } };
  wire [32-1:0] _dma_write_packed_local_packed_size_118;
  assign _dma_write_packed_local_packed_size_118 = (_dma_write_packed_low_local_size_117 > 0)? _dma_write_packed_high_local_size_116 + 1 : _dma_write_packed_high_local_size_116;
  wire [32-1:0] mask_addr_shifted_119;
  assign mask_addr_shifted_119 = transpose_14_objaddr + _tmp_55 + _tmp_56 + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_120;
  assign mask_addr_masked_120 = mask_addr_shifted_119 << 2;
  reg [32-1:0] _maxi_write_req_fsm;
  localparam _maxi_write_req_fsm_init = 0;
  reg [33-1:0] _maxi_write_cur_global_size;
  reg _maxi_write_cont;
  wire [8-1:0] pack_write_req_op_sel_121;
  wire [32-1:0] pack_write_req_local_addr_122;
  wire [32-1:0] pack_write_req_local_stride_123;
  wire [33-1:0] pack_write_req_size_124;
  wire [32-1:0] pack_write_req_local_blocksize_125;
  assign pack_write_req_op_sel_121 = _maxi_write_op_sel;
  assign pack_write_req_local_addr_122 = _maxi_write_local_addr;
  assign pack_write_req_local_stride_123 = _maxi_write_local_stride;
  assign pack_write_req_size_124 = _maxi_write_local_size;
  assign pack_write_req_local_blocksize_125 = _maxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_126;
  assign pack_write_req_packed_126 = { pack_write_req_op_sel_121, pack_write_req_local_addr_122, pack_write_req_local_stride_123, pack_write_req_size_124, pack_write_req_local_blocksize_125 };
  localparam _tmp_127 = 1;
  wire [_tmp_127-1:0] _tmp_128;
  assign _tmp_128 = !_maxi_write_req_fifo_almost_full;
  reg [_tmp_127-1:0] __tmp_128_1;
  wire [32-1:0] mask_addr_shifted_129;
  assign mask_addr_shifted_129 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_130;
  assign mask_addr_masked_130 = mask_addr_shifted_129 << 2;
  wire [32-1:0] mask_addr_shifted_131;
  assign mask_addr_shifted_131 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_132;
  assign mask_addr_masked_132 = mask_addr_shifted_131 << 2;
  wire [32-1:0] mask_addr_shifted_133;
  assign mask_addr_shifted_133 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_134;
  assign mask_addr_masked_134 = mask_addr_shifted_133 << 2;
  wire [32-1:0] mask_addr_shifted_135;
  assign mask_addr_shifted_135 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_136;
  assign mask_addr_masked_136 = mask_addr_shifted_135 << 2;
  wire [32-1:0] mask_addr_shifted_137;
  assign mask_addr_shifted_137 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_138;
  assign mask_addr_masked_138 = mask_addr_shifted_137 << 2;
  wire [32-1:0] mask_addr_shifted_139;
  assign mask_addr_shifted_139 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_140;
  assign mask_addr_masked_140 = mask_addr_shifted_139 << 2;
  wire [8-1:0] pack_write_req_op_sel_141;
  wire [32-1:0] pack_write_req_local_addr_142;
  wire [32-1:0] pack_write_req_local_stride_143;
  wire [33-1:0] pack_write_req_size_144;
  wire [32-1:0] pack_write_req_local_blocksize_145;
  assign pack_write_req_op_sel_141 = _maxi_write_op_sel;
  assign pack_write_req_local_addr_142 = _maxi_write_local_addr;
  assign pack_write_req_local_stride_143 = _maxi_write_local_stride;
  assign pack_write_req_size_144 = _maxi_write_cur_global_size;
  assign pack_write_req_local_blocksize_145 = _maxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_146;
  assign pack_write_req_packed_146 = { pack_write_req_op_sel_141, pack_write_req_local_addr_142, pack_write_req_local_stride_143, pack_write_req_size_144, pack_write_req_local_blocksize_145 };
  assign _maxi_write_req_fifo_wdata = ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6))? pack_write_req_packed_146 : 
                                      ((_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full)? pack_write_req_packed_126 : 'hx;
  assign _maxi_write_req_fifo_enq = ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6))? (_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6) && !_maxi_write_req_fifo_almost_full : 
                                    ((_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full)? (_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full && !_maxi_write_req_fifo_almost_full : 0;
  localparam _tmp_147 = 1;
  wire [_tmp_147-1:0] _tmp_148;
  assign _tmp_148 = !_maxi_write_req_fifo_almost_full;
  reg [_tmp_147-1:0] __tmp_148_1;
  reg _maxi_waddr_cond_0_1;
  reg [32-1:0] _maxi_write_data_fsm;
  localparam _maxi_write_data_fsm_init = 0;
  reg [32-1:0] read_burst_packed_fsm_2;
  localparam read_burst_packed_fsm_2_init = 0;
  reg [10-1:0] read_burst_packed_addr_149;
  reg [10-1:0] read_burst_packed_stride_150;
  reg [33-1:0] read_burst_packed_length_151;
  reg read_burst_packed_rvalid_152;
  reg read_burst_packed_rlast_153;
  wire [9-1:0] read_burst_packed_ram_addr_154;
  assign read_burst_packed_ram_addr_154 = read_burst_packed_addr_149 >> 1;
  assign ram_w16_l1024_id1_0_1_addr = ((read_burst_packed_fsm_2 == 1) && (!read_burst_packed_rvalid_152 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? read_burst_packed_ram_addr_154 : 
                                      ((write_burst_packed_fsm_1 == 1) && _maxi_rvalid_sb_0)? write_burst_packed_ram_addr_101 : 'hx;
  assign ram_w16_l1024_id1_0_1_enable = ((read_burst_packed_fsm_2 == 1) && (!read_burst_packed_rvalid_152 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? 1'd1 : 
                                        ((write_burst_packed_fsm_1 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  localparam _tmp_155 = 1;
  wire [_tmp_155-1:0] _tmp_156;
  assign _tmp_156 = (read_burst_packed_fsm_2 == 1) && (!read_burst_packed_rvalid_152 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0));
  reg [_tmp_155-1:0] __tmp_156_1;
  wire [16-1:0] read_burst_packed_ram_rdata_157;
  assign read_burst_packed_ram_rdata_157 = ram_w16_l1024_id1_0_1_rdata;
  wire [9-1:0] read_burst_packed_ram_addr_158;
  assign read_burst_packed_ram_addr_158 = read_burst_packed_addr_149 >> 1;
  assign ram_w16_l1024_id1_1_1_addr = ((read_burst_packed_fsm_2 == 1) && (!read_burst_packed_rvalid_152 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? read_burst_packed_ram_addr_158 : 
                                      ((write_burst_packed_fsm_1 == 1) && _maxi_rvalid_sb_0)? write_burst_packed_ram_addr_103 : 'hx;
  assign ram_w16_l1024_id1_1_1_enable = ((read_burst_packed_fsm_2 == 1) && (!read_burst_packed_rvalid_152 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? 1'd1 : 
                                        ((write_burst_packed_fsm_1 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  localparam _tmp_159 = 1;
  wire [_tmp_159-1:0] _tmp_160;
  assign _tmp_160 = (read_burst_packed_fsm_2 == 1) && (!read_burst_packed_rvalid_152 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0));
  reg [_tmp_159-1:0] __tmp_160_1;
  wire [16-1:0] read_burst_packed_ram_rdata_161;
  assign read_burst_packed_ram_rdata_161 = ram_w16_l1024_id1_1_1_rdata;
  wire [32-1:0] read_burst_packed_rdata_162;
  assign read_burst_packed_rdata_162 = { read_burst_packed_ram_rdata_161, read_burst_packed_ram_rdata_157 };
  reg _maxi_wdata_cond_0_1;
  reg [32-1:0] _lazy_reshape_1_objaddr;
  reg [32-1:0] _lazy_reshape_1_arg_objaddr_0;
  reg [32-1:0] control__lazy_reshape_1;
  localparam control__lazy_reshape_1_init = 0;
  reg _control__lazy_reshape_1_called;
  reg [32-1:0] _lazy_reshape_1_total_count;
  reg [32-1:0] _lazy_reshape_1_in_offset;
  reg [32-1:0] _lazy_reshape_1_out_offset;
  reg [32-1:0] _lazy_reshape_1_count_read;
  reg [32-1:0] _lazy_reshape_1_count_copy;
  reg [32-1:0] _lazy_reshape_1_count_write;
  reg [32-1:0] _lazy_reshape_1_copy_src;
  reg [32-1:0] _lazy_reshape_1_copy_dst;
  reg [32-1:0] _lazy_reshape_1_copy_size;
  wire [1-1:0] _dma_read_packed_high_local_size_163;
  assign _dma_read_packed_high_local_size_163 = cparam__lazy_reshape_1_read_size >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_164;
  assign _dma_read_packed_low_local_size_164 = cparam__lazy_reshape_1_read_size & { 1{ 1'd1 } };
  wire [1-1:0] _dma_read_packed_local_packed_size_165;
  assign _dma_read_packed_local_packed_size_165 = (_dma_read_packed_low_local_size_164 > 0)? _dma_read_packed_high_local_size_163 + 1 : _dma_read_packed_high_local_size_163;
  wire [32-1:0] mask_addr_shifted_166;
  assign mask_addr_shifted_166 = _lazy_reshape_1_arg_objaddr_0 + _lazy_reshape_1_in_offset + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_167;
  assign mask_addr_masked_167 = mask_addr_shifted_166 << 2;
  wire signed [16-1:0] stream__lazy_reshape_1_source_0_data;
  wire signed [16-1:0] stream__lazy_reshape_1_sink_1_data;
  assign stream__lazy_reshape_1_sink_1_data = stream__lazy_reshape_1_source_0_data;
  wire _set_flag_168;
  assign _set_flag_168 = control__lazy_reshape_1 == 7;
  wire [1-1:0] read_rtl_bank_169;
  assign read_rtl_bank_169 = _stream__lazy_reshape_1_source_0_source_ram_raddr;
  reg [1-1:0] _tmp_170;
  assign ram_w16_l1024_id0_0_0_addr = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_source_0_source_ram_renable && (_stream__lazy_reshape_1_source_0_source_sel == 1))? _stream__lazy_reshape_1_source_0_source_ram_raddr >> 1 : 
                                      (control_transpose_14 == 7)? _tmp_57 >> 1 : 'hx;
  assign ram_w16_l1024_id0_0_0_enable = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_source_0_source_ram_renable && (_stream__lazy_reshape_1_source_0_source_sel == 1))? 1'd1 : 
                                        (control_transpose_14 == 7)? 1'd1 : 0;
  localparam _tmp_171 = 1;
  wire [_tmp_171-1:0] _tmp_172;
  assign _tmp_172 = _stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_source_0_source_ram_renable && (_stream__lazy_reshape_1_source_0_source_sel == 1);
  reg [_tmp_171-1:0] __tmp_172_1;
  assign ram_w16_l1024_id0_1_0_addr = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_source_0_source_ram_renable && (_stream__lazy_reshape_1_source_0_source_sel == 1))? _stream__lazy_reshape_1_source_0_source_ram_raddr >> 1 : 
                                      (control_transpose_14 == 7)? _tmp_57 >> 1 : 'hx;
  assign ram_w16_l1024_id0_1_0_enable = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_source_0_source_ram_renable && (_stream__lazy_reshape_1_source_0_source_sel == 1))? 1'd1 : 
                                        (control_transpose_14 == 7)? 1'd1 : 0;
  localparam _tmp_173 = 1;
  wire [_tmp_173-1:0] _tmp_174;
  assign _tmp_174 = _stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_source_0_source_ram_renable && (_stream__lazy_reshape_1_source_0_source_sel == 1);
  reg [_tmp_173-1:0] __tmp_174_1;
  wire signed [16-1:0] read_rtl_rdata_175;
  wire read_rtl_rvalid_176;
  assign read_rtl_rdata_175 = (_tmp_170 == 0)? ram_w16_l1024_id0_0_0_rdata : 
                              (_tmp_170 == 1)? ram_w16_l1024_id0_1_0_rdata : 0;
  assign read_rtl_rvalid_176 = __tmp_172_1;
  assign _stream__lazy_reshape_1_source_0_source_ram_rdata = (_stream__lazy_reshape_1_source_0_source_sel == 1)? read_rtl_rdata_175 : 'hx;
  reg signed [16-1:0] __variable_wdata_204;
  assign stream__lazy_reshape_1_source_0_data = __variable_wdata_204;
  reg [32-1:0] _stream__lazy_reshape_1_source_0_source_fsm_0;
  localparam _stream__lazy_reshape_1_source_0_source_fsm_0_init = 0;
  wire _set_flag_177;
  assign _set_flag_177 = control__lazy_reshape_1 == 7;
  reg _tmp_178;
  reg _tmp_179;
  reg [32-1:0] _tmp_180;
  reg [32-1:0] _tmp_181;
  reg [32-1:0] _tmp_182;
  reg [32-1:0] _tmp_183;
  wire [1-1:0] write_rtl_bank_184;
  assign write_rtl_bank_184 = _stream__lazy_reshape_1_sink_1_sink_waddr;
  assign ram_w16_l1024_id1_0_0_addr = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_sink_1_sink_wenable && (_stream__lazy_reshape_1_sink_1_sink_sel == 2) && (write_rtl_bank_184 == 0))? _stream__lazy_reshape_1_sink_1_sink_waddr >> 1 : 
                                      ((control_transpose_14 == 8) && (write_rtl_bank_115 == 0))? _tmp_114 >> 1 : 'hx;
  assign ram_w16_l1024_id1_0_0_wdata = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_sink_1_sink_wenable && (_stream__lazy_reshape_1_sink_1_sink_sel == 2) && (write_rtl_bank_184 == 0))? _stream__lazy_reshape_1_sink_1_sink_wdata : 
                                       ((control_transpose_14 == 8) && (write_rtl_bank_115 == 0))? read_rdata_113 : 'hx;
  assign ram_w16_l1024_id1_0_0_wenable = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_sink_1_sink_wenable && (_stream__lazy_reshape_1_sink_1_sink_sel == 2) && (write_rtl_bank_184 == 0))? 1'd1 : 
                                         ((control_transpose_14 == 8) && (write_rtl_bank_115 == 0))? 1'd1 : 0;
  assign ram_w16_l1024_id1_0_0_enable = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_sink_1_sink_wenable && (_stream__lazy_reshape_1_sink_1_sink_sel == 2) && (write_rtl_bank_184 == 0))? 1'd1 : 
                                        ((control_transpose_14 == 8) && (write_rtl_bank_115 == 0))? 1'd1 : 0;
  assign ram_w16_l1024_id1_1_0_addr = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_sink_1_sink_wenable && (_stream__lazy_reshape_1_sink_1_sink_sel == 2) && (write_rtl_bank_184 == 1))? _stream__lazy_reshape_1_sink_1_sink_waddr >> 1 : 
                                      ((control_transpose_14 == 8) && (write_rtl_bank_115 == 1))? _tmp_114 >> 1 : 'hx;
  assign ram_w16_l1024_id1_1_0_wdata = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_sink_1_sink_wenable && (_stream__lazy_reshape_1_sink_1_sink_sel == 2) && (write_rtl_bank_184 == 1))? _stream__lazy_reshape_1_sink_1_sink_wdata : 
                                       ((control_transpose_14 == 8) && (write_rtl_bank_115 == 1))? read_rdata_113 : 'hx;
  assign ram_w16_l1024_id1_1_0_wenable = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_sink_1_sink_wenable && (_stream__lazy_reshape_1_sink_1_sink_sel == 2) && (write_rtl_bank_184 == 1))? 1'd1 : 
                                         ((control_transpose_14 == 8) && (write_rtl_bank_115 == 1))? 1'd1 : 0;
  assign ram_w16_l1024_id1_1_0_enable = (_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_sink_1_sink_wenable && (_stream__lazy_reshape_1_sink_1_sink_sel == 2) && (write_rtl_bank_184 == 1))? 1'd1 : 
                                        ((control_transpose_14 == 8) && (write_rtl_bank_115 == 1))? 1'd1 : 0;
  reg [32-1:0] _stream__lazy_reshape_1_sink_1_sink_fsm_1;
  localparam _stream__lazy_reshape_1_sink_1_sink_fsm_1_init = 0;
  wire _set_flag_185;
  assign _set_flag_185 = control__lazy_reshape_1 == 8;
  assign _stream__lazy_reshape_1_run_flag = (_set_flag_185)? 1 : 0;
  reg _tmp_186;
  reg _tmp_187;
  reg _tmp_188;
  assign _stream__lazy_reshape_1_source_stop = _stream__lazy_reshape_1_stream_oready && (_stream__lazy_reshape_1_source_0_idle && (_stream__lazy_reshape_1_fsm == 3));
  localparam _tmp_189 = 1;
  wire [_tmp_189-1:0] _tmp_190;
  assign _tmp_190 = _stream__lazy_reshape_1_source_0_idle && (_stream__lazy_reshape_1_fsm == 3);
  reg [_tmp_189-1:0] _tmp_191;
  reg _tmp_192;
  reg _tmp_193;
  assign _stream__lazy_reshape_1_sink_start = _tmp_193;
  reg _tmp_194;
  reg _tmp_195;
  assign _stream__lazy_reshape_1_sink_stop = _tmp_195;
  reg _tmp_196;
  reg _tmp_197;
  assign _stream__lazy_reshape_1_sink_busy = _tmp_197;
  reg _tmp_198;
  assign _stream__lazy_reshape_1_busy = _stream__lazy_reshape_1_source_busy || _stream__lazy_reshape_1_sink_busy || _stream__lazy_reshape_1_busy_reg;
  wire [10-1:0] _dma_write_packed_high_local_size_199;
  assign _dma_write_packed_high_local_size_199 = cparam__lazy_reshape_1_write_size >> 1;
  wire [1-1:0] _dma_write_packed_low_local_size_200;
  assign _dma_write_packed_low_local_size_200 = cparam__lazy_reshape_1_write_size & { 1{ 1'd1 } };
  wire [10-1:0] _dma_write_packed_local_packed_size_201;
  assign _dma_write_packed_local_packed_size_201 = (_dma_write_packed_low_local_size_200 > 0)? _dma_write_packed_high_local_size_199 + 1 : _dma_write_packed_high_local_size_199;
  wire [32-1:0] mask_addr_shifted_202;
  assign mask_addr_shifted_202 = _lazy_reshape_1_objaddr + _lazy_reshape_1_out_offset + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_203;
  assign mask_addr_masked_203 = mask_addr_shifted_202 << 2;
  reg [32-1:0] matmul_5_objaddr;
  reg [32-1:0] matmul_5_arg_objaddr_0;
  reg [32-1:0] matmul_5_arg_objaddr_1;
  reg [32-1:0] matmul_5_arg_objaddr_2;
  reg [32-1:0] control_matmul_5;
  localparam control_matmul_5_init = 0;
  reg _control_matmul_5_called;
  wire signed [32-1:0] matmul_5_act_base_offset;
  reg signed [32-1:0] matmul_5_act_base_offset_row;
  reg signed [32-1:0] matmul_5_act_base_offset_bat;
  assign matmul_5_act_base_offset = matmul_5_act_base_offset_row + matmul_5_act_base_offset_bat;
  reg signed [32-1:0] matmul_5_filter_base_offset;
  reg [32-1:0] matmul_5_next_stream_num_ops;
  wire signed [32-1:0] matmul_5_out_base_offset;
  reg signed [32-1:0] matmul_5_out_base_offset_val;
  reg signed [32-1:0] matmul_5_out_base_offset_col;
  reg signed [32-1:0] matmul_5_out_base_offset_row;
  reg signed [32-1:0] matmul_5_out_base_offset_bat;
  reg signed [32-1:0] matmul_5_out_base_offset_och;
  assign matmul_5_out_base_offset = matmul_5_out_base_offset_val + matmul_5_out_base_offset_col + matmul_5_out_base_offset_row + matmul_5_out_base_offset_bat + matmul_5_out_base_offset_och;
  reg matmul_5_dma_flag_0;
  reg [32-1:0] matmul_5_sync_comp_count;
  reg [32-1:0] matmul_5_sync_out_count;
  reg [32-1:0] matmul_5_write_count;
  reg [32-1:0] matmul_5_next_out_write_size;
  reg [32-1:0] matmul_5_col_count;
  reg [32-1:0] matmul_5_row_count;
  reg [32-1:0] matmul_5_bat_count;
  reg [32-1:0] matmul_5_och_count;
  reg [1-1:0] matmul_5_col_select;
  reg [1-1:0] matmul_5_row_select;
  reg [32-1:0] matmul_5_out_col_count;
  reg [32-1:0] matmul_5_out_row_count;
  reg [32-1:0] matmul_5_out_ram_select;
  reg [32-1:0] matmul_5_prev_col_count;
  reg [32-1:0] matmul_5_prev_row_count;
  reg [32-1:0] matmul_5_prev_bat_count;
  reg [32-1:0] matmul_5_prev_och_count;
  reg [1-1:0] matmul_5_prev_row_select;
  reg [32-1:0] matmul_5_stream_act_local_0;
  reg [32-1:0] matmul_5_stream_out_local_val;
  reg [32-1:0] matmul_5_stream_out_local_col;
  wire [32-1:0] matmul_5_stream_out_local;
  assign matmul_5_stream_out_local = matmul_5_stream_out_local_val + matmul_5_stream_out_local_col;
  reg [32-1:0] matmul_5_act_page_comp_offset_0;
  reg [32-1:0] matmul_5_act_page_dma_offset_0;
  reg [32-1:0] matmul_5_filter_page_comp_offset;
  reg [32-1:0] matmul_5_filter_page_dma_offset;
  reg matmul_5_out_page;
  reg [32-1:0] matmul_5_out_page_comp_offset;
  reg [32-1:0] matmul_5_out_page_dma_offset;
  reg [32-1:0] matmul_5_out_laddr_offset;
  reg matmul_5_skip_read_filter;
  reg matmul_5_skip_read_act;
  reg matmul_5_skip_comp;
  reg matmul_5_skip_write_out;
  wire [32-1:0] mask_addr_shifted_204;
  assign mask_addr_shifted_204 = matmul_5_arg_objaddr_2 + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_205;
  assign mask_addr_masked_205 = mask_addr_shifted_204 << 2;
  reg [32-1:0] write_burst_fsm_3;
  localparam write_burst_fsm_3_init = 0;
  reg [7-1:0] write_burst_addr_206;
  reg [7-1:0] write_burst_stride_207;
  reg [33-1:0] write_burst_length_208;
  reg write_burst_done_209;
  assign ram_w32_l128_id1_1_addr = ((write_burst_fsm_3 == 1) && _maxi_rvalid_sb_0)? write_burst_addr_206 : 'hx;
  assign ram_w32_l128_id1_1_wdata = ((write_burst_fsm_3 == 1) && _maxi_rvalid_sb_0)? _maxi_rdata_sb_0 : 'hx;
  assign ram_w32_l128_id1_1_wenable = ((write_burst_fsm_3 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  assign ram_w32_l128_id1_1_enable = ((write_burst_fsm_3 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_210;
  assign mask_addr_shifted_210 = matmul_5_arg_objaddr_1 + matmul_5_filter_base_offset + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_211;
  assign mask_addr_masked_211 = mask_addr_shifted_210 << 2;
  wire write_burst_block_ram_wvalid_212;
  wire write_burst_block_ram_wquit_213;
  reg [32-1:0] write_burst_fsm_4;
  localparam write_burst_fsm_4_init = 0;
  reg [10-1:0] write_burst_addr_214;
  reg [10-1:0] write_burst_stride_215;
  reg [33-1:0] write_burst_length_216;
  reg write_burst_done_217;
  assign ram_w32_l1024_id0_1_addr = ((write_burst_fsm_4 == 1) && write_burst_block_ram_wvalid_212)? write_burst_addr_214 : 'hx;
  assign ram_w32_l1024_id0_1_wdata = ((write_burst_fsm_4 == 1) && write_burst_block_ram_wvalid_212)? _maxi_rdata_sb_0 : 'hx;
  assign ram_w32_l1024_id0_1_wenable = ((write_burst_fsm_4 == 1) && write_burst_block_ram_wvalid_212)? 1'd1 : 0;
  assign ram_w32_l1024_id0_1_enable = ((write_burst_fsm_4 == 1) && write_burst_block_ram_wvalid_212)? 1'd1 : 0;
  wire write_burst_block_ram_wvalid_218;
  wire write_burst_block_ram_wquit_219;
  reg [32-1:0] write_burst_fsm_5;
  localparam write_burst_fsm_5_init = 0;
  reg [10-1:0] write_burst_addr_220;
  reg [10-1:0] write_burst_stride_221;
  reg [33-1:0] write_burst_length_222;
  reg write_burst_done_223;
  assign ram_w32_l1024_id1_1_addr = ((write_burst_fsm_5 == 1) && write_burst_block_ram_wvalid_218)? write_burst_addr_220 : 'hx;
  assign ram_w32_l1024_id1_1_wdata = ((write_burst_fsm_5 == 1) && write_burst_block_ram_wvalid_218)? _maxi_rdata_sb_0 : 'hx;
  assign ram_w32_l1024_id1_1_wenable = ((write_burst_fsm_5 == 1) && write_burst_block_ram_wvalid_218)? 1'd1 : 0;
  assign ram_w32_l1024_id1_1_enable = ((write_burst_fsm_5 == 1) && write_burst_block_ram_wvalid_218)? 1'd1 : 0;
  reg [32-1:0] write_burst_block_fsm_6;
  localparam write_burst_block_fsm_6_init = 0;
  reg [33-1:0] write_burst_block_length_224;
  reg [32-1:0] write_burst_block_blocksize_225;
  reg write_burst_block_done_226;
  reg [32-1:0] write_burst_block_count_227;
  assign write_burst_block_ram_wvalid_212 = _maxi_rvalid_sb_0 && (write_burst_block_fsm_6 == 1);
  assign write_burst_block_ram_wquit_213 = 0 || _maxi_rvalid_sb_0 && 0 || _maxi_rvalid_sb_0 && (write_burst_block_length_224 <= 1);
  assign write_burst_block_ram_wvalid_218 = _maxi_rvalid_sb_0 && (write_burst_block_fsm_6 == 2);
  assign write_burst_block_ram_wquit_219 = 0 || _maxi_rvalid_sb_0 && 0 || _maxi_rvalid_sb_0 && (write_burst_block_length_224 <= 1);
  wire [32-1:0] matmul_5_mux_act_gaddr_0;
  assign matmul_5_mux_act_gaddr_0 = (matmul_5_row_select == 0)? matmul_5_arg_objaddr_0 + (matmul_5_act_base_offset + cparam_matmul_5_act_offset_values_0) : 1'd0;
  wire matmul_5_dma_pad_mask_0;
  assign matmul_5_dma_pad_mask_0 = (matmul_5_row_count + 0 < cparam_matmul_5_pad_row_top) || (matmul_5_row_count + 0 >= cparam_matmul_5_act_num_row + cparam_matmul_5_pad_row_top);
  wire matmul_5_mux_dma_pad_mask_0;
  assign matmul_5_mux_dma_pad_mask_0 = (matmul_5_row_select == 0)? matmul_5_dma_pad_mask_0 : 1'd0;
  wire matmul_5_mux_dma_flag_0;
  assign matmul_5_mux_dma_flag_0 = (matmul_5_prev_row_select == 0)? matmul_5_dma_flag_0 : 1'd0;
  wire [32-1:0] mask_addr_shifted_228;
  assign mask_addr_shifted_228 = matmul_5_mux_act_gaddr_0 + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_229;
  assign mask_addr_masked_229 = mask_addr_shifted_228 << 2;
  assign _maxi_read_req_fifo_deq = ((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 5)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 4)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1)) && !_maxi_read_req_fifo_empty)? 1 : 0;
  reg [32-1:0] write_burst_fsm_7;
  localparam write_burst_fsm_7_init = 0;
  reg [9-1:0] write_burst_addr_230;
  reg [9-1:0] write_burst_stride_231;
  reg [33-1:0] write_burst_length_232;
  reg write_burst_done_233;
  assign ram_w32_l512_id0_1_addr = ((write_burst_fsm_7 == 1) && _maxi_rvalid_sb_0)? write_burst_addr_230 : 'hx;
  assign ram_w32_l512_id0_1_wdata = ((write_burst_fsm_7 == 1) && _maxi_rvalid_sb_0)? _maxi_rdata_sb_0 : 'hx;
  assign ram_w32_l512_id0_1_wenable = ((write_burst_fsm_7 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  assign ram_w32_l512_id0_1_enable = ((write_burst_fsm_7 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  assign _maxi_rready_sb_0 = (_maxi_read_data_fsm == 2) || (_maxi_read_data_fsm == 2) || (_maxi_read_data_fsm == 2) || (_maxi_read_data_fsm == 2) || (_maxi_read_data_fsm == 2);
  reg [32-1:0] matmul_5_comp_fsm;
  localparam matmul_5_comp_fsm_init = 0;
  reg [32-1:0] matmul_5_filter_page_comp_offset_buf;
  reg [32-1:0] matmul_5_act_page_comp_offset_buf_0;
  reg [32-1:0] matmul_5_out_page_comp_offset_buf;
  reg [32-1:0] matmul_5_row_count_buf;
  reg [1-1:0] matmul_5_row_select_buf;
  reg [32-1:0] matmul_5_och_count_buf;
  wire matmul_5_stream_pad_mask_0_0;
  assign matmul_5_stream_pad_mask_0_0 = (matmul_5_col_count + 0 < cparam_matmul_5_pad_col_left) || (matmul_5_col_count + 0 >= cparam_matmul_5_act_num_col + cparam_matmul_5_pad_col_left) || (matmul_5_row_count_buf + 0 < cparam_matmul_5_pad_row_top) || (matmul_5_row_count_buf + 0 >= cparam_matmul_5_act_num_row + cparam_matmul_5_pad_row_top);
  reg [1-1:0] matmul_5_stream_pad_masks;
  wire [9-1:0] stream_matmul_5_parameter_0_data;
  wire [1-1:0] stream_matmul_5_parameter_1_data;
  wire [1-1:0] stream_matmul_5_parameter_2_data;
  wire [1-1:0] stream_matmul_5_parameter_3_data;
  wire [2-1:0] stream_matmul_5_parameter_4_data;
  wire [1-1:0] stream_matmul_5__reduce_reset_data;
  wire [1-1:0] stream_matmul_5_parameter_6_data;
  wire [32-1:0] stream_matmul_5_source_7_data;
  wire [1-1:0] stream_matmul_5_parameter_8_data;
  wire [32-1:0] stream_matmul_5_source_9_data;
  wire [1-1:0] stream_matmul_5_parameter_10_data;
  wire [32-1:0] stream_matmul_5_source_11_data;
  wire [1-1:0] stream_matmul_5_parameter_12_data;
  wire [32-1:0] stream_matmul_5_source_13_data;
  wire [1-1:0] stream_matmul_5_parameter_14_data;
  wire [32-1:0] stream_matmul_5_source_15_data;
  wire [1-1:0] stream_matmul_5_parameter_16_data;
  wire [1-1:0] stream_matmul_5_parameter_17_data;
  wire [5-1:0] stream_matmul_5_parameter_18_data;
  wire [2-1:0] stream_matmul_5_parameter_19_data;
  wire [32-1:0] stream_matmul_5_source_20_data;
  wire [32-1:0] stream_matmul_5_source_21_data;
  wire [32-1:0] stream_matmul_5_source_22_data;
  reg __stream_matmul_5_stream_ivalid_1;
  reg __stream_matmul_5_stream_ivalid_2;
  reg __stream_matmul_5_stream_ivalid_3;
  reg __stream_matmul_5_stream_ivalid_4;
  reg __stream_matmul_5_stream_ivalid_5;
  reg __stream_matmul_5_stream_ivalid_6;
  reg __stream_matmul_5_stream_ivalid_7;
  reg __stream_matmul_5_stream_ivalid_8;
  reg __stream_matmul_5_stream_ivalid_9;
  reg __stream_matmul_5_stream_ivalid_10;
  reg __stream_matmul_5_stream_ivalid_11;
  reg __stream_matmul_5_stream_ivalid_12;
  reg __stream_matmul_5_stream_ivalid_13;
  reg __stream_matmul_5_stream_ivalid_14;
  reg __stream_matmul_5_stream_ivalid_15;
  reg __stream_matmul_5_stream_ivalid_16;
  reg __stream_matmul_5_stream_ivalid_17;
  reg __stream_matmul_5_stream_ivalid_18;
  reg __stream_matmul_5_stream_ivalid_19;
  reg __stream_matmul_5_stream_ivalid_20;
  reg __stream_matmul_5_stream_ivalid_21;
  reg __stream_matmul_5_stream_ivalid_22;
  reg __stream_matmul_5_stream_ivalid_23;
  reg __stream_matmul_5_stream_ivalid_24;
  reg __stream_matmul_5_stream_ivalid_25;
  reg __stream_matmul_5_stream_ivalid_26;
  reg __stream_matmul_5_stream_ivalid_27;
  reg __stream_matmul_5_stream_ivalid_28;
  reg __stream_matmul_5_stream_ivalid_29;
  reg __stream_matmul_5_stream_ivalid_30;
  reg __stream_matmul_5_stream_ivalid_31;
  reg __stream_matmul_5_stream_ivalid_32;
  reg [32-1:0] _counter_data_211;
  reg [32-1:0] _counter_count_211;
  wire _counter_reset_cond_211;
  assign _counter_reset_cond_211 = stream_matmul_5__reduce_reset_data;
  wire [32-1:0] _counter_current_count_211;
  assign _counter_current_count_211 = (_counter_reset_cond_211)? 1'sd0 : _counter_count_211;
  wire [1-1:0] _pointer_data_214;
  assign _pointer_data_214 = stream_matmul_5_parameter_4_data[1'sd0];
  reg [9-1:0] _minus_data_216;
  wire [1-1:0] _pointer_data_220;
  assign _pointer_data_220 = stream_matmul_5_parameter_4_data[2'sd1];
  reg [9-1:0] _minus_data_222;
  wire [16-1:0] _slice_data_230;
  assign _slice_data_230 = stream_matmul_5_source_7_data[5'd15:1'd0];
  wire [16-1:0] _reinterpretcast_src_231;
  assign _reinterpretcast_src_231 = _slice_data_230;
  wire signed [16-1:0] _reinterpretcast_data_231;
  assign _reinterpretcast_data_231 = _reinterpretcast_src_231;
  wire [16-1:0] _slice_data_234;
  assign _slice_data_234 = stream_matmul_5_source_7_data[6'd31:6'd16];
  wire [16-1:0] _reinterpretcast_src_235;
  assign _reinterpretcast_src_235 = _slice_data_234;
  wire signed [16-1:0] _reinterpretcast_data_235;
  assign _reinterpretcast_data_235 = _reinterpretcast_src_235;
  wire signed [16-1:0] _cond_data_236;
  assign _cond_data_236 = (stream_matmul_5_parameter_6_data)? _reinterpretcast_data_231 : _reinterpretcast_data_231;
  wire signed [16-1:0] _cond_data_237;
  assign _cond_data_237 = (stream_matmul_5_parameter_6_data)? _reinterpretcast_data_231 : _reinterpretcast_data_235;
  wire [16-1:0] _slice_data_242;
  assign _slice_data_242 = stream_matmul_5_source_9_data[5'd15:1'd0];
  wire [16-1:0] _reinterpretcast_src_243;
  assign _reinterpretcast_src_243 = _slice_data_242;
  wire signed [16-1:0] _reinterpretcast_data_243;
  assign _reinterpretcast_data_243 = _reinterpretcast_src_243;
  wire [16-1:0] _slice_data_246;
  assign _slice_data_246 = stream_matmul_5_source_9_data[6'd31:6'd16];
  wire [16-1:0] _reinterpretcast_src_247;
  assign _reinterpretcast_src_247 = _slice_data_246;
  wire signed [16-1:0] _reinterpretcast_data_247;
  assign _reinterpretcast_data_247 = _reinterpretcast_src_247;
  wire signed [16-1:0] _cond_data_248;
  assign _cond_data_248 = (stream_matmul_5_parameter_8_data)? _reinterpretcast_data_243 : _reinterpretcast_data_243;
  wire signed [16-1:0] _cond_data_249;
  assign _cond_data_249 = (stream_matmul_5_parameter_8_data)? _reinterpretcast_data_243 : _reinterpretcast_data_247;
  wire [16-1:0] _slice_data_254;
  assign _slice_data_254 = stream_matmul_5_source_11_data[5'd15:1'd0];
  wire [16-1:0] _reinterpretcast_src_255;
  assign _reinterpretcast_src_255 = _slice_data_254;
  wire [16-1:0] _reinterpretcast_data_255;
  assign _reinterpretcast_data_255 = _reinterpretcast_src_255;
  wire [16-1:0] _slice_data_258;
  assign _slice_data_258 = stream_matmul_5_source_11_data[6'd31:6'd16];
  wire [16-1:0] _reinterpretcast_src_259;
  assign _reinterpretcast_src_259 = _slice_data_258;
  wire [16-1:0] _reinterpretcast_data_259;
  assign _reinterpretcast_data_259 = _reinterpretcast_src_259;
  wire [16-1:0] _cond_data_260;
  assign _cond_data_260 = (stream_matmul_5_parameter_10_data)? _reinterpretcast_data_255 : _reinterpretcast_data_255;
  wire [16-1:0] _cond_data_261;
  assign _cond_data_261 = (stream_matmul_5_parameter_10_data)? _reinterpretcast_data_255 : _reinterpretcast_data_259;
  wire [16-1:0] _slice_data_266;
  assign _slice_data_266 = stream_matmul_5_source_13_data[5'd15:1'd0];
  wire [16-1:0] _reinterpretcast_src_267;
  assign _reinterpretcast_src_267 = _slice_data_266;
  wire [16-1:0] _reinterpretcast_data_267;
  assign _reinterpretcast_data_267 = _reinterpretcast_src_267;
  wire [16-1:0] _slice_data_270;
  assign _slice_data_270 = stream_matmul_5_source_13_data[6'd31:6'd16];
  wire [16-1:0] _reinterpretcast_src_271;
  assign _reinterpretcast_src_271 = _slice_data_270;
  wire [16-1:0] _reinterpretcast_data_271;
  assign _reinterpretcast_data_271 = _reinterpretcast_src_271;
  wire [16-1:0] _cond_data_272;
  assign _cond_data_272 = (stream_matmul_5_parameter_12_data)? _reinterpretcast_data_267 : _reinterpretcast_data_267;
  wire [16-1:0] _cond_data_273;
  assign _cond_data_273 = (stream_matmul_5_parameter_12_data)? _reinterpretcast_data_267 : _reinterpretcast_data_271;
  wire [16-1:0] _slice_data_278;
  assign _slice_data_278 = stream_matmul_5_source_15_data[5'd15:1'd0];
  wire [16-1:0] _reinterpretcast_src_279;
  assign _reinterpretcast_src_279 = _slice_data_278;
  wire [16-1:0] _reinterpretcast_data_279;
  assign _reinterpretcast_data_279 = _reinterpretcast_src_279;
  wire [16-1:0] _slice_data_282;
  assign _slice_data_282 = stream_matmul_5_source_15_data[6'd31:6'd16];
  wire [16-1:0] _reinterpretcast_src_283;
  assign _reinterpretcast_src_283 = _slice_data_282;
  wire [16-1:0] _reinterpretcast_data_283;
  assign _reinterpretcast_data_283 = _reinterpretcast_src_283;
  wire [16-1:0] _cond_data_284;
  assign _cond_data_284 = (stream_matmul_5_parameter_14_data)? _reinterpretcast_data_279 : _reinterpretcast_data_279;
  wire [16-1:0] _cond_data_285;
  assign _cond_data_285 = (stream_matmul_5_parameter_14_data)? _reinterpretcast_data_279 : _reinterpretcast_data_283;
  reg [1-1:0] _eq_data_291;
  reg [1-1:0] _eq_data_295;
  wire [16-1:0] _slice_data_315;
  assign _slice_data_315 = stream_matmul_5_source_21_data[5'd15:1'd0];
  wire [16-1:0] _reinterpretcast_src_316;
  assign _reinterpretcast_src_316 = _slice_data_315;
  wire signed [16-1:0] _reinterpretcast_data_316;
  assign _reinterpretcast_data_316 = _reinterpretcast_src_316;
  wire [16-1:0] _slice_data_319;
  assign _slice_data_319 = stream_matmul_5_source_21_data[6'd31:6'd16];
  wire [16-1:0] _reinterpretcast_src_320;
  assign _reinterpretcast_src_320 = _slice_data_319;
  wire signed [16-1:0] _reinterpretcast_data_320;
  assign _reinterpretcast_data_320 = _reinterpretcast_src_320;
  wire [16-1:0] _slice_data_327;
  assign _slice_data_327 = stream_matmul_5_source_22_data[5'd15:1'd0];
  wire [16-1:0] _reinterpretcast_src_328;
  assign _reinterpretcast_src_328 = _slice_data_327;
  wire signed [16-1:0] _reinterpretcast_data_328;
  assign _reinterpretcast_data_328 = _reinterpretcast_src_328;
  wire [16-1:0] _slice_data_331;
  assign _slice_data_331 = stream_matmul_5_source_22_data[6'd31:6'd16];
  wire [16-1:0] _reinterpretcast_src_332;
  assign _reinterpretcast_src_332 = _slice_data_331;
  wire signed [16-1:0] _reinterpretcast_data_332;
  assign _reinterpretcast_data_332 = _reinterpretcast_src_332;
  wire [1-1:0] _pointer_data_337;
  assign _pointer_data_337 = stream_matmul_5_parameter_3_data[1'sd0];
  reg [16-1:0] _plus_data_358;
  reg [16-1:0] _plus_data_379;
  reg [16-1:0] _plus_data_395;
  reg [16-1:0] _plus_data_414;
  reg [1-1:0] _eq_data_420;
  reg [1-1:0] _eq_data_423;
  reg [16-1:0] _plus_data_446;
  reg [16-1:0] _plus_data_467;
  reg [16-1:0] _plus_data_483;
  reg [16-1:0] _plus_data_502;
  reg [1-1:0] _eq_data_508;
  reg [1-1:0] _eq_data_511;
  reg [1-1:0] __delay_data_516_pointer_214;
  reg [32-1:0] __delay_data_518__variable_290;
  reg [1-1:0] __delay_data_521_pointer_337;
  reg signed [16-1:0] __delay_data_524_reinterpretcast_316;
  reg [1-1:0] __delay_data_529_pointer_220;
  reg signed [16-1:0] __delay_data_533_reinterpretcast_320;
  reg [1-1:0] __delay_data_538__variable_210;
  reg [9-1:0] __delay_data_565__variable_205;
  reg signed [16-1:0] __delay_data_579_reinterpretcast_328;
  reg signed [16-1:0] __delay_data_584_reinterpretcast_332;
  reg signed [16-1:0] __delay_data_602_cond_237;
  reg signed [16-1:0] __delay_data_622_cond_249;
  reg signed [16-1:0] __delay_data_727_cond_236;
  reg signed [16-1:0] __delay_data_747_cond_248;
  reg [1-1:0] _eq_data_218;
  reg [1-1:0] _eq_data_224;
  wire signed [32-1:0] _cond_data_293;
  assign _cond_data_293 = (_eq_data_291)? __delay_data_518__variable_290 : 1'sd0;
  wire signed [32-1:0] _cond_data_297;
  assign _cond_data_297 = (_eq_data_295)? _cond_data_293 : 1'sd0;
  wire [16-1:0] _slice_data_301;
  assign _slice_data_301 = _cond_data_297[5'd15:1'd0];
  wire [16-1:0] _reinterpretcast_src_302;
  assign _reinterpretcast_src_302 = _slice_data_301;
  wire signed [16-1:0] _reinterpretcast_data_302;
  assign _reinterpretcast_data_302 = _reinterpretcast_src_302;
  wire [16-1:0] _slice_data_305;
  assign _slice_data_305 = _cond_data_297[6'd31:6'd16];
  wire [16-1:0] _reinterpretcast_src_306;
  assign _reinterpretcast_src_306 = _slice_data_305;
  wire signed [16-1:0] _reinterpretcast_data_306;
  assign _reinterpretcast_data_306 = _reinterpretcast_src_306;
  reg [1-1:0] __delay_data_517__delay_516_pointer_214;
  reg signed [16-1:0] __delay_data_519_reinterpretcast_302;
  reg [1-1:0] __delay_data_522__delay_521_pointer_337;
  reg signed [16-1:0] __delay_data_525__delay_524_reinterpretcast_316;
  reg [16-1:0] __delay_data_527_plus_358;
  reg [1-1:0] __delay_data_530__delay_529_pointer_220;
  reg signed [16-1:0] __delay_data_531_reinterpretcast_306;
  reg signed [16-1:0] __delay_data_534__delay_533_reinterpretcast_320;
  reg [16-1:0] __delay_data_536_plus_379;
  reg [1-1:0] __delay_data_539__delay_538__variable_210;
  reg [16-1:0] __delay_data_552_plus_395;
  reg [9-1:0] __delay_data_566__delay_565__variable_205;
  reg signed [16-1:0] __delay_data_580__delay_579_reinterpretcast_328;
  reg [16-1:0] __delay_data_582_plus_446;
  reg signed [16-1:0] __delay_data_585__delay_584_reinterpretcast_332;
  reg [16-1:0] __delay_data_587_plus_467;
  reg [16-1:0] __delay_data_589_plus_483;
  reg signed [16-1:0] __delay_data_603__delay_602_cond_237;
  reg signed [16-1:0] __delay_data_623__delay_622_cond_249;
  reg [16-1:0] __delay_data_643_plus_502;
  reg [1-1:0] __delay_data_664_eq_508;
  reg [1-1:0] __delay_data_696_eq_511;
  reg signed [16-1:0] __delay_data_728__delay_727_cond_236;
  reg signed [16-1:0] __delay_data_748__delay_747_cond_248;
  reg [16-1:0] __delay_data_768_plus_414;
  reg [1-1:0] __delay_data_789_eq_420;
  reg [1-1:0] __delay_data_821_eq_423;
  reg [1-1:0] _land_data_219;
  reg [1-1:0] _land_data_225;
  reg signed [16-1:0] __delay_data_520__delay_519_reinterpretcast_302;
  reg [1-1:0] __delay_data_523__delay_522__delay_521_pointer_337;
  reg signed [16-1:0] __delay_data_526__delay_525__delay_524_reinterpretcast_316;
  reg [16-1:0] __delay_data_528__delay_527_plus_358;
  reg signed [16-1:0] __delay_data_532__delay_531_reinterpretcast_306;
  reg signed [16-1:0] __delay_data_535__delay_534__delay_533_reinterpretcast_320;
  reg [16-1:0] __delay_data_537__delay_536_plus_379;
  reg [1-1:0] __delay_data_540__delay_539__delay_538__variable_210;
  reg [16-1:0] __delay_data_553__delay_552_plus_395;
  reg [9-1:0] __delay_data_567__delay_566__delay_565__variable_205;
  reg signed [16-1:0] __delay_data_581__delay_580__delay_579_reinterpretcast_328;
  reg [16-1:0] __delay_data_583__delay_582_plus_446;
  reg signed [16-1:0] __delay_data_586__delay_585__delay_584_reinterpretcast_332;
  reg [16-1:0] __delay_data_588__delay_587_plus_467;
  reg [16-1:0] __delay_data_590__delay_589_plus_483;
  reg signed [16-1:0] __delay_data_604__delay_603__delay_602_cond_237;
  reg signed [16-1:0] __delay_data_624__delay_623__delay_622_cond_249;
  reg [16-1:0] __delay_data_644__delay_643_plus_502;
  reg [1-1:0] __delay_data_665__delay_664_eq_508;
  reg [1-1:0] __delay_data_697__delay_696_eq_511;
  reg signed [16-1:0] __delay_data_729__delay_728__delay_727_cond_236;
  reg signed [16-1:0] __delay_data_749__delay_748__delay_747_cond_248;
  reg [16-1:0] __delay_data_769__delay_768_plus_414;
  reg [1-1:0] __delay_data_790__delay_789_eq_420;
  reg [1-1:0] __delay_data_822__delay_821_eq_423;
  wire signed [16-1:0] _cond_data_308;
  assign _cond_data_308 = (_land_data_219)? 1'sd0 : __delay_data_520__delay_519_reinterpretcast_302;
  wire signed [16-1:0] _cond_data_310;
  assign _cond_data_310 = (_land_data_225)? 1'sd0 : __delay_data_532__delay_531_reinterpretcast_306;
  wire signed [16-1:0] _cond_data_322;
  assign _cond_data_322 = (_land_data_219)? 1'sd0 : __delay_data_526__delay_525__delay_524_reinterpretcast_316;
  wire signed [16-1:0] _cond_data_324;
  assign _cond_data_324 = (_land_data_225)? 1'sd0 : __delay_data_535__delay_534__delay_533_reinterpretcast_320;
  wire signed [16-1:0] _cond_data_334;
  assign _cond_data_334 = (_land_data_219)? 1'sd0 : __delay_data_581__delay_580__delay_579_reinterpretcast_328;
  wire signed [16-1:0] _cond_data_336;
  assign _cond_data_336 = (_land_data_225)? 1'sd0 : __delay_data_586__delay_585__delay_584_reinterpretcast_332;
  wire signed [16-1:0] _cond_data_340;
  assign _cond_data_340 = (__delay_data_523__delay_522__delay_521_pointer_337)? 1'sd0 : _cond_data_308;
  reg signed [16-1:0] __variable_wdata_120;
  assign mul_6_x_data = __variable_wdata_120;
  reg signed [16-1:0] __variable_wdata_121;
  assign mul_6_y_data = __variable_wdata_121;
  reg [5-1:0] __variable_wdata_122;
  assign mul_6_rshift_data = __variable_wdata_122;
  assign _mul_6_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _mul_6_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _mul_6_stream_internal_oready;
  wire signed [16-1:0] _cond_data_361;
  assign _cond_data_361 = (__delay_data_523__delay_522__delay_521_pointer_337)? 1'sd0 : _cond_data_310;
  reg signed [16-1:0] __variable_wdata_141;
  assign mul_7_x_data = __variable_wdata_141;
  reg signed [16-1:0] __variable_wdata_142;
  assign mul_7_y_data = __variable_wdata_142;
  reg [5-1:0] __variable_wdata_143;
  assign mul_7_rshift_data = __variable_wdata_143;
  assign _mul_7_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _mul_7_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _mul_7_stream_internal_oready;
  wire signed [16-1:0] _cond_data_428;
  assign _cond_data_428 = (__delay_data_523__delay_522__delay_521_pointer_337)? 1'sd0 : _cond_data_308;
  reg signed [16-1:0] __variable_wdata_162;
  assign mul_8_x_data = __variable_wdata_162;
  reg signed [16-1:0] __variable_wdata_163;
  assign mul_8_y_data = __variable_wdata_163;
  reg [5-1:0] __variable_wdata_164;
  assign mul_8_rshift_data = __variable_wdata_164;
  assign _mul_8_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _mul_8_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _mul_8_stream_internal_oready;
  wire signed [16-1:0] _cond_data_449;
  assign _cond_data_449 = (__delay_data_523__delay_522__delay_521_pointer_337)? 1'sd0 : _cond_data_310;
  reg signed [16-1:0] __variable_wdata_183;
  assign mul_9_x_data = __variable_wdata_183;
  reg signed [16-1:0] __variable_wdata_184;
  assign mul_9_y_data = __variable_wdata_184;
  reg [5-1:0] __variable_wdata_185;
  assign mul_9_rshift_data = __variable_wdata_185;
  assign _mul_9_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _mul_9_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _mul_9_stream_internal_oready;
  reg [1-1:0] __delay_data_541__delay_540__delay_539____variable_210;
  reg [16-1:0] __delay_data_554__delay_553__delay_552_plus_395;
  reg [9-1:0] __delay_data_568__delay_567__delay_566____variable_205;
  reg [16-1:0] __delay_data_591__delay_590__delay_589_plus_483;
  reg signed [16-1:0] __delay_data_605__delay_604__delay_603__delay_602_cond_237;
  reg signed [16-1:0] __delay_data_625__delay_624__delay_623__delay_622_cond_249;
  reg [16-1:0] __delay_data_645__delay_644__delay_643_plus_502;
  reg [1-1:0] __delay_data_666__delay_665__delay_664_eq_508;
  reg [1-1:0] __delay_data_698__delay_697__delay_696_eq_511;
  reg signed [16-1:0] __delay_data_730__delay_729__delay_728__delay_727_cond_236;
  reg signed [16-1:0] __delay_data_750__delay_749__delay_748__delay_747_cond_248;
  reg [16-1:0] __delay_data_770__delay_769__delay_768_plus_414;
  reg [1-1:0] __delay_data_791__delay_790__delay_789_eq_420;
  reg [1-1:0] __delay_data_823__delay_822__delay_821_eq_423;
  reg [1-1:0] __delay_data_542__delay_541__delay_540____variable_210;
  reg [16-1:0] __delay_data_555__delay_554__delay_553__delay_552_plus_395;
  reg [9-1:0] __delay_data_569__delay_568__delay_567____variable_205;
  reg [16-1:0] __delay_data_592__delay_591__delay_590__delay_589_plus_483;
  reg signed [16-1:0] __delay_data_606__delay_605__delay_604__delay_603___cond_237;
  reg signed [16-1:0] __delay_data_626__delay_625__delay_624__delay_623___cond_249;
  reg [16-1:0] __delay_data_646__delay_645__delay_644__delay_643_plus_502;
  reg [1-1:0] __delay_data_667__delay_666__delay_665__delay_664_eq_508;
  reg [1-1:0] __delay_data_699__delay_698__delay_697__delay_696_eq_511;
  reg signed [16-1:0] __delay_data_731__delay_730__delay_729__delay_728___cond_236;
  reg signed [16-1:0] __delay_data_751__delay_750__delay_749__delay_748___cond_248;
  reg [16-1:0] __delay_data_771__delay_770__delay_769__delay_768_plus_414;
  reg [1-1:0] __delay_data_792__delay_791__delay_790__delay_789_eq_420;
  reg [1-1:0] __delay_data_824__delay_823__delay_822__delay_821_eq_423;
  reg [1-1:0] __delay_data_543__delay_542__delay_541____variable_210;
  reg [16-1:0] __delay_data_556__delay_555__delay_554__delay_553___plus_395;
  reg [9-1:0] __delay_data_570__delay_569__delay_568____variable_205;
  reg [16-1:0] __delay_data_593__delay_592__delay_591__delay_590___plus_483;
  reg signed [16-1:0] __delay_data_607__delay_606__delay_605__delay_604___cond_237;
  reg signed [16-1:0] __delay_data_627__delay_626__delay_625__delay_624___cond_249;
  reg [16-1:0] __delay_data_647__delay_646__delay_645__delay_644___plus_502;
  reg [1-1:0] __delay_data_668__delay_667__delay_666__delay_665___eq_508;
  reg [1-1:0] __delay_data_700__delay_699__delay_698__delay_697___eq_511;
  reg signed [16-1:0] __delay_data_732__delay_731__delay_730__delay_729___cond_236;
  reg signed [16-1:0] __delay_data_752__delay_751__delay_750__delay_749___cond_248;
  reg [16-1:0] __delay_data_772__delay_771__delay_770__delay_769___plus_414;
  reg [1-1:0] __delay_data_793__delay_792__delay_791__delay_790___eq_420;
  reg [1-1:0] __delay_data_825__delay_824__delay_823__delay_822___eq_423;
  reg [1-1:0] __delay_data_544__delay_543__delay_542____variable_210;
  reg [16-1:0] __delay_data_557__delay_556__delay_555__delay_554___plus_395;
  reg [9-1:0] __delay_data_571__delay_570__delay_569____variable_205;
  reg [16-1:0] __delay_data_594__delay_593__delay_592__delay_591___plus_483;
  reg signed [16-1:0] __delay_data_608__delay_607__delay_606__delay_605___cond_237;
  reg signed [16-1:0] __delay_data_628__delay_627__delay_626__delay_625___cond_249;
  reg [16-1:0] __delay_data_648__delay_647__delay_646__delay_645___plus_502;
  reg [1-1:0] __delay_data_669__delay_668__delay_667__delay_666___eq_508;
  reg [1-1:0] __delay_data_701__delay_700__delay_699__delay_698___eq_511;
  reg signed [16-1:0] __delay_data_733__delay_732__delay_731__delay_730___cond_236;
  reg signed [16-1:0] __delay_data_753__delay_752__delay_751__delay_750___cond_248;
  reg [16-1:0] __delay_data_773__delay_772__delay_771__delay_770___plus_414;
  reg [1-1:0] __delay_data_794__delay_793__delay_792__delay_791___eq_420;
  reg [1-1:0] __delay_data_826__delay_825__delay_824__delay_823___eq_423;
  reg [1-1:0] __delay_data_545__delay_544__delay_543____variable_210;
  reg [16-1:0] __delay_data_558__delay_557__delay_556__delay_555___plus_395;
  reg [9-1:0] __delay_data_572__delay_571__delay_570____variable_205;
  reg [16-1:0] __delay_data_595__delay_594__delay_593__delay_592___plus_483;
  reg signed [16-1:0] __delay_data_609__delay_608__delay_607__delay_606___cond_237;
  reg signed [16-1:0] __delay_data_629__delay_628__delay_627__delay_626___cond_249;
  reg [16-1:0] __delay_data_649__delay_648__delay_647__delay_646___plus_502;
  reg [1-1:0] __delay_data_670__delay_669__delay_668__delay_667___eq_508;
  reg [1-1:0] __delay_data_702__delay_701__delay_700__delay_699___eq_511;
  reg signed [16-1:0] __delay_data_734__delay_733__delay_732__delay_731___cond_236;
  reg signed [16-1:0] __delay_data_754__delay_753__delay_752__delay_751___cond_248;
  reg [16-1:0] __delay_data_774__delay_773__delay_772__delay_771___plus_414;
  reg [1-1:0] __delay_data_795__delay_794__delay_793__delay_792___eq_420;
  reg [1-1:0] __delay_data_827__delay_826__delay_825__delay_824___eq_423;
  reg [1-1:0] __delay_data_546__delay_545__delay_544____variable_210;
  reg [16-1:0] __delay_data_559__delay_558__delay_557__delay_556___plus_395;
  reg [9-1:0] __delay_data_573__delay_572__delay_571____variable_205;
  reg [16-1:0] __delay_data_596__delay_595__delay_594__delay_593___plus_483;
  reg signed [16-1:0] __delay_data_610__delay_609__delay_608__delay_607___cond_237;
  reg signed [16-1:0] __delay_data_630__delay_629__delay_628__delay_627___cond_249;
  reg [16-1:0] __delay_data_650__delay_649__delay_648__delay_647___plus_502;
  reg [1-1:0] __delay_data_671__delay_670__delay_669__delay_668___eq_508;
  reg [1-1:0] __delay_data_703__delay_702__delay_701__delay_700___eq_511;
  reg signed [16-1:0] __delay_data_735__delay_734__delay_733__delay_732___cond_236;
  reg signed [16-1:0] __delay_data_755__delay_754__delay_753__delay_752___cond_248;
  reg [16-1:0] __delay_data_775__delay_774__delay_773__delay_772___plus_414;
  reg [1-1:0] __delay_data_796__delay_795__delay_794__delay_793___eq_420;
  reg [1-1:0] __delay_data_828__delay_827__delay_826__delay_825___eq_423;
  reg [1-1:0] __delay_data_547__delay_546__delay_545____variable_210;
  reg [16-1:0] __delay_data_560__delay_559__delay_558__delay_557___plus_395;
  reg [9-1:0] __delay_data_574__delay_573__delay_572____variable_205;
  reg [16-1:0] __delay_data_597__delay_596__delay_595__delay_594___plus_483;
  reg signed [16-1:0] __delay_data_611__delay_610__delay_609__delay_608___cond_237;
  reg signed [16-1:0] __delay_data_631__delay_630__delay_629__delay_628___cond_249;
  reg [16-1:0] __delay_data_651__delay_650__delay_649__delay_648___plus_502;
  reg [1-1:0] __delay_data_672__delay_671__delay_670__delay_669___eq_508;
  reg [1-1:0] __delay_data_704__delay_703__delay_702__delay_701___eq_511;
  reg signed [16-1:0] __delay_data_736__delay_735__delay_734__delay_733___cond_236;
  reg signed [16-1:0] __delay_data_756__delay_755__delay_754__delay_753___cond_248;
  reg [16-1:0] __delay_data_776__delay_775__delay_774__delay_773___plus_414;
  reg [1-1:0] __delay_data_797__delay_796__delay_795__delay_794___eq_420;
  reg [1-1:0] __delay_data_829__delay_828__delay_827__delay_826___eq_423;
  reg [1-1:0] __delay_data_548__delay_547__delay_546____variable_210;
  reg [16-1:0] __delay_data_561__delay_560__delay_559__delay_558___plus_395;
  reg [9-1:0] __delay_data_575__delay_574__delay_573____variable_205;
  reg [16-1:0] __delay_data_598__delay_597__delay_596__delay_595___plus_483;
  reg signed [16-1:0] __delay_data_612__delay_611__delay_610__delay_609___cond_237;
  reg signed [16-1:0] __delay_data_632__delay_631__delay_630__delay_629___cond_249;
  reg [16-1:0] __delay_data_652__delay_651__delay_650__delay_649___plus_502;
  reg [1-1:0] __delay_data_673__delay_672__delay_671__delay_670___eq_508;
  reg [1-1:0] __delay_data_705__delay_704__delay_703__delay_702___eq_511;
  reg signed [16-1:0] __delay_data_737__delay_736__delay_735__delay_734___cond_236;
  reg signed [16-1:0] __delay_data_757__delay_756__delay_755__delay_754___cond_248;
  reg [16-1:0] __delay_data_777__delay_776__delay_775__delay_774___plus_414;
  reg [1-1:0] __delay_data_798__delay_797__delay_796__delay_795___eq_420;
  reg [1-1:0] __delay_data_830__delay_829__delay_828__delay_827___eq_423;
  reg [1-1:0] __delay_data_549__delay_548__delay_547____variable_210;
  reg [16-1:0] __delay_data_562__delay_561__delay_560__delay_559___plus_395;
  reg [9-1:0] __delay_data_576__delay_575__delay_574____variable_205;
  reg [16-1:0] __delay_data_599__delay_598__delay_597__delay_596___plus_483;
  reg signed [16-1:0] __delay_data_613__delay_612__delay_611__delay_610___cond_237;
  reg signed [16-1:0] __delay_data_633__delay_632__delay_631__delay_630___cond_249;
  reg [16-1:0] __delay_data_653__delay_652__delay_651__delay_650___plus_502;
  reg [1-1:0] __delay_data_674__delay_673__delay_672__delay_671___eq_508;
  reg [1-1:0] __delay_data_706__delay_705__delay_704__delay_703___eq_511;
  reg signed [16-1:0] __delay_data_738__delay_737__delay_736__delay_735___cond_236;
  reg signed [16-1:0] __delay_data_758__delay_757__delay_756__delay_755___cond_248;
  reg [16-1:0] __delay_data_778__delay_777__delay_776__delay_775___plus_414;
  reg [1-1:0] __delay_data_799__delay_798__delay_797__delay_796___eq_420;
  reg [1-1:0] __delay_data_831__delay_830__delay_829__delay_828___eq_423;
  wire signed [32-1:0] __substreamoutput_data_359;
  assign __substreamoutput_data_359 = mul_6_z_data;
  wire signed [32-1:0] __substreamoutput_data_380;
  assign __substreamoutput_data_380 = mul_7_z_data;
  reg signed [32-1:0] __variable_wdata_44;
  assign add_tree_2_var0_data = __variable_wdata_44;
  reg signed [32-1:0] __variable_wdata_45;
  assign add_tree_2_var1_data = __variable_wdata_45;
  assign _add_tree_2_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _add_tree_2_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _add_tree_2_stream_internal_oready;
  wire signed [32-1:0] __substreamoutput_data_447;
  assign __substreamoutput_data_447 = mul_8_z_data;
  wire signed [32-1:0] __substreamoutput_data_468;
  assign __substreamoutput_data_468 = mul_9_z_data;
  reg signed [32-1:0] __variable_wdata_48;
  assign add_tree_3_var0_data = __variable_wdata_48;
  reg signed [32-1:0] __variable_wdata_49;
  assign add_tree_3_var1_data = __variable_wdata_49;
  assign _add_tree_3_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _add_tree_3_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _add_tree_3_stream_internal_oready;
  reg [1-1:0] __delay_data_550__delay_549__delay_548____variable_210;
  reg [16-1:0] __delay_data_563__delay_562__delay_561__delay_560___plus_395;
  reg [9-1:0] __delay_data_577__delay_576__delay_575____variable_205;
  reg [16-1:0] __delay_data_600__delay_599__delay_598__delay_597___plus_483;
  reg signed [16-1:0] __delay_data_614__delay_613__delay_612__delay_611___cond_237;
  reg signed [16-1:0] __delay_data_634__delay_633__delay_632__delay_631___cond_249;
  reg [16-1:0] __delay_data_654__delay_653__delay_652__delay_651___plus_502;
  reg [1-1:0] __delay_data_675__delay_674__delay_673__delay_672___eq_508;
  reg [1-1:0] __delay_data_707__delay_706__delay_705__delay_704___eq_511;
  reg signed [16-1:0] __delay_data_739__delay_738__delay_737__delay_736___cond_236;
  reg signed [16-1:0] __delay_data_759__delay_758__delay_757__delay_756___cond_248;
  reg [16-1:0] __delay_data_779__delay_778__delay_777__delay_776___plus_414;
  reg [1-1:0] __delay_data_800__delay_799__delay_798__delay_797___eq_420;
  reg [1-1:0] __delay_data_832__delay_831__delay_830__delay_829___eq_423;
  reg [1-1:0] __delay_data_551__delay_550__delay_549____variable_210;
  reg [16-1:0] __delay_data_564__delay_563__delay_562__delay_561___plus_395;
  reg [9-1:0] __delay_data_578__delay_577__delay_576____variable_205;
  reg [16-1:0] __delay_data_601__delay_600__delay_599__delay_598___plus_483;
  reg signed [16-1:0] __delay_data_615__delay_614__delay_613__delay_612___cond_237;
  reg signed [16-1:0] __delay_data_635__delay_634__delay_633__delay_632___cond_249;
  reg [16-1:0] __delay_data_655__delay_654__delay_653__delay_652___plus_502;
  reg [1-1:0] __delay_data_676__delay_675__delay_674__delay_673___eq_508;
  reg [1-1:0] __delay_data_708__delay_707__delay_706__delay_705___eq_511;
  reg signed [16-1:0] __delay_data_740__delay_739__delay_738__delay_737___cond_236;
  reg signed [16-1:0] __delay_data_760__delay_759__delay_758__delay_757___cond_248;
  reg [16-1:0] __delay_data_780__delay_779__delay_778__delay_777___plus_414;
  reg [1-1:0] __delay_data_801__delay_800__delay_799__delay_798___eq_420;
  reg [1-1:0] __delay_data_833__delay_832__delay_831__delay_830___eq_423;
  wire signed [32-1:0] __substreamoutput_data_382;
  assign __substreamoutput_data_382 = add_tree_2_sum_data;
  reg [1-1:0] __variable_wdata_15;
  assign acc_0__reduce_reset_data = __variable_wdata_15;
  reg signed [32-1:0] __variable_wdata_0;
  assign acc_0_x_data = __variable_wdata_0;
  reg [6-1:0] __variable_wdata_1;
  assign acc_0_rshift_data = __variable_wdata_1;
  reg [32-1:0] __variable_wdata_2;
  assign acc_0_size_data = __variable_wdata_2;
  assign _acc_0_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _acc_0_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _acc_0_stream_internal_oready;
  wire signed [32-1:0] __substreamoutput_data_470;
  assign __substreamoutput_data_470 = add_tree_3_sum_data;
  reg [1-1:0] __variable_wdata_37;
  assign acc_1__reduce_reset_data = __variable_wdata_37;
  reg signed [32-1:0] __variable_wdata_22;
  assign acc_1_x_data = __variable_wdata_22;
  reg [6-1:0] __variable_wdata_23;
  assign acc_1_rshift_data = __variable_wdata_23;
  reg [32-1:0] __variable_wdata_24;
  assign acc_1_size_data = __variable_wdata_24;
  assign _acc_1_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _acc_1_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _acc_1_stream_internal_oready;
  reg signed [16-1:0] __delay_data_616__delay_615__delay_614__delay_613___cond_237;
  reg signed [16-1:0] __delay_data_636__delay_635__delay_634__delay_633___cond_249;
  reg [16-1:0] __delay_data_656__delay_655__delay_654__delay_653___plus_502;
  reg [1-1:0] __delay_data_677__delay_676__delay_675__delay_674___eq_508;
  reg [1-1:0] __delay_data_709__delay_708__delay_707__delay_706___eq_511;
  reg signed [16-1:0] __delay_data_741__delay_740__delay_739__delay_738___cond_236;
  reg signed [16-1:0] __delay_data_761__delay_760__delay_759__delay_758___cond_248;
  reg [16-1:0] __delay_data_781__delay_780__delay_779__delay_778___plus_414;
  reg [1-1:0] __delay_data_802__delay_801__delay_800__delay_799___eq_420;
  reg [1-1:0] __delay_data_834__delay_833__delay_832__delay_831___eq_423;
  reg signed [16-1:0] __delay_data_617__delay_616__delay_615__delay_614___cond_237;
  reg signed [16-1:0] __delay_data_637__delay_636__delay_635__delay_634___cond_249;
  reg [16-1:0] __delay_data_657__delay_656__delay_655__delay_654___plus_502;
  reg [1-1:0] __delay_data_678__delay_677__delay_676__delay_675___eq_508;
  reg [1-1:0] __delay_data_710__delay_709__delay_708__delay_707___eq_511;
  reg signed [16-1:0] __delay_data_742__delay_741__delay_740__delay_739___cond_236;
  reg signed [16-1:0] __delay_data_762__delay_761__delay_760__delay_759___cond_248;
  reg [16-1:0] __delay_data_782__delay_781__delay_780__delay_779___plus_414;
  reg [1-1:0] __delay_data_803__delay_802__delay_801__delay_800___eq_420;
  reg [1-1:0] __delay_data_835__delay_834__delay_833__delay_832___eq_423;
  reg signed [16-1:0] __delay_data_618__delay_617__delay_616__delay_615___cond_237;
  reg signed [16-1:0] __delay_data_638__delay_637__delay_636__delay_635___cond_249;
  reg [16-1:0] __delay_data_658__delay_657__delay_656__delay_655___plus_502;
  reg [1-1:0] __delay_data_679__delay_678__delay_677__delay_676___eq_508;
  reg [1-1:0] __delay_data_711__delay_710__delay_709__delay_708___eq_511;
  reg signed [16-1:0] __delay_data_743__delay_742__delay_741__delay_740___cond_236;
  reg signed [16-1:0] __delay_data_763__delay_762__delay_761__delay_760___cond_248;
  reg [16-1:0] __delay_data_783__delay_782__delay_781__delay_780___plus_414;
  reg [1-1:0] __delay_data_804__delay_803__delay_802__delay_801___eq_420;
  reg [1-1:0] __delay_data_836__delay_835__delay_834__delay_833___eq_423;
  reg signed [16-1:0] __delay_data_619__delay_618__delay_617__delay_616___cond_237;
  reg signed [16-1:0] __delay_data_639__delay_638__delay_637__delay_636___cond_249;
  reg [16-1:0] __delay_data_659__delay_658__delay_657__delay_656___plus_502;
  reg [1-1:0] __delay_data_680__delay_679__delay_678__delay_677___eq_508;
  reg [1-1:0] __delay_data_712__delay_711__delay_710__delay_709___eq_511;
  reg signed [16-1:0] __delay_data_744__delay_743__delay_742__delay_741___cond_236;
  reg signed [16-1:0] __delay_data_764__delay_763__delay_762__delay_761___cond_248;
  reg [16-1:0] __delay_data_784__delay_783__delay_782__delay_781___plus_414;
  reg [1-1:0] __delay_data_805__delay_804__delay_803__delay_802___eq_420;
  reg [1-1:0] __delay_data_837__delay_836__delay_835__delay_834___eq_423;
  reg signed [16-1:0] __delay_data_620__delay_619__delay_618__delay_617___cond_237;
  reg signed [16-1:0] __delay_data_640__delay_639__delay_638__delay_637___cond_249;
  reg [16-1:0] __delay_data_660__delay_659__delay_658__delay_657___plus_502;
  reg [1-1:0] __delay_data_681__delay_680__delay_679__delay_678___eq_508;
  reg [1-1:0] __delay_data_713__delay_712__delay_711__delay_710___eq_511;
  reg signed [16-1:0] __delay_data_745__delay_744__delay_743__delay_742___cond_236;
  reg signed [16-1:0] __delay_data_765__delay_764__delay_763__delay_762___cond_248;
  reg [16-1:0] __delay_data_785__delay_784__delay_783__delay_782___plus_414;
  reg [1-1:0] __delay_data_806__delay_805__delay_804__delay_803___eq_420;
  reg [1-1:0] __delay_data_838__delay_837__delay_836__delay_835___eq_423;
  reg signed [16-1:0] __delay_data_621__delay_620__delay_619__delay_618___cond_237;
  reg signed [16-1:0] __delay_data_641__delay_640__delay_639__delay_638___cond_249;
  reg [16-1:0] __delay_data_661__delay_660__delay_659__delay_658___plus_502;
  reg [1-1:0] __delay_data_682__delay_681__delay_680__delay_679___eq_508;
  reg [1-1:0] __delay_data_714__delay_713__delay_712__delay_711___eq_511;
  reg signed [16-1:0] __delay_data_746__delay_745__delay_744__delay_743___cond_236;
  reg signed [16-1:0] __delay_data_766__delay_765__delay_764__delay_763___cond_248;
  reg [16-1:0] __delay_data_786__delay_785__delay_784__delay_783___plus_414;
  reg [1-1:0] __delay_data_807__delay_806__delay_805__delay_804___eq_420;
  reg [1-1:0] __delay_data_839__delay_838__delay_837__delay_836___eq_423;
  wire signed [32-1:0] __substreamoutput_data_396;
  assign __substreamoutput_data_396 = acc_0_sum_data;
  wire [1-1:0] __substreamoutput_data_397;
  assign __substreamoutput_data_397 = acc_0_valid_data;
  reg signed [32-1:0] _plus_data_398;
  wire signed [32-1:0] __substreamoutput_data_484;
  assign __substreamoutput_data_484 = acc_1_sum_data;
  reg signed [32-1:0] _plus_data_486;
  reg signed [16-1:0] __delay_data_642__delay_641__delay_640__delay_639___cond_249;
  reg [16-1:0] __delay_data_662__delay_661__delay_660__delay_659___plus_502;
  reg [1-1:0] __delay_data_683__delay_682__delay_681__delay_680___eq_508;
  reg [1-1:0] __delay_data_715__delay_714__delay_713__delay_712___eq_511;
  reg signed [16-1:0] __delay_data_767__delay_766__delay_765__delay_764___cond_248;
  reg [16-1:0] __delay_data_787__delay_786__delay_785__delay_784___plus_414;
  reg [1-1:0] __delay_data_808__delay_807__delay_806__delay_805___eq_420;
  reg [1-1:0] __delay_data_840__delay_839__delay_838__delay_837___eq_423;
  reg [1-1:0] __delay_data_852__substreamoutput_397;
  reg signed [32-1:0] __variable_wdata_52;
  assign mul_rshift_round_clip_4_x_data = __variable_wdata_52;
  reg signed [16-1:0] __variable_wdata_53;
  assign mul_rshift_round_clip_4_y_data = __variable_wdata_53;
  reg [6-1:0] __variable_wdata_54;
  assign mul_rshift_round_clip_4_rshift_data = __variable_wdata_54;
  assign _mul_rshift_round_clip_4_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _mul_rshift_round_clip_4_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _mul_rshift_round_clip_4_stream_internal_oready;
  reg signed [32-1:0] __variable_wdata_86;
  assign mul_rshift_round_clip_5_x_data = __variable_wdata_86;
  reg signed [16-1:0] __variable_wdata_87;
  assign mul_rshift_round_clip_5_y_data = __variable_wdata_87;
  reg [6-1:0] __variable_wdata_88;
  assign mul_rshift_round_clip_5_rshift_data = __variable_wdata_88;
  assign _mul_rshift_round_clip_5_is_root = ((_stream_matmul_5_busy)? 0 : 1) && 1;
  assign _mul_rshift_round_clip_5_stream_oready = ((_stream_matmul_5_busy)? _stream_matmul_5_stream_oready : 1) && _mul_rshift_round_clip_5_stream_internal_oready;
  assign _stream_matmul_5_stream_internal_oready = ((_stream_matmul_5_busy)? _mul_rshift_round_clip_5_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _mul_rshift_round_clip_4_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _acc_1_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _acc_0_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _add_tree_3_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _add_tree_2_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _mul_9_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _mul_8_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _mul_7_stream_internal_oready : 1) && (((_stream_matmul_5_busy)? _mul_6_stream_internal_oready : 1) && 1)))))))));
  reg [1-1:0] __delay_data_684__delay_683__delay_682__delay_681___eq_508;
  reg [1-1:0] __delay_data_716__delay_715__delay_714__delay_713___eq_511;
  reg [1-1:0] __delay_data_809__delay_808__delay_807__delay_806___eq_420;
  reg [1-1:0] __delay_data_841__delay_840__delay_839__delay_838___eq_423;
  reg [1-1:0] __delay_data_853__delay_852__substreamoutput_397;
  reg [1-1:0] __delay_data_685__delay_684__delay_683__delay_682___eq_508;
  reg [1-1:0] __delay_data_717__delay_716__delay_715__delay_714___eq_511;
  reg [1-1:0] __delay_data_810__delay_809__delay_808__delay_807___eq_420;
  reg [1-1:0] __delay_data_842__delay_841__delay_840__delay_839___eq_423;
  reg [1-1:0] __delay_data_854__delay_853__delay_852__substreamoutput_397;
  reg [1-1:0] __delay_data_686__delay_685__delay_684__delay_683___eq_508;
  reg [1-1:0] __delay_data_718__delay_717__delay_716__delay_715___eq_511;
  reg [1-1:0] __delay_data_811__delay_810__delay_809__delay_808___eq_420;
  reg [1-1:0] __delay_data_843__delay_842__delay_841__delay_840___eq_423;
  reg [1-1:0] __delay_data_855__delay_854__delay_853____substreamoutput_397;
  reg [1-1:0] __delay_data_687__delay_686__delay_685__delay_684___eq_508;
  reg [1-1:0] __delay_data_719__delay_718__delay_717__delay_716___eq_511;
  reg [1-1:0] __delay_data_812__delay_811__delay_810__delay_809___eq_420;
  reg [1-1:0] __delay_data_844__delay_843__delay_842__delay_841___eq_423;
  reg [1-1:0] __delay_data_856__delay_855__delay_854____substreamoutput_397;
  reg [1-1:0] __delay_data_688__delay_687__delay_686__delay_685___eq_508;
  reg [1-1:0] __delay_data_720__delay_719__delay_718__delay_717___eq_511;
  reg [1-1:0] __delay_data_813__delay_812__delay_811__delay_810___eq_420;
  reg [1-1:0] __delay_data_845__delay_844__delay_843__delay_842___eq_423;
  reg [1-1:0] __delay_data_857__delay_856__delay_855____substreamoutput_397;
  reg [1-1:0] __delay_data_689__delay_688__delay_687__delay_686___eq_508;
  reg [1-1:0] __delay_data_721__delay_720__delay_719__delay_718___eq_511;
  reg [1-1:0] __delay_data_814__delay_813__delay_812__delay_811___eq_420;
  reg [1-1:0] __delay_data_846__delay_845__delay_844__delay_843___eq_423;
  reg [1-1:0] __delay_data_858__delay_857__delay_856____substreamoutput_397;
  reg [1-1:0] __delay_data_690__delay_689__delay_688__delay_687___eq_508;
  reg [1-1:0] __delay_data_722__delay_721__delay_720__delay_719___eq_511;
  reg [1-1:0] __delay_data_815__delay_814__delay_813__delay_812___eq_420;
  reg [1-1:0] __delay_data_847__delay_846__delay_845__delay_844___eq_423;
  reg [1-1:0] __delay_data_859__delay_858__delay_857____substreamoutput_397;
  reg [1-1:0] __delay_data_691__delay_690__delay_689__delay_688___eq_508;
  reg [1-1:0] __delay_data_723__delay_722__delay_721__delay_720___eq_511;
  reg [1-1:0] __delay_data_816__delay_815__delay_814__delay_813___eq_420;
  reg [1-1:0] __delay_data_848__delay_847__delay_846__delay_845___eq_423;
  reg [1-1:0] __delay_data_860__delay_859__delay_858____substreamoutput_397;
  reg [1-1:0] __delay_data_692__delay_691__delay_690__delay_689___eq_508;
  reg [1-1:0] __delay_data_724__delay_723__delay_722__delay_721___eq_511;
  reg [1-1:0] __delay_data_817__delay_816__delay_815__delay_814___eq_420;
  reg [1-1:0] __delay_data_849__delay_848__delay_847__delay_846___eq_423;
  reg [1-1:0] __delay_data_861__delay_860__delay_859____substreamoutput_397;
  wire signed [16-1:0] __substreamoutput_data_415;
  assign __substreamoutput_data_415 = mul_rshift_round_clip_4_z_data;
  reg [1-1:0] _greaterthan_data_417;
  wire signed [16-1:0] __substreamoutput_data_503;
  assign __substreamoutput_data_503 = mul_rshift_round_clip_5_z_data;
  reg [1-1:0] _greaterthan_data_505;
  reg signed [16-1:0] __delay_data_663__substreamoutput_503;
  reg [1-1:0] __delay_data_693__delay_692__delay_691__delay_690___eq_508;
  reg [1-1:0] __delay_data_725__delay_724__delay_723__delay_722___eq_511;
  reg signed [16-1:0] __delay_data_788__substreamoutput_415;
  reg [1-1:0] __delay_data_818__delay_817__delay_816__delay_815___eq_420;
  reg [1-1:0] __delay_data_850__delay_849__delay_848__delay_847___eq_423;
  reg [1-1:0] __delay_data_862__delay_861__delay_860____substreamoutput_397;
  reg signed [16-1:0] _cond_data_419;
  reg signed [16-1:0] _cond_data_507;
  reg [1-1:0] __delay_data_694__delay_693__delay_692__delay_691___eq_508;
  reg signed [16-1:0] __delay_data_695__delay_663__substreamoutput_503;
  reg [1-1:0] __delay_data_726__delay_725__delay_724__delay_723___eq_511;
  reg [1-1:0] __delay_data_819__delay_818__delay_817__delay_816___eq_420;
  reg signed [16-1:0] __delay_data_820__delay_788__substreamoutput_415;
  reg [1-1:0] __delay_data_851__delay_850__delay_849__delay_848___eq_423;
  reg [1-1:0] __delay_data_863__delay_862__delay_861____substreamoutput_397;
  wire signed [16-1:0] _cond_data_422;
  assign _cond_data_422 = (__delay_data_819__delay_818__delay_817__delay_816___eq_420)? _cond_data_419 : __delay_data_820__delay_788__substreamoutput_415;
  wire signed [16-1:0] _cond_data_425;
  assign _cond_data_425 = (__delay_data_851__delay_850__delay_849__delay_848___eq_423)? __delay_data_820__delay_788__substreamoutput_415 : _cond_data_422;
  wire signed [16-1:0] _reinterpretcast_src_426;
  assign _reinterpretcast_src_426 = _cond_data_425;
  wire signed [16-1:0] _reinterpretcast_data_426;
  assign _reinterpretcast_data_426 = _reinterpretcast_src_426;
  wire signed [16-1:0] _cond_data_510;
  assign _cond_data_510 = (__delay_data_694__delay_693__delay_692__delay_691___eq_508)? _cond_data_507 : __delay_data_695__delay_663__substreamoutput_503;
  wire signed [16-1:0] _cond_data_513;
  assign _cond_data_513 = (__delay_data_726__delay_725__delay_724__delay_723___eq_511)? __delay_data_695__delay_663__substreamoutput_503 : _cond_data_510;
  wire signed [16-1:0] _reinterpretcast_src_514;
  assign _reinterpretcast_src_514 = _cond_data_513;
  wire signed [16-1:0] _reinterpretcast_data_514;
  assign _reinterpretcast_data_514 = _reinterpretcast_src_514;
  wire [32-1:0] _cat_data_515;
  assign _cat_data_515 = { _reinterpretcast_data_514, _reinterpretcast_data_426 };
  wire [32-1:0] stream_matmul_5_sink_33_data;
  assign stream_matmul_5_sink_33_data = _cat_data_515;
  wire [1-1:0] stream_matmul_5_sink_34_data;
  assign stream_matmul_5_sink_34_data = __delay_data_863__delay_862__delay_861____substreamoutput_397;
  wire _set_flag_234;
  assign _set_flag_234 = matmul_5_comp_fsm == 3;
  reg [9-1:0] __variable_wdata_205;
  assign stream_matmul_5_parameter_0_data = __variable_wdata_205;
  wire _set_flag_235;
  assign _set_flag_235 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_206;
  assign stream_matmul_5_parameter_1_data = __variable_wdata_206;
  wire _set_flag_236;
  assign _set_flag_236 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_207;
  assign stream_matmul_5_parameter_2_data = __variable_wdata_207;
  wire _set_flag_237;
  assign _set_flag_237 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_208;
  assign stream_matmul_5_parameter_3_data = __variable_wdata_208;
  wire _set_flag_238;
  assign _set_flag_238 = matmul_5_comp_fsm == 3;
  reg [2-1:0] __variable_wdata_209;
  assign stream_matmul_5_parameter_4_data = __variable_wdata_209;
  wire _set_flag_239;
  assign _set_flag_239 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_226;
  assign stream_matmul_5_parameter_6_data = __variable_wdata_226;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_cur_offset_0;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_cur_offset_1;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_cur_offset_2;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_cur_offset_3;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_size_0;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_size_1;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_size_2;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_size_3;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_stride_0;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_stride_1;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_stride_2;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_stride_3;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_count_0;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_count_1;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_count_2;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_count_3;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_size_buf_0;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_size_buf_1;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_size_buf_2;
  reg [33-1:0] _source_stream_matmul_5_source_7_pat_size_buf_3;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_stride_buf_0;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_stride_buf_1;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_stride_buf_2;
  reg [32-1:0] _source_stream_matmul_5_source_7_pat_stride_buf_3;
  wire _set_flag_240;
  assign _set_flag_240 = matmul_5_comp_fsm == 3;
  assign ram_w32_l128_id1_0_addr = (_stream_matmul_5_stream_oready && _stream_matmul_5_source_7_source_ram_renable && (_stream_matmul_5_source_7_source_sel == 1))? _stream_matmul_5_source_7_source_ram_raddr : 'hx;
  assign ram_w32_l128_id1_0_enable = (_stream_matmul_5_stream_oready && _stream_matmul_5_source_7_source_ram_renable && (_stream_matmul_5_source_7_source_sel == 1))? 1'd1 : 0;
  localparam _tmp_241 = 1;
  wire [_tmp_241-1:0] _tmp_242;
  assign _tmp_242 = _stream_matmul_5_stream_oready && _stream_matmul_5_source_7_source_ram_renable && (_stream_matmul_5_source_7_source_sel == 1);
  reg [_tmp_241-1:0] __tmp_242_1;
  assign _stream_matmul_5_source_7_source_ram_rdata = (_stream_matmul_5_source_7_source_sel == 1)? ram_w32_l128_id1_0_rdata : 'hx;
  reg [32-1:0] __variable_wdata_227;
  assign stream_matmul_5_source_7_data = __variable_wdata_227;
  reg [32-1:0] _stream_matmul_5_source_7_source_pat_fsm_0;
  localparam _stream_matmul_5_source_7_source_pat_fsm_0_init = 0;
  wire [32-1:0] _stream_matmul_5_source_7_source_pat_all_offset;
  assign _stream_matmul_5_source_7_source_pat_all_offset = _stream_matmul_5_source_7_source_offset_buf + _source_stream_matmul_5_source_7_pat_cur_offset_0 + _source_stream_matmul_5_source_7_pat_cur_offset_1 + _source_stream_matmul_5_source_7_pat_cur_offset_2 + _source_stream_matmul_5_source_7_pat_cur_offset_3;
  wire _set_flag_243;
  assign _set_flag_243 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_238;
  assign stream_matmul_5_parameter_8_data = __variable_wdata_238;
  wire _set_flag_244;
  assign _set_flag_244 = matmul_5_comp_fsm == 3;
  reg [32-1:0] __variable_wdata_239;
  assign stream_matmul_5_source_9_data = __variable_wdata_239;
  wire _set_flag_245;
  assign _set_flag_245 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_250;
  assign stream_matmul_5_parameter_10_data = __variable_wdata_250;
  wire _set_flag_246;
  assign _set_flag_246 = matmul_5_comp_fsm == 3;
  reg [32-1:0] __variable_wdata_251;
  assign stream_matmul_5_source_11_data = __variable_wdata_251;
  wire _set_flag_247;
  assign _set_flag_247 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_262;
  assign stream_matmul_5_parameter_12_data = __variable_wdata_262;
  wire _set_flag_248;
  assign _set_flag_248 = matmul_5_comp_fsm == 3;
  reg [32-1:0] __variable_wdata_263;
  assign stream_matmul_5_source_13_data = __variable_wdata_263;
  wire _set_flag_249;
  assign _set_flag_249 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_274;
  assign stream_matmul_5_parameter_14_data = __variable_wdata_274;
  wire _set_flag_250;
  assign _set_flag_250 = matmul_5_comp_fsm == 3;
  reg [32-1:0] __variable_wdata_275;
  assign stream_matmul_5_source_15_data = __variable_wdata_275;
  wire _set_flag_251;
  assign _set_flag_251 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_286;
  assign stream_matmul_5_parameter_16_data = __variable_wdata_286;
  wire _set_flag_252;
  assign _set_flag_252 = matmul_5_comp_fsm == 3;
  reg [1-1:0] __variable_wdata_287;
  assign stream_matmul_5_parameter_17_data = __variable_wdata_287;
  wire _set_flag_253;
  assign _set_flag_253 = matmul_5_comp_fsm == 3;
  reg [5-1:0] __variable_wdata_288;
  assign stream_matmul_5_parameter_18_data = __variable_wdata_288;
  wire _set_flag_254;
  assign _set_flag_254 = matmul_5_comp_fsm == 3;
  reg [2-1:0] __variable_wdata_289;
  assign stream_matmul_5_parameter_19_data = __variable_wdata_289;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_cur_offset_0;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_cur_offset_1;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_cur_offset_2;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_cur_offset_3;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_size_0;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_size_1;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_size_2;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_size_3;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_stride_0;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_stride_1;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_stride_2;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_stride_3;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_count_0;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_count_1;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_count_2;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_count_3;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_size_buf_0;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_size_buf_1;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_size_buf_2;
  reg [33-1:0] _source_stream_matmul_5_source_20_pat_size_buf_3;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_stride_buf_0;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_stride_buf_1;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_stride_buf_2;
  reg [32-1:0] _source_stream_matmul_5_source_20_pat_stride_buf_3;
  wire _set_flag_255;
  assign _set_flag_255 = matmul_5_comp_fsm == 3;
  assign ram_w32_l512_id0_0_addr = (_stream_matmul_5_stream_oready && _stream_matmul_5_source_20_source_ram_renable && (_stream_matmul_5_source_20_source_sel == 2))? _stream_matmul_5_source_20_source_ram_raddr : 'hx;
  assign ram_w32_l512_id0_0_enable = (_stream_matmul_5_stream_oready && _stream_matmul_5_source_20_source_ram_renable && (_stream_matmul_5_source_20_source_sel == 2))? 1'd1 : 0;
  localparam _tmp_256 = 1;
  wire [_tmp_256-1:0] _tmp_257;
  assign _tmp_257 = _stream_matmul_5_stream_oready && _stream_matmul_5_source_20_source_ram_renable && (_stream_matmul_5_source_20_source_sel == 2);
  reg [_tmp_256-1:0] __tmp_257_1;
  assign _stream_matmul_5_source_20_source_ram_rdata = (_stream_matmul_5_source_20_source_sel == 2)? ram_w32_l512_id0_0_rdata : 'hx;
  reg [32-1:0] __variable_wdata_290;
  assign stream_matmul_5_source_20_data = __variable_wdata_290;
  reg [32-1:0] _stream_matmul_5_source_20_source_pat_fsm_1;
  localparam _stream_matmul_5_source_20_source_pat_fsm_1_init = 0;
  wire [32-1:0] _stream_matmul_5_source_20_source_pat_all_offset;
  assign _stream_matmul_5_source_20_source_pat_all_offset = _stream_matmul_5_source_20_source_offset_buf + _source_stream_matmul_5_source_20_pat_cur_offset_0 + _source_stream_matmul_5_source_20_pat_cur_offset_1 + _source_stream_matmul_5_source_20_pat_cur_offset_2 + _source_stream_matmul_5_source_20_pat_cur_offset_3;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_cur_offset_0;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_cur_offset_1;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_cur_offset_2;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_cur_offset_3;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_size_0;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_size_1;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_size_2;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_size_3;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_stride_0;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_stride_1;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_stride_2;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_stride_3;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_count_0;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_count_1;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_count_2;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_count_3;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_size_buf_0;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_size_buf_1;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_size_buf_2;
  reg [33-1:0] _source_stream_matmul_5_source_21_pat_size_buf_3;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_stride_buf_0;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_stride_buf_1;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_stride_buf_2;
  reg [32-1:0] _source_stream_matmul_5_source_21_pat_stride_buf_3;
  wire _set_flag_258;
  assign _set_flag_258 = matmul_5_comp_fsm == 3;
  assign ram_w32_l1024_id0_0_addr = (_stream_matmul_5_stream_oready && _stream_matmul_5_source_21_source_ram_renable && (_stream_matmul_5_source_21_source_sel == 3))? _stream_matmul_5_source_21_source_ram_raddr : 'hx;
  assign ram_w32_l1024_id0_0_enable = (_stream_matmul_5_stream_oready && _stream_matmul_5_source_21_source_ram_renable && (_stream_matmul_5_source_21_source_sel == 3))? 1'd1 : 0;
  localparam _tmp_259 = 1;
  wire [_tmp_259-1:0] _tmp_260;
  assign _tmp_260 = _stream_matmul_5_stream_oready && _stream_matmul_5_source_21_source_ram_renable && (_stream_matmul_5_source_21_source_sel == 3);
  reg [_tmp_259-1:0] __tmp_260_1;
  assign _stream_matmul_5_source_21_source_ram_rdata = (_stream_matmul_5_source_21_source_sel == 3)? ram_w32_l1024_id0_0_rdata : 'hx;
  reg [32-1:0] __variable_wdata_311;
  assign stream_matmul_5_source_21_data = __variable_wdata_311;
  reg [32-1:0] _stream_matmul_5_source_21_source_pat_fsm_2;
  localparam _stream_matmul_5_source_21_source_pat_fsm_2_init = 0;
  wire [32-1:0] _stream_matmul_5_source_21_source_pat_all_offset;
  assign _stream_matmul_5_source_21_source_pat_all_offset = _stream_matmul_5_source_21_source_offset_buf + _source_stream_matmul_5_source_21_pat_cur_offset_0 + _source_stream_matmul_5_source_21_pat_cur_offset_1 + _source_stream_matmul_5_source_21_pat_cur_offset_2 + _source_stream_matmul_5_source_21_pat_cur_offset_3;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_cur_offset_0;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_cur_offset_1;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_cur_offset_2;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_cur_offset_3;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_size_0;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_size_1;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_size_2;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_size_3;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_stride_0;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_stride_1;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_stride_2;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_stride_3;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_count_0;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_count_1;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_count_2;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_count_3;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_size_buf_0;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_size_buf_1;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_size_buf_2;
  reg [33-1:0] _source_stream_matmul_5_source_22_pat_size_buf_3;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_stride_buf_0;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_stride_buf_1;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_stride_buf_2;
  reg [32-1:0] _source_stream_matmul_5_source_22_pat_stride_buf_3;
  wire _set_flag_261;
  assign _set_flag_261 = matmul_5_comp_fsm == 3;
  assign ram_w32_l1024_id1_0_addr = (_stream_matmul_5_stream_oready && _stream_matmul_5_source_22_source_ram_renable && (_stream_matmul_5_source_22_source_sel == 4))? _stream_matmul_5_source_22_source_ram_raddr : 'hx;
  assign ram_w32_l1024_id1_0_enable = (_stream_matmul_5_stream_oready && _stream_matmul_5_source_22_source_ram_renable && (_stream_matmul_5_source_22_source_sel == 4))? 1'd1 : 0;
  localparam _tmp_262 = 1;
  wire [_tmp_262-1:0] _tmp_263;
  assign _tmp_263 = _stream_matmul_5_stream_oready && _stream_matmul_5_source_22_source_ram_renable && (_stream_matmul_5_source_22_source_sel == 4);
  reg [_tmp_262-1:0] __tmp_263_1;
  assign _stream_matmul_5_source_22_source_ram_rdata = (_stream_matmul_5_source_22_source_sel == 4)? ram_w32_l1024_id1_0_rdata : 'hx;
  reg [32-1:0] __variable_wdata_312;
  assign stream_matmul_5_source_22_data = __variable_wdata_312;
  reg [32-1:0] _stream_matmul_5_source_22_source_pat_fsm_3;
  localparam _stream_matmul_5_source_22_source_pat_fsm_3_init = 0;
  wire [32-1:0] _stream_matmul_5_source_22_source_pat_all_offset;
  assign _stream_matmul_5_source_22_source_pat_all_offset = _stream_matmul_5_source_22_source_offset_buf + _source_stream_matmul_5_source_22_pat_cur_offset_0 + _source_stream_matmul_5_source_22_pat_cur_offset_1 + _source_stream_matmul_5_source_22_pat_cur_offset_2 + _source_stream_matmul_5_source_22_pat_cur_offset_3;
  wire _set_flag_264;
  assign _set_flag_264 = matmul_5_comp_fsm == 3;
  reg _tmp_265;
  reg _tmp_266;
  reg _tmp_267;
  reg _tmp_268;
  reg _tmp_269;
  reg _tmp_270;
  reg _tmp_271;
  reg _tmp_272;
  reg _tmp_273;
  reg _tmp_274;
  reg _tmp_275;
  reg _tmp_276;
  reg _tmp_277;
  reg _tmp_278;
  reg _tmp_279;
  reg _tmp_280;
  reg _tmp_281;
  reg _tmp_282;
  reg _tmp_283;
  reg _tmp_284;
  reg _tmp_285;
  reg _tmp_286;
  reg _tmp_287;
  reg _tmp_288;
  reg _tmp_289;
  reg _tmp_290;
  reg _tmp_291;
  reg _tmp_292;
  reg _tmp_293;
  reg _tmp_294;
  reg _tmp_295;
  reg _tmp_296;
  reg _tmp_297;
  reg _tmp_298;
  localparam _tmp_299 = 33;
  wire [_tmp_299-1:0] _tmp_300;
  assign _tmp_300 = matmul_5_stream_out_local + matmul_5_out_page_comp_offset_buf;
  reg [_tmp_299-1:0] _tmp_301;
  reg [_tmp_299-1:0] _tmp_302;
  reg [_tmp_299-1:0] _tmp_303;
  reg [_tmp_299-1:0] _tmp_304;
  reg [_tmp_299-1:0] _tmp_305;
  reg [_tmp_299-1:0] _tmp_306;
  reg [_tmp_299-1:0] _tmp_307;
  reg [_tmp_299-1:0] _tmp_308;
  reg [_tmp_299-1:0] _tmp_309;
  reg [_tmp_299-1:0] _tmp_310;
  reg [_tmp_299-1:0] _tmp_311;
  reg [_tmp_299-1:0] _tmp_312;
  reg [_tmp_299-1:0] _tmp_313;
  reg [_tmp_299-1:0] _tmp_314;
  reg [_tmp_299-1:0] _tmp_315;
  reg [_tmp_299-1:0] _tmp_316;
  reg [_tmp_299-1:0] _tmp_317;
  reg [_tmp_299-1:0] _tmp_318;
  reg [_tmp_299-1:0] _tmp_319;
  reg [_tmp_299-1:0] _tmp_320;
  reg [_tmp_299-1:0] _tmp_321;
  reg [_tmp_299-1:0] _tmp_322;
  reg [_tmp_299-1:0] _tmp_323;
  reg [_tmp_299-1:0] _tmp_324;
  reg [_tmp_299-1:0] _tmp_325;
  reg [_tmp_299-1:0] _tmp_326;
  reg [_tmp_299-1:0] _tmp_327;
  reg [_tmp_299-1:0] _tmp_328;
  reg [_tmp_299-1:0] _tmp_329;
  reg [_tmp_299-1:0] _tmp_330;
  reg [_tmp_299-1:0] _tmp_331;
  reg [_tmp_299-1:0] _tmp_332;
  reg [_tmp_299-1:0] _tmp_333;
  reg [_tmp_299-1:0] _tmp_334;
  reg [32-1:0] _tmp_335;
  reg [32-1:0] _tmp_336;
  reg [32-1:0] _tmp_337;
  reg [32-1:0] _tmp_338;
  reg [32-1:0] _tmp_339;
  reg [32-1:0] _tmp_340;
  reg [32-1:0] _tmp_341;
  reg [32-1:0] _tmp_342;
  reg [32-1:0] _tmp_343;
  reg [32-1:0] _tmp_344;
  reg [32-1:0] _tmp_345;
  reg [32-1:0] _tmp_346;
  reg [32-1:0] _tmp_347;
  reg [32-1:0] _tmp_348;
  reg [32-1:0] _tmp_349;
  reg [32-1:0] _tmp_350;
  reg [32-1:0] _tmp_351;
  reg [32-1:0] _tmp_352;
  reg [32-1:0] _tmp_353;
  reg [32-1:0] _tmp_354;
  reg [32-1:0] _tmp_355;
  reg [32-1:0] _tmp_356;
  reg [32-1:0] _tmp_357;
  reg [32-1:0] _tmp_358;
  reg [32-1:0] _tmp_359;
  reg [32-1:0] _tmp_360;
  reg [32-1:0] _tmp_361;
  reg [32-1:0] _tmp_362;
  reg [32-1:0] _tmp_363;
  reg [32-1:0] _tmp_364;
  reg [32-1:0] _tmp_365;
  reg [32-1:0] _tmp_366;
  reg [32-1:0] _tmp_367;
  reg [32-1:0] _tmp_368;
  assign ram_w32_l128_id0_0_addr = (_stream_matmul_5_stream_oready && _stream_matmul_5_sink_33_sink_wenable && (_stream_matmul_5_sink_33_sink_sel == 5))? _stream_matmul_5_sink_33_sink_waddr : 'hx;
  assign ram_w32_l128_id0_0_wdata = (_stream_matmul_5_stream_oready && _stream_matmul_5_sink_33_sink_wenable && (_stream_matmul_5_sink_33_sink_sel == 5))? _stream_matmul_5_sink_33_sink_wdata : 'hx;
  assign ram_w32_l128_id0_0_wenable = (_stream_matmul_5_stream_oready && _stream_matmul_5_sink_33_sink_wenable && (_stream_matmul_5_sink_33_sink_sel == 5))? 1'd1 : 0;
  assign ram_w32_l128_id0_0_enable = (_stream_matmul_5_stream_oready && _stream_matmul_5_sink_33_sink_wenable && (_stream_matmul_5_sink_33_sink_sel == 5))? 1'd1 : 0;
  reg [32-1:0] _stream_matmul_5_sink_33_sink_fsm_4;
  localparam _stream_matmul_5_sink_33_sink_fsm_4_init = 0;
  wire _set_flag_369;
  assign _set_flag_369 = matmul_5_comp_fsm == 4;
  assign _stream_matmul_5_run_flag = (_set_flag_369)? 1 : 0;
  reg _tmp_370;
  reg _tmp_371;
  reg _tmp_372;
  assign _mul_6_source_stop = _mul_6_stream_oready && 1'd0;
  reg _tmp_373;
  reg _tmp_374;
  reg _tmp_375;
  reg _tmp_376;
  reg _tmp_377;
  reg _tmp_378;
  reg _tmp_379;
  reg _tmp_380;
  reg _tmp_381;
  reg _tmp_382;
  assign _mul_6_sink_start = _tmp_382;
  reg _tmp_383;
  reg _tmp_384;
  reg _tmp_385;
  reg _tmp_386;
  reg _tmp_387;
  reg _tmp_388;
  reg _tmp_389;
  reg _tmp_390;
  reg _tmp_391;
  reg _tmp_392;
  assign _mul_6_sink_stop = _tmp_392;
  reg _tmp_393;
  reg _tmp_394;
  reg _tmp_395;
  reg _tmp_396;
  reg _tmp_397;
  reg _tmp_398;
  reg _tmp_399;
  reg _tmp_400;
  reg _tmp_401;
  reg _tmp_402;
  assign _mul_6_sink_busy = _tmp_402;
  reg _tmp_403;
  assign _mul_6_busy = _mul_6_source_busy || _mul_6_sink_busy || _mul_6_busy_reg;
  reg _tmp_404;
  reg _tmp_405;
  reg _tmp_406;
  assign _mul_7_source_stop = _mul_7_stream_oready && 1'd0;
  reg _tmp_407;
  reg _tmp_408;
  reg _tmp_409;
  reg _tmp_410;
  reg _tmp_411;
  reg _tmp_412;
  reg _tmp_413;
  reg _tmp_414;
  reg _tmp_415;
  reg _tmp_416;
  assign _mul_7_sink_start = _tmp_416;
  reg _tmp_417;
  reg _tmp_418;
  reg _tmp_419;
  reg _tmp_420;
  reg _tmp_421;
  reg _tmp_422;
  reg _tmp_423;
  reg _tmp_424;
  reg _tmp_425;
  reg _tmp_426;
  assign _mul_7_sink_stop = _tmp_426;
  reg _tmp_427;
  reg _tmp_428;
  reg _tmp_429;
  reg _tmp_430;
  reg _tmp_431;
  reg _tmp_432;
  reg _tmp_433;
  reg _tmp_434;
  reg _tmp_435;
  reg _tmp_436;
  assign _mul_7_sink_busy = _tmp_436;
  reg _tmp_437;
  assign _mul_7_busy = _mul_7_source_busy || _mul_7_sink_busy || _mul_7_busy_reg;
  reg _tmp_438;
  reg _tmp_439;
  reg _tmp_440;
  assign _add_tree_2_source_stop = _add_tree_2_stream_oready && 1'd0;
  reg _tmp_441;
  reg _tmp_442;
  reg _tmp_443;
  assign _add_tree_2_sink_start = _tmp_443;
  reg _tmp_444;
  reg _tmp_445;
  reg _tmp_446;
  assign _add_tree_2_sink_stop = _tmp_446;
  reg _tmp_447;
  reg _tmp_448;
  reg _tmp_449;
  assign _add_tree_2_sink_busy = _tmp_449;
  reg _tmp_450;
  assign _add_tree_2_busy = _add_tree_2_source_busy || _add_tree_2_sink_busy || _add_tree_2_busy_reg;
  reg _tmp_451;
  reg _tmp_452;
  reg _tmp_453;
  reg _tmp_454;
  reg _tmp_455;
  reg _tmp_456;
  reg _tmp_457;
  reg _tmp_458;
  reg _tmp_459;
  reg _tmp_460;
  assign _acc_0_source_stop = _acc_0_stream_oready && 1'd0;
  reg _tmp_461;
  reg _tmp_462;
  reg _tmp_463;
  reg _tmp_464;
  reg _tmp_465;
  reg _tmp_466;
  reg _tmp_467;
  assign _acc_0_sink_start = _tmp_467;
  reg _tmp_468;
  reg _tmp_469;
  reg _tmp_470;
  reg _tmp_471;
  reg _tmp_472;
  reg _tmp_473;
  reg _tmp_474;
  assign _acc_0_sink_stop = _tmp_474;
  reg _tmp_475;
  reg _tmp_476;
  reg _tmp_477;
  reg _tmp_478;
  reg _tmp_479;
  reg _tmp_480;
  reg _tmp_481;
  assign _acc_0_sink_busy = _tmp_481;
  reg _tmp_482;
  assign _acc_0_busy = _acc_0_source_busy || _acc_0_sink_busy || _acc_0_busy_reg;
  reg _tmp_483;
  reg _tmp_484;
  reg _tmp_485;
  assign _mul_rshift_round_clip_4_source_stop = _mul_rshift_round_clip_4_stream_oready && 1'd0;
  reg _tmp_486;
  reg _tmp_487;
  reg _tmp_488;
  reg _tmp_489;
  reg _tmp_490;
  reg _tmp_491;
  reg _tmp_492;
  reg _tmp_493;
  reg _tmp_494;
  reg _tmp_495;
  assign _mul_rshift_round_clip_4_sink_start = _tmp_495;
  reg _tmp_496;
  reg _tmp_497;
  reg _tmp_498;
  reg _tmp_499;
  reg _tmp_500;
  reg _tmp_501;
  reg _tmp_502;
  reg _tmp_503;
  reg _tmp_504;
  reg _tmp_505;
  assign _mul_rshift_round_clip_4_sink_stop = _tmp_505;
  reg _tmp_506;
  reg _tmp_507;
  reg _tmp_508;
  reg _tmp_509;
  reg _tmp_510;
  reg _tmp_511;
  reg _tmp_512;
  reg _tmp_513;
  reg _tmp_514;
  reg _tmp_515;
  assign _mul_rshift_round_clip_4_sink_busy = _tmp_515;
  reg _tmp_516;
  assign _mul_rshift_round_clip_4_busy = _mul_rshift_round_clip_4_source_busy || _mul_rshift_round_clip_4_sink_busy || _mul_rshift_round_clip_4_busy_reg;
  reg _tmp_517;
  reg _tmp_518;
  reg _tmp_519;
  assign _mul_8_source_stop = _mul_8_stream_oready && 1'd0;
  reg _tmp_520;
  reg _tmp_521;
  reg _tmp_522;
  reg _tmp_523;
  reg _tmp_524;
  reg _tmp_525;
  reg _tmp_526;
  reg _tmp_527;
  reg _tmp_528;
  reg _tmp_529;
  assign _mul_8_sink_start = _tmp_529;
  reg _tmp_530;
  reg _tmp_531;
  reg _tmp_532;
  reg _tmp_533;
  reg _tmp_534;
  reg _tmp_535;
  reg _tmp_536;
  reg _tmp_537;
  reg _tmp_538;
  reg _tmp_539;
  assign _mul_8_sink_stop = _tmp_539;
  reg _tmp_540;
  reg _tmp_541;
  reg _tmp_542;
  reg _tmp_543;
  reg _tmp_544;
  reg _tmp_545;
  reg _tmp_546;
  reg _tmp_547;
  reg _tmp_548;
  reg _tmp_549;
  assign _mul_8_sink_busy = _tmp_549;
  reg _tmp_550;
  assign _mul_8_busy = _mul_8_source_busy || _mul_8_sink_busy || _mul_8_busy_reg;
  reg _tmp_551;
  reg _tmp_552;
  reg _tmp_553;
  assign _mul_9_source_stop = _mul_9_stream_oready && 1'd0;
  reg _tmp_554;
  reg _tmp_555;
  reg _tmp_556;
  reg _tmp_557;
  reg _tmp_558;
  reg _tmp_559;
  reg _tmp_560;
  reg _tmp_561;
  reg _tmp_562;
  reg _tmp_563;
  assign _mul_9_sink_start = _tmp_563;
  reg _tmp_564;
  reg _tmp_565;
  reg _tmp_566;
  reg _tmp_567;
  reg _tmp_568;
  reg _tmp_569;
  reg _tmp_570;
  reg _tmp_571;
  reg _tmp_572;
  reg _tmp_573;
  assign _mul_9_sink_stop = _tmp_573;
  reg _tmp_574;
  reg _tmp_575;
  reg _tmp_576;
  reg _tmp_577;
  reg _tmp_578;
  reg _tmp_579;
  reg _tmp_580;
  reg _tmp_581;
  reg _tmp_582;
  reg _tmp_583;
  assign _mul_9_sink_busy = _tmp_583;
  reg _tmp_584;
  assign _mul_9_busy = _mul_9_source_busy || _mul_9_sink_busy || _mul_9_busy_reg;
  reg _tmp_585;
  reg _tmp_586;
  reg _tmp_587;
  assign _add_tree_3_source_stop = _add_tree_3_stream_oready && 1'd0;
  reg _tmp_588;
  reg _tmp_589;
  reg _tmp_590;
  assign _add_tree_3_sink_start = _tmp_590;
  reg _tmp_591;
  reg _tmp_592;
  reg _tmp_593;
  assign _add_tree_3_sink_stop = _tmp_593;
  reg _tmp_594;
  reg _tmp_595;
  reg _tmp_596;
  assign _add_tree_3_sink_busy = _tmp_596;
  reg _tmp_597;
  assign _add_tree_3_busy = _add_tree_3_source_busy || _add_tree_3_sink_busy || _add_tree_3_busy_reg;
  reg _tmp_598;
  reg _tmp_599;
  reg _tmp_600;
  reg _tmp_601;
  reg _tmp_602;
  reg _tmp_603;
  reg _tmp_604;
  reg _tmp_605;
  reg _tmp_606;
  reg _tmp_607;
  assign _acc_1_source_stop = _acc_1_stream_oready && 1'd0;
  reg _tmp_608;
  reg _tmp_609;
  reg _tmp_610;
  reg _tmp_611;
  reg _tmp_612;
  reg _tmp_613;
  reg _tmp_614;
  assign _acc_1_sink_start = _tmp_614;
  reg _tmp_615;
  reg _tmp_616;
  reg _tmp_617;
  reg _tmp_618;
  reg _tmp_619;
  reg _tmp_620;
  reg _tmp_621;
  assign _acc_1_sink_stop = _tmp_621;
  reg _tmp_622;
  reg _tmp_623;
  reg _tmp_624;
  reg _tmp_625;
  reg _tmp_626;
  reg _tmp_627;
  reg _tmp_628;
  assign _acc_1_sink_busy = _tmp_628;
  reg _tmp_629;
  assign _acc_1_busy = _acc_1_source_busy || _acc_1_sink_busy || _acc_1_busy_reg;
  reg _tmp_630;
  reg _tmp_631;
  reg _tmp_632;
  assign _mul_rshift_round_clip_5_source_stop = _mul_rshift_round_clip_5_stream_oready && 1'd0;
  reg _tmp_633;
  reg _tmp_634;
  reg _tmp_635;
  reg _tmp_636;
  reg _tmp_637;
  reg _tmp_638;
  reg _tmp_639;
  reg _tmp_640;
  reg _tmp_641;
  reg _tmp_642;
  assign _mul_rshift_round_clip_5_sink_start = _tmp_642;
  reg _tmp_643;
  reg _tmp_644;
  reg _tmp_645;
  reg _tmp_646;
  reg _tmp_647;
  reg _tmp_648;
  reg _tmp_649;
  reg _tmp_650;
  reg _tmp_651;
  reg _tmp_652;
  assign _mul_rshift_round_clip_5_sink_stop = _tmp_652;
  reg _tmp_653;
  reg _tmp_654;
  reg _tmp_655;
  reg _tmp_656;
  reg _tmp_657;
  reg _tmp_658;
  reg _tmp_659;
  reg _tmp_660;
  reg _tmp_661;
  reg _tmp_662;
  assign _mul_rshift_round_clip_5_sink_busy = _tmp_662;
  reg _tmp_663;
  assign _mul_rshift_round_clip_5_busy = _mul_rshift_round_clip_5_source_busy || _mul_rshift_round_clip_5_sink_busy || _mul_rshift_round_clip_5_busy_reg;
  reg _tmp_664;
  reg _tmp_665;
  reg _tmp_666;
  reg _tmp_667;
  reg _tmp_668;
  reg _tmp_669;
  reg [1-1:0] __variable_wdata_210;
  assign stream_matmul_5__reduce_reset_data = __variable_wdata_210;
  reg _tmp_670;
  reg _tmp_671;
  reg _tmp_672;
  reg _tmp_673;
  assign _stream_matmul_5_source_stop = _stream_matmul_5_stream_oready && (_stream_matmul_5_source_11_idle && _stream_matmul_5_source_13_idle && _stream_matmul_5_source_15_idle && _stream_matmul_5_source_20_idle && _stream_matmul_5_source_21_idle && _stream_matmul_5_source_22_idle && _stream_matmul_5_source_7_idle && _stream_matmul_5_source_9_idle && (_stream_matmul_5_fsm == 3));
  localparam _tmp_674 = 1;
  wire [_tmp_674-1:0] _tmp_675;
  assign _tmp_675 = _stream_matmul_5_source_11_idle && _stream_matmul_5_source_13_idle && _stream_matmul_5_source_15_idle && _stream_matmul_5_source_20_idle && _stream_matmul_5_source_21_idle && _stream_matmul_5_source_22_idle && _stream_matmul_5_source_7_idle && _stream_matmul_5_source_9_idle && (_stream_matmul_5_fsm == 3);
  reg [_tmp_674-1:0] _tmp_676;
  localparam _tmp_677 = 1;
  wire [_tmp_677-1:0] _tmp_678;
  assign _tmp_678 = _stream_matmul_5_source_11_idle && _stream_matmul_5_source_13_idle && _stream_matmul_5_source_15_idle && _stream_matmul_5_source_20_idle && _stream_matmul_5_source_21_idle && _stream_matmul_5_source_22_idle && _stream_matmul_5_source_7_idle && _stream_matmul_5_source_9_idle && (_stream_matmul_5_fsm == 3);
  reg [_tmp_677-1:0] _tmp_679;
  reg _tmp_680;
  reg _tmp_681;
  reg _tmp_682;
  reg _tmp_683;
  reg _tmp_684;
  reg _tmp_685;
  reg _tmp_686;
  reg _tmp_687;
  reg _tmp_688;
  reg _tmp_689;
  reg _tmp_690;
  reg _tmp_691;
  reg _tmp_692;
  reg _tmp_693;
  reg _tmp_694;
  reg _tmp_695;
  reg _tmp_696;
  reg _tmp_697;
  reg _tmp_698;
  reg _tmp_699;
  reg _tmp_700;
  reg _tmp_701;
  reg _tmp_702;
  reg _tmp_703;
  reg _tmp_704;
  reg _tmp_705;
  reg _tmp_706;
  reg _tmp_707;
  reg _tmp_708;
  reg _tmp_709;
  reg _tmp_710;
  reg _tmp_711;
  reg _tmp_712;
  reg _tmp_713;
  assign _stream_matmul_5_sink_start = _tmp_713;
  reg _tmp_714;
  reg _tmp_715;
  reg _tmp_716;
  reg _tmp_717;
  reg _tmp_718;
  reg _tmp_719;
  reg _tmp_720;
  reg _tmp_721;
  reg _tmp_722;
  reg _tmp_723;
  reg _tmp_724;
  reg _tmp_725;
  reg _tmp_726;
  reg _tmp_727;
  reg _tmp_728;
  reg _tmp_729;
  reg _tmp_730;
  reg _tmp_731;
  reg _tmp_732;
  reg _tmp_733;
  reg _tmp_734;
  reg _tmp_735;
  reg _tmp_736;
  reg _tmp_737;
  reg _tmp_738;
  reg _tmp_739;
  reg _tmp_740;
  reg _tmp_741;
  reg _tmp_742;
  reg _tmp_743;
  reg _tmp_744;
  reg _tmp_745;
  reg _tmp_746;
  reg _tmp_747;
  assign _stream_matmul_5_sink_stop = _tmp_747;
  reg _tmp_748;
  reg _tmp_749;
  reg _tmp_750;
  reg _tmp_751;
  reg _tmp_752;
  reg _tmp_753;
  reg _tmp_754;
  reg _tmp_755;
  reg _tmp_756;
  reg _tmp_757;
  reg _tmp_758;
  reg _tmp_759;
  reg _tmp_760;
  reg _tmp_761;
  reg _tmp_762;
  reg _tmp_763;
  reg _tmp_764;
  reg _tmp_765;
  reg _tmp_766;
  reg _tmp_767;
  reg _tmp_768;
  reg _tmp_769;
  reg _tmp_770;
  reg _tmp_771;
  reg _tmp_772;
  reg _tmp_773;
  reg _tmp_774;
  reg _tmp_775;
  reg _tmp_776;
  reg _tmp_777;
  reg _tmp_778;
  reg _tmp_779;
  reg _tmp_780;
  reg _tmp_781;
  assign _stream_matmul_5_sink_busy = _tmp_781;
  reg _tmp_782;
  assign _stream_matmul_5_busy = _stream_matmul_5_source_busy || _stream_matmul_5_sink_busy || _stream_matmul_5_busy_reg;
  wire matmul_5_dma_out_mask_0;
  assign matmul_5_dma_out_mask_0 = matmul_5_out_row_count + 0 >= cparam_matmul_5_out_num_row;
  wire [32-1:0] mask_addr_shifted_783;
  assign mask_addr_shifted_783 = matmul_5_objaddr + (matmul_5_out_base_offset + cparam_matmul_5_out_offset_values_0) + _maxi_global_base_addr >> 2;
  wire [32-1:0] mask_addr_masked_784;
  assign mask_addr_masked_784 = mask_addr_shifted_783 << 2;
  reg [32-1:0] read_burst_fsm_8;
  localparam read_burst_fsm_8_init = 0;
  reg [7-1:0] read_burst_addr_785;
  reg [7-1:0] read_burst_stride_786;
  reg [33-1:0] read_burst_length_787;
  reg read_burst_rvalid_788;
  reg read_burst_rlast_789;
  assign ram_w32_l128_id0_1_addr = ((read_burst_fsm_8 == 1) && (!read_burst_rvalid_788 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? read_burst_addr_785 : 'hx;
  assign ram_w32_l128_id0_1_enable = ((read_burst_fsm_8 == 1) && (!read_burst_rvalid_788 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? 1'd1 : 0;
  localparam _tmp_790 = 1;
  wire [_tmp_790-1:0] _tmp_791;
  assign _tmp_791 = (read_burst_fsm_8 == 1) && (!read_burst_rvalid_788 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0));
  reg [_tmp_790-1:0] __tmp_791_1;
  wire [32-1:0] read_burst_rdata_792;
  assign read_burst_rdata_792 = ram_w32_l128_id0_1_rdata;
  assign _maxi_write_req_fifo_deq = ((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 2)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1)) && !_maxi_write_req_fifo_empty)? 1 : 0;
  reg _maxi_wdata_cond_1_1;
  wire matmul_5_update_filter;
  assign matmul_5_update_filter = (cparam_matmul_5_data_stationary == 0) && (matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count) || (cparam_matmul_5_data_stationary == 1) && !cparam_matmul_5_keep_filter;
  wire matmul_5_update_act;
  assign matmul_5_update_act = (cparam_matmul_5_data_stationary == 1) && (matmul_5_och_count >= cparam_matmul_5_max_och_count) || (cparam_matmul_5_data_stationary == 0);
  wire matmul_5_mux_next_dma_flag_0;
  assign matmul_5_mux_next_dma_flag_0 = (matmul_5_row_select == 0)? (matmul_5_row_count >= cparam_matmul_5_max_row_count)? 1 : cparam_matmul_5_dma_flag_conds_0 : 1'd0;

  always @(posedge CLK) begin
    _RESETN_inv_1 <= RESETN_inv;
    _RESETN_inv_2 <= _RESETN_inv_1;
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      maxi_awaddr <= 0;
      maxi_awlen <= 0;
      maxi_awvalid <= 0;
      _maxi_waddr_cond_0_1 <= 0;
    end else begin
      if(_maxi_waddr_cond_0_1) begin
        maxi_awvalid <= 0;
      end 
      if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (_maxi_outstanding_wcount < 6) && ((_maxi_outstanding_wcount < 6) && (maxi_awready || !maxi_awvalid))) begin
        maxi_awaddr <= _maxi_write_global_addr;
        maxi_awlen <= _maxi_write_cur_global_size - 1;
        maxi_awvalid <= 1;
      end 
      if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (_maxi_outstanding_wcount < 6) && ((_maxi_outstanding_wcount < 6) && (maxi_awready || !maxi_awvalid)) && (_maxi_write_cur_global_size == 0)) begin
        maxi_awvalid <= 0;
      end 
      _maxi_waddr_cond_0_1 <= 1;
      if(maxi_awvalid && !maxi_awready) begin
        maxi_awvalid <= maxi_awvalid;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _maxi_wdata_sb_0 <= 0;
      _maxi_wvalid_sb_0 <= 0;
      _maxi_wlast_sb_0 <= 0;
      _maxi_wstrb_sb_0 <= 0;
      _maxi_wdata_cond_0_1 <= 0;
      _maxi_wdata_cond_1_1 <= 0;
    end else begin
      if(_maxi_wdata_cond_0_1) begin
        _maxi_wvalid_sb_0 <= 0;
        _maxi_wlast_sb_0 <= 0;
      end 
      if(_maxi_wdata_cond_1_1) begin
        _maxi_wvalid_sb_0 <= 0;
        _maxi_wlast_sb_0 <= 0;
      end 
      if((_maxi_write_op_sel_buf == 1) && read_burst_packed_rvalid_152 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0)) begin
        _maxi_wdata_sb_0 <= read_burst_packed_rdata_162;
        _maxi_wvalid_sb_0 <= 1;
        _maxi_wlast_sb_0 <= read_burst_packed_rlast_153 || (_maxi_write_size_buf == 1);
        _maxi_wstrb_sb_0 <= { 4{ 1'd1 } };
      end 
      _maxi_wdata_cond_0_1 <= 1;
      if(_maxi_wvalid_sb_0 && !_maxi_wready_sb_0) begin
        _maxi_wvalid_sb_0 <= _maxi_wvalid_sb_0;
        _maxi_wlast_sb_0 <= _maxi_wlast_sb_0;
      end 
      if((_maxi_write_op_sel_buf == 2) && read_burst_rvalid_788 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0)) begin
        _maxi_wdata_sb_0 <= read_burst_rdata_792;
        _maxi_wvalid_sb_0 <= 1;
        _maxi_wlast_sb_0 <= read_burst_rlast_789 || (_maxi_write_size_buf == 1);
        _maxi_wstrb_sb_0 <= { 4{ 1'd1 } };
      end 
      _maxi_wdata_cond_1_1 <= 1;
      if(_maxi_wvalid_sb_0 && !_maxi_wready_sb_0) begin
        _maxi_wvalid_sb_0 <= _maxi_wvalid_sb_0;
        _maxi_wlast_sb_0 <= _maxi_wlast_sb_0;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _sb_maxi_writedata_data_6 <= 0;
      _sb_maxi_writedata_valid_7 <= 0;
      _sb_maxi_writedata_tmp_data_9 <= 0;
      _sb_maxi_writedata_tmp_valid_10 <= 0;
    end else begin
      if(_sb_maxi_writedata_m_ready_5 || !_sb_maxi_writedata_valid_7) begin
        _sb_maxi_writedata_data_6 <= _sb_maxi_writedata_next_data_11;
        _sb_maxi_writedata_valid_7 <= _sb_maxi_writedata_next_valid_12;
      end 
      if(!_sb_maxi_writedata_tmp_valid_10 && _sb_maxi_writedata_valid_7 && !_sb_maxi_writedata_m_ready_5) begin
        _sb_maxi_writedata_tmp_data_9 <= _sb_maxi_writedata_s_data_3;
        _sb_maxi_writedata_tmp_valid_10 <= _sb_maxi_writedata_s_valid_4;
      end 
      if(_sb_maxi_writedata_tmp_valid_10 && _sb_maxi_writedata_m_ready_5) begin
        _sb_maxi_writedata_tmp_valid_10 <= 0;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      maxi_araddr <= 0;
      maxi_arlen <= 0;
      maxi_arvalid <= 0;
      _maxi_raddr_cond_0_1 <= 0;
    end else begin
      if(_maxi_raddr_cond_0_1) begin
        maxi_arvalid <= 0;
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid)) begin
        maxi_araddr <= _maxi_read_global_addr;
        maxi_arlen <= _maxi_read_cur_global_size - 1;
        maxi_arvalid <= 1;
      end 
      _maxi_raddr_cond_0_1 <= 1;
      if(maxi_arvalid && !maxi_arready) begin
        maxi_arvalid <= maxi_arvalid;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _sb_maxi_readdata_data_21 <= 0;
      _sb_maxi_readdata_valid_22 <= 0;
      _sb_maxi_readdata_tmp_data_24 <= 0;
      _sb_maxi_readdata_tmp_valid_25 <= 0;
    end else begin
      if(_sb_maxi_readdata_m_ready_20 || !_sb_maxi_readdata_valid_22) begin
        _sb_maxi_readdata_data_21 <= _sb_maxi_readdata_next_data_26;
        _sb_maxi_readdata_valid_22 <= _sb_maxi_readdata_next_valid_27;
      end 
      if(!_sb_maxi_readdata_tmp_valid_25 && _sb_maxi_readdata_valid_22 && !_sb_maxi_readdata_m_ready_20) begin
        _sb_maxi_readdata_tmp_data_24 <= _sb_maxi_readdata_s_data_18;
        _sb_maxi_readdata_tmp_valid_25 <= _sb_maxi_readdata_s_valid_19;
      end 
      if(_sb_maxi_readdata_tmp_valid_25 && _sb_maxi_readdata_m_ready_20) begin
        _sb_maxi_readdata_tmp_valid_25 <= 0;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _maxi_outstanding_wcount <= 0;
      _maxi_read_start <= 0;
      _maxi_write_start <= 0;
      _maxi_global_base_addr <= 0;
      _maxi_read_op_sel <= 0;
      _maxi_read_global_addr <= 0;
      _maxi_read_global_size <= 0;
      _maxi_read_local_addr <= 0;
      _maxi_read_local_stride <= 0;
      _maxi_read_local_size <= 0;
      _maxi_read_local_blocksize <= 0;
      _maxi_read_req_busy <= 0;
      _maxi_read_cur_global_size <= 0;
      _maxi_read_data_busy <= 0;
      _maxi_read_op_sel_buf <= 0;
      _maxi_read_local_addr_buf <= 0;
      _maxi_read_local_stride_buf <= 0;
      _maxi_read_local_size_buf <= 0;
      _maxi_read_local_blocksize_buf <= 0;
      _maxi_write_op_sel <= 0;
      _maxi_write_global_addr <= 0;
      _maxi_write_global_size <= 0;
      _maxi_write_local_addr <= 0;
      _maxi_write_local_stride <= 0;
      _maxi_write_local_size <= 0;
      _maxi_write_local_blocksize <= 0;
      _maxi_write_req_busy <= 0;
      _maxi_write_cur_global_size <= 0;
      _maxi_write_data_busy <= 0;
      _maxi_write_op_sel_buf <= 0;
      _maxi_write_local_addr_buf <= 0;
      _maxi_write_local_stride_buf <= 0;
      _maxi_write_size_buf <= 0;
      _maxi_write_local_blocksize_buf <= 0;
    end else begin
      if(maxi_awvalid && maxi_awready && !(maxi_bvalid && maxi_bready) && (_maxi_outstanding_wcount < 7)) begin
        _maxi_outstanding_wcount <= _maxi_outstanding_wcount + 1;
      end 
      if(!(maxi_awvalid && maxi_awready) && (maxi_bvalid && maxi_bready) && (_maxi_outstanding_wcount > 0)) begin
        _maxi_outstanding_wcount <= _maxi_outstanding_wcount - 1;
      end 
      _maxi_read_start <= 0;
      _maxi_write_start <= 0;
      _maxi_global_base_addr <= _saxi_register_32;
      if((control_transpose_14 == 3) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 1;
        _maxi_read_global_addr <= mask_addr_masked_63;
        _maxi_read_global_size <= _dma_read_packed_local_packed_size_61;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 2;
        _maxi_read_local_size <= _dma_read_packed_local_packed_size_61;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_req_fsm == 0) && _maxi_read_start) begin
        _maxi_read_req_busy <= 1;
      end 
      if(_maxi_read_start && _maxi_read_req_fifo_almost_full) begin
        _maxi_read_start <= 1;
      end 
      if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && (_maxi_read_global_size <= 256) && ((mask_addr_masked_73 & 4095) + (_maxi_read_global_size << 2) >= 4096)) begin
        _maxi_read_cur_global_size <= 4096 - (mask_addr_masked_75 & 4095) >> 2;
        _maxi_read_global_size <= _maxi_read_global_size - (4096 - (mask_addr_masked_77 & 4095) >> 2);
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && (_maxi_read_global_size <= 256)) begin
        _maxi_read_cur_global_size <= _maxi_read_global_size;
        _maxi_read_global_size <= 0;
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && ((mask_addr_masked_79 & 4095) + 1024 >= 4096)) begin
        _maxi_read_cur_global_size <= 4096 - (mask_addr_masked_81 & 4095) >> 2;
        _maxi_read_global_size <= _maxi_read_global_size - (4096 - (mask_addr_masked_83 & 4095) >> 2);
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full) begin
        _maxi_read_cur_global_size <= 256;
        _maxi_read_global_size <= _maxi_read_global_size - 256;
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid)) begin
        _maxi_read_global_addr <= _maxi_read_global_addr + (_maxi_read_cur_global_size << 2);
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid) && (_maxi_read_global_size == 0)) begin
        _maxi_read_req_busy <= 0;
      end 
      if((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1))) begin
        _maxi_read_data_busy <= 1;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
        _maxi_read_data_busy <= 0;
      end 
      if((control_transpose_14 == 5) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_96;
        _maxi_read_global_size <= _dma_read_packed_local_packed_size_94;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 2;
        _maxi_read_local_size <= _dma_read_packed_local_packed_size_94;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2))) begin
        _maxi_read_data_busy <= 1;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
        _maxi_read_data_busy <= 0;
      end 
      if((control_transpose_14 == 9) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_120;
        _maxi_write_global_size <= _dma_write_packed_local_packed_size_118;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 2;
        _maxi_write_local_size <= _dma_write_packed_local_packed_size_118;
        _maxi_write_local_blocksize <= 1;
      end 
      if((_maxi_write_req_fsm == 0) && _maxi_write_start) begin
        _maxi_write_req_busy <= 1;
      end 
      if(_maxi_write_start && _maxi_write_req_fifo_almost_full) begin
        _maxi_write_start <= 1;
      end 
      if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && (_maxi_write_global_size <= 256) && ((mask_addr_masked_130 & 4095) + (_maxi_write_global_size << 2) >= 4096)) begin
        _maxi_write_cur_global_size <= 4096 - (mask_addr_masked_132 & 4095) >> 2;
        _maxi_write_global_size <= _maxi_write_global_size - (4096 - (mask_addr_masked_134 & 4095) >> 2);
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && (_maxi_write_global_size <= 256)) begin
        _maxi_write_cur_global_size <= _maxi_write_global_size;
        _maxi_write_global_size <= 0;
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && ((mask_addr_masked_136 & 4095) + 1024 >= 4096)) begin
        _maxi_write_cur_global_size <= 4096 - (mask_addr_masked_138 & 4095) >> 2;
        _maxi_write_global_size <= _maxi_write_global_size - (4096 - (mask_addr_masked_140 & 4095) >> 2);
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full) begin
        _maxi_write_cur_global_size <= 256;
        _maxi_write_global_size <= _maxi_write_global_size - 256;
      end 
      if((_maxi_write_req_fsm == 1) && ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6))) begin
        _maxi_write_global_addr <= _maxi_write_global_addr + (_maxi_write_cur_global_size << 2);
      end 
      if((_maxi_write_req_fsm == 1) && ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6)) && (_maxi_write_global_size == 0)) begin
        _maxi_write_req_busy <= 0;
      end 
      if((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1))) begin
        _maxi_write_data_busy <= 1;
        _maxi_write_op_sel_buf <= _maxi_write_op_sel_fifo;
        _maxi_write_local_addr_buf <= _maxi_write_local_addr_fifo;
        _maxi_write_local_stride_buf <= _maxi_write_local_stride_fifo;
        _maxi_write_size_buf <= _maxi_write_size_fifo;
        _maxi_write_local_blocksize_buf <= _maxi_write_local_blocksize_fifo;
      end 
      if(_maxi_write_data_fsm == 1) begin
        _maxi_write_size_buf <= 0;
      end 
      if((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_fifo;
      end 
      if((_maxi_write_data_fsm == 2) && read_burst_packed_rvalid_152 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_buf - 1;
      end 
      if((_maxi_write_data_fsm == 2) && ((_maxi_write_op_sel_buf == 1) && read_burst_packed_rvalid_152 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) && read_burst_packed_rlast_153) begin
        _maxi_write_data_busy <= 0;
      end 
      if((control__lazy_reshape_1 == 3) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 1;
        _maxi_read_global_addr <= mask_addr_masked_167;
        _maxi_read_global_size <= _dma_read_packed_local_packed_size_165;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 2;
        _maxi_read_local_size <= _dma_read_packed_local_packed_size_165;
        _maxi_read_local_blocksize <= 1;
      end 
      if((control__lazy_reshape_1 == 12) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_203;
        _maxi_write_global_size <= _dma_write_packed_local_packed_size_201;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 2;
        _maxi_write_local_size <= _dma_write_packed_local_packed_size_201;
        _maxi_write_local_blocksize <= 1;
      end 
      if((control_matmul_5 == 2) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_205;
        _maxi_read_global_size <= cparam_matmul_5_bias_num;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= cparam_matmul_5_bias_num;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3))) begin
        _maxi_read_data_busy <= 1;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
        _maxi_read_data_busy <= 0;
      end 
      if((control_matmul_5 == 6) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 4;
        _maxi_read_global_addr <= mask_addr_masked_211;
        _maxi_read_global_size <= cparam_matmul_5_filter_read_size;
        _maxi_read_local_addr <= matmul_5_filter_page_dma_offset;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= cparam_matmul_5_filter_read_size;
        _maxi_read_local_blocksize <= cparam_matmul_5_filter_read_block;
      end 
      if((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 4))) begin
        _maxi_read_data_busy <= 1;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
        _maxi_read_data_busy <= 0;
      end 
      if((control_matmul_5 == 12) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 5;
        _maxi_read_global_addr <= mask_addr_masked_229;
        _maxi_read_global_size <= cparam_matmul_5_act_read_size;
        _maxi_read_local_addr <= matmul_5_act_page_dma_offset_0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= cparam_matmul_5_act_read_size;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 5))) begin
        _maxi_read_data_busy <= 1;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
        _maxi_read_data_busy <= 0;
      end 
      if((control_matmul_5 == 21) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 2;
        _maxi_write_global_addr <= mask_addr_masked_784;
        _maxi_write_global_size <= matmul_5_next_out_write_size;
        _maxi_write_local_addr <= matmul_5_out_laddr_offset + matmul_5_out_page_dma_offset;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= matmul_5_next_out_write_size;
        _maxi_write_local_blocksize <= 1;
      end 
      if((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 2))) begin
        _maxi_write_data_busy <= 1;
        _maxi_write_op_sel_buf <= _maxi_write_op_sel_fifo;
        _maxi_write_local_addr_buf <= _maxi_write_local_addr_fifo;
        _maxi_write_local_stride_buf <= _maxi_write_local_stride_fifo;
        _maxi_write_size_buf <= _maxi_write_size_fifo;
        _maxi_write_local_blocksize_buf <= _maxi_write_local_blocksize_fifo;
      end 
      if(_maxi_write_data_fsm == 1) begin
        _maxi_write_size_buf <= 0;
      end 
      if((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_fifo;
      end 
      if((_maxi_write_data_fsm == 2) && read_burst_rvalid_788 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_buf - 1;
      end 
      if((_maxi_write_data_fsm == 2) && ((_maxi_write_op_sel_buf == 2) && read_burst_rvalid_788 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) && read_burst_rlast_789) begin
        _maxi_write_data_busy <= 0;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      count__maxi_read_req_fifo <= 0;
      __tmp_71_1 <= 0;
    end else begin
      if(_maxi_read_req_fifo_enq && !_maxi_read_req_fifo_full && (_maxi_read_req_fifo_deq && !_maxi_read_req_fifo_empty)) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo;
      end else if(_maxi_read_req_fifo_enq && !_maxi_read_req_fifo_full) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo + 1;
      end else if(_maxi_read_req_fifo_deq && !_maxi_read_req_fifo_empty) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo - 1;
      end 
      __tmp_71_1 <= _tmp_71;
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      count__maxi_write_req_fifo <= 0;
      __tmp_128_1 <= 0;
      __tmp_148_1 <= 0;
    end else begin
      if(_maxi_write_req_fifo_enq && !_maxi_write_req_fifo_full && (_maxi_write_req_fifo_deq && !_maxi_write_req_fifo_empty)) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo;
      end else if(_maxi_write_req_fifo_enq && !_maxi_write_req_fifo_full) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo + 1;
      end else if(_maxi_write_req_fifo_deq && !_maxi_write_req_fifo_empty) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo - 1;
      end 
      __tmp_128_1 <= _tmp_128;
      __tmp_148_1 <= _tmp_148;
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      saxi_rdata <= 0;
      saxi_rvalid <= 0;
      _saxi_rdata_cond_0_1 <= 0;
    end else begin
      if(_saxi_rdata_cond_0_1) begin
        saxi_rvalid <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid)) begin
        saxi_rdata <= axislite_rdata_46;
        saxi_rvalid <= 1;
      end 
      _saxi_rdata_cond_0_1 <= 1;
      if(saxi_rvalid && !saxi_rready) begin
        saxi_rvalid <= saxi_rvalid;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      saxi_bvalid <= 0;
      prev_awvalid_43 <= 0;
      prev_arvalid_44 <= 0;
      writevalid_41 <= 0;
      readvalid_42 <= 0;
      addr_40 <= 0;
      _saxi_register_0 <= 0;
      _saxi_flag_0 <= 0;
      _saxi_register_1 <= 0;
      _saxi_flag_1 <= 0;
      _saxi_register_2 <= 0;
      _saxi_flag_2 <= 0;
      _saxi_register_3 <= 0;
      _saxi_flag_3 <= 0;
      _saxi_register_4 <= 0;
      _saxi_flag_4 <= 0;
      _saxi_register_5 <= 0;
      _saxi_flag_5 <= 0;
      _saxi_register_6 <= 0;
      _saxi_flag_6 <= 0;
      _saxi_register_7 <= 0;
      _saxi_flag_7 <= 0;
      _saxi_register_8 <= 0;
      _saxi_flag_8 <= 0;
      _saxi_register_9 <= 0;
      _saxi_flag_9 <= 0;
      _saxi_register_10 <= 0;
      _saxi_flag_10 <= 0;
      _saxi_register_11 <= 0;
      _saxi_flag_11 <= 0;
      _saxi_register_12 <= 0;
      _saxi_flag_12 <= 0;
      _saxi_register_13 <= 0;
      _saxi_flag_13 <= 0;
      _saxi_register_14 <= 0;
      _saxi_flag_14 <= 0;
      _saxi_register_15 <= 0;
      _saxi_flag_15 <= 0;
      _saxi_register_16 <= 0;
      _saxi_flag_16 <= 0;
      _saxi_register_17 <= 0;
      _saxi_flag_17 <= 0;
      _saxi_register_18 <= 0;
      _saxi_flag_18 <= 0;
      _saxi_register_19 <= 0;
      _saxi_flag_19 <= 0;
      _saxi_register_20 <= 0;
      _saxi_flag_20 <= 0;
      _saxi_register_21 <= 0;
      _saxi_flag_21 <= 0;
      _saxi_register_22 <= 0;
      _saxi_flag_22 <= 0;
      _saxi_register_23 <= 0;
      _saxi_flag_23 <= 0;
      _saxi_register_24 <= 0;
      _saxi_flag_24 <= 0;
      _saxi_register_25 <= 0;
      _saxi_flag_25 <= 0;
      _saxi_register_26 <= 0;
      _saxi_flag_26 <= 0;
      _saxi_register_27 <= 0;
      _saxi_flag_27 <= 0;
      _saxi_register_28 <= 0;
      _saxi_flag_28 <= 0;
      _saxi_register_29 <= 0;
      _saxi_flag_29 <= 0;
      _saxi_register_30 <= 0;
      _saxi_flag_30 <= 0;
      _saxi_register_31 <= 442368;
      _saxi_flag_31 <= 0;
      _saxi_register_32 <= 0;
      _saxi_flag_32 <= 0;
      _saxi_register_33 <= 222016;
      _saxi_flag_33 <= 0;
      _saxi_register_34 <= 0;
      _saxi_flag_34 <= 0;
      _saxi_register_35 <= 64;
      _saxi_flag_35 <= 0;
      _saxi_register_36 <= 3200;
      _saxi_flag_36 <= 0;
      _saxi_register_11[0] <= (0 >> 0) & 1'd1;
      _saxi_register_9[0] <= (0 >> 0) & 1'd1;
      _saxi_register_11[1] <= (0 >> 1) & 1'd1;
      _saxi_register_9[1] <= (0 >> 1) & 1'd1;
      _saxi_register_11[2] <= (0 >> 2) & 1'd1;
      _saxi_register_9[2] <= (0 >> 2) & 1'd1;
      _saxi_register_11[3] <= (0 >> 3) & 1'd1;
      _saxi_register_9[3] <= (0 >> 3) & 1'd1;
      _saxi_register_11[4] <= (0 >> 4) & 1'd1;
      _saxi_register_9[4] <= (0 >> 4) & 1'd1;
      _saxi_register_11[5] <= (0 >> 5) & 1'd1;
      _saxi_register_9[5] <= (0 >> 5) & 1'd1;
      _saxi_register_11[6] <= (0 >> 6) & 1'd1;
      _saxi_register_9[6] <= (0 >> 6) & 1'd1;
      _saxi_register_11[7] <= (0 >> 7) & 1'd1;
      _saxi_register_9[7] <= (0 >> 7) & 1'd1;
      _saxi_register_11[8] <= (0 >> 8) & 1'd1;
      _saxi_register_9[8] <= (0 >> 8) & 1'd1;
      _saxi_register_11[9] <= (0 >> 9) & 1'd1;
      _saxi_register_9[9] <= (0 >> 9) & 1'd1;
      _saxi_register_11[10] <= (0 >> 10) & 1'd1;
      _saxi_register_9[10] <= (0 >> 10) & 1'd1;
      _saxi_register_11[11] <= (0 >> 11) & 1'd1;
      _saxi_register_9[11] <= (0 >> 11) & 1'd1;
      _saxi_register_11[12] <= (0 >> 12) & 1'd1;
      _saxi_register_9[12] <= (0 >> 12) & 1'd1;
      _saxi_register_11[13] <= (0 >> 13) & 1'd1;
      _saxi_register_9[13] <= (0 >> 13) & 1'd1;
      _saxi_register_11[14] <= (0 >> 14) & 1'd1;
      _saxi_register_9[14] <= (0 >> 14) & 1'd1;
      _saxi_register_11[15] <= (0 >> 15) & 1'd1;
      _saxi_register_9[15] <= (0 >> 15) & 1'd1;
      _saxi_register_11[16] <= (0 >> 16) & 1'd1;
      _saxi_register_9[16] <= (0 >> 16) & 1'd1;
      _saxi_register_11[17] <= (0 >> 17) & 1'd1;
      _saxi_register_9[17] <= (0 >> 17) & 1'd1;
      _saxi_register_11[18] <= (0 >> 18) & 1'd1;
      _saxi_register_9[18] <= (0 >> 18) & 1'd1;
      _saxi_register_11[19] <= (0 >> 19) & 1'd1;
      _saxi_register_9[19] <= (0 >> 19) & 1'd1;
      _saxi_register_11[20] <= (0 >> 20) & 1'd1;
      _saxi_register_9[20] <= (0 >> 20) & 1'd1;
      _saxi_register_11[21] <= (0 >> 21) & 1'd1;
      _saxi_register_9[21] <= (0 >> 21) & 1'd1;
      _saxi_register_11[22] <= (0 >> 22) & 1'd1;
      _saxi_register_9[22] <= (0 >> 22) & 1'd1;
      _saxi_register_11[23] <= (0 >> 23) & 1'd1;
      _saxi_register_9[23] <= (0 >> 23) & 1'd1;
      _saxi_register_11[24] <= (0 >> 24) & 1'd1;
      _saxi_register_9[24] <= (0 >> 24) & 1'd1;
      _saxi_register_11[25] <= (0 >> 25) & 1'd1;
      _saxi_register_9[25] <= (0 >> 25) & 1'd1;
      _saxi_register_11[26] <= (0 >> 26) & 1'd1;
      _saxi_register_9[26] <= (0 >> 26) & 1'd1;
      _saxi_register_11[27] <= (0 >> 27) & 1'd1;
      _saxi_register_9[27] <= (0 >> 27) & 1'd1;
      _saxi_register_11[28] <= (0 >> 28) & 1'd1;
      _saxi_register_9[28] <= (0 >> 28) & 1'd1;
      _saxi_register_11[29] <= (0 >> 29) & 1'd1;
      _saxi_register_9[29] <= (0 >> 29) & 1'd1;
      _saxi_register_11[30] <= (0 >> 30) & 1'd1;
      _saxi_register_9[30] <= (0 >> 30) & 1'd1;
      _saxi_register_11[31] <= (0 >> 31) & 1'd1;
      _saxi_register_9[31] <= (0 >> 31) & 1'd1;
      internal_state_counter <= 0;
    end else begin
      if(saxi_bvalid && saxi_bready) begin
        saxi_bvalid <= 0;
      end 
      if(saxi_wvalid && saxi_wready) begin
        saxi_bvalid <= 1;
      end 
      prev_awvalid_43 <= saxi_awvalid;
      prev_arvalid_44 <= saxi_arvalid;
      writevalid_41 <= 0;
      readvalid_42 <= 0;
      if(saxi_awready && saxi_awvalid && !saxi_bvalid) begin
        addr_40 <= saxi_awaddr;
        writevalid_41 <= 1;
      end else if(saxi_arready && saxi_arvalid) begin
        addr_40 <= saxi_araddr;
        readvalid_42 <= 1;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 0)) begin
        _saxi_register_0 <= axislite_resetval_48;
        _saxi_flag_0 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 1)) begin
        _saxi_register_1 <= axislite_resetval_48;
        _saxi_flag_1 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 2)) begin
        _saxi_register_2 <= axislite_resetval_48;
        _saxi_flag_2 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 3)) begin
        _saxi_register_3 <= axislite_resetval_48;
        _saxi_flag_3 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 4)) begin
        _saxi_register_4 <= axislite_resetval_48;
        _saxi_flag_4 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 5)) begin
        _saxi_register_5 <= axislite_resetval_48;
        _saxi_flag_5 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 6)) begin
        _saxi_register_6 <= axislite_resetval_48;
        _saxi_flag_6 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 7)) begin
        _saxi_register_7 <= axislite_resetval_48;
        _saxi_flag_7 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 8)) begin
        _saxi_register_8 <= axislite_resetval_48;
        _saxi_flag_8 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 9)) begin
        _saxi_register_9 <= axislite_resetval_48;
        _saxi_flag_9 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 10)) begin
        _saxi_register_10 <= axislite_resetval_48;
        _saxi_flag_10 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 11)) begin
        _saxi_register_11 <= axislite_resetval_48;
        _saxi_flag_11 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 12)) begin
        _saxi_register_12 <= axislite_resetval_48;
        _saxi_flag_12 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 13)) begin
        _saxi_register_13 <= axislite_resetval_48;
        _saxi_flag_13 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 14)) begin
        _saxi_register_14 <= axislite_resetval_48;
        _saxi_flag_14 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 15)) begin
        _saxi_register_15 <= axislite_resetval_48;
        _saxi_flag_15 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 16)) begin
        _saxi_register_16 <= axislite_resetval_48;
        _saxi_flag_16 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 17)) begin
        _saxi_register_17 <= axislite_resetval_48;
        _saxi_flag_17 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 18)) begin
        _saxi_register_18 <= axislite_resetval_48;
        _saxi_flag_18 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 19)) begin
        _saxi_register_19 <= axislite_resetval_48;
        _saxi_flag_19 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 20)) begin
        _saxi_register_20 <= axislite_resetval_48;
        _saxi_flag_20 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 21)) begin
        _saxi_register_21 <= axislite_resetval_48;
        _saxi_flag_21 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 22)) begin
        _saxi_register_22 <= axislite_resetval_48;
        _saxi_flag_22 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 23)) begin
        _saxi_register_23 <= axislite_resetval_48;
        _saxi_flag_23 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 24)) begin
        _saxi_register_24 <= axislite_resetval_48;
        _saxi_flag_24 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 25)) begin
        _saxi_register_25 <= axislite_resetval_48;
        _saxi_flag_25 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 26)) begin
        _saxi_register_26 <= axislite_resetval_48;
        _saxi_flag_26 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 27)) begin
        _saxi_register_27 <= axislite_resetval_48;
        _saxi_flag_27 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 28)) begin
        _saxi_register_28 <= axislite_resetval_48;
        _saxi_flag_28 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 29)) begin
        _saxi_register_29 <= axislite_resetval_48;
        _saxi_flag_29 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 30)) begin
        _saxi_register_30 <= axislite_resetval_48;
        _saxi_flag_30 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 31)) begin
        _saxi_register_31 <= axislite_resetval_48;
        _saxi_flag_31 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 32)) begin
        _saxi_register_32 <= axislite_resetval_48;
        _saxi_flag_32 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 33)) begin
        _saxi_register_33 <= axislite_resetval_48;
        _saxi_flag_33 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 34)) begin
        _saxi_register_34 <= axislite_resetval_48;
        _saxi_flag_34 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 35)) begin
        _saxi_register_35 <= axislite_resetval_48;
        _saxi_flag_35 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 36)) begin
        _saxi_register_36 <= axislite_resetval_48;
        _saxi_flag_36 <= 0;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 0)) begin
        _saxi_register_0 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 1)) begin
        _saxi_register_1 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 2)) begin
        _saxi_register_2 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 3)) begin
        _saxi_register_3 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 4)) begin
        _saxi_register_4 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 5)) begin
        _saxi_register_5 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 6)) begin
        _saxi_register_6 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 7)) begin
        _saxi_register_7 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 8)) begin
        _saxi_register_8 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 9)) begin
        _saxi_register_9 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 10)) begin
        _saxi_register_10 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 11)) begin
        _saxi_register_11 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 12)) begin
        _saxi_register_12 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 13)) begin
        _saxi_register_13 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 14)) begin
        _saxi_register_14 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 15)) begin
        _saxi_register_15 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 16)) begin
        _saxi_register_16 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 17)) begin
        _saxi_register_17 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 18)) begin
        _saxi_register_18 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 19)) begin
        _saxi_register_19 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 20)) begin
        _saxi_register_20 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 21)) begin
        _saxi_register_21 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 22)) begin
        _saxi_register_22 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 23)) begin
        _saxi_register_23 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 24)) begin
        _saxi_register_24 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 25)) begin
        _saxi_register_25 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 26)) begin
        _saxi_register_26 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 27)) begin
        _saxi_register_27 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 28)) begin
        _saxi_register_28 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 29)) begin
        _saxi_register_29 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 30)) begin
        _saxi_register_30 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 31)) begin
        _saxi_register_31 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 32)) begin
        _saxi_register_32 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 33)) begin
        _saxi_register_33 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 34)) begin
        _saxi_register_34 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 35)) begin
        _saxi_register_35 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 36)) begin
        _saxi_register_36 <= saxi_wdata;
      end 
      if(_saxi_register_11[0] == 1) begin
        _saxi_register_11[0] <= 0;
        _saxi_register_9[0] <= 0;
      end 
      if(_saxi_register_11[1] == 1) begin
        _saxi_register_11[1] <= 0;
        _saxi_register_9[1] <= 0;
      end 
      if(_saxi_register_11[2] == 1) begin
        _saxi_register_11[2] <= 0;
        _saxi_register_9[2] <= 0;
      end 
      if(_saxi_register_11[3] == 1) begin
        _saxi_register_11[3] <= 0;
        _saxi_register_9[3] <= 0;
      end 
      if(_saxi_register_11[4] == 1) begin
        _saxi_register_11[4] <= 0;
        _saxi_register_9[4] <= 0;
      end 
      if(_saxi_register_11[5] == 1) begin
        _saxi_register_11[5] <= 0;
        _saxi_register_9[5] <= 0;
      end 
      if(_saxi_register_11[6] == 1) begin
        _saxi_register_11[6] <= 0;
        _saxi_register_9[6] <= 0;
      end 
      if(_saxi_register_11[7] == 1) begin
        _saxi_register_11[7] <= 0;
        _saxi_register_9[7] <= 0;
      end 
      if(_saxi_register_11[8] == 1) begin
        _saxi_register_11[8] <= 0;
        _saxi_register_9[8] <= 0;
      end 
      if(_saxi_register_11[9] == 1) begin
        _saxi_register_11[9] <= 0;
        _saxi_register_9[9] <= 0;
      end 
      if(_saxi_register_11[10] == 1) begin
        _saxi_register_11[10] <= 0;
        _saxi_register_9[10] <= 0;
      end 
      if(_saxi_register_11[11] == 1) begin
        _saxi_register_11[11] <= 0;
        _saxi_register_9[11] <= 0;
      end 
      if(_saxi_register_11[12] == 1) begin
        _saxi_register_11[12] <= 0;
        _saxi_register_9[12] <= 0;
      end 
      if(_saxi_register_11[13] == 1) begin
        _saxi_register_11[13] <= 0;
        _saxi_register_9[13] <= 0;
      end 
      if(_saxi_register_11[14] == 1) begin
        _saxi_register_11[14] <= 0;
        _saxi_register_9[14] <= 0;
      end 
      if(_saxi_register_11[15] == 1) begin
        _saxi_register_11[15] <= 0;
        _saxi_register_9[15] <= 0;
      end 
      if(_saxi_register_11[16] == 1) begin
        _saxi_register_11[16] <= 0;
        _saxi_register_9[16] <= 0;
      end 
      if(_saxi_register_11[17] == 1) begin
        _saxi_register_11[17] <= 0;
        _saxi_register_9[17] <= 0;
      end 
      if(_saxi_register_11[18] == 1) begin
        _saxi_register_11[18] <= 0;
        _saxi_register_9[18] <= 0;
      end 
      if(_saxi_register_11[19] == 1) begin
        _saxi_register_11[19] <= 0;
        _saxi_register_9[19] <= 0;
      end 
      if(_saxi_register_11[20] == 1) begin
        _saxi_register_11[20] <= 0;
        _saxi_register_9[20] <= 0;
      end 
      if(_saxi_register_11[21] == 1) begin
        _saxi_register_11[21] <= 0;
        _saxi_register_9[21] <= 0;
      end 
      if(_saxi_register_11[22] == 1) begin
        _saxi_register_11[22] <= 0;
        _saxi_register_9[22] <= 0;
      end 
      if(_saxi_register_11[23] == 1) begin
        _saxi_register_11[23] <= 0;
        _saxi_register_9[23] <= 0;
      end 
      if(_saxi_register_11[24] == 1) begin
        _saxi_register_11[24] <= 0;
        _saxi_register_9[24] <= 0;
      end 
      if(_saxi_register_11[25] == 1) begin
        _saxi_register_11[25] <= 0;
        _saxi_register_9[25] <= 0;
      end 
      if(_saxi_register_11[26] == 1) begin
        _saxi_register_11[26] <= 0;
        _saxi_register_9[26] <= 0;
      end 
      if(_saxi_register_11[27] == 1) begin
        _saxi_register_11[27] <= 0;
        _saxi_register_9[27] <= 0;
      end 
      if(_saxi_register_11[28] == 1) begin
        _saxi_register_11[28] <= 0;
        _saxi_register_9[28] <= 0;
      end 
      if(_saxi_register_11[29] == 1) begin
        _saxi_register_11[29] <= 0;
        _saxi_register_9[29] <= 0;
      end 
      if(_saxi_register_11[30] == 1) begin
        _saxi_register_11[30] <= 0;
        _saxi_register_9[30] <= 0;
      end 
      if(_saxi_register_11[31] == 1) begin
        _saxi_register_11[31] <= 0;
        _saxi_register_9[31] <= 0;
      end 
      if(irq_busy_edge_51) begin
        _saxi_register_9[0] <= irq_busy_edge_51;
      end 
      if(irq_extern_edge_53) begin
        _saxi_register_9[1] <= irq_extern_edge_53;
      end 
      if(main_fsm == 0) begin
        _saxi_register_5 <= 0;
        _saxi_register_6 <= 0;
        _saxi_register_7 <= 0;
      end 
      if(main_fsm == 1) begin
        internal_state_counter <= 0;
        _saxi_register_12 <= 0;
      end else if(main_fsm == _saxi_register_13) begin
        if(internal_state_counter == _saxi_register_14) begin
          internal_state_counter <= 0;
          _saxi_register_12 <= _saxi_register_12 + 1;
        end else begin
          internal_state_counter <= internal_state_counter + 1;
        end
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_0 <= 1;
        _saxi_flag_0 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_1 <= 1;
        _saxi_flag_1 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_2 <= 1;
        _saxi_flag_2 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_3 <= 1;
        _saxi_flag_3 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_4 <= 1;
        _saxi_flag_4 <= 0;
      end 
      if((main_fsm == 1) && 1) begin
        _saxi_register_5 <= 1;
        _saxi_flag_5 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_6 <= 1;
        _saxi_flag_6 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_7 <= 1;
        _saxi_flag_7 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_8 <= 1;
        _saxi_flag_8 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_9 <= 1;
        _saxi_flag_9 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_10 <= 1;
        _saxi_flag_10 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_11 <= 1;
        _saxi_flag_11 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_12 <= 1;
        _saxi_flag_12 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_13 <= 1;
        _saxi_flag_13 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_14 <= 1;
        _saxi_flag_14 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_15 <= 1;
        _saxi_flag_15 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_16 <= 1;
        _saxi_flag_16 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_17 <= 1;
        _saxi_flag_17 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_18 <= 1;
        _saxi_flag_18 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_19 <= 1;
        _saxi_flag_19 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_20 <= 1;
        _saxi_flag_20 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_21 <= 1;
        _saxi_flag_21 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_22 <= 1;
        _saxi_flag_22 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_23 <= 1;
        _saxi_flag_23 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_24 <= 1;
        _saxi_flag_24 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_25 <= 1;
        _saxi_flag_25 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_26 <= 1;
        _saxi_flag_26 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_27 <= 1;
        _saxi_flag_27 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_28 <= 1;
        _saxi_flag_28 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_29 <= 1;
        _saxi_flag_29 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_30 <= 1;
        _saxi_flag_30 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_31 <= 1;
        _saxi_flag_31 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_32 <= 1;
        _saxi_flag_32 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_33 <= 1;
        _saxi_flag_33 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_34 <= 1;
        _saxi_flag_34 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_35 <= 1;
        _saxi_flag_35 <= 0;
      end 
      if((main_fsm == 1) && 0) begin
        _saxi_register_36 <= 1;
        _saxi_flag_36 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_0 <= 0;
        _saxi_flag_0 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_1 <= 0;
        _saxi_flag_1 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_2 <= 0;
        _saxi_flag_2 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_3 <= 0;
        _saxi_flag_3 <= 0;
      end 
      if((main_fsm == 2) && 1) begin
        _saxi_register_4 <= 0;
        _saxi_flag_4 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_5 <= 0;
        _saxi_flag_5 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_6 <= 0;
        _saxi_flag_6 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_7 <= 0;
        _saxi_flag_7 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_8 <= 0;
        _saxi_flag_8 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_9 <= 0;
        _saxi_flag_9 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_10 <= 0;
        _saxi_flag_10 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_11 <= 0;
        _saxi_flag_11 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_12 <= 0;
        _saxi_flag_12 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_13 <= 0;
        _saxi_flag_13 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_14 <= 0;
        _saxi_flag_14 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_15 <= 0;
        _saxi_flag_15 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_16 <= 0;
        _saxi_flag_16 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_17 <= 0;
        _saxi_flag_17 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_18 <= 0;
        _saxi_flag_18 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_19 <= 0;
        _saxi_flag_19 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_20 <= 0;
        _saxi_flag_20 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_21 <= 0;
        _saxi_flag_21 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_22 <= 0;
        _saxi_flag_22 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_23 <= 0;
        _saxi_flag_23 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_24 <= 0;
        _saxi_flag_24 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_25 <= 0;
        _saxi_flag_25 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_26 <= 0;
        _saxi_flag_26 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_27 <= 0;
        _saxi_flag_27 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_28 <= 0;
        _saxi_flag_28 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_29 <= 0;
        _saxi_flag_29 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_30 <= 0;
        _saxi_flag_30 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_31 <= 0;
        _saxi_flag_31 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_32 <= 0;
        _saxi_flag_32 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_33 <= 0;
        _saxi_flag_33 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_34 <= 0;
        _saxi_flag_34 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_35 <= 0;
        _saxi_flag_35 <= 0;
      end 
      if((main_fsm == 2) && 0) begin
        _saxi_register_36 <= 0;
        _saxi_flag_36 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_0 <= 0;
        _saxi_flag_0 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_1 <= 0;
        _saxi_flag_1 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_2 <= 0;
        _saxi_flag_2 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_3 <= 0;
        _saxi_flag_3 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_4 <= 0;
        _saxi_flag_4 <= 0;
      end 
      if((main_fsm == 60) && 1) begin
        _saxi_register_5 <= 0;
        _saxi_flag_5 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_6 <= 0;
        _saxi_flag_6 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_7 <= 0;
        _saxi_flag_7 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_8 <= 0;
        _saxi_flag_8 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_9 <= 0;
        _saxi_flag_9 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_10 <= 0;
        _saxi_flag_10 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_11 <= 0;
        _saxi_flag_11 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_12 <= 0;
        _saxi_flag_12 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_13 <= 0;
        _saxi_flag_13 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_14 <= 0;
        _saxi_flag_14 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_15 <= 0;
        _saxi_flag_15 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_16 <= 0;
        _saxi_flag_16 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_17 <= 0;
        _saxi_flag_17 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_18 <= 0;
        _saxi_flag_18 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_19 <= 0;
        _saxi_flag_19 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_20 <= 0;
        _saxi_flag_20 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_21 <= 0;
        _saxi_flag_21 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_22 <= 0;
        _saxi_flag_22 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_23 <= 0;
        _saxi_flag_23 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_24 <= 0;
        _saxi_flag_24 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_25 <= 0;
        _saxi_flag_25 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_26 <= 0;
        _saxi_flag_26 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_27 <= 0;
        _saxi_flag_27 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_28 <= 0;
        _saxi_flag_28 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_29 <= 0;
        _saxi_flag_29 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_30 <= 0;
        _saxi_flag_30 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_31 <= 0;
        _saxi_flag_31 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_32 <= 0;
        _saxi_flag_32 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_33 <= 0;
        _saxi_flag_33 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_34 <= 0;
        _saxi_flag_34 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_35 <= 0;
        _saxi_flag_35 <= 0;
      end 
      if((main_fsm == 60) && 0) begin
        _saxi_register_36 <= 0;
        _saxi_flag_36 <= 0;
      end 
    end
  end

  localparam _saxi_register_fsm_1 = 1;
  localparam _saxi_register_fsm_2 = 2;
  localparam _saxi_register_fsm_3 = 3;
  localparam _saxi_register_fsm_4 = 4;

  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _saxi_register_fsm <= _saxi_register_fsm_init;
      axis_maskaddr_45 <= 0;
    end else begin
      case(_saxi_register_fsm)
        _saxi_register_fsm_init: begin
          if(readvalid_42 || writevalid_41) begin
            axis_maskaddr_45 <= (addr_40 >> _saxi_shift) & _saxi_mask;
          end 
          if(readvalid_42) begin
            _saxi_register_fsm <= _saxi_register_fsm_1;
          end 
          if(writevalid_41) begin
            _saxi_register_fsm <= _saxi_register_fsm_3;
          end 
        end
        _saxi_register_fsm_1: begin
          if(saxi_rready || !saxi_rvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_2;
          end 
        end
        _saxi_register_fsm_2: begin
          if(saxi_rready && saxi_rvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_init;
          end 
        end
        _saxi_register_fsm_3: begin
          if(saxi_wvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_4;
          end 
        end
        _saxi_register_fsm_4: begin
          if(saxi_bready && saxi_bvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_init;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    _rst_logic_1 <= rst_logic;
    _rst_logic_2 <= _rst_logic_1;
    RST <= rst_logic | _rst_logic_1 | _rst_logic_2;
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      irq <= 0;
    end else begin
      irq <= |irq_49;
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      irq_busy_edge_50 <= 0;
    end else begin
      irq_busy_edge_50 <= irq_busy;
    end
  end


  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      irq_extern_edge_52 <= 0;
    end else begin
      irq_extern_edge_52 <= irq_extern;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_260_1 <= 0;
    end else begin
      __tmp_260_1 <= _tmp_260;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_263_1 <= 0;
    end else begin
      __tmp_263_1 <= _tmp_263;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_108_1 <= 0;
      __tmp_172_1 <= 0;
    end else begin
      __tmp_108_1 <= _tmp_108;
      __tmp_172_1 <= _tmp_172;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_110_1 <= 0;
      __tmp_174_1 <= 0;
    end else begin
      __tmp_110_1 <= _tmp_110;
      __tmp_174_1 <= _tmp_174;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_156_1 <= 0;
    end else begin
      __tmp_156_1 <= _tmp_156;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_160_1 <= 0;
    end else begin
      __tmp_160_1 <= _tmp_160;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_257_1 <= 0;
    end else begin
      __tmp_257_1 <= _tmp_257;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_791_1 <= 0;
    end else begin
      __tmp_791_1 <= _tmp_791;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_242_1 <= 0;
    end else begin
      __tmp_242_1 <= _tmp_242;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _acc_0_x_source_ram_renable <= 0;
      _acc_0_x_source_fifo_deq <= 0;
      _acc_0_x_idle <= 1;
      _acc_0_rshift_source_ram_renable <= 0;
      _acc_0_rshift_source_fifo_deq <= 0;
      _acc_0_rshift_idle <= 1;
      _acc_0_sum_sink_wenable <= 0;
      _acc_0_sum_sink_fifo_enq <= 0;
      _acc_0_valid_sink_wenable <= 0;
      _acc_0_valid_sink_fifo_enq <= 0;
      __acc_0_stream_ivalid_1 <= 0;
      __acc_0_stream_ivalid_2 <= 0;
      __acc_0_stream_ivalid_3 <= 0;
      __acc_0_stream_ivalid_4 <= 0;
      __acc_0_stream_ivalid_5 <= 0;
      _greaterthan_data_3 <= 0;
      _minus_data_5 <= 0;
      _reduceadd_data_16 <= 1'sd0;
      _reduceadd_count_16 <= 0;
      _reduceadd_prev_count_max_16 <= 0;
      _pulse_data_18 <= 1'sd0;
      _pulse_count_18 <= 0;
      _pulse_prev_count_max_18 <= 0;
      __delay_data_387__variable_1 <= 0;
      _sll_data_7 <= 0;
      __delay_data_384_greaterthan_3 <= 0;
      __delay_data_385_reduceadd_16 <= 0;
      __delay_data_388__delay_387__variable_1 <= 0;
      __delay_data_391_pulse_18 <= 0;
      _cond_data_13 <= 0;
      __delay_data_386__delay_385_reduceadd_16 <= 0;
      __delay_data_389__delay_388__delay_387__variable_1 <= 0;
      __delay_data_392__delay_391_pulse_18 <= 0;
      _plus_data_20 <= 0;
      __delay_data_390__delay_389__delay_388__delay_387__variable_1 <= 0;
      __delay_data_393__delay_392__delay_391_pulse_18 <= 0;
      _sra_data_21 <= 0;
      __delay_data_394__delay_393__delay_392__delay_391_pulse_18 <= 0;
      __variable_wdata_15 <= 0;
      __variable_wdata_0 <= 0;
      __variable_wdata_1 <= 0;
      __variable_wdata_2 <= 0;
      _tmp_451 <= 0;
      _tmp_452 <= 0;
      _tmp_453 <= 0;
      _tmp_454 <= 0;
      _tmp_455 <= 0;
      _tmp_456 <= 0;
      _tmp_457 <= 0;
      _tmp_458 <= 0;
      _tmp_459 <= 0;
      _tmp_460 <= 0;
      _tmp_461 <= 0;
      _tmp_462 <= 0;
      _tmp_463 <= 0;
      _tmp_464 <= 0;
      _tmp_465 <= 0;
      _tmp_466 <= 0;
      _tmp_467 <= 0;
      _tmp_468 <= 0;
      _tmp_469 <= 0;
      _tmp_470 <= 0;
      _tmp_471 <= 0;
      _tmp_472 <= 0;
      _tmp_473 <= 0;
      _tmp_474 <= 0;
      _tmp_475 <= 0;
      _tmp_476 <= 0;
      _tmp_477 <= 0;
      _tmp_478 <= 0;
      _tmp_479 <= 0;
      _tmp_480 <= 0;
      _tmp_481 <= 0;
      _tmp_482 <= 0;
      _acc_0_busy_reg <= 0;
    end else begin
      if(_acc_0_stream_oready) begin
        _acc_0_x_source_ram_renable <= 0;
        _acc_0_x_source_fifo_deq <= 0;
      end 
      _acc_0_x_idle <= _acc_0_x_idle;
      if(_acc_0_stream_oready) begin
        _acc_0_rshift_source_ram_renable <= 0;
        _acc_0_rshift_source_fifo_deq <= 0;
      end 
      _acc_0_rshift_idle <= _acc_0_rshift_idle;
      if(_acc_0_stream_oready) begin
        _acc_0_sum_sink_wenable <= 0;
        _acc_0_sum_sink_fifo_enq <= 0;
      end 
      if(_acc_0_stream_oready) begin
        _acc_0_valid_sink_wenable <= 0;
        _acc_0_valid_sink_fifo_enq <= 0;
      end 
      if(_acc_0_stream_oready) begin
        __acc_0_stream_ivalid_1 <= _acc_0_stream_ivalid;
      end 
      if(_acc_0_stream_oready) begin
        __acc_0_stream_ivalid_2 <= __acc_0_stream_ivalid_1;
      end 
      if(_acc_0_stream_oready) begin
        __acc_0_stream_ivalid_3 <= __acc_0_stream_ivalid_2;
      end 
      if(_acc_0_stream_oready) begin
        __acc_0_stream_ivalid_4 <= __acc_0_stream_ivalid_3;
      end 
      if(_acc_0_stream_oready) begin
        __acc_0_stream_ivalid_5 <= __acc_0_stream_ivalid_4;
      end 
      if(_acc_0_stream_oready) begin
        _greaterthan_data_3 <= acc_0_rshift_data > 1'sd0;
      end 
      if(_acc_0_stream_oready) begin
        _minus_data_5 <= acc_0_rshift_data - 2'sd1;
      end 
      if(_acc_0_stream_ivalid && _acc_0_stream_oready && _reduceadd_reset_cond_16) begin
        _reduceadd_data_16 <= 1'sd0;
      end 
      if(_acc_0_stream_ivalid && _acc_0_stream_oready) begin
        _reduceadd_count_16 <= (_reduceadd_current_count_16 >= acc_0_size_data - 1)? 0 : _reduceadd_current_count_16 + 1;
      end 
      if(_acc_0_stream_ivalid && _acc_0_stream_oready) begin
        _reduceadd_prev_count_max_16 <= _reduceadd_current_count_16 >= acc_0_size_data - 1;
      end 
      if(_acc_0_stream_ivalid && _acc_0_stream_oready) begin
        _reduceadd_data_16 <= _reduceadd_current_data_16 + acc_0_x_data;
      end 
      if(_acc_0_stream_ivalid && _acc_0_stream_oready && _pulse_reset_cond_18) begin
        _pulse_data_18 <= 1'sd0;
      end 
      if(_acc_0_stream_ivalid && _acc_0_stream_oready) begin
        _pulse_count_18 <= (_pulse_current_count_18 >= acc_0_size_data - 1)? 0 : _pulse_current_count_18 + 1;
      end 
      if(_acc_0_stream_ivalid && _acc_0_stream_oready) begin
        _pulse_prev_count_max_18 <= _pulse_current_count_18 >= acc_0_size_data - 1;
      end 
      if(_acc_0_stream_ivalid && _acc_0_stream_oready) begin
        _pulse_data_18 <= _pulse_current_count_18 >= acc_0_size_data - 1;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_387__variable_1 <= acc_0_rshift_data;
      end 
      if(_acc_0_stream_oready) begin
        _sll_data_7 <= 2'sd1 << _minus_data_5;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_384_greaterthan_3 <= _greaterthan_data_3;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_385_reduceadd_16 <= _reduceadd_data_16;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_388__delay_387__variable_1 <= __delay_data_387__variable_1;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_391_pulse_18 <= _pulse_data_18;
      end 
      if(_acc_0_stream_oready) begin
        _cond_data_13 <= (__delay_data_384_greaterthan_3)? _sll_data_7 : 1'sd0;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_386__delay_385_reduceadd_16 <= __delay_data_385_reduceadd_16;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_389__delay_388__delay_387__variable_1 <= __delay_data_388__delay_387__variable_1;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_392__delay_391_pulse_18 <= __delay_data_391_pulse_18;
      end 
      if(_acc_0_stream_oready) begin
        _plus_data_20 <= __delay_data_386__delay_385_reduceadd_16 + _cond_data_13;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_390__delay_389__delay_388__delay_387__variable_1 <= __delay_data_389__delay_388__delay_387__variable_1;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_393__delay_392__delay_391_pulse_18 <= __delay_data_392__delay_391_pulse_18;
      end 
      if(_acc_0_stream_oready) begin
        _sra_data_21 <= _plus_data_20 >>> __delay_data_390__delay_389__delay_388__delay_387__variable_1;
      end 
      if(_acc_0_stream_oready) begin
        __delay_data_394__delay_393__delay_392__delay_391_pulse_18 <= __delay_data_393__delay_392__delay_391_pulse_18;
      end 
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_15 <= __delay_data_551__delay_550__delay_549____variable_210;
      end 
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_0 <= __substreamoutput_data_382;
      end 
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_1 <= __delay_data_564__delay_563__delay_562__delay_561___plus_395;
      end 
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_2 <= __delay_data_578__delay_577__delay_576____variable_205;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_451 <= _acc_0_source_start;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_452 <= _tmp_451;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_453 <= _tmp_452;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_454 <= _acc_0_source_start;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_455 <= _tmp_454;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_456 <= _tmp_455;
      end 
      if(_acc_0_stream_oready && _tmp_456) begin
        __variable_wdata_15 <= 1;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_457 <= _acc_0_source_start;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_458 <= _tmp_457;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_459 <= _tmp_458;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_460 <= _tmp_459;
      end 
      if(_acc_0_stream_oready && _tmp_460) begin
        __variable_wdata_15 <= 0;
      end 
      if(_acc_0_stream_oready && 1'd0) begin
        __variable_wdata_15 <= 1;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_461 <= _acc_0_source_start;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_462 <= _tmp_461;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_463 <= _tmp_462;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_464 <= _tmp_463;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_465 <= _tmp_464;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_466 <= _tmp_465;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_467 <= _tmp_466;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_468 <= _acc_0_source_stop;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_469 <= _tmp_468;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_470 <= _tmp_469;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_471 <= _tmp_470;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_472 <= _tmp_471;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_473 <= _tmp_472;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_474 <= _tmp_473;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_475 <= _acc_0_source_busy;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_476 <= _tmp_475;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_477 <= _tmp_476;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_478 <= _tmp_477;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_479 <= _tmp_478;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_480 <= _tmp_479;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_481 <= _tmp_480;
      end 
      if(_acc_0_stream_oready) begin
        _tmp_482 <= _acc_0_sink_busy;
      end 
      if(!_acc_0_sink_busy && _tmp_482) begin
        _acc_0_busy_reg <= 0;
      end 
      if(_acc_0_source_busy) begin
        _acc_0_busy_reg <= 1;
      end 
    end
  end

  localparam _acc_0_fsm_1 = 1;
  localparam _acc_0_fsm_2 = 2;
  localparam _acc_0_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _acc_0_fsm <= _acc_0_fsm_init;
      _acc_0_source_start <= 0;
      _acc_0_source_busy <= 0;
      _acc_0_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        _acc_0_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _acc_0_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_acc_0_stream_oready && _tmp_453) begin
        _acc_0_stream_ivalid <= 1;
      end 
      if(_acc_0_stream_oready && 1'd0) begin
        _acc_0_stream_ivalid <= 0;
      end 
      case(_acc_0_fsm)
        _acc_0_fsm_init: begin
          if(_acc_0_run_flag) begin
            _acc_0_source_start <= 1;
          end 
          if(_acc_0_run_flag) begin
            _acc_0_fsm <= _acc_0_fsm_1;
          end 
        end
        _acc_0_fsm_1: begin
          if(_acc_0_source_start && _acc_0_stream_oready) begin
            _acc_0_source_start <= 0;
            _acc_0_source_busy <= 1;
          end 
          if(_acc_0_source_start && _acc_0_stream_oready) begin
            _acc_0_fsm <= _acc_0_fsm_2;
          end 
        end
        _acc_0_fsm_2: begin
          if(_acc_0_stream_oready) begin
            _acc_0_fsm <= _acc_0_fsm_3;
          end 
        end
        _acc_0_fsm_3: begin
          if(_acc_0_stream_oready && 1'd0) begin
            _acc_0_source_busy <= 0;
          end 
          if(_acc_0_stream_oready && 1'd0 && _acc_0_run_flag) begin
            _acc_0_source_start <= 1;
          end 
          if(_acc_0_stream_oready && 1'd0) begin
            _acc_0_fsm <= _acc_0_fsm_init;
          end 
          if(_acc_0_stream_oready && 1'd0 && _acc_0_run_flag) begin
            _acc_0_fsm <= _acc_0_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _acc_1_x_source_ram_renable <= 0;
      _acc_1_x_source_fifo_deq <= 0;
      _acc_1_x_idle <= 1;
      _acc_1_rshift_source_ram_renable <= 0;
      _acc_1_rshift_source_fifo_deq <= 0;
      _acc_1_rshift_idle <= 1;
      _acc_1_sum_sink_wenable <= 0;
      _acc_1_sum_sink_fifo_enq <= 0;
      _acc_1_valid_sink_wenable <= 0;
      _acc_1_valid_sink_fifo_enq <= 0;
      __acc_1_stream_ivalid_1 <= 0;
      __acc_1_stream_ivalid_2 <= 0;
      __acc_1_stream_ivalid_3 <= 0;
      __acc_1_stream_ivalid_4 <= 0;
      __acc_1_stream_ivalid_5 <= 0;
      _greaterthan_data_25 <= 0;
      _minus_data_27 <= 0;
      _reduceadd_data_38 <= 1'sd0;
      _reduceadd_count_38 <= 0;
      _reduceadd_prev_count_max_38 <= 0;
      _pulse_data_40 <= 1'sd0;
      _pulse_count_40 <= 0;
      _pulse_prev_count_max_40 <= 0;
      __delay_data_475__variable_23 <= 0;
      _sll_data_29 <= 0;
      __delay_data_472_greaterthan_25 <= 0;
      __delay_data_473_reduceadd_38 <= 0;
      __delay_data_476__delay_475__variable_23 <= 0;
      __delay_data_479_pulse_40 <= 0;
      _cond_data_35 <= 0;
      __delay_data_474__delay_473_reduceadd_38 <= 0;
      __delay_data_477__delay_476__delay_475__variable_23 <= 0;
      __delay_data_480__delay_479_pulse_40 <= 0;
      _plus_data_42 <= 0;
      __delay_data_478__delay_477__delay_476__delay_475__variable_23 <= 0;
      __delay_data_481__delay_480__delay_479_pulse_40 <= 0;
      _sra_data_43 <= 0;
      __delay_data_482__delay_481__delay_480__delay_479_pulse_40 <= 0;
      __variable_wdata_37 <= 0;
      __variable_wdata_22 <= 0;
      __variable_wdata_23 <= 0;
      __variable_wdata_24 <= 0;
      _tmp_598 <= 0;
      _tmp_599 <= 0;
      _tmp_600 <= 0;
      _tmp_601 <= 0;
      _tmp_602 <= 0;
      _tmp_603 <= 0;
      _tmp_604 <= 0;
      _tmp_605 <= 0;
      _tmp_606 <= 0;
      _tmp_607 <= 0;
      _tmp_608 <= 0;
      _tmp_609 <= 0;
      _tmp_610 <= 0;
      _tmp_611 <= 0;
      _tmp_612 <= 0;
      _tmp_613 <= 0;
      _tmp_614 <= 0;
      _tmp_615 <= 0;
      _tmp_616 <= 0;
      _tmp_617 <= 0;
      _tmp_618 <= 0;
      _tmp_619 <= 0;
      _tmp_620 <= 0;
      _tmp_621 <= 0;
      _tmp_622 <= 0;
      _tmp_623 <= 0;
      _tmp_624 <= 0;
      _tmp_625 <= 0;
      _tmp_626 <= 0;
      _tmp_627 <= 0;
      _tmp_628 <= 0;
      _tmp_629 <= 0;
      _acc_1_busy_reg <= 0;
    end else begin
      if(_acc_1_stream_oready) begin
        _acc_1_x_source_ram_renable <= 0;
        _acc_1_x_source_fifo_deq <= 0;
      end 
      _acc_1_x_idle <= _acc_1_x_idle;
      if(_acc_1_stream_oready) begin
        _acc_1_rshift_source_ram_renable <= 0;
        _acc_1_rshift_source_fifo_deq <= 0;
      end 
      _acc_1_rshift_idle <= _acc_1_rshift_idle;
      if(_acc_1_stream_oready) begin
        _acc_1_sum_sink_wenable <= 0;
        _acc_1_sum_sink_fifo_enq <= 0;
      end 
      if(_acc_1_stream_oready) begin
        _acc_1_valid_sink_wenable <= 0;
        _acc_1_valid_sink_fifo_enq <= 0;
      end 
      if(_acc_1_stream_oready) begin
        __acc_1_stream_ivalid_1 <= _acc_1_stream_ivalid;
      end 
      if(_acc_1_stream_oready) begin
        __acc_1_stream_ivalid_2 <= __acc_1_stream_ivalid_1;
      end 
      if(_acc_1_stream_oready) begin
        __acc_1_stream_ivalid_3 <= __acc_1_stream_ivalid_2;
      end 
      if(_acc_1_stream_oready) begin
        __acc_1_stream_ivalid_4 <= __acc_1_stream_ivalid_3;
      end 
      if(_acc_1_stream_oready) begin
        __acc_1_stream_ivalid_5 <= __acc_1_stream_ivalid_4;
      end 
      if(_acc_1_stream_oready) begin
        _greaterthan_data_25 <= acc_1_rshift_data > 1'sd0;
      end 
      if(_acc_1_stream_oready) begin
        _minus_data_27 <= acc_1_rshift_data - 2'sd1;
      end 
      if(_acc_1_stream_ivalid && _acc_1_stream_oready && _reduceadd_reset_cond_38) begin
        _reduceadd_data_38 <= 1'sd0;
      end 
      if(_acc_1_stream_ivalid && _acc_1_stream_oready) begin
        _reduceadd_count_38 <= (_reduceadd_current_count_38 >= acc_1_size_data - 1)? 0 : _reduceadd_current_count_38 + 1;
      end 
      if(_acc_1_stream_ivalid && _acc_1_stream_oready) begin
        _reduceadd_prev_count_max_38 <= _reduceadd_current_count_38 >= acc_1_size_data - 1;
      end 
      if(_acc_1_stream_ivalid && _acc_1_stream_oready) begin
        _reduceadd_data_38 <= _reduceadd_current_data_38 + acc_1_x_data;
      end 
      if(_acc_1_stream_ivalid && _acc_1_stream_oready && _pulse_reset_cond_40) begin
        _pulse_data_40 <= 1'sd0;
      end 
      if(_acc_1_stream_ivalid && _acc_1_stream_oready) begin
        _pulse_count_40 <= (_pulse_current_count_40 >= acc_1_size_data - 1)? 0 : _pulse_current_count_40 + 1;
      end 
      if(_acc_1_stream_ivalid && _acc_1_stream_oready) begin
        _pulse_prev_count_max_40 <= _pulse_current_count_40 >= acc_1_size_data - 1;
      end 
      if(_acc_1_stream_ivalid && _acc_1_stream_oready) begin
        _pulse_data_40 <= _pulse_current_count_40 >= acc_1_size_data - 1;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_475__variable_23 <= acc_1_rshift_data;
      end 
      if(_acc_1_stream_oready) begin
        _sll_data_29 <= 2'sd1 << _minus_data_27;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_472_greaterthan_25 <= _greaterthan_data_25;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_473_reduceadd_38 <= _reduceadd_data_38;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_476__delay_475__variable_23 <= __delay_data_475__variable_23;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_479_pulse_40 <= _pulse_data_40;
      end 
      if(_acc_1_stream_oready) begin
        _cond_data_35 <= (__delay_data_472_greaterthan_25)? _sll_data_29 : 1'sd0;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_474__delay_473_reduceadd_38 <= __delay_data_473_reduceadd_38;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_477__delay_476__delay_475__variable_23 <= __delay_data_476__delay_475__variable_23;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_480__delay_479_pulse_40 <= __delay_data_479_pulse_40;
      end 
      if(_acc_1_stream_oready) begin
        _plus_data_42 <= __delay_data_474__delay_473_reduceadd_38 + _cond_data_35;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_478__delay_477__delay_476__delay_475__variable_23 <= __delay_data_477__delay_476__delay_475__variable_23;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_481__delay_480__delay_479_pulse_40 <= __delay_data_480__delay_479_pulse_40;
      end 
      if(_acc_1_stream_oready) begin
        _sra_data_43 <= _plus_data_42 >>> __delay_data_478__delay_477__delay_476__delay_475__variable_23;
      end 
      if(_acc_1_stream_oready) begin
        __delay_data_482__delay_481__delay_480__delay_479_pulse_40 <= __delay_data_481__delay_480__delay_479_pulse_40;
      end 
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_37 <= __delay_data_551__delay_550__delay_549____variable_210;
      end 
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_22 <= __substreamoutput_data_470;
      end 
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_23 <= __delay_data_601__delay_600__delay_599__delay_598___plus_483;
      end 
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_24 <= __delay_data_578__delay_577__delay_576____variable_205;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_598 <= _acc_1_source_start;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_599 <= _tmp_598;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_600 <= _tmp_599;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_601 <= _acc_1_source_start;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_602 <= _tmp_601;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_603 <= _tmp_602;
      end 
      if(_acc_1_stream_oready && _tmp_603) begin
        __variable_wdata_37 <= 1;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_604 <= _acc_1_source_start;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_605 <= _tmp_604;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_606 <= _tmp_605;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_607 <= _tmp_606;
      end 
      if(_acc_1_stream_oready && _tmp_607) begin
        __variable_wdata_37 <= 0;
      end 
      if(_acc_1_stream_oready && 1'd0) begin
        __variable_wdata_37 <= 1;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_608 <= _acc_1_source_start;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_609 <= _tmp_608;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_610 <= _tmp_609;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_611 <= _tmp_610;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_612 <= _tmp_611;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_613 <= _tmp_612;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_614 <= _tmp_613;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_615 <= _acc_1_source_stop;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_616 <= _tmp_615;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_617 <= _tmp_616;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_618 <= _tmp_617;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_619 <= _tmp_618;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_620 <= _tmp_619;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_621 <= _tmp_620;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_622 <= _acc_1_source_busy;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_623 <= _tmp_622;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_624 <= _tmp_623;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_625 <= _tmp_624;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_626 <= _tmp_625;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_627 <= _tmp_626;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_628 <= _tmp_627;
      end 
      if(_acc_1_stream_oready) begin
        _tmp_629 <= _acc_1_sink_busy;
      end 
      if(!_acc_1_sink_busy && _tmp_629) begin
        _acc_1_busy_reg <= 0;
      end 
      if(_acc_1_source_busy) begin
        _acc_1_busy_reg <= 1;
      end 
    end
  end

  localparam _acc_1_fsm_1 = 1;
  localparam _acc_1_fsm_2 = 2;
  localparam _acc_1_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _acc_1_fsm <= _acc_1_fsm_init;
      _acc_1_source_start <= 0;
      _acc_1_source_busy <= 0;
      _acc_1_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_14 && _stream_matmul_5_stream_oready) begin
        _acc_1_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _acc_1_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_acc_1_stream_oready && _tmp_600) begin
        _acc_1_stream_ivalid <= 1;
      end 
      if(_acc_1_stream_oready && 1'd0) begin
        _acc_1_stream_ivalid <= 0;
      end 
      case(_acc_1_fsm)
        _acc_1_fsm_init: begin
          if(_acc_1_run_flag) begin
            _acc_1_source_start <= 1;
          end 
          if(_acc_1_run_flag) begin
            _acc_1_fsm <= _acc_1_fsm_1;
          end 
        end
        _acc_1_fsm_1: begin
          if(_acc_1_source_start && _acc_1_stream_oready) begin
            _acc_1_source_start <= 0;
            _acc_1_source_busy <= 1;
          end 
          if(_acc_1_source_start && _acc_1_stream_oready) begin
            _acc_1_fsm <= _acc_1_fsm_2;
          end 
        end
        _acc_1_fsm_2: begin
          if(_acc_1_stream_oready) begin
            _acc_1_fsm <= _acc_1_fsm_3;
          end 
        end
        _acc_1_fsm_3: begin
          if(_acc_1_stream_oready && 1'd0) begin
            _acc_1_source_busy <= 0;
          end 
          if(_acc_1_stream_oready && 1'd0 && _acc_1_run_flag) begin
            _acc_1_source_start <= 1;
          end 
          if(_acc_1_stream_oready && 1'd0) begin
            _acc_1_fsm <= _acc_1_fsm_init;
          end 
          if(_acc_1_stream_oready && 1'd0 && _acc_1_run_flag) begin
            _acc_1_fsm <= _acc_1_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _add_tree_2_var0_source_ram_renable <= 0;
      _add_tree_2_var0_source_fifo_deq <= 0;
      _add_tree_2_var0_idle <= 1;
      _add_tree_2_var1_source_ram_renable <= 0;
      _add_tree_2_var1_source_fifo_deq <= 0;
      _add_tree_2_var1_idle <= 1;
      _add_tree_2_sum_sink_wenable <= 0;
      _add_tree_2_sum_sink_fifo_enq <= 0;
      __add_tree_2_stream_ivalid_1 <= 0;
      __plusn_data_47 <= 0;
      __variable_wdata_44 <= 0;
      __variable_wdata_45 <= 0;
      _tmp_438 <= 0;
      _tmp_439 <= 0;
      _tmp_440 <= 0;
      _tmp_441 <= 0;
      _tmp_442 <= 0;
      _tmp_443 <= 0;
      _tmp_444 <= 0;
      _tmp_445 <= 0;
      _tmp_446 <= 0;
      _tmp_447 <= 0;
      _tmp_448 <= 0;
      _tmp_449 <= 0;
      _tmp_450 <= 0;
      _add_tree_2_busy_reg <= 0;
    end else begin
      if(_add_tree_2_stream_oready) begin
        _add_tree_2_var0_source_ram_renable <= 0;
        _add_tree_2_var0_source_fifo_deq <= 0;
      end 
      _add_tree_2_var0_idle <= _add_tree_2_var0_idle;
      if(_add_tree_2_stream_oready) begin
        _add_tree_2_var1_source_ram_renable <= 0;
        _add_tree_2_var1_source_fifo_deq <= 0;
      end 
      _add_tree_2_var1_idle <= _add_tree_2_var1_idle;
      if(_add_tree_2_stream_oready) begin
        _add_tree_2_sum_sink_wenable <= 0;
        _add_tree_2_sum_sink_fifo_enq <= 0;
      end 
      if(_add_tree_2_stream_oready) begin
        __add_tree_2_stream_ivalid_1 <= _add_tree_2_stream_ivalid;
      end 
      if(_add_tree_2_stream_oready) begin
        __plusn_data_47 <= add_tree_2_var0_data + add_tree_2_var1_data + 1'sd0;
      end 
      if(__stream_matmul_5_stream_ivalid_12 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_44 <= __substreamoutput_data_359;
      end 
      if(__stream_matmul_5_stream_ivalid_12 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_45 <= __substreamoutput_data_380;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_438 <= _add_tree_2_source_start;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_439 <= _tmp_438;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_440 <= _tmp_439;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_441 <= _add_tree_2_source_start;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_442 <= _tmp_441;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_443 <= _tmp_442;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_444 <= _add_tree_2_source_stop;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_445 <= _tmp_444;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_446 <= _tmp_445;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_447 <= _add_tree_2_source_busy;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_448 <= _tmp_447;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_449 <= _tmp_448;
      end 
      if(_add_tree_2_stream_oready) begin
        _tmp_450 <= _add_tree_2_sink_busy;
      end 
      if(!_add_tree_2_sink_busy && _tmp_450) begin
        _add_tree_2_busy_reg <= 0;
      end 
      if(_add_tree_2_source_busy) begin
        _add_tree_2_busy_reg <= 1;
      end 
    end
  end

  localparam _add_tree_2_fsm_1 = 1;
  localparam _add_tree_2_fsm_2 = 2;
  localparam _add_tree_2_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _add_tree_2_fsm <= _add_tree_2_fsm_init;
      _add_tree_2_source_start <= 0;
      _add_tree_2_source_busy <= 0;
      _add_tree_2_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_12 && _stream_matmul_5_stream_oready) begin
        _add_tree_2_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _add_tree_2_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_add_tree_2_stream_oready && _tmp_440) begin
        _add_tree_2_stream_ivalid <= 1;
      end 
      if(_add_tree_2_stream_oready && 1'd0) begin
        _add_tree_2_stream_ivalid <= 0;
      end 
      case(_add_tree_2_fsm)
        _add_tree_2_fsm_init: begin
          if(_add_tree_2_run_flag) begin
            _add_tree_2_source_start <= 1;
          end 
          if(_add_tree_2_run_flag) begin
            _add_tree_2_fsm <= _add_tree_2_fsm_1;
          end 
        end
        _add_tree_2_fsm_1: begin
          if(_add_tree_2_source_start && _add_tree_2_stream_oready) begin
            _add_tree_2_source_start <= 0;
            _add_tree_2_source_busy <= 1;
          end 
          if(_add_tree_2_source_start && _add_tree_2_stream_oready) begin
            _add_tree_2_fsm <= _add_tree_2_fsm_2;
          end 
        end
        _add_tree_2_fsm_2: begin
          if(_add_tree_2_stream_oready) begin
            _add_tree_2_fsm <= _add_tree_2_fsm_3;
          end 
        end
        _add_tree_2_fsm_3: begin
          if(_add_tree_2_stream_oready && 1'd0) begin
            _add_tree_2_source_busy <= 0;
          end 
          if(_add_tree_2_stream_oready && 1'd0 && _add_tree_2_run_flag) begin
            _add_tree_2_source_start <= 1;
          end 
          if(_add_tree_2_stream_oready && 1'd0) begin
            _add_tree_2_fsm <= _add_tree_2_fsm_init;
          end 
          if(_add_tree_2_stream_oready && 1'd0 && _add_tree_2_run_flag) begin
            _add_tree_2_fsm <= _add_tree_2_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _add_tree_3_var0_source_ram_renable <= 0;
      _add_tree_3_var0_source_fifo_deq <= 0;
      _add_tree_3_var0_idle <= 1;
      _add_tree_3_var1_source_ram_renable <= 0;
      _add_tree_3_var1_source_fifo_deq <= 0;
      _add_tree_3_var1_idle <= 1;
      _add_tree_3_sum_sink_wenable <= 0;
      _add_tree_3_sum_sink_fifo_enq <= 0;
      __add_tree_3_stream_ivalid_1 <= 0;
      __plusn_data_51 <= 0;
      __variable_wdata_48 <= 0;
      __variable_wdata_49 <= 0;
      _tmp_585 <= 0;
      _tmp_586 <= 0;
      _tmp_587 <= 0;
      _tmp_588 <= 0;
      _tmp_589 <= 0;
      _tmp_590 <= 0;
      _tmp_591 <= 0;
      _tmp_592 <= 0;
      _tmp_593 <= 0;
      _tmp_594 <= 0;
      _tmp_595 <= 0;
      _tmp_596 <= 0;
      _tmp_597 <= 0;
      _add_tree_3_busy_reg <= 0;
    end else begin
      if(_add_tree_3_stream_oready) begin
        _add_tree_3_var0_source_ram_renable <= 0;
        _add_tree_3_var0_source_fifo_deq <= 0;
      end 
      _add_tree_3_var0_idle <= _add_tree_3_var0_idle;
      if(_add_tree_3_stream_oready) begin
        _add_tree_3_var1_source_ram_renable <= 0;
        _add_tree_3_var1_source_fifo_deq <= 0;
      end 
      _add_tree_3_var1_idle <= _add_tree_3_var1_idle;
      if(_add_tree_3_stream_oready) begin
        _add_tree_3_sum_sink_wenable <= 0;
        _add_tree_3_sum_sink_fifo_enq <= 0;
      end 
      if(_add_tree_3_stream_oready) begin
        __add_tree_3_stream_ivalid_1 <= _add_tree_3_stream_ivalid;
      end 
      if(_add_tree_3_stream_oready) begin
        __plusn_data_51 <= add_tree_3_var0_data + add_tree_3_var1_data + 1'sd0;
      end 
      if(__stream_matmul_5_stream_ivalid_12 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_48 <= __substreamoutput_data_447;
      end 
      if(__stream_matmul_5_stream_ivalid_12 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_49 <= __substreamoutput_data_468;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_585 <= _add_tree_3_source_start;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_586 <= _tmp_585;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_587 <= _tmp_586;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_588 <= _add_tree_3_source_start;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_589 <= _tmp_588;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_590 <= _tmp_589;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_591 <= _add_tree_3_source_stop;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_592 <= _tmp_591;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_593 <= _tmp_592;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_594 <= _add_tree_3_source_busy;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_595 <= _tmp_594;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_596 <= _tmp_595;
      end 
      if(_add_tree_3_stream_oready) begin
        _tmp_597 <= _add_tree_3_sink_busy;
      end 
      if(!_add_tree_3_sink_busy && _tmp_597) begin
        _add_tree_3_busy_reg <= 0;
      end 
      if(_add_tree_3_source_busy) begin
        _add_tree_3_busy_reg <= 1;
      end 
    end
  end

  localparam _add_tree_3_fsm_1 = 1;
  localparam _add_tree_3_fsm_2 = 2;
  localparam _add_tree_3_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _add_tree_3_fsm <= _add_tree_3_fsm_init;
      _add_tree_3_source_start <= 0;
      _add_tree_3_source_busy <= 0;
      _add_tree_3_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_12 && _stream_matmul_5_stream_oready) begin
        _add_tree_3_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _add_tree_3_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_add_tree_3_stream_oready && _tmp_587) begin
        _add_tree_3_stream_ivalid <= 1;
      end 
      if(_add_tree_3_stream_oready && 1'd0) begin
        _add_tree_3_stream_ivalid <= 0;
      end 
      case(_add_tree_3_fsm)
        _add_tree_3_fsm_init: begin
          if(_add_tree_3_run_flag) begin
            _add_tree_3_source_start <= 1;
          end 
          if(_add_tree_3_run_flag) begin
            _add_tree_3_fsm <= _add_tree_3_fsm_1;
          end 
        end
        _add_tree_3_fsm_1: begin
          if(_add_tree_3_source_start && _add_tree_3_stream_oready) begin
            _add_tree_3_source_start <= 0;
            _add_tree_3_source_busy <= 1;
          end 
          if(_add_tree_3_source_start && _add_tree_3_stream_oready) begin
            _add_tree_3_fsm <= _add_tree_3_fsm_2;
          end 
        end
        _add_tree_3_fsm_2: begin
          if(_add_tree_3_stream_oready) begin
            _add_tree_3_fsm <= _add_tree_3_fsm_3;
          end 
        end
        _add_tree_3_fsm_3: begin
          if(_add_tree_3_stream_oready && 1'd0) begin
            _add_tree_3_source_busy <= 0;
          end 
          if(_add_tree_3_stream_oready && 1'd0 && _add_tree_3_run_flag) begin
            _add_tree_3_source_start <= 1;
          end 
          if(_add_tree_3_stream_oready && 1'd0) begin
            _add_tree_3_fsm <= _add_tree_3_fsm_init;
          end 
          if(_add_tree_3_stream_oready && 1'd0 && _add_tree_3_run_flag) begin
            _add_tree_3_fsm <= _add_tree_3_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _mul_rshift_round_clip_4_x_source_ram_renable <= 0;
      _mul_rshift_round_clip_4_x_source_fifo_deq <= 0;
      _mul_rshift_round_clip_4_x_idle <= 1;
      _mul_rshift_round_clip_4_y_source_ram_renable <= 0;
      _mul_rshift_round_clip_4_y_source_fifo_deq <= 0;
      _mul_rshift_round_clip_4_y_idle <= 1;
      _mul_rshift_round_clip_4_rshift_source_ram_renable <= 0;
      _mul_rshift_round_clip_4_rshift_source_fifo_deq <= 0;
      _mul_rshift_round_clip_4_rshift_idle <= 1;
      _mul_rshift_round_clip_4_z_sink_wenable <= 0;
      _mul_rshift_round_clip_4_z_sink_fifo_enq <= 0;
      __mul_rshift_round_clip_4_stream_ivalid_1 <= 0;
      __mul_rshift_round_clip_4_stream_ivalid_2 <= 0;
      __mul_rshift_round_clip_4_stream_ivalid_3 <= 0;
      __mul_rshift_round_clip_4_stream_ivalid_4 <= 0;
      __mul_rshift_round_clip_4_stream_ivalid_5 <= 0;
      __mul_rshift_round_clip_4_stream_ivalid_6 <= 0;
      __mul_rshift_round_clip_4_stream_ivalid_7 <= 0;
      __mul_rshift_round_clip_4_stream_ivalid_8 <= 0;
      _times_mul_odata_reg_55 <= 0;
      __delay_data_400_sll_61 <= 0;
      __delay_data_404__variable_54 <= 0;
      __delay_data_408_eq_73 <= 0;
      __delay_data_401__delay_400_sll_61 <= 0;
      __delay_data_405__delay_404__variable_54 <= 0;
      __delay_data_409__delay_408_eq_73 <= 0;
      __delay_data_402__delay_401__delay_400_sll_61 <= 0;
      __delay_data_406__delay_405__delay_404__variable_54 <= 0;
      __delay_data_410__delay_409__delay_408_eq_73 <= 0;
      __delay_data_403__delay_402__delay_401__delay_400_sll_61 <= 0;
      __delay_data_407__delay_406__delay_405__delay_404__variable_54 <= 0;
      __delay_data_411__delay_410__delay_409__delay_408_eq_73 <= 0;
      _cond_data_74 <= 0;
      _greaterthan_data_75 <= 0;
      _lessthan_data_79 <= 0;
      _greatereq_data_83 <= 0;
      __delay_data_412_cond_74 <= 0;
      _cond_data_77 <= 0;
      _cond_data_81 <= 0;
      __delay_data_413_greatereq_83 <= 0;
      _cond_data_85 <= 0;
      __variable_wdata_52 <= 0;
      __variable_wdata_53 <= 0;
      __variable_wdata_54 <= 0;
      _tmp_483 <= 0;
      _tmp_484 <= 0;
      _tmp_485 <= 0;
      _tmp_486 <= 0;
      _tmp_487 <= 0;
      _tmp_488 <= 0;
      _tmp_489 <= 0;
      _tmp_490 <= 0;
      _tmp_491 <= 0;
      _tmp_492 <= 0;
      _tmp_493 <= 0;
      _tmp_494 <= 0;
      _tmp_495 <= 0;
      _tmp_496 <= 0;
      _tmp_497 <= 0;
      _tmp_498 <= 0;
      _tmp_499 <= 0;
      _tmp_500 <= 0;
      _tmp_501 <= 0;
      _tmp_502 <= 0;
      _tmp_503 <= 0;
      _tmp_504 <= 0;
      _tmp_505 <= 0;
      _tmp_506 <= 0;
      _tmp_507 <= 0;
      _tmp_508 <= 0;
      _tmp_509 <= 0;
      _tmp_510 <= 0;
      _tmp_511 <= 0;
      _tmp_512 <= 0;
      _tmp_513 <= 0;
      _tmp_514 <= 0;
      _tmp_515 <= 0;
      _tmp_516 <= 0;
      _mul_rshift_round_clip_4_busy_reg <= 0;
    end else begin
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _mul_rshift_round_clip_4_x_source_ram_renable <= 0;
        _mul_rshift_round_clip_4_x_source_fifo_deq <= 0;
      end 
      _mul_rshift_round_clip_4_x_idle <= _mul_rshift_round_clip_4_x_idle;
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _mul_rshift_round_clip_4_y_source_ram_renable <= 0;
        _mul_rshift_round_clip_4_y_source_fifo_deq <= 0;
      end 
      _mul_rshift_round_clip_4_y_idle <= _mul_rshift_round_clip_4_y_idle;
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _mul_rshift_round_clip_4_rshift_source_ram_renable <= 0;
        _mul_rshift_round_clip_4_rshift_source_fifo_deq <= 0;
      end 
      _mul_rshift_round_clip_4_rshift_idle <= _mul_rshift_round_clip_4_rshift_idle;
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _mul_rshift_round_clip_4_z_sink_wenable <= 0;
        _mul_rshift_round_clip_4_z_sink_fifo_enq <= 0;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __mul_rshift_round_clip_4_stream_ivalid_1 <= _mul_rshift_round_clip_4_stream_ivalid;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __mul_rshift_round_clip_4_stream_ivalid_2 <= __mul_rshift_round_clip_4_stream_ivalid_1;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __mul_rshift_round_clip_4_stream_ivalid_3 <= __mul_rshift_round_clip_4_stream_ivalid_2;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __mul_rshift_round_clip_4_stream_ivalid_4 <= __mul_rshift_round_clip_4_stream_ivalid_3;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __mul_rshift_round_clip_4_stream_ivalid_5 <= __mul_rshift_round_clip_4_stream_ivalid_4;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __mul_rshift_round_clip_4_stream_ivalid_6 <= __mul_rshift_round_clip_4_stream_ivalid_5;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __mul_rshift_round_clip_4_stream_ivalid_7 <= __mul_rshift_round_clip_4_stream_ivalid_6;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __mul_rshift_round_clip_4_stream_ivalid_8 <= __mul_rshift_round_clip_4_stream_ivalid_7;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _times_mul_odata_reg_55 <= _times_mul_odata_55;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_400_sll_61 <= _sll_data_61;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_404__variable_54 <= mul_rshift_round_clip_4_rshift_data;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_408_eq_73 <= _eq_data_73;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_401__delay_400_sll_61 <= __delay_data_400_sll_61;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_405__delay_404__variable_54 <= __delay_data_404__variable_54;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_409__delay_408_eq_73 <= __delay_data_408_eq_73;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_402__delay_401__delay_400_sll_61 <= __delay_data_401__delay_400_sll_61;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_406__delay_405__delay_404__variable_54 <= __delay_data_405__delay_404__variable_54;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_410__delay_409__delay_408_eq_73 <= __delay_data_409__delay_408_eq_73;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_403__delay_402__delay_401__delay_400_sll_61 <= __delay_data_402__delay_401__delay_400_sll_61;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_407__delay_406__delay_405__delay_404__variable_54 <= __delay_data_406__delay_405__delay_404__variable_54;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_411__delay_410__delay_409__delay_408_eq_73 <= __delay_data_410__delay_409__delay_408_eq_73;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _cond_data_74 <= (__delay_data_411__delay_410__delay_409__delay_408_eq_73)? _times_data_55 : _sra_data_71;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _greaterthan_data_75 <= _cond_data_74 > 16'sd32767;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _lessthan_data_79 <= _cond_data_74 < -16'sd32767;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _greatereq_data_83 <= _cond_data_74 >= 1'sd0;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_412_cond_74 <= _cond_data_74;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _cond_data_77 <= (_greaterthan_data_75)? 16'sd32767 : __delay_data_412_cond_74;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _cond_data_81 <= (_lessthan_data_79)? -16'sd32767 : __delay_data_412_cond_74;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        __delay_data_413_greatereq_83 <= _greatereq_data_83;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _cond_data_85 <= (__delay_data_413_greatereq_83)? _cond_data_77 : _cond_data_81;
      end 
      if(__stream_matmul_5_stream_ivalid_21 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_52 <= _plus_data_398;
      end 
      if(__stream_matmul_5_stream_ivalid_21 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_53 <= __delay_data_767__delay_766__delay_765__delay_764___cond_248;
      end 
      if(__stream_matmul_5_stream_ivalid_21 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_54 <= __delay_data_787__delay_786__delay_785__delay_784___plus_414;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_483 <= _mul_rshift_round_clip_4_source_start;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_484 <= _tmp_483;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_485 <= _tmp_484;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_486 <= _mul_rshift_round_clip_4_source_start;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_487 <= _tmp_486;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_488 <= _tmp_487;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_489 <= _tmp_488;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_490 <= _tmp_489;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_491 <= _tmp_490;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_492 <= _tmp_491;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_493 <= _tmp_492;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_494 <= _tmp_493;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_495 <= _tmp_494;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_496 <= _mul_rshift_round_clip_4_source_stop;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_497 <= _tmp_496;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_498 <= _tmp_497;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_499 <= _tmp_498;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_500 <= _tmp_499;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_501 <= _tmp_500;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_502 <= _tmp_501;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_503 <= _tmp_502;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_504 <= _tmp_503;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_505 <= _tmp_504;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_506 <= _mul_rshift_round_clip_4_source_busy;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_507 <= _tmp_506;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_508 <= _tmp_507;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_509 <= _tmp_508;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_510 <= _tmp_509;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_511 <= _tmp_510;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_512 <= _tmp_511;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_513 <= _tmp_512;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_514 <= _tmp_513;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_515 <= _tmp_514;
      end 
      if(_mul_rshift_round_clip_4_stream_oready) begin
        _tmp_516 <= _mul_rshift_round_clip_4_sink_busy;
      end 
      if(!_mul_rshift_round_clip_4_sink_busy && _tmp_516) begin
        _mul_rshift_round_clip_4_busy_reg <= 0;
      end 
      if(_mul_rshift_round_clip_4_source_busy) begin
        _mul_rshift_round_clip_4_busy_reg <= 1;
      end 
    end
  end

  localparam _mul_rshift_round_clip_4_fsm_1 = 1;
  localparam _mul_rshift_round_clip_4_fsm_2 = 2;
  localparam _mul_rshift_round_clip_4_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _mul_rshift_round_clip_4_fsm <= _mul_rshift_round_clip_4_fsm_init;
      _mul_rshift_round_clip_4_source_start <= 0;
      _mul_rshift_round_clip_4_source_busy <= 0;
      _mul_rshift_round_clip_4_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_21 && _stream_matmul_5_stream_oready) begin
        _mul_rshift_round_clip_4_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _mul_rshift_round_clip_4_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_mul_rshift_round_clip_4_stream_oready && _tmp_485) begin
        _mul_rshift_round_clip_4_stream_ivalid <= 1;
      end 
      if(_mul_rshift_round_clip_4_stream_oready && 1'd0) begin
        _mul_rshift_round_clip_4_stream_ivalid <= 0;
      end 
      case(_mul_rshift_round_clip_4_fsm)
        _mul_rshift_round_clip_4_fsm_init: begin
          if(_mul_rshift_round_clip_4_run_flag) begin
            _mul_rshift_round_clip_4_source_start <= 1;
          end 
          if(_mul_rshift_round_clip_4_run_flag) begin
            _mul_rshift_round_clip_4_fsm <= _mul_rshift_round_clip_4_fsm_1;
          end 
        end
        _mul_rshift_round_clip_4_fsm_1: begin
          if(_mul_rshift_round_clip_4_source_start && _mul_rshift_round_clip_4_stream_oready) begin
            _mul_rshift_round_clip_4_source_start <= 0;
            _mul_rshift_round_clip_4_source_busy <= 1;
          end 
          if(_mul_rshift_round_clip_4_source_start && _mul_rshift_round_clip_4_stream_oready) begin
            _mul_rshift_round_clip_4_fsm <= _mul_rshift_round_clip_4_fsm_2;
          end 
        end
        _mul_rshift_round_clip_4_fsm_2: begin
          if(_mul_rshift_round_clip_4_stream_oready) begin
            _mul_rshift_round_clip_4_fsm <= _mul_rshift_round_clip_4_fsm_3;
          end 
        end
        _mul_rshift_round_clip_4_fsm_3: begin
          if(_mul_rshift_round_clip_4_stream_oready && 1'd0) begin
            _mul_rshift_round_clip_4_source_busy <= 0;
          end 
          if(_mul_rshift_round_clip_4_stream_oready && 1'd0 && _mul_rshift_round_clip_4_run_flag) begin
            _mul_rshift_round_clip_4_source_start <= 1;
          end 
          if(_mul_rshift_round_clip_4_stream_oready && 1'd0) begin
            _mul_rshift_round_clip_4_fsm <= _mul_rshift_round_clip_4_fsm_init;
          end 
          if(_mul_rshift_round_clip_4_stream_oready && 1'd0 && _mul_rshift_round_clip_4_run_flag) begin
            _mul_rshift_round_clip_4_fsm <= _mul_rshift_round_clip_4_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _mul_rshift_round_clip_5_x_source_ram_renable <= 0;
      _mul_rshift_round_clip_5_x_source_fifo_deq <= 0;
      _mul_rshift_round_clip_5_x_idle <= 1;
      _mul_rshift_round_clip_5_y_source_ram_renable <= 0;
      _mul_rshift_round_clip_5_y_source_fifo_deq <= 0;
      _mul_rshift_round_clip_5_y_idle <= 1;
      _mul_rshift_round_clip_5_rshift_source_ram_renable <= 0;
      _mul_rshift_round_clip_5_rshift_source_fifo_deq <= 0;
      _mul_rshift_round_clip_5_rshift_idle <= 1;
      _mul_rshift_round_clip_5_z_sink_wenable <= 0;
      _mul_rshift_round_clip_5_z_sink_fifo_enq <= 0;
      __mul_rshift_round_clip_5_stream_ivalid_1 <= 0;
      __mul_rshift_round_clip_5_stream_ivalid_2 <= 0;
      __mul_rshift_round_clip_5_stream_ivalid_3 <= 0;
      __mul_rshift_round_clip_5_stream_ivalid_4 <= 0;
      __mul_rshift_round_clip_5_stream_ivalid_5 <= 0;
      __mul_rshift_round_clip_5_stream_ivalid_6 <= 0;
      __mul_rshift_round_clip_5_stream_ivalid_7 <= 0;
      __mul_rshift_round_clip_5_stream_ivalid_8 <= 0;
      _times_mul_odata_reg_89 <= 0;
      __delay_data_488_sll_95 <= 0;
      __delay_data_492__variable_88 <= 0;
      __delay_data_496_eq_107 <= 0;
      __delay_data_489__delay_488_sll_95 <= 0;
      __delay_data_493__delay_492__variable_88 <= 0;
      __delay_data_497__delay_496_eq_107 <= 0;
      __delay_data_490__delay_489__delay_488_sll_95 <= 0;
      __delay_data_494__delay_493__delay_492__variable_88 <= 0;
      __delay_data_498__delay_497__delay_496_eq_107 <= 0;
      __delay_data_491__delay_490__delay_489__delay_488_sll_95 <= 0;
      __delay_data_495__delay_494__delay_493__delay_492__variable_88 <= 0;
      __delay_data_499__delay_498__delay_497__delay_496_eq_107 <= 0;
      _cond_data_108 <= 0;
      _greaterthan_data_109 <= 0;
      _lessthan_data_113 <= 0;
      _greatereq_data_117 <= 0;
      __delay_data_500_cond_108 <= 0;
      _cond_data_111 <= 0;
      _cond_data_115 <= 0;
      __delay_data_501_greatereq_117 <= 0;
      _cond_data_119 <= 0;
      __variable_wdata_86 <= 0;
      __variable_wdata_87 <= 0;
      __variable_wdata_88 <= 0;
      _tmp_630 <= 0;
      _tmp_631 <= 0;
      _tmp_632 <= 0;
      _tmp_633 <= 0;
      _tmp_634 <= 0;
      _tmp_635 <= 0;
      _tmp_636 <= 0;
      _tmp_637 <= 0;
      _tmp_638 <= 0;
      _tmp_639 <= 0;
      _tmp_640 <= 0;
      _tmp_641 <= 0;
      _tmp_642 <= 0;
      _tmp_643 <= 0;
      _tmp_644 <= 0;
      _tmp_645 <= 0;
      _tmp_646 <= 0;
      _tmp_647 <= 0;
      _tmp_648 <= 0;
      _tmp_649 <= 0;
      _tmp_650 <= 0;
      _tmp_651 <= 0;
      _tmp_652 <= 0;
      _tmp_653 <= 0;
      _tmp_654 <= 0;
      _tmp_655 <= 0;
      _tmp_656 <= 0;
      _tmp_657 <= 0;
      _tmp_658 <= 0;
      _tmp_659 <= 0;
      _tmp_660 <= 0;
      _tmp_661 <= 0;
      _tmp_662 <= 0;
      _tmp_663 <= 0;
      _mul_rshift_round_clip_5_busy_reg <= 0;
    end else begin
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _mul_rshift_round_clip_5_x_source_ram_renable <= 0;
        _mul_rshift_round_clip_5_x_source_fifo_deq <= 0;
      end 
      _mul_rshift_round_clip_5_x_idle <= _mul_rshift_round_clip_5_x_idle;
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _mul_rshift_round_clip_5_y_source_ram_renable <= 0;
        _mul_rshift_round_clip_5_y_source_fifo_deq <= 0;
      end 
      _mul_rshift_round_clip_5_y_idle <= _mul_rshift_round_clip_5_y_idle;
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _mul_rshift_round_clip_5_rshift_source_ram_renable <= 0;
        _mul_rshift_round_clip_5_rshift_source_fifo_deq <= 0;
      end 
      _mul_rshift_round_clip_5_rshift_idle <= _mul_rshift_round_clip_5_rshift_idle;
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _mul_rshift_round_clip_5_z_sink_wenable <= 0;
        _mul_rshift_round_clip_5_z_sink_fifo_enq <= 0;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __mul_rshift_round_clip_5_stream_ivalid_1 <= _mul_rshift_round_clip_5_stream_ivalid;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __mul_rshift_round_clip_5_stream_ivalid_2 <= __mul_rshift_round_clip_5_stream_ivalid_1;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __mul_rshift_round_clip_5_stream_ivalid_3 <= __mul_rshift_round_clip_5_stream_ivalid_2;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __mul_rshift_round_clip_5_stream_ivalid_4 <= __mul_rshift_round_clip_5_stream_ivalid_3;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __mul_rshift_round_clip_5_stream_ivalid_5 <= __mul_rshift_round_clip_5_stream_ivalid_4;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __mul_rshift_round_clip_5_stream_ivalid_6 <= __mul_rshift_round_clip_5_stream_ivalid_5;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __mul_rshift_round_clip_5_stream_ivalid_7 <= __mul_rshift_round_clip_5_stream_ivalid_6;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __mul_rshift_round_clip_5_stream_ivalid_8 <= __mul_rshift_round_clip_5_stream_ivalid_7;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _times_mul_odata_reg_89 <= _times_mul_odata_89;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_488_sll_95 <= _sll_data_95;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_492__variable_88 <= mul_rshift_round_clip_5_rshift_data;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_496_eq_107 <= _eq_data_107;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_489__delay_488_sll_95 <= __delay_data_488_sll_95;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_493__delay_492__variable_88 <= __delay_data_492__variable_88;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_497__delay_496_eq_107 <= __delay_data_496_eq_107;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_490__delay_489__delay_488_sll_95 <= __delay_data_489__delay_488_sll_95;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_494__delay_493__delay_492__variable_88 <= __delay_data_493__delay_492__variable_88;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_498__delay_497__delay_496_eq_107 <= __delay_data_497__delay_496_eq_107;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_491__delay_490__delay_489__delay_488_sll_95 <= __delay_data_490__delay_489__delay_488_sll_95;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_495__delay_494__delay_493__delay_492__variable_88 <= __delay_data_494__delay_493__delay_492__variable_88;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_499__delay_498__delay_497__delay_496_eq_107 <= __delay_data_498__delay_497__delay_496_eq_107;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _cond_data_108 <= (__delay_data_499__delay_498__delay_497__delay_496_eq_107)? _times_data_89 : _sra_data_105;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _greaterthan_data_109 <= _cond_data_108 > 16'sd32767;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _lessthan_data_113 <= _cond_data_108 < -16'sd32767;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _greatereq_data_117 <= _cond_data_108 >= 1'sd0;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_500_cond_108 <= _cond_data_108;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _cond_data_111 <= (_greaterthan_data_109)? 16'sd32767 : __delay_data_500_cond_108;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _cond_data_115 <= (_lessthan_data_113)? -16'sd32767 : __delay_data_500_cond_108;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        __delay_data_501_greatereq_117 <= _greatereq_data_117;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _cond_data_119 <= (__delay_data_501_greatereq_117)? _cond_data_111 : _cond_data_115;
      end 
      if(__stream_matmul_5_stream_ivalid_21 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_86 <= _plus_data_486;
      end 
      if(__stream_matmul_5_stream_ivalid_21 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_87 <= __delay_data_642__delay_641__delay_640__delay_639___cond_249;
      end 
      if(__stream_matmul_5_stream_ivalid_21 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_88 <= __delay_data_662__delay_661__delay_660__delay_659___plus_502;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_630 <= _mul_rshift_round_clip_5_source_start;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_631 <= _tmp_630;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_632 <= _tmp_631;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_633 <= _mul_rshift_round_clip_5_source_start;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_634 <= _tmp_633;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_635 <= _tmp_634;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_636 <= _tmp_635;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_637 <= _tmp_636;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_638 <= _tmp_637;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_639 <= _tmp_638;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_640 <= _tmp_639;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_641 <= _tmp_640;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_642 <= _tmp_641;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_643 <= _mul_rshift_round_clip_5_source_stop;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_644 <= _tmp_643;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_645 <= _tmp_644;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_646 <= _tmp_645;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_647 <= _tmp_646;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_648 <= _tmp_647;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_649 <= _tmp_648;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_650 <= _tmp_649;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_651 <= _tmp_650;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_652 <= _tmp_651;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_653 <= _mul_rshift_round_clip_5_source_busy;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_654 <= _tmp_653;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_655 <= _tmp_654;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_656 <= _tmp_655;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_657 <= _tmp_656;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_658 <= _tmp_657;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_659 <= _tmp_658;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_660 <= _tmp_659;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_661 <= _tmp_660;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_662 <= _tmp_661;
      end 
      if(_mul_rshift_round_clip_5_stream_oready) begin
        _tmp_663 <= _mul_rshift_round_clip_5_sink_busy;
      end 
      if(!_mul_rshift_round_clip_5_sink_busy && _tmp_663) begin
        _mul_rshift_round_clip_5_busy_reg <= 0;
      end 
      if(_mul_rshift_round_clip_5_source_busy) begin
        _mul_rshift_round_clip_5_busy_reg <= 1;
      end 
    end
  end

  localparam _mul_rshift_round_clip_5_fsm_1 = 1;
  localparam _mul_rshift_round_clip_5_fsm_2 = 2;
  localparam _mul_rshift_round_clip_5_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _mul_rshift_round_clip_5_fsm <= _mul_rshift_round_clip_5_fsm_init;
      _mul_rshift_round_clip_5_source_start <= 0;
      _mul_rshift_round_clip_5_source_busy <= 0;
      _mul_rshift_round_clip_5_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_21 && _stream_matmul_5_stream_oready) begin
        _mul_rshift_round_clip_5_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _mul_rshift_round_clip_5_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_mul_rshift_round_clip_5_stream_oready && _tmp_632) begin
        _mul_rshift_round_clip_5_stream_ivalid <= 1;
      end 
      if(_mul_rshift_round_clip_5_stream_oready && 1'd0) begin
        _mul_rshift_round_clip_5_stream_ivalid <= 0;
      end 
      case(_mul_rshift_round_clip_5_fsm)
        _mul_rshift_round_clip_5_fsm_init: begin
          if(_mul_rshift_round_clip_5_run_flag) begin
            _mul_rshift_round_clip_5_source_start <= 1;
          end 
          if(_mul_rshift_round_clip_5_run_flag) begin
            _mul_rshift_round_clip_5_fsm <= _mul_rshift_round_clip_5_fsm_1;
          end 
        end
        _mul_rshift_round_clip_5_fsm_1: begin
          if(_mul_rshift_round_clip_5_source_start && _mul_rshift_round_clip_5_stream_oready) begin
            _mul_rshift_round_clip_5_source_start <= 0;
            _mul_rshift_round_clip_5_source_busy <= 1;
          end 
          if(_mul_rshift_round_clip_5_source_start && _mul_rshift_round_clip_5_stream_oready) begin
            _mul_rshift_round_clip_5_fsm <= _mul_rshift_round_clip_5_fsm_2;
          end 
        end
        _mul_rshift_round_clip_5_fsm_2: begin
          if(_mul_rshift_round_clip_5_stream_oready) begin
            _mul_rshift_round_clip_5_fsm <= _mul_rshift_round_clip_5_fsm_3;
          end 
        end
        _mul_rshift_round_clip_5_fsm_3: begin
          if(_mul_rshift_round_clip_5_stream_oready && 1'd0) begin
            _mul_rshift_round_clip_5_source_busy <= 0;
          end 
          if(_mul_rshift_round_clip_5_stream_oready && 1'd0 && _mul_rshift_round_clip_5_run_flag) begin
            _mul_rshift_round_clip_5_source_start <= 1;
          end 
          if(_mul_rshift_round_clip_5_stream_oready && 1'd0) begin
            _mul_rshift_round_clip_5_fsm <= _mul_rshift_round_clip_5_fsm_init;
          end 
          if(_mul_rshift_round_clip_5_stream_oready && 1'd0 && _mul_rshift_round_clip_5_run_flag) begin
            _mul_rshift_round_clip_5_fsm <= _mul_rshift_round_clip_5_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _mul_6_x_source_ram_renable <= 0;
      _mul_6_x_source_fifo_deq <= 0;
      _mul_6_x_idle <= 1;
      _mul_6_y_source_ram_renable <= 0;
      _mul_6_y_source_fifo_deq <= 0;
      _mul_6_y_idle <= 1;
      _mul_6_rshift_source_ram_renable <= 0;
      _mul_6_rshift_source_fifo_deq <= 0;
      _mul_6_rshift_idle <= 1;
      _mul_6_z_sink_wenable <= 0;
      _mul_6_z_sink_fifo_enq <= 0;
      __mul_6_stream_ivalid_1 <= 0;
      __mul_6_stream_ivalid_2 <= 0;
      __mul_6_stream_ivalid_3 <= 0;
      __mul_6_stream_ivalid_4 <= 0;
      __mul_6_stream_ivalid_5 <= 0;
      __mul_6_stream_ivalid_6 <= 0;
      __mul_6_stream_ivalid_7 <= 0;
      __mul_6_stream_ivalid_8 <= 0;
      _greaterthan_data_123 <= 0;
      _minus_data_125 <= 0;
      _greatereq_data_136 <= 0;
      __delay_data_345__variable_120 <= 0;
      __delay_data_348__variable_121 <= 0;
      __delay_data_351__variable_122 <= 0;
      _sll_data_127 <= 0;
      __delay_data_342_greaterthan_123 <= 0;
      __delay_data_343_greatereq_136 <= 0;
      __delay_data_346__delay_345__variable_120 <= 0;
      __delay_data_349__delay_348__variable_121 <= 0;
      __delay_data_352__delay_351__variable_122 <= 0;
      _cond_data_133 <= 0;
      __delay_data_344__delay_343_greatereq_136 <= 0;
      __delay_data_347__delay_346__delay_345__variable_120 <= 0;
      __delay_data_350__delay_349__delay_348__variable_121 <= 0;
      __delay_data_353__delay_352__delay_351__variable_122 <= 0;
      __muladd_madd_odata_reg_139 <= 0;
      __delay_data_354__delay_353__delay_352____variable_122 <= 0;
      __delay_data_355__delay_354__delay_353____variable_122 <= 0;
      __delay_data_356__delay_355__delay_354____variable_122 <= 0;
      __delay_data_357__delay_356__delay_355____variable_122 <= 0;
      _sra_data_140 <= 0;
      __variable_wdata_120 <= 0;
      __variable_wdata_121 <= 0;
      __variable_wdata_122 <= 0;
      _tmp_370 <= 0;
      _tmp_371 <= 0;
      _tmp_372 <= 0;
      _tmp_373 <= 0;
      _tmp_374 <= 0;
      _tmp_375 <= 0;
      _tmp_376 <= 0;
      _tmp_377 <= 0;
      _tmp_378 <= 0;
      _tmp_379 <= 0;
      _tmp_380 <= 0;
      _tmp_381 <= 0;
      _tmp_382 <= 0;
      _tmp_383 <= 0;
      _tmp_384 <= 0;
      _tmp_385 <= 0;
      _tmp_386 <= 0;
      _tmp_387 <= 0;
      _tmp_388 <= 0;
      _tmp_389 <= 0;
      _tmp_390 <= 0;
      _tmp_391 <= 0;
      _tmp_392 <= 0;
      _tmp_393 <= 0;
      _tmp_394 <= 0;
      _tmp_395 <= 0;
      _tmp_396 <= 0;
      _tmp_397 <= 0;
      _tmp_398 <= 0;
      _tmp_399 <= 0;
      _tmp_400 <= 0;
      _tmp_401 <= 0;
      _tmp_402 <= 0;
      _tmp_403 <= 0;
      _mul_6_busy_reg <= 0;
    end else begin
      if(_mul_6_stream_oready) begin
        _mul_6_x_source_ram_renable <= 0;
        _mul_6_x_source_fifo_deq <= 0;
      end 
      _mul_6_x_idle <= _mul_6_x_idle;
      if(_mul_6_stream_oready) begin
        _mul_6_y_source_ram_renable <= 0;
        _mul_6_y_source_fifo_deq <= 0;
      end 
      _mul_6_y_idle <= _mul_6_y_idle;
      if(_mul_6_stream_oready) begin
        _mul_6_rshift_source_ram_renable <= 0;
        _mul_6_rshift_source_fifo_deq <= 0;
      end 
      _mul_6_rshift_idle <= _mul_6_rshift_idle;
      if(_mul_6_stream_oready) begin
        _mul_6_z_sink_wenable <= 0;
        _mul_6_z_sink_fifo_enq <= 0;
      end 
      if(_mul_6_stream_oready) begin
        __mul_6_stream_ivalid_1 <= _mul_6_stream_ivalid;
      end 
      if(_mul_6_stream_oready) begin
        __mul_6_stream_ivalid_2 <= __mul_6_stream_ivalid_1;
      end 
      if(_mul_6_stream_oready) begin
        __mul_6_stream_ivalid_3 <= __mul_6_stream_ivalid_2;
      end 
      if(_mul_6_stream_oready) begin
        __mul_6_stream_ivalid_4 <= __mul_6_stream_ivalid_3;
      end 
      if(_mul_6_stream_oready) begin
        __mul_6_stream_ivalid_5 <= __mul_6_stream_ivalid_4;
      end 
      if(_mul_6_stream_oready) begin
        __mul_6_stream_ivalid_6 <= __mul_6_stream_ivalid_5;
      end 
      if(_mul_6_stream_oready) begin
        __mul_6_stream_ivalid_7 <= __mul_6_stream_ivalid_6;
      end 
      if(_mul_6_stream_oready) begin
        __mul_6_stream_ivalid_8 <= __mul_6_stream_ivalid_7;
      end 
      if(_mul_6_stream_oready) begin
        _greaterthan_data_123 <= mul_6_rshift_data > 1'sd0;
      end 
      if(_mul_6_stream_oready) begin
        _minus_data_125 <= mul_6_rshift_data - 2'sd1;
      end 
      if(_mul_6_stream_oready) begin
        _greatereq_data_136 <= mul_6_x_data >= 1'sd0;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_345__variable_120 <= mul_6_x_data;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_348__variable_121 <= mul_6_y_data;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_351__variable_122 <= mul_6_rshift_data;
      end 
      if(_mul_6_stream_oready) begin
        _sll_data_127 <= 2'sd1 << _minus_data_125;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_342_greaterthan_123 <= _greaterthan_data_123;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_343_greatereq_136 <= _greatereq_data_136;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_346__delay_345__variable_120 <= __delay_data_345__variable_120;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_349__delay_348__variable_121 <= __delay_data_348__variable_121;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_352__delay_351__variable_122 <= __delay_data_351__variable_122;
      end 
      if(_mul_6_stream_oready) begin
        _cond_data_133 <= (__delay_data_342_greaterthan_123)? _sll_data_127 : 1'sd0;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_344__delay_343_greatereq_136 <= __delay_data_343_greatereq_136;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_347__delay_346__delay_345__variable_120 <= __delay_data_346__delay_345__variable_120;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_350__delay_349__delay_348__variable_121 <= __delay_data_349__delay_348__variable_121;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_353__delay_352__delay_351__variable_122 <= __delay_data_352__delay_351__variable_122;
      end 
      if(_mul_6_stream_oready) begin
        __muladd_madd_odata_reg_139 <= __muladd_madd_odata_139;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_354__delay_353__delay_352____variable_122 <= __delay_data_353__delay_352__delay_351__variable_122;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_355__delay_354__delay_353____variable_122 <= __delay_data_354__delay_353__delay_352____variable_122;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_356__delay_355__delay_354____variable_122 <= __delay_data_355__delay_354__delay_353____variable_122;
      end 
      if(_mul_6_stream_oready) begin
        __delay_data_357__delay_356__delay_355____variable_122 <= __delay_data_356__delay_355__delay_354____variable_122;
      end 
      if(_mul_6_stream_oready) begin
        _sra_data_140 <= __muladd_data_139 >>> __delay_data_357__delay_356__delay_355____variable_122;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_120 <= _cond_data_340;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_121 <= _cond_data_322;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_122 <= __delay_data_528__delay_527_plus_358;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_370 <= _mul_6_source_start;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_371 <= _tmp_370;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_372 <= _tmp_371;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_373 <= _mul_6_source_start;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_374 <= _tmp_373;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_375 <= _tmp_374;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_376 <= _tmp_375;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_377 <= _tmp_376;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_378 <= _tmp_377;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_379 <= _tmp_378;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_380 <= _tmp_379;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_381 <= _tmp_380;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_382 <= _tmp_381;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_383 <= _mul_6_source_stop;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_384 <= _tmp_383;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_385 <= _tmp_384;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_386 <= _tmp_385;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_387 <= _tmp_386;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_388 <= _tmp_387;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_389 <= _tmp_388;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_390 <= _tmp_389;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_391 <= _tmp_390;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_392 <= _tmp_391;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_393 <= _mul_6_source_busy;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_394 <= _tmp_393;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_395 <= _tmp_394;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_396 <= _tmp_395;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_397 <= _tmp_396;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_398 <= _tmp_397;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_399 <= _tmp_398;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_400 <= _tmp_399;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_401 <= _tmp_400;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_402 <= _tmp_401;
      end 
      if(_mul_6_stream_oready) begin
        _tmp_403 <= _mul_6_sink_busy;
      end 
      if(!_mul_6_sink_busy && _tmp_403) begin
        _mul_6_busy_reg <= 0;
      end 
      if(_mul_6_source_busy) begin
        _mul_6_busy_reg <= 1;
      end 
    end
  end

  localparam _mul_6_fsm_1 = 1;
  localparam _mul_6_fsm_2 = 2;
  localparam _mul_6_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _mul_6_fsm <= _mul_6_fsm_init;
      _mul_6_source_start <= 0;
      _mul_6_source_busy <= 0;
      _mul_6_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        _mul_6_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _mul_6_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_mul_6_stream_oready && _tmp_372) begin
        _mul_6_stream_ivalid <= 1;
      end 
      if(_mul_6_stream_oready && 1'd0) begin
        _mul_6_stream_ivalid <= 0;
      end 
      case(_mul_6_fsm)
        _mul_6_fsm_init: begin
          if(_mul_6_run_flag) begin
            _mul_6_source_start <= 1;
          end 
          if(_mul_6_run_flag) begin
            _mul_6_fsm <= _mul_6_fsm_1;
          end 
        end
        _mul_6_fsm_1: begin
          if(_mul_6_source_start && _mul_6_stream_oready) begin
            _mul_6_source_start <= 0;
            _mul_6_source_busy <= 1;
          end 
          if(_mul_6_source_start && _mul_6_stream_oready) begin
            _mul_6_fsm <= _mul_6_fsm_2;
          end 
        end
        _mul_6_fsm_2: begin
          if(_mul_6_stream_oready) begin
            _mul_6_fsm <= _mul_6_fsm_3;
          end 
        end
        _mul_6_fsm_3: begin
          if(_mul_6_stream_oready && 1'd0) begin
            _mul_6_source_busy <= 0;
          end 
          if(_mul_6_stream_oready && 1'd0 && _mul_6_run_flag) begin
            _mul_6_source_start <= 1;
          end 
          if(_mul_6_stream_oready && 1'd0) begin
            _mul_6_fsm <= _mul_6_fsm_init;
          end 
          if(_mul_6_stream_oready && 1'd0 && _mul_6_run_flag) begin
            _mul_6_fsm <= _mul_6_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _mul_7_x_source_ram_renable <= 0;
      _mul_7_x_source_fifo_deq <= 0;
      _mul_7_x_idle <= 1;
      _mul_7_y_source_ram_renable <= 0;
      _mul_7_y_source_fifo_deq <= 0;
      _mul_7_y_idle <= 1;
      _mul_7_rshift_source_ram_renable <= 0;
      _mul_7_rshift_source_fifo_deq <= 0;
      _mul_7_rshift_idle <= 1;
      _mul_7_z_sink_wenable <= 0;
      _mul_7_z_sink_fifo_enq <= 0;
      __mul_7_stream_ivalid_1 <= 0;
      __mul_7_stream_ivalid_2 <= 0;
      __mul_7_stream_ivalid_3 <= 0;
      __mul_7_stream_ivalid_4 <= 0;
      __mul_7_stream_ivalid_5 <= 0;
      __mul_7_stream_ivalid_6 <= 0;
      __mul_7_stream_ivalid_7 <= 0;
      __mul_7_stream_ivalid_8 <= 0;
      _greaterthan_data_144 <= 0;
      _minus_data_146 <= 0;
      _greatereq_data_157 <= 0;
      __delay_data_366__variable_141 <= 0;
      __delay_data_369__variable_142 <= 0;
      __delay_data_372__variable_143 <= 0;
      _sll_data_148 <= 0;
      __delay_data_363_greaterthan_144 <= 0;
      __delay_data_364_greatereq_157 <= 0;
      __delay_data_367__delay_366__variable_141 <= 0;
      __delay_data_370__delay_369__variable_142 <= 0;
      __delay_data_373__delay_372__variable_143 <= 0;
      _cond_data_154 <= 0;
      __delay_data_365__delay_364_greatereq_157 <= 0;
      __delay_data_368__delay_367__delay_366__variable_141 <= 0;
      __delay_data_371__delay_370__delay_369__variable_142 <= 0;
      __delay_data_374__delay_373__delay_372__variable_143 <= 0;
      __muladd_madd_odata_reg_160 <= 0;
      __delay_data_375__delay_374__delay_373____variable_143 <= 0;
      __delay_data_376__delay_375__delay_374____variable_143 <= 0;
      __delay_data_377__delay_376__delay_375____variable_143 <= 0;
      __delay_data_378__delay_377__delay_376____variable_143 <= 0;
      _sra_data_161 <= 0;
      __variable_wdata_141 <= 0;
      __variable_wdata_142 <= 0;
      __variable_wdata_143 <= 0;
      _tmp_404 <= 0;
      _tmp_405 <= 0;
      _tmp_406 <= 0;
      _tmp_407 <= 0;
      _tmp_408 <= 0;
      _tmp_409 <= 0;
      _tmp_410 <= 0;
      _tmp_411 <= 0;
      _tmp_412 <= 0;
      _tmp_413 <= 0;
      _tmp_414 <= 0;
      _tmp_415 <= 0;
      _tmp_416 <= 0;
      _tmp_417 <= 0;
      _tmp_418 <= 0;
      _tmp_419 <= 0;
      _tmp_420 <= 0;
      _tmp_421 <= 0;
      _tmp_422 <= 0;
      _tmp_423 <= 0;
      _tmp_424 <= 0;
      _tmp_425 <= 0;
      _tmp_426 <= 0;
      _tmp_427 <= 0;
      _tmp_428 <= 0;
      _tmp_429 <= 0;
      _tmp_430 <= 0;
      _tmp_431 <= 0;
      _tmp_432 <= 0;
      _tmp_433 <= 0;
      _tmp_434 <= 0;
      _tmp_435 <= 0;
      _tmp_436 <= 0;
      _tmp_437 <= 0;
      _mul_7_busy_reg <= 0;
    end else begin
      if(_mul_7_stream_oready) begin
        _mul_7_x_source_ram_renable <= 0;
        _mul_7_x_source_fifo_deq <= 0;
      end 
      _mul_7_x_idle <= _mul_7_x_idle;
      if(_mul_7_stream_oready) begin
        _mul_7_y_source_ram_renable <= 0;
        _mul_7_y_source_fifo_deq <= 0;
      end 
      _mul_7_y_idle <= _mul_7_y_idle;
      if(_mul_7_stream_oready) begin
        _mul_7_rshift_source_ram_renable <= 0;
        _mul_7_rshift_source_fifo_deq <= 0;
      end 
      _mul_7_rshift_idle <= _mul_7_rshift_idle;
      if(_mul_7_stream_oready) begin
        _mul_7_z_sink_wenable <= 0;
        _mul_7_z_sink_fifo_enq <= 0;
      end 
      if(_mul_7_stream_oready) begin
        __mul_7_stream_ivalid_1 <= _mul_7_stream_ivalid;
      end 
      if(_mul_7_stream_oready) begin
        __mul_7_stream_ivalid_2 <= __mul_7_stream_ivalid_1;
      end 
      if(_mul_7_stream_oready) begin
        __mul_7_stream_ivalid_3 <= __mul_7_stream_ivalid_2;
      end 
      if(_mul_7_stream_oready) begin
        __mul_7_stream_ivalid_4 <= __mul_7_stream_ivalid_3;
      end 
      if(_mul_7_stream_oready) begin
        __mul_7_stream_ivalid_5 <= __mul_7_stream_ivalid_4;
      end 
      if(_mul_7_stream_oready) begin
        __mul_7_stream_ivalid_6 <= __mul_7_stream_ivalid_5;
      end 
      if(_mul_7_stream_oready) begin
        __mul_7_stream_ivalid_7 <= __mul_7_stream_ivalid_6;
      end 
      if(_mul_7_stream_oready) begin
        __mul_7_stream_ivalid_8 <= __mul_7_stream_ivalid_7;
      end 
      if(_mul_7_stream_oready) begin
        _greaterthan_data_144 <= mul_7_rshift_data > 1'sd0;
      end 
      if(_mul_7_stream_oready) begin
        _minus_data_146 <= mul_7_rshift_data - 2'sd1;
      end 
      if(_mul_7_stream_oready) begin
        _greatereq_data_157 <= mul_7_x_data >= 1'sd0;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_366__variable_141 <= mul_7_x_data;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_369__variable_142 <= mul_7_y_data;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_372__variable_143 <= mul_7_rshift_data;
      end 
      if(_mul_7_stream_oready) begin
        _sll_data_148 <= 2'sd1 << _minus_data_146;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_363_greaterthan_144 <= _greaterthan_data_144;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_364_greatereq_157 <= _greatereq_data_157;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_367__delay_366__variable_141 <= __delay_data_366__variable_141;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_370__delay_369__variable_142 <= __delay_data_369__variable_142;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_373__delay_372__variable_143 <= __delay_data_372__variable_143;
      end 
      if(_mul_7_stream_oready) begin
        _cond_data_154 <= (__delay_data_363_greaterthan_144)? _sll_data_148 : 1'sd0;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_365__delay_364_greatereq_157 <= __delay_data_364_greatereq_157;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_368__delay_367__delay_366__variable_141 <= __delay_data_367__delay_366__variable_141;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_371__delay_370__delay_369__variable_142 <= __delay_data_370__delay_369__variable_142;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_374__delay_373__delay_372__variable_143 <= __delay_data_373__delay_372__variable_143;
      end 
      if(_mul_7_stream_oready) begin
        __muladd_madd_odata_reg_160 <= __muladd_madd_odata_160;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_375__delay_374__delay_373____variable_143 <= __delay_data_374__delay_373__delay_372__variable_143;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_376__delay_375__delay_374____variable_143 <= __delay_data_375__delay_374__delay_373____variable_143;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_377__delay_376__delay_375____variable_143 <= __delay_data_376__delay_375__delay_374____variable_143;
      end 
      if(_mul_7_stream_oready) begin
        __delay_data_378__delay_377__delay_376____variable_143 <= __delay_data_377__delay_376__delay_375____variable_143;
      end 
      if(_mul_7_stream_oready) begin
        _sra_data_161 <= __muladd_data_160 >>> __delay_data_378__delay_377__delay_376____variable_143;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_141 <= _cond_data_361;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_142 <= _cond_data_324;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_143 <= __delay_data_537__delay_536_plus_379;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_404 <= _mul_7_source_start;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_405 <= _tmp_404;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_406 <= _tmp_405;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_407 <= _mul_7_source_start;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_408 <= _tmp_407;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_409 <= _tmp_408;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_410 <= _tmp_409;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_411 <= _tmp_410;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_412 <= _tmp_411;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_413 <= _tmp_412;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_414 <= _tmp_413;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_415 <= _tmp_414;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_416 <= _tmp_415;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_417 <= _mul_7_source_stop;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_418 <= _tmp_417;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_419 <= _tmp_418;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_420 <= _tmp_419;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_421 <= _tmp_420;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_422 <= _tmp_421;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_423 <= _tmp_422;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_424 <= _tmp_423;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_425 <= _tmp_424;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_426 <= _tmp_425;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_427 <= _mul_7_source_busy;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_428 <= _tmp_427;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_429 <= _tmp_428;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_430 <= _tmp_429;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_431 <= _tmp_430;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_432 <= _tmp_431;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_433 <= _tmp_432;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_434 <= _tmp_433;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_435 <= _tmp_434;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_436 <= _tmp_435;
      end 
      if(_mul_7_stream_oready) begin
        _tmp_437 <= _mul_7_sink_busy;
      end 
      if(!_mul_7_sink_busy && _tmp_437) begin
        _mul_7_busy_reg <= 0;
      end 
      if(_mul_7_source_busy) begin
        _mul_7_busy_reg <= 1;
      end 
    end
  end

  localparam _mul_7_fsm_1 = 1;
  localparam _mul_7_fsm_2 = 2;
  localparam _mul_7_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _mul_7_fsm <= _mul_7_fsm_init;
      _mul_7_source_start <= 0;
      _mul_7_source_busy <= 0;
      _mul_7_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        _mul_7_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _mul_7_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_mul_7_stream_oready && _tmp_406) begin
        _mul_7_stream_ivalid <= 1;
      end 
      if(_mul_7_stream_oready && 1'd0) begin
        _mul_7_stream_ivalid <= 0;
      end 
      case(_mul_7_fsm)
        _mul_7_fsm_init: begin
          if(_mul_7_run_flag) begin
            _mul_7_source_start <= 1;
          end 
          if(_mul_7_run_flag) begin
            _mul_7_fsm <= _mul_7_fsm_1;
          end 
        end
        _mul_7_fsm_1: begin
          if(_mul_7_source_start && _mul_7_stream_oready) begin
            _mul_7_source_start <= 0;
            _mul_7_source_busy <= 1;
          end 
          if(_mul_7_source_start && _mul_7_stream_oready) begin
            _mul_7_fsm <= _mul_7_fsm_2;
          end 
        end
        _mul_7_fsm_2: begin
          if(_mul_7_stream_oready) begin
            _mul_7_fsm <= _mul_7_fsm_3;
          end 
        end
        _mul_7_fsm_3: begin
          if(_mul_7_stream_oready && 1'd0) begin
            _mul_7_source_busy <= 0;
          end 
          if(_mul_7_stream_oready && 1'd0 && _mul_7_run_flag) begin
            _mul_7_source_start <= 1;
          end 
          if(_mul_7_stream_oready && 1'd0) begin
            _mul_7_fsm <= _mul_7_fsm_init;
          end 
          if(_mul_7_stream_oready && 1'd0 && _mul_7_run_flag) begin
            _mul_7_fsm <= _mul_7_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _mul_8_x_source_ram_renable <= 0;
      _mul_8_x_source_fifo_deq <= 0;
      _mul_8_x_idle <= 1;
      _mul_8_y_source_ram_renable <= 0;
      _mul_8_y_source_fifo_deq <= 0;
      _mul_8_y_idle <= 1;
      _mul_8_rshift_source_ram_renable <= 0;
      _mul_8_rshift_source_fifo_deq <= 0;
      _mul_8_rshift_idle <= 1;
      _mul_8_z_sink_wenable <= 0;
      _mul_8_z_sink_fifo_enq <= 0;
      __mul_8_stream_ivalid_1 <= 0;
      __mul_8_stream_ivalid_2 <= 0;
      __mul_8_stream_ivalid_3 <= 0;
      __mul_8_stream_ivalid_4 <= 0;
      __mul_8_stream_ivalid_5 <= 0;
      __mul_8_stream_ivalid_6 <= 0;
      __mul_8_stream_ivalid_7 <= 0;
      __mul_8_stream_ivalid_8 <= 0;
      _greaterthan_data_165 <= 0;
      _minus_data_167 <= 0;
      _greatereq_data_178 <= 0;
      __delay_data_433__variable_162 <= 0;
      __delay_data_436__variable_163 <= 0;
      __delay_data_439__variable_164 <= 0;
      _sll_data_169 <= 0;
      __delay_data_430_greaterthan_165 <= 0;
      __delay_data_431_greatereq_178 <= 0;
      __delay_data_434__delay_433__variable_162 <= 0;
      __delay_data_437__delay_436__variable_163 <= 0;
      __delay_data_440__delay_439__variable_164 <= 0;
      _cond_data_175 <= 0;
      __delay_data_432__delay_431_greatereq_178 <= 0;
      __delay_data_435__delay_434__delay_433__variable_162 <= 0;
      __delay_data_438__delay_437__delay_436__variable_163 <= 0;
      __delay_data_441__delay_440__delay_439__variable_164 <= 0;
      __muladd_madd_odata_reg_181 <= 0;
      __delay_data_442__delay_441__delay_440____variable_164 <= 0;
      __delay_data_443__delay_442__delay_441____variable_164 <= 0;
      __delay_data_444__delay_443__delay_442____variable_164 <= 0;
      __delay_data_445__delay_444__delay_443____variable_164 <= 0;
      _sra_data_182 <= 0;
      __variable_wdata_162 <= 0;
      __variable_wdata_163 <= 0;
      __variable_wdata_164 <= 0;
      _tmp_517 <= 0;
      _tmp_518 <= 0;
      _tmp_519 <= 0;
      _tmp_520 <= 0;
      _tmp_521 <= 0;
      _tmp_522 <= 0;
      _tmp_523 <= 0;
      _tmp_524 <= 0;
      _tmp_525 <= 0;
      _tmp_526 <= 0;
      _tmp_527 <= 0;
      _tmp_528 <= 0;
      _tmp_529 <= 0;
      _tmp_530 <= 0;
      _tmp_531 <= 0;
      _tmp_532 <= 0;
      _tmp_533 <= 0;
      _tmp_534 <= 0;
      _tmp_535 <= 0;
      _tmp_536 <= 0;
      _tmp_537 <= 0;
      _tmp_538 <= 0;
      _tmp_539 <= 0;
      _tmp_540 <= 0;
      _tmp_541 <= 0;
      _tmp_542 <= 0;
      _tmp_543 <= 0;
      _tmp_544 <= 0;
      _tmp_545 <= 0;
      _tmp_546 <= 0;
      _tmp_547 <= 0;
      _tmp_548 <= 0;
      _tmp_549 <= 0;
      _tmp_550 <= 0;
      _mul_8_busy_reg <= 0;
    end else begin
      if(_mul_8_stream_oready) begin
        _mul_8_x_source_ram_renable <= 0;
        _mul_8_x_source_fifo_deq <= 0;
      end 
      _mul_8_x_idle <= _mul_8_x_idle;
      if(_mul_8_stream_oready) begin
        _mul_8_y_source_ram_renable <= 0;
        _mul_8_y_source_fifo_deq <= 0;
      end 
      _mul_8_y_idle <= _mul_8_y_idle;
      if(_mul_8_stream_oready) begin
        _mul_8_rshift_source_ram_renable <= 0;
        _mul_8_rshift_source_fifo_deq <= 0;
      end 
      _mul_8_rshift_idle <= _mul_8_rshift_idle;
      if(_mul_8_stream_oready) begin
        _mul_8_z_sink_wenable <= 0;
        _mul_8_z_sink_fifo_enq <= 0;
      end 
      if(_mul_8_stream_oready) begin
        __mul_8_stream_ivalid_1 <= _mul_8_stream_ivalid;
      end 
      if(_mul_8_stream_oready) begin
        __mul_8_stream_ivalid_2 <= __mul_8_stream_ivalid_1;
      end 
      if(_mul_8_stream_oready) begin
        __mul_8_stream_ivalid_3 <= __mul_8_stream_ivalid_2;
      end 
      if(_mul_8_stream_oready) begin
        __mul_8_stream_ivalid_4 <= __mul_8_stream_ivalid_3;
      end 
      if(_mul_8_stream_oready) begin
        __mul_8_stream_ivalid_5 <= __mul_8_stream_ivalid_4;
      end 
      if(_mul_8_stream_oready) begin
        __mul_8_stream_ivalid_6 <= __mul_8_stream_ivalid_5;
      end 
      if(_mul_8_stream_oready) begin
        __mul_8_stream_ivalid_7 <= __mul_8_stream_ivalid_6;
      end 
      if(_mul_8_stream_oready) begin
        __mul_8_stream_ivalid_8 <= __mul_8_stream_ivalid_7;
      end 
      if(_mul_8_stream_oready) begin
        _greaterthan_data_165 <= mul_8_rshift_data > 1'sd0;
      end 
      if(_mul_8_stream_oready) begin
        _minus_data_167 <= mul_8_rshift_data - 2'sd1;
      end 
      if(_mul_8_stream_oready) begin
        _greatereq_data_178 <= mul_8_x_data >= 1'sd0;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_433__variable_162 <= mul_8_x_data;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_436__variable_163 <= mul_8_y_data;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_439__variable_164 <= mul_8_rshift_data;
      end 
      if(_mul_8_stream_oready) begin
        _sll_data_169 <= 2'sd1 << _minus_data_167;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_430_greaterthan_165 <= _greaterthan_data_165;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_431_greatereq_178 <= _greatereq_data_178;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_434__delay_433__variable_162 <= __delay_data_433__variable_162;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_437__delay_436__variable_163 <= __delay_data_436__variable_163;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_440__delay_439__variable_164 <= __delay_data_439__variable_164;
      end 
      if(_mul_8_stream_oready) begin
        _cond_data_175 <= (__delay_data_430_greaterthan_165)? _sll_data_169 : 1'sd0;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_432__delay_431_greatereq_178 <= __delay_data_431_greatereq_178;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_435__delay_434__delay_433__variable_162 <= __delay_data_434__delay_433__variable_162;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_438__delay_437__delay_436__variable_163 <= __delay_data_437__delay_436__variable_163;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_441__delay_440__delay_439__variable_164 <= __delay_data_440__delay_439__variable_164;
      end 
      if(_mul_8_stream_oready) begin
        __muladd_madd_odata_reg_181 <= __muladd_madd_odata_181;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_442__delay_441__delay_440____variable_164 <= __delay_data_441__delay_440__delay_439__variable_164;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_443__delay_442__delay_441____variable_164 <= __delay_data_442__delay_441__delay_440____variable_164;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_444__delay_443__delay_442____variable_164 <= __delay_data_443__delay_442__delay_441____variable_164;
      end 
      if(_mul_8_stream_oready) begin
        __delay_data_445__delay_444__delay_443____variable_164 <= __delay_data_444__delay_443__delay_442____variable_164;
      end 
      if(_mul_8_stream_oready) begin
        _sra_data_182 <= __muladd_data_181 >>> __delay_data_445__delay_444__delay_443____variable_164;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_162 <= _cond_data_428;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_163 <= _cond_data_334;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_164 <= __delay_data_583__delay_582_plus_446;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_517 <= _mul_8_source_start;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_518 <= _tmp_517;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_519 <= _tmp_518;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_520 <= _mul_8_source_start;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_521 <= _tmp_520;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_522 <= _tmp_521;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_523 <= _tmp_522;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_524 <= _tmp_523;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_525 <= _tmp_524;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_526 <= _tmp_525;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_527 <= _tmp_526;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_528 <= _tmp_527;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_529 <= _tmp_528;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_530 <= _mul_8_source_stop;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_531 <= _tmp_530;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_532 <= _tmp_531;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_533 <= _tmp_532;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_534 <= _tmp_533;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_535 <= _tmp_534;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_536 <= _tmp_535;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_537 <= _tmp_536;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_538 <= _tmp_537;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_539 <= _tmp_538;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_540 <= _mul_8_source_busy;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_541 <= _tmp_540;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_542 <= _tmp_541;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_543 <= _tmp_542;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_544 <= _tmp_543;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_545 <= _tmp_544;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_546 <= _tmp_545;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_547 <= _tmp_546;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_548 <= _tmp_547;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_549 <= _tmp_548;
      end 
      if(_mul_8_stream_oready) begin
        _tmp_550 <= _mul_8_sink_busy;
      end 
      if(!_mul_8_sink_busy && _tmp_550) begin
        _mul_8_busy_reg <= 0;
      end 
      if(_mul_8_source_busy) begin
        _mul_8_busy_reg <= 1;
      end 
    end
  end

  localparam _mul_8_fsm_1 = 1;
  localparam _mul_8_fsm_2 = 2;
  localparam _mul_8_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _mul_8_fsm <= _mul_8_fsm_init;
      _mul_8_source_start <= 0;
      _mul_8_source_busy <= 0;
      _mul_8_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        _mul_8_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _mul_8_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_mul_8_stream_oready && _tmp_519) begin
        _mul_8_stream_ivalid <= 1;
      end 
      if(_mul_8_stream_oready && 1'd0) begin
        _mul_8_stream_ivalid <= 0;
      end 
      case(_mul_8_fsm)
        _mul_8_fsm_init: begin
          if(_mul_8_run_flag) begin
            _mul_8_source_start <= 1;
          end 
          if(_mul_8_run_flag) begin
            _mul_8_fsm <= _mul_8_fsm_1;
          end 
        end
        _mul_8_fsm_1: begin
          if(_mul_8_source_start && _mul_8_stream_oready) begin
            _mul_8_source_start <= 0;
            _mul_8_source_busy <= 1;
          end 
          if(_mul_8_source_start && _mul_8_stream_oready) begin
            _mul_8_fsm <= _mul_8_fsm_2;
          end 
        end
        _mul_8_fsm_2: begin
          if(_mul_8_stream_oready) begin
            _mul_8_fsm <= _mul_8_fsm_3;
          end 
        end
        _mul_8_fsm_3: begin
          if(_mul_8_stream_oready && 1'd0) begin
            _mul_8_source_busy <= 0;
          end 
          if(_mul_8_stream_oready && 1'd0 && _mul_8_run_flag) begin
            _mul_8_source_start <= 1;
          end 
          if(_mul_8_stream_oready && 1'd0) begin
            _mul_8_fsm <= _mul_8_fsm_init;
          end 
          if(_mul_8_stream_oready && 1'd0 && _mul_8_run_flag) begin
            _mul_8_fsm <= _mul_8_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _mul_9_x_source_ram_renable <= 0;
      _mul_9_x_source_fifo_deq <= 0;
      _mul_9_x_idle <= 1;
      _mul_9_y_source_ram_renable <= 0;
      _mul_9_y_source_fifo_deq <= 0;
      _mul_9_y_idle <= 1;
      _mul_9_rshift_source_ram_renable <= 0;
      _mul_9_rshift_source_fifo_deq <= 0;
      _mul_9_rshift_idle <= 1;
      _mul_9_z_sink_wenable <= 0;
      _mul_9_z_sink_fifo_enq <= 0;
      __mul_9_stream_ivalid_1 <= 0;
      __mul_9_stream_ivalid_2 <= 0;
      __mul_9_stream_ivalid_3 <= 0;
      __mul_9_stream_ivalid_4 <= 0;
      __mul_9_stream_ivalid_5 <= 0;
      __mul_9_stream_ivalid_6 <= 0;
      __mul_9_stream_ivalid_7 <= 0;
      __mul_9_stream_ivalid_8 <= 0;
      _greaterthan_data_186 <= 0;
      _minus_data_188 <= 0;
      _greatereq_data_199 <= 0;
      __delay_data_454__variable_183 <= 0;
      __delay_data_457__variable_184 <= 0;
      __delay_data_460__variable_185 <= 0;
      _sll_data_190 <= 0;
      __delay_data_451_greaterthan_186 <= 0;
      __delay_data_452_greatereq_199 <= 0;
      __delay_data_455__delay_454__variable_183 <= 0;
      __delay_data_458__delay_457__variable_184 <= 0;
      __delay_data_461__delay_460__variable_185 <= 0;
      _cond_data_196 <= 0;
      __delay_data_453__delay_452_greatereq_199 <= 0;
      __delay_data_456__delay_455__delay_454__variable_183 <= 0;
      __delay_data_459__delay_458__delay_457__variable_184 <= 0;
      __delay_data_462__delay_461__delay_460__variable_185 <= 0;
      __muladd_madd_odata_reg_202 <= 0;
      __delay_data_463__delay_462__delay_461____variable_185 <= 0;
      __delay_data_464__delay_463__delay_462____variable_185 <= 0;
      __delay_data_465__delay_464__delay_463____variable_185 <= 0;
      __delay_data_466__delay_465__delay_464____variable_185 <= 0;
      _sra_data_203 <= 0;
      __variable_wdata_183 <= 0;
      __variable_wdata_184 <= 0;
      __variable_wdata_185 <= 0;
      _tmp_551 <= 0;
      _tmp_552 <= 0;
      _tmp_553 <= 0;
      _tmp_554 <= 0;
      _tmp_555 <= 0;
      _tmp_556 <= 0;
      _tmp_557 <= 0;
      _tmp_558 <= 0;
      _tmp_559 <= 0;
      _tmp_560 <= 0;
      _tmp_561 <= 0;
      _tmp_562 <= 0;
      _tmp_563 <= 0;
      _tmp_564 <= 0;
      _tmp_565 <= 0;
      _tmp_566 <= 0;
      _tmp_567 <= 0;
      _tmp_568 <= 0;
      _tmp_569 <= 0;
      _tmp_570 <= 0;
      _tmp_571 <= 0;
      _tmp_572 <= 0;
      _tmp_573 <= 0;
      _tmp_574 <= 0;
      _tmp_575 <= 0;
      _tmp_576 <= 0;
      _tmp_577 <= 0;
      _tmp_578 <= 0;
      _tmp_579 <= 0;
      _tmp_580 <= 0;
      _tmp_581 <= 0;
      _tmp_582 <= 0;
      _tmp_583 <= 0;
      _tmp_584 <= 0;
      _mul_9_busy_reg <= 0;
    end else begin
      if(_mul_9_stream_oready) begin
        _mul_9_x_source_ram_renable <= 0;
        _mul_9_x_source_fifo_deq <= 0;
      end 
      _mul_9_x_idle <= _mul_9_x_idle;
      if(_mul_9_stream_oready) begin
        _mul_9_y_source_ram_renable <= 0;
        _mul_9_y_source_fifo_deq <= 0;
      end 
      _mul_9_y_idle <= _mul_9_y_idle;
      if(_mul_9_stream_oready) begin
        _mul_9_rshift_source_ram_renable <= 0;
        _mul_9_rshift_source_fifo_deq <= 0;
      end 
      _mul_9_rshift_idle <= _mul_9_rshift_idle;
      if(_mul_9_stream_oready) begin
        _mul_9_z_sink_wenable <= 0;
        _mul_9_z_sink_fifo_enq <= 0;
      end 
      if(_mul_9_stream_oready) begin
        __mul_9_stream_ivalid_1 <= _mul_9_stream_ivalid;
      end 
      if(_mul_9_stream_oready) begin
        __mul_9_stream_ivalid_2 <= __mul_9_stream_ivalid_1;
      end 
      if(_mul_9_stream_oready) begin
        __mul_9_stream_ivalid_3 <= __mul_9_stream_ivalid_2;
      end 
      if(_mul_9_stream_oready) begin
        __mul_9_stream_ivalid_4 <= __mul_9_stream_ivalid_3;
      end 
      if(_mul_9_stream_oready) begin
        __mul_9_stream_ivalid_5 <= __mul_9_stream_ivalid_4;
      end 
      if(_mul_9_stream_oready) begin
        __mul_9_stream_ivalid_6 <= __mul_9_stream_ivalid_5;
      end 
      if(_mul_9_stream_oready) begin
        __mul_9_stream_ivalid_7 <= __mul_9_stream_ivalid_6;
      end 
      if(_mul_9_stream_oready) begin
        __mul_9_stream_ivalid_8 <= __mul_9_stream_ivalid_7;
      end 
      if(_mul_9_stream_oready) begin
        _greaterthan_data_186 <= mul_9_rshift_data > 1'sd0;
      end 
      if(_mul_9_stream_oready) begin
        _minus_data_188 <= mul_9_rshift_data - 2'sd1;
      end 
      if(_mul_9_stream_oready) begin
        _greatereq_data_199 <= mul_9_x_data >= 1'sd0;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_454__variable_183 <= mul_9_x_data;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_457__variable_184 <= mul_9_y_data;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_460__variable_185 <= mul_9_rshift_data;
      end 
      if(_mul_9_stream_oready) begin
        _sll_data_190 <= 2'sd1 << _minus_data_188;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_451_greaterthan_186 <= _greaterthan_data_186;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_452_greatereq_199 <= _greatereq_data_199;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_455__delay_454__variable_183 <= __delay_data_454__variable_183;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_458__delay_457__variable_184 <= __delay_data_457__variable_184;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_461__delay_460__variable_185 <= __delay_data_460__variable_185;
      end 
      if(_mul_9_stream_oready) begin
        _cond_data_196 <= (__delay_data_451_greaterthan_186)? _sll_data_190 : 1'sd0;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_453__delay_452_greatereq_199 <= __delay_data_452_greatereq_199;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_456__delay_455__delay_454__variable_183 <= __delay_data_455__delay_454__variable_183;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_459__delay_458__delay_457__variable_184 <= __delay_data_458__delay_457__variable_184;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_462__delay_461__delay_460__variable_185 <= __delay_data_461__delay_460__variable_185;
      end 
      if(_mul_9_stream_oready) begin
        __muladd_madd_odata_reg_202 <= __muladd_madd_odata_202;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_463__delay_462__delay_461____variable_185 <= __delay_data_462__delay_461__delay_460__variable_185;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_464__delay_463__delay_462____variable_185 <= __delay_data_463__delay_462__delay_461____variable_185;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_465__delay_464__delay_463____variable_185 <= __delay_data_464__delay_463__delay_462____variable_185;
      end 
      if(_mul_9_stream_oready) begin
        __delay_data_466__delay_465__delay_464____variable_185 <= __delay_data_465__delay_464__delay_463____variable_185;
      end 
      if(_mul_9_stream_oready) begin
        _sra_data_203 <= __muladd_data_202 >>> __delay_data_466__delay_465__delay_464____variable_185;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_183 <= _cond_data_449;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_184 <= _cond_data_336;
      end 
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        __variable_wdata_185 <= __delay_data_588__delay_587_plus_467;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_551 <= _mul_9_source_start;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_552 <= _tmp_551;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_553 <= _tmp_552;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_554 <= _mul_9_source_start;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_555 <= _tmp_554;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_556 <= _tmp_555;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_557 <= _tmp_556;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_558 <= _tmp_557;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_559 <= _tmp_558;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_560 <= _tmp_559;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_561 <= _tmp_560;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_562 <= _tmp_561;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_563 <= _tmp_562;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_564 <= _mul_9_source_stop;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_565 <= _tmp_564;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_566 <= _tmp_565;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_567 <= _tmp_566;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_568 <= _tmp_567;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_569 <= _tmp_568;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_570 <= _tmp_569;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_571 <= _tmp_570;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_572 <= _tmp_571;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_573 <= _tmp_572;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_574 <= _mul_9_source_busy;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_575 <= _tmp_574;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_576 <= _tmp_575;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_577 <= _tmp_576;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_578 <= _tmp_577;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_579 <= _tmp_578;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_580 <= _tmp_579;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_581 <= _tmp_580;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_582 <= _tmp_581;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_583 <= _tmp_582;
      end 
      if(_mul_9_stream_oready) begin
        _tmp_584 <= _mul_9_sink_busy;
      end 
      if(!_mul_9_sink_busy && _tmp_584) begin
        _mul_9_busy_reg <= 0;
      end 
      if(_mul_9_source_busy) begin
        _mul_9_busy_reg <= 1;
      end 
    end
  end

  localparam _mul_9_fsm_1 = 1;
  localparam _mul_9_fsm_2 = 2;
  localparam _mul_9_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _mul_9_fsm <= _mul_9_fsm_init;
      _mul_9_source_start <= 0;
      _mul_9_source_busy <= 0;
      _mul_9_stream_ivalid <= 0;
    end else begin
      if(__stream_matmul_5_stream_ivalid_3 && _stream_matmul_5_stream_oready) begin
        _mul_9_stream_ivalid <= 1'd1;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_busy) begin
        _mul_9_source_busy <= _stream_matmul_5_source_busy;
      end 
      if(_mul_9_stream_oready && _tmp_553) begin
        _mul_9_stream_ivalid <= 1;
      end 
      if(_mul_9_stream_oready && 1'd0) begin
        _mul_9_stream_ivalid <= 0;
      end 
      case(_mul_9_fsm)
        _mul_9_fsm_init: begin
          if(_mul_9_run_flag) begin
            _mul_9_source_start <= 1;
          end 
          if(_mul_9_run_flag) begin
            _mul_9_fsm <= _mul_9_fsm_1;
          end 
        end
        _mul_9_fsm_1: begin
          if(_mul_9_source_start && _mul_9_stream_oready) begin
            _mul_9_source_start <= 0;
            _mul_9_source_busy <= 1;
          end 
          if(_mul_9_source_start && _mul_9_stream_oready) begin
            _mul_9_fsm <= _mul_9_fsm_2;
          end 
        end
        _mul_9_fsm_2: begin
          if(_mul_9_stream_oready) begin
            _mul_9_fsm <= _mul_9_fsm_3;
          end 
        end
        _mul_9_fsm_3: begin
          if(_mul_9_stream_oready && 1'd0) begin
            _mul_9_source_busy <= 0;
          end 
          if(_mul_9_stream_oready && 1'd0 && _mul_9_run_flag) begin
            _mul_9_source_start <= 1;
          end 
          if(_mul_9_stream_oready && 1'd0) begin
            _mul_9_fsm <= _mul_9_fsm_init;
          end 
          if(_mul_9_stream_oready && 1'd0 && _mul_9_run_flag) begin
            _mul_9_fsm <= _mul_9_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _stream__lazy_reshape_1_source_0_source_ram_renable <= 0;
      _stream__lazy_reshape_1_source_0_source_fifo_deq <= 0;
      _stream__lazy_reshape_1_source_0_idle <= 1;
      _stream__lazy_reshape_1_sink_1_sink_wenable <= 0;
      _stream__lazy_reshape_1_sink_1_sink_fifo_enq <= 0;
      _stream__lazy_reshape_1_source_0_source_mode <= 5'b0;
      _stream__lazy_reshape_1_source_0_source_offset <= 0;
      _stream__lazy_reshape_1_source_0_source_size <= 0;
      _stream__lazy_reshape_1_source_0_source_stride <= 0;
      _stream__lazy_reshape_1_source_0_source_sel <= 0;
      _stream__lazy_reshape_1_source_0_source_offset_buf <= 0;
      _stream__lazy_reshape_1_source_0_source_size_buf <= 0;
      _stream__lazy_reshape_1_source_0_source_stride_buf <= 0;
      __variable_wdata_204 <= 0;
      _stream__lazy_reshape_1_source_0_source_ram_raddr <= 0;
      _stream__lazy_reshape_1_source_0_source_count <= 0;
      _tmp_178 <= 0;
      _tmp_179 <= 0;
      _tmp_180 <= 0;
      _tmp_181 <= 0;
      _tmp_182 <= 0;
      _tmp_183 <= 0;
      _stream__lazy_reshape_1_sink_1_sink_mode <= 5'b0;
      _stream__lazy_reshape_1_sink_1_sink_offset <= 0;
      _stream__lazy_reshape_1_sink_1_sink_size <= 0;
      _stream__lazy_reshape_1_sink_1_sink_stride <= 0;
      _stream__lazy_reshape_1_sink_1_sink_sel <= 0;
      _stream__lazy_reshape_1_sink_1_sink_offset_buf <= 0;
      _stream__lazy_reshape_1_sink_1_sink_size_buf <= 0;
      _stream__lazy_reshape_1_sink_1_sink_stride_buf <= 0;
      _stream__lazy_reshape_1_sink_1_sink_waddr <= 0;
      _stream__lazy_reshape_1_sink_1_sink_count <= 0;
      _stream__lazy_reshape_1_sink_1_sink_wdata <= 0;
      _tmp_186 <= 0;
      _tmp_187 <= 0;
      _tmp_188 <= 0;
      _tmp_191 <= 0;
      _tmp_192 <= 0;
      _tmp_193 <= 0;
      _tmp_194 <= 0;
      _tmp_195 <= 0;
      _tmp_196 <= 0;
      _tmp_197 <= 0;
      _tmp_198 <= 0;
      _stream__lazy_reshape_1_busy_reg <= 0;
    end else begin
      if(_stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_source_0_source_ram_renable <= 0;
        _stream__lazy_reshape_1_source_0_source_fifo_deq <= 0;
      end 
      _stream__lazy_reshape_1_source_0_idle <= _stream__lazy_reshape_1_source_0_idle;
      if(_stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_sink_1_sink_wenable <= 0;
        _stream__lazy_reshape_1_sink_1_sink_fifo_enq <= 0;
      end 
      if(_set_flag_168) begin
        _stream__lazy_reshape_1_source_0_source_mode <= 5'b1;
        _stream__lazy_reshape_1_source_0_source_offset <= _lazy_reshape_1_copy_src;
        _stream__lazy_reshape_1_source_0_source_size <= _lazy_reshape_1_copy_size;
        _stream__lazy_reshape_1_source_0_source_stride <= 1;
      end 
      if(_set_flag_168) begin
        _stream__lazy_reshape_1_source_0_source_sel <= 1;
      end 
      if(_stream__lazy_reshape_1_source_start && _stream__lazy_reshape_1_source_0_source_mode & 5'b1 && _stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_source_0_source_offset_buf <= _stream__lazy_reshape_1_source_0_source_offset;
        _stream__lazy_reshape_1_source_0_source_size_buf <= _stream__lazy_reshape_1_source_0_source_size;
        _stream__lazy_reshape_1_source_0_source_stride_buf <= _stream__lazy_reshape_1_source_0_source_stride;
      end 
      if(_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_source_busy && _stream__lazy_reshape_1_is_root) begin
        __variable_wdata_204 <= _stream__lazy_reshape_1_source_0_source_ram_rdata;
      end 
      if((_stream__lazy_reshape_1_source_0_source_fsm_0 == 1) && _stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_source_0_idle <= 0;
        _stream__lazy_reshape_1_source_0_source_ram_raddr <= _stream__lazy_reshape_1_source_0_source_offset_buf;
        _stream__lazy_reshape_1_source_0_source_ram_renable <= 1;
        _stream__lazy_reshape_1_source_0_source_count <= _stream__lazy_reshape_1_source_0_source_size_buf;
      end 
      if((_stream__lazy_reshape_1_source_0_source_fsm_0 == 2) && _stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_source_0_source_ram_raddr <= _stream__lazy_reshape_1_source_0_source_ram_raddr + _stream__lazy_reshape_1_source_0_source_stride_buf;
        _stream__lazy_reshape_1_source_0_source_ram_renable <= 1;
        _stream__lazy_reshape_1_source_0_source_count <= _stream__lazy_reshape_1_source_0_source_count - 1;
      end 
      if((_stream__lazy_reshape_1_source_0_source_fsm_0 == 2) && (_stream__lazy_reshape_1_source_0_source_count == 1) && _stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_source_0_source_ram_renable <= 0;
        _stream__lazy_reshape_1_source_0_idle <= 1;
      end 
      if((_stream__lazy_reshape_1_source_0_source_fsm_0 == 2) && _stream__lazy_reshape_1_source_stop && _stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_source_0_source_ram_renable <= 0;
        _stream__lazy_reshape_1_source_0_idle <= 1;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_178 <= _set_flag_177;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_179 <= _tmp_178;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_180 <= _lazy_reshape_1_copy_dst;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_181 <= _tmp_180;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_182 <= _lazy_reshape_1_copy_size;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_183 <= _tmp_182;
      end 
      if(_tmp_179) begin
        _stream__lazy_reshape_1_sink_1_sink_mode <= 5'b1;
        _stream__lazy_reshape_1_sink_1_sink_offset <= _tmp_181;
        _stream__lazy_reshape_1_sink_1_sink_size <= _tmp_183;
        _stream__lazy_reshape_1_sink_1_sink_stride <= 1;
      end 
      if(_tmp_179) begin
        _stream__lazy_reshape_1_sink_1_sink_sel <= 2;
      end 
      if(_stream__lazy_reshape_1_sink_start && _stream__lazy_reshape_1_sink_1_sink_mode & 5'b1 && _stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_sink_1_sink_offset_buf <= _stream__lazy_reshape_1_sink_1_sink_offset;
        _stream__lazy_reshape_1_sink_1_sink_size_buf <= _stream__lazy_reshape_1_sink_1_sink_size;
        _stream__lazy_reshape_1_sink_1_sink_stride_buf <= _stream__lazy_reshape_1_sink_1_sink_stride;
      end 
      if((_stream__lazy_reshape_1_sink_1_sink_fsm_1 == 1) && _stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_sink_1_sink_waddr <= _stream__lazy_reshape_1_sink_1_sink_offset_buf - _stream__lazy_reshape_1_sink_1_sink_stride_buf;
        _stream__lazy_reshape_1_sink_1_sink_count <= _stream__lazy_reshape_1_sink_1_sink_size_buf;
      end 
      if((_stream__lazy_reshape_1_sink_1_sink_fsm_1 == 2) && _stream__lazy_reshape_1_stream_oready) begin
        _stream__lazy_reshape_1_sink_1_sink_waddr <= _stream__lazy_reshape_1_sink_1_sink_waddr + _stream__lazy_reshape_1_sink_1_sink_stride_buf;
        _stream__lazy_reshape_1_sink_1_sink_wdata <= stream__lazy_reshape_1_sink_1_data;
        _stream__lazy_reshape_1_sink_1_sink_wenable <= 1;
        _stream__lazy_reshape_1_sink_1_sink_count <= _stream__lazy_reshape_1_sink_1_sink_count - 1;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_186 <= _stream__lazy_reshape_1_source_start;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_187 <= _tmp_186;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_188 <= _tmp_187;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_191 <= _tmp_190;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_192 <= _stream__lazy_reshape_1_source_start;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_193 <= _tmp_192;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_194 <= _stream__lazy_reshape_1_source_stop;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_195 <= _tmp_194;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_196 <= _stream__lazy_reshape_1_source_busy;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_197 <= _tmp_196;
      end 
      if(_stream__lazy_reshape_1_stream_oready) begin
        _tmp_198 <= _stream__lazy_reshape_1_sink_busy;
      end 
      if(!_stream__lazy_reshape_1_sink_busy && _tmp_198) begin
        _stream__lazy_reshape_1_busy_reg <= 0;
      end 
      if(_stream__lazy_reshape_1_source_busy) begin
        _stream__lazy_reshape_1_busy_reg <= 1;
      end 
    end
  end

  localparam _stream__lazy_reshape_1_fsm_1 = 1;
  localparam _stream__lazy_reshape_1_fsm_2 = 2;
  localparam _stream__lazy_reshape_1_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _stream__lazy_reshape_1_fsm <= _stream__lazy_reshape_1_fsm_init;
      _stream__lazy_reshape_1_source_start <= 0;
      _stream__lazy_reshape_1_source_busy <= 0;
      _stream__lazy_reshape_1_stream_ivalid <= 0;
    end else begin
      if(_stream__lazy_reshape_1_stream_oready && _tmp_188) begin
        _stream__lazy_reshape_1_stream_ivalid <= 1;
      end 
      if(_stream__lazy_reshape_1_stream_oready && _tmp_191) begin
        _stream__lazy_reshape_1_stream_ivalid <= 0;
      end 
      case(_stream__lazy_reshape_1_fsm)
        _stream__lazy_reshape_1_fsm_init: begin
          if(_stream__lazy_reshape_1_run_flag) begin
            _stream__lazy_reshape_1_source_start <= 1;
          end 
          if(_stream__lazy_reshape_1_run_flag) begin
            _stream__lazy_reshape_1_fsm <= _stream__lazy_reshape_1_fsm_1;
          end 
        end
        _stream__lazy_reshape_1_fsm_1: begin
          if(_stream__lazy_reshape_1_source_start && _stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_source_start <= 0;
            _stream__lazy_reshape_1_source_busy <= 1;
          end 
          if(_stream__lazy_reshape_1_source_start && _stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_fsm <= _stream__lazy_reshape_1_fsm_2;
          end 
        end
        _stream__lazy_reshape_1_fsm_2: begin
          if(_stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_fsm <= _stream__lazy_reshape_1_fsm_3;
          end 
        end
        _stream__lazy_reshape_1_fsm_3: begin
          if(_stream__lazy_reshape_1_stream_oready && (_stream__lazy_reshape_1_source_0_idle && (_stream__lazy_reshape_1_fsm == 3))) begin
            _stream__lazy_reshape_1_source_busy <= 0;
          end 
          if(_stream__lazy_reshape_1_stream_oready && (_stream__lazy_reshape_1_source_0_idle && (_stream__lazy_reshape_1_fsm == 3)) && _stream__lazy_reshape_1_run_flag) begin
            _stream__lazy_reshape_1_source_start <= 1;
          end 
          if(_stream__lazy_reshape_1_stream_oready && (_stream__lazy_reshape_1_source_0_idle && (_stream__lazy_reshape_1_fsm == 3))) begin
            _stream__lazy_reshape_1_fsm <= _stream__lazy_reshape_1_fsm_init;
          end 
          if(_stream__lazy_reshape_1_stream_oready && (_stream__lazy_reshape_1_source_0_idle && (_stream__lazy_reshape_1_fsm == 3)) && _stream__lazy_reshape_1_run_flag) begin
            _stream__lazy_reshape_1_fsm <= _stream__lazy_reshape_1_fsm_1;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _stream_matmul_5_source_7_source_ram_renable <= 0;
      _stream_matmul_5_source_7_source_fifo_deq <= 0;
      _stream_matmul_5_source_7_idle <= 1;
      _stream_matmul_5_source_9_source_ram_renable <= 0;
      _stream_matmul_5_source_9_source_fifo_deq <= 0;
      _stream_matmul_5_source_9_idle <= 1;
      _stream_matmul_5_source_11_source_ram_renable <= 0;
      _stream_matmul_5_source_11_source_fifo_deq <= 0;
      _stream_matmul_5_source_11_idle <= 1;
      _stream_matmul_5_source_13_source_ram_renable <= 0;
      _stream_matmul_5_source_13_source_fifo_deq <= 0;
      _stream_matmul_5_source_13_idle <= 1;
      _stream_matmul_5_source_15_source_ram_renable <= 0;
      _stream_matmul_5_source_15_source_fifo_deq <= 0;
      _stream_matmul_5_source_15_idle <= 1;
      _stream_matmul_5_source_20_source_ram_renable <= 0;
      _stream_matmul_5_source_20_source_fifo_deq <= 0;
      _stream_matmul_5_source_20_idle <= 1;
      _stream_matmul_5_source_21_source_ram_renable <= 0;
      _stream_matmul_5_source_21_source_fifo_deq <= 0;
      _stream_matmul_5_source_21_idle <= 1;
      _stream_matmul_5_source_22_source_ram_renable <= 0;
      _stream_matmul_5_source_22_source_fifo_deq <= 0;
      _stream_matmul_5_source_22_idle <= 1;
      _stream_matmul_5_sink_33_sink_wenable <= 0;
      _stream_matmul_5_sink_33_sink_fifo_enq <= 0;
      _stream_matmul_5_sink_34_sink_wenable <= 0;
      _stream_matmul_5_sink_34_sink_fifo_enq <= 0;
      __stream_matmul_5_stream_ivalid_1 <= 0;
      __stream_matmul_5_stream_ivalid_2 <= 0;
      __stream_matmul_5_stream_ivalid_3 <= 0;
      __stream_matmul_5_stream_ivalid_4 <= 0;
      __stream_matmul_5_stream_ivalid_5 <= 0;
      __stream_matmul_5_stream_ivalid_6 <= 0;
      __stream_matmul_5_stream_ivalid_7 <= 0;
      __stream_matmul_5_stream_ivalid_8 <= 0;
      __stream_matmul_5_stream_ivalid_9 <= 0;
      __stream_matmul_5_stream_ivalid_10 <= 0;
      __stream_matmul_5_stream_ivalid_11 <= 0;
      __stream_matmul_5_stream_ivalid_12 <= 0;
      __stream_matmul_5_stream_ivalid_13 <= 0;
      __stream_matmul_5_stream_ivalid_14 <= 0;
      __stream_matmul_5_stream_ivalid_15 <= 0;
      __stream_matmul_5_stream_ivalid_16 <= 0;
      __stream_matmul_5_stream_ivalid_17 <= 0;
      __stream_matmul_5_stream_ivalid_18 <= 0;
      __stream_matmul_5_stream_ivalid_19 <= 0;
      __stream_matmul_5_stream_ivalid_20 <= 0;
      __stream_matmul_5_stream_ivalid_21 <= 0;
      __stream_matmul_5_stream_ivalid_22 <= 0;
      __stream_matmul_5_stream_ivalid_23 <= 0;
      __stream_matmul_5_stream_ivalid_24 <= 0;
      __stream_matmul_5_stream_ivalid_25 <= 0;
      __stream_matmul_5_stream_ivalid_26 <= 0;
      __stream_matmul_5_stream_ivalid_27 <= 0;
      __stream_matmul_5_stream_ivalid_28 <= 0;
      __stream_matmul_5_stream_ivalid_29 <= 0;
      __stream_matmul_5_stream_ivalid_30 <= 0;
      __stream_matmul_5_stream_ivalid_31 <= 0;
      __stream_matmul_5_stream_ivalid_32 <= 0;
      _counter_data_211 <= 1'sd0;
      _counter_count_211 <= 1'sd0;
      _minus_data_216 <= 0;
      _minus_data_222 <= 0;
      _eq_data_291 <= 0;
      _eq_data_295 <= 0;
      _plus_data_358 <= 0;
      _plus_data_379 <= 0;
      _plus_data_395 <= 0;
      _plus_data_414 <= 0;
      _eq_data_420 <= 0;
      _eq_data_423 <= 0;
      _plus_data_446 <= 0;
      _plus_data_467 <= 0;
      _plus_data_483 <= 0;
      _plus_data_502 <= 0;
      _eq_data_508 <= 0;
      _eq_data_511 <= 0;
      __delay_data_516_pointer_214 <= 0;
      __delay_data_518__variable_290 <= 0;
      __delay_data_521_pointer_337 <= 0;
      __delay_data_524_reinterpretcast_316 <= 0;
      __delay_data_529_pointer_220 <= 0;
      __delay_data_533_reinterpretcast_320 <= 0;
      __delay_data_538__variable_210 <= 0;
      __delay_data_565__variable_205 <= 0;
      __delay_data_579_reinterpretcast_328 <= 0;
      __delay_data_584_reinterpretcast_332 <= 0;
      __delay_data_602_cond_237 <= 0;
      __delay_data_622_cond_249 <= 0;
      __delay_data_727_cond_236 <= 0;
      __delay_data_747_cond_248 <= 0;
      _eq_data_218 <= 0;
      _eq_data_224 <= 0;
      __delay_data_517__delay_516_pointer_214 <= 0;
      __delay_data_519_reinterpretcast_302 <= 0;
      __delay_data_522__delay_521_pointer_337 <= 0;
      __delay_data_525__delay_524_reinterpretcast_316 <= 0;
      __delay_data_527_plus_358 <= 0;
      __delay_data_530__delay_529_pointer_220 <= 0;
      __delay_data_531_reinterpretcast_306 <= 0;
      __delay_data_534__delay_533_reinterpretcast_320 <= 0;
      __delay_data_536_plus_379 <= 0;
      __delay_data_539__delay_538__variable_210 <= 0;
      __delay_data_552_plus_395 <= 0;
      __delay_data_566__delay_565__variable_205 <= 0;
      __delay_data_580__delay_579_reinterpretcast_328 <= 0;
      __delay_data_582_plus_446 <= 0;
      __delay_data_585__delay_584_reinterpretcast_332 <= 0;
      __delay_data_587_plus_467 <= 0;
      __delay_data_589_plus_483 <= 0;
      __delay_data_603__delay_602_cond_237 <= 0;
      __delay_data_623__delay_622_cond_249 <= 0;
      __delay_data_643_plus_502 <= 0;
      __delay_data_664_eq_508 <= 0;
      __delay_data_696_eq_511 <= 0;
      __delay_data_728__delay_727_cond_236 <= 0;
      __delay_data_748__delay_747_cond_248 <= 0;
      __delay_data_768_plus_414 <= 0;
      __delay_data_789_eq_420 <= 0;
      __delay_data_821_eq_423 <= 0;
      _land_data_219 <= 0;
      _land_data_225 <= 0;
      __delay_data_520__delay_519_reinterpretcast_302 <= 0;
      __delay_data_523__delay_522__delay_521_pointer_337 <= 0;
      __delay_data_526__delay_525__delay_524_reinterpretcast_316 <= 0;
      __delay_data_528__delay_527_plus_358 <= 0;
      __delay_data_532__delay_531_reinterpretcast_306 <= 0;
      __delay_data_535__delay_534__delay_533_reinterpretcast_320 <= 0;
      __delay_data_537__delay_536_plus_379 <= 0;
      __delay_data_540__delay_539__delay_538__variable_210 <= 0;
      __delay_data_553__delay_552_plus_395 <= 0;
      __delay_data_567__delay_566__delay_565__variable_205 <= 0;
      __delay_data_581__delay_580__delay_579_reinterpretcast_328 <= 0;
      __delay_data_583__delay_582_plus_446 <= 0;
      __delay_data_586__delay_585__delay_584_reinterpretcast_332 <= 0;
      __delay_data_588__delay_587_plus_467 <= 0;
      __delay_data_590__delay_589_plus_483 <= 0;
      __delay_data_604__delay_603__delay_602_cond_237 <= 0;
      __delay_data_624__delay_623__delay_622_cond_249 <= 0;
      __delay_data_644__delay_643_plus_502 <= 0;
      __delay_data_665__delay_664_eq_508 <= 0;
      __delay_data_697__delay_696_eq_511 <= 0;
      __delay_data_729__delay_728__delay_727_cond_236 <= 0;
      __delay_data_749__delay_748__delay_747_cond_248 <= 0;
      __delay_data_769__delay_768_plus_414 <= 0;
      __delay_data_790__delay_789_eq_420 <= 0;
      __delay_data_822__delay_821_eq_423 <= 0;
      __delay_data_541__delay_540__delay_539____variable_210 <= 0;
      __delay_data_554__delay_553__delay_552_plus_395 <= 0;
      __delay_data_568__delay_567__delay_566____variable_205 <= 0;
      __delay_data_591__delay_590__delay_589_plus_483 <= 0;
      __delay_data_605__delay_604__delay_603__delay_602_cond_237 <= 0;
      __delay_data_625__delay_624__delay_623__delay_622_cond_249 <= 0;
      __delay_data_645__delay_644__delay_643_plus_502 <= 0;
      __delay_data_666__delay_665__delay_664_eq_508 <= 0;
      __delay_data_698__delay_697__delay_696_eq_511 <= 0;
      __delay_data_730__delay_729__delay_728__delay_727_cond_236 <= 0;
      __delay_data_750__delay_749__delay_748__delay_747_cond_248 <= 0;
      __delay_data_770__delay_769__delay_768_plus_414 <= 0;
      __delay_data_791__delay_790__delay_789_eq_420 <= 0;
      __delay_data_823__delay_822__delay_821_eq_423 <= 0;
      __delay_data_542__delay_541__delay_540____variable_210 <= 0;
      __delay_data_555__delay_554__delay_553__delay_552_plus_395 <= 0;
      __delay_data_569__delay_568__delay_567____variable_205 <= 0;
      __delay_data_592__delay_591__delay_590__delay_589_plus_483 <= 0;
      __delay_data_606__delay_605__delay_604__delay_603___cond_237 <= 0;
      __delay_data_626__delay_625__delay_624__delay_623___cond_249 <= 0;
      __delay_data_646__delay_645__delay_644__delay_643_plus_502 <= 0;
      __delay_data_667__delay_666__delay_665__delay_664_eq_508 <= 0;
      __delay_data_699__delay_698__delay_697__delay_696_eq_511 <= 0;
      __delay_data_731__delay_730__delay_729__delay_728___cond_236 <= 0;
      __delay_data_751__delay_750__delay_749__delay_748___cond_248 <= 0;
      __delay_data_771__delay_770__delay_769__delay_768_plus_414 <= 0;
      __delay_data_792__delay_791__delay_790__delay_789_eq_420 <= 0;
      __delay_data_824__delay_823__delay_822__delay_821_eq_423 <= 0;
      __delay_data_543__delay_542__delay_541____variable_210 <= 0;
      __delay_data_556__delay_555__delay_554__delay_553___plus_395 <= 0;
      __delay_data_570__delay_569__delay_568____variable_205 <= 0;
      __delay_data_593__delay_592__delay_591__delay_590___plus_483 <= 0;
      __delay_data_607__delay_606__delay_605__delay_604___cond_237 <= 0;
      __delay_data_627__delay_626__delay_625__delay_624___cond_249 <= 0;
      __delay_data_647__delay_646__delay_645__delay_644___plus_502 <= 0;
      __delay_data_668__delay_667__delay_666__delay_665___eq_508 <= 0;
      __delay_data_700__delay_699__delay_698__delay_697___eq_511 <= 0;
      __delay_data_732__delay_731__delay_730__delay_729___cond_236 <= 0;
      __delay_data_752__delay_751__delay_750__delay_749___cond_248 <= 0;
      __delay_data_772__delay_771__delay_770__delay_769___plus_414 <= 0;
      __delay_data_793__delay_792__delay_791__delay_790___eq_420 <= 0;
      __delay_data_825__delay_824__delay_823__delay_822___eq_423 <= 0;
      __delay_data_544__delay_543__delay_542____variable_210 <= 0;
      __delay_data_557__delay_556__delay_555__delay_554___plus_395 <= 0;
      __delay_data_571__delay_570__delay_569____variable_205 <= 0;
      __delay_data_594__delay_593__delay_592__delay_591___plus_483 <= 0;
      __delay_data_608__delay_607__delay_606__delay_605___cond_237 <= 0;
      __delay_data_628__delay_627__delay_626__delay_625___cond_249 <= 0;
      __delay_data_648__delay_647__delay_646__delay_645___plus_502 <= 0;
      __delay_data_669__delay_668__delay_667__delay_666___eq_508 <= 0;
      __delay_data_701__delay_700__delay_699__delay_698___eq_511 <= 0;
      __delay_data_733__delay_732__delay_731__delay_730___cond_236 <= 0;
      __delay_data_753__delay_752__delay_751__delay_750___cond_248 <= 0;
      __delay_data_773__delay_772__delay_771__delay_770___plus_414 <= 0;
      __delay_data_794__delay_793__delay_792__delay_791___eq_420 <= 0;
      __delay_data_826__delay_825__delay_824__delay_823___eq_423 <= 0;
      __delay_data_545__delay_544__delay_543____variable_210 <= 0;
      __delay_data_558__delay_557__delay_556__delay_555___plus_395 <= 0;
      __delay_data_572__delay_571__delay_570____variable_205 <= 0;
      __delay_data_595__delay_594__delay_593__delay_592___plus_483 <= 0;
      __delay_data_609__delay_608__delay_607__delay_606___cond_237 <= 0;
      __delay_data_629__delay_628__delay_627__delay_626___cond_249 <= 0;
      __delay_data_649__delay_648__delay_647__delay_646___plus_502 <= 0;
      __delay_data_670__delay_669__delay_668__delay_667___eq_508 <= 0;
      __delay_data_702__delay_701__delay_700__delay_699___eq_511 <= 0;
      __delay_data_734__delay_733__delay_732__delay_731___cond_236 <= 0;
      __delay_data_754__delay_753__delay_752__delay_751___cond_248 <= 0;
      __delay_data_774__delay_773__delay_772__delay_771___plus_414 <= 0;
      __delay_data_795__delay_794__delay_793__delay_792___eq_420 <= 0;
      __delay_data_827__delay_826__delay_825__delay_824___eq_423 <= 0;
      __delay_data_546__delay_545__delay_544____variable_210 <= 0;
      __delay_data_559__delay_558__delay_557__delay_556___plus_395 <= 0;
      __delay_data_573__delay_572__delay_571____variable_205 <= 0;
      __delay_data_596__delay_595__delay_594__delay_593___plus_483 <= 0;
      __delay_data_610__delay_609__delay_608__delay_607___cond_237 <= 0;
      __delay_data_630__delay_629__delay_628__delay_627___cond_249 <= 0;
      __delay_data_650__delay_649__delay_648__delay_647___plus_502 <= 0;
      __delay_data_671__delay_670__delay_669__delay_668___eq_508 <= 0;
      __delay_data_703__delay_702__delay_701__delay_700___eq_511 <= 0;
      __delay_data_735__delay_734__delay_733__delay_732___cond_236 <= 0;
      __delay_data_755__delay_754__delay_753__delay_752___cond_248 <= 0;
      __delay_data_775__delay_774__delay_773__delay_772___plus_414 <= 0;
      __delay_data_796__delay_795__delay_794__delay_793___eq_420 <= 0;
      __delay_data_828__delay_827__delay_826__delay_825___eq_423 <= 0;
      __delay_data_547__delay_546__delay_545____variable_210 <= 0;
      __delay_data_560__delay_559__delay_558__delay_557___plus_395 <= 0;
      __delay_data_574__delay_573__delay_572____variable_205 <= 0;
      __delay_data_597__delay_596__delay_595__delay_594___plus_483 <= 0;
      __delay_data_611__delay_610__delay_609__delay_608___cond_237 <= 0;
      __delay_data_631__delay_630__delay_629__delay_628___cond_249 <= 0;
      __delay_data_651__delay_650__delay_649__delay_648___plus_502 <= 0;
      __delay_data_672__delay_671__delay_670__delay_669___eq_508 <= 0;
      __delay_data_704__delay_703__delay_702__delay_701___eq_511 <= 0;
      __delay_data_736__delay_735__delay_734__delay_733___cond_236 <= 0;
      __delay_data_756__delay_755__delay_754__delay_753___cond_248 <= 0;
      __delay_data_776__delay_775__delay_774__delay_773___plus_414 <= 0;
      __delay_data_797__delay_796__delay_795__delay_794___eq_420 <= 0;
      __delay_data_829__delay_828__delay_827__delay_826___eq_423 <= 0;
      __delay_data_548__delay_547__delay_546____variable_210 <= 0;
      __delay_data_561__delay_560__delay_559__delay_558___plus_395 <= 0;
      __delay_data_575__delay_574__delay_573____variable_205 <= 0;
      __delay_data_598__delay_597__delay_596__delay_595___plus_483 <= 0;
      __delay_data_612__delay_611__delay_610__delay_609___cond_237 <= 0;
      __delay_data_632__delay_631__delay_630__delay_629___cond_249 <= 0;
      __delay_data_652__delay_651__delay_650__delay_649___plus_502 <= 0;
      __delay_data_673__delay_672__delay_671__delay_670___eq_508 <= 0;
      __delay_data_705__delay_704__delay_703__delay_702___eq_511 <= 0;
      __delay_data_737__delay_736__delay_735__delay_734___cond_236 <= 0;
      __delay_data_757__delay_756__delay_755__delay_754___cond_248 <= 0;
      __delay_data_777__delay_776__delay_775__delay_774___plus_414 <= 0;
      __delay_data_798__delay_797__delay_796__delay_795___eq_420 <= 0;
      __delay_data_830__delay_829__delay_828__delay_827___eq_423 <= 0;
      __delay_data_549__delay_548__delay_547____variable_210 <= 0;
      __delay_data_562__delay_561__delay_560__delay_559___plus_395 <= 0;
      __delay_data_576__delay_575__delay_574____variable_205 <= 0;
      __delay_data_599__delay_598__delay_597__delay_596___plus_483 <= 0;
      __delay_data_613__delay_612__delay_611__delay_610___cond_237 <= 0;
      __delay_data_633__delay_632__delay_631__delay_630___cond_249 <= 0;
      __delay_data_653__delay_652__delay_651__delay_650___plus_502 <= 0;
      __delay_data_674__delay_673__delay_672__delay_671___eq_508 <= 0;
      __delay_data_706__delay_705__delay_704__delay_703___eq_511 <= 0;
      __delay_data_738__delay_737__delay_736__delay_735___cond_236 <= 0;
      __delay_data_758__delay_757__delay_756__delay_755___cond_248 <= 0;
      __delay_data_778__delay_777__delay_776__delay_775___plus_414 <= 0;
      __delay_data_799__delay_798__delay_797__delay_796___eq_420 <= 0;
      __delay_data_831__delay_830__delay_829__delay_828___eq_423 <= 0;
      __delay_data_550__delay_549__delay_548____variable_210 <= 0;
      __delay_data_563__delay_562__delay_561__delay_560___plus_395 <= 0;
      __delay_data_577__delay_576__delay_575____variable_205 <= 0;
      __delay_data_600__delay_599__delay_598__delay_597___plus_483 <= 0;
      __delay_data_614__delay_613__delay_612__delay_611___cond_237 <= 0;
      __delay_data_634__delay_633__delay_632__delay_631___cond_249 <= 0;
      __delay_data_654__delay_653__delay_652__delay_651___plus_502 <= 0;
      __delay_data_675__delay_674__delay_673__delay_672___eq_508 <= 0;
      __delay_data_707__delay_706__delay_705__delay_704___eq_511 <= 0;
      __delay_data_739__delay_738__delay_737__delay_736___cond_236 <= 0;
      __delay_data_759__delay_758__delay_757__delay_756___cond_248 <= 0;
      __delay_data_779__delay_778__delay_777__delay_776___plus_414 <= 0;
      __delay_data_800__delay_799__delay_798__delay_797___eq_420 <= 0;
      __delay_data_832__delay_831__delay_830__delay_829___eq_423 <= 0;
      __delay_data_551__delay_550__delay_549____variable_210 <= 0;
      __delay_data_564__delay_563__delay_562__delay_561___plus_395 <= 0;
      __delay_data_578__delay_577__delay_576____variable_205 <= 0;
      __delay_data_601__delay_600__delay_599__delay_598___plus_483 <= 0;
      __delay_data_615__delay_614__delay_613__delay_612___cond_237 <= 0;
      __delay_data_635__delay_634__delay_633__delay_632___cond_249 <= 0;
      __delay_data_655__delay_654__delay_653__delay_652___plus_502 <= 0;
      __delay_data_676__delay_675__delay_674__delay_673___eq_508 <= 0;
      __delay_data_708__delay_707__delay_706__delay_705___eq_511 <= 0;
      __delay_data_740__delay_739__delay_738__delay_737___cond_236 <= 0;
      __delay_data_760__delay_759__delay_758__delay_757___cond_248 <= 0;
      __delay_data_780__delay_779__delay_778__delay_777___plus_414 <= 0;
      __delay_data_801__delay_800__delay_799__delay_798___eq_420 <= 0;
      __delay_data_833__delay_832__delay_831__delay_830___eq_423 <= 0;
      __delay_data_616__delay_615__delay_614__delay_613___cond_237 <= 0;
      __delay_data_636__delay_635__delay_634__delay_633___cond_249 <= 0;
      __delay_data_656__delay_655__delay_654__delay_653___plus_502 <= 0;
      __delay_data_677__delay_676__delay_675__delay_674___eq_508 <= 0;
      __delay_data_709__delay_708__delay_707__delay_706___eq_511 <= 0;
      __delay_data_741__delay_740__delay_739__delay_738___cond_236 <= 0;
      __delay_data_761__delay_760__delay_759__delay_758___cond_248 <= 0;
      __delay_data_781__delay_780__delay_779__delay_778___plus_414 <= 0;
      __delay_data_802__delay_801__delay_800__delay_799___eq_420 <= 0;
      __delay_data_834__delay_833__delay_832__delay_831___eq_423 <= 0;
      __delay_data_617__delay_616__delay_615__delay_614___cond_237 <= 0;
      __delay_data_637__delay_636__delay_635__delay_634___cond_249 <= 0;
      __delay_data_657__delay_656__delay_655__delay_654___plus_502 <= 0;
      __delay_data_678__delay_677__delay_676__delay_675___eq_508 <= 0;
      __delay_data_710__delay_709__delay_708__delay_707___eq_511 <= 0;
      __delay_data_742__delay_741__delay_740__delay_739___cond_236 <= 0;
      __delay_data_762__delay_761__delay_760__delay_759___cond_248 <= 0;
      __delay_data_782__delay_781__delay_780__delay_779___plus_414 <= 0;
      __delay_data_803__delay_802__delay_801__delay_800___eq_420 <= 0;
      __delay_data_835__delay_834__delay_833__delay_832___eq_423 <= 0;
      __delay_data_618__delay_617__delay_616__delay_615___cond_237 <= 0;
      __delay_data_638__delay_637__delay_636__delay_635___cond_249 <= 0;
      __delay_data_658__delay_657__delay_656__delay_655___plus_502 <= 0;
      __delay_data_679__delay_678__delay_677__delay_676___eq_508 <= 0;
      __delay_data_711__delay_710__delay_709__delay_708___eq_511 <= 0;
      __delay_data_743__delay_742__delay_741__delay_740___cond_236 <= 0;
      __delay_data_763__delay_762__delay_761__delay_760___cond_248 <= 0;
      __delay_data_783__delay_782__delay_781__delay_780___plus_414 <= 0;
      __delay_data_804__delay_803__delay_802__delay_801___eq_420 <= 0;
      __delay_data_836__delay_835__delay_834__delay_833___eq_423 <= 0;
      __delay_data_619__delay_618__delay_617__delay_616___cond_237 <= 0;
      __delay_data_639__delay_638__delay_637__delay_636___cond_249 <= 0;
      __delay_data_659__delay_658__delay_657__delay_656___plus_502 <= 0;
      __delay_data_680__delay_679__delay_678__delay_677___eq_508 <= 0;
      __delay_data_712__delay_711__delay_710__delay_709___eq_511 <= 0;
      __delay_data_744__delay_743__delay_742__delay_741___cond_236 <= 0;
      __delay_data_764__delay_763__delay_762__delay_761___cond_248 <= 0;
      __delay_data_784__delay_783__delay_782__delay_781___plus_414 <= 0;
      __delay_data_805__delay_804__delay_803__delay_802___eq_420 <= 0;
      __delay_data_837__delay_836__delay_835__delay_834___eq_423 <= 0;
      __delay_data_620__delay_619__delay_618__delay_617___cond_237 <= 0;
      __delay_data_640__delay_639__delay_638__delay_637___cond_249 <= 0;
      __delay_data_660__delay_659__delay_658__delay_657___plus_502 <= 0;
      __delay_data_681__delay_680__delay_679__delay_678___eq_508 <= 0;
      __delay_data_713__delay_712__delay_711__delay_710___eq_511 <= 0;
      __delay_data_745__delay_744__delay_743__delay_742___cond_236 <= 0;
      __delay_data_765__delay_764__delay_763__delay_762___cond_248 <= 0;
      __delay_data_785__delay_784__delay_783__delay_782___plus_414 <= 0;
      __delay_data_806__delay_805__delay_804__delay_803___eq_420 <= 0;
      __delay_data_838__delay_837__delay_836__delay_835___eq_423 <= 0;
      __delay_data_621__delay_620__delay_619__delay_618___cond_237 <= 0;
      __delay_data_641__delay_640__delay_639__delay_638___cond_249 <= 0;
      __delay_data_661__delay_660__delay_659__delay_658___plus_502 <= 0;
      __delay_data_682__delay_681__delay_680__delay_679___eq_508 <= 0;
      __delay_data_714__delay_713__delay_712__delay_711___eq_511 <= 0;
      __delay_data_746__delay_745__delay_744__delay_743___cond_236 <= 0;
      __delay_data_766__delay_765__delay_764__delay_763___cond_248 <= 0;
      __delay_data_786__delay_785__delay_784__delay_783___plus_414 <= 0;
      __delay_data_807__delay_806__delay_805__delay_804___eq_420 <= 0;
      __delay_data_839__delay_838__delay_837__delay_836___eq_423 <= 0;
      _plus_data_398 <= 0;
      _plus_data_486 <= 0;
      __delay_data_642__delay_641__delay_640__delay_639___cond_249 <= 0;
      __delay_data_662__delay_661__delay_660__delay_659___plus_502 <= 0;
      __delay_data_683__delay_682__delay_681__delay_680___eq_508 <= 0;
      __delay_data_715__delay_714__delay_713__delay_712___eq_511 <= 0;
      __delay_data_767__delay_766__delay_765__delay_764___cond_248 <= 0;
      __delay_data_787__delay_786__delay_785__delay_784___plus_414 <= 0;
      __delay_data_808__delay_807__delay_806__delay_805___eq_420 <= 0;
      __delay_data_840__delay_839__delay_838__delay_837___eq_423 <= 0;
      __delay_data_852__substreamoutput_397 <= 0;
      __delay_data_684__delay_683__delay_682__delay_681___eq_508 <= 0;
      __delay_data_716__delay_715__delay_714__delay_713___eq_511 <= 0;
      __delay_data_809__delay_808__delay_807__delay_806___eq_420 <= 0;
      __delay_data_841__delay_840__delay_839__delay_838___eq_423 <= 0;
      __delay_data_853__delay_852__substreamoutput_397 <= 0;
      __delay_data_685__delay_684__delay_683__delay_682___eq_508 <= 0;
      __delay_data_717__delay_716__delay_715__delay_714___eq_511 <= 0;
      __delay_data_810__delay_809__delay_808__delay_807___eq_420 <= 0;
      __delay_data_842__delay_841__delay_840__delay_839___eq_423 <= 0;
      __delay_data_854__delay_853__delay_852__substreamoutput_397 <= 0;
      __delay_data_686__delay_685__delay_684__delay_683___eq_508 <= 0;
      __delay_data_718__delay_717__delay_716__delay_715___eq_511 <= 0;
      __delay_data_811__delay_810__delay_809__delay_808___eq_420 <= 0;
      __delay_data_843__delay_842__delay_841__delay_840___eq_423 <= 0;
      __delay_data_855__delay_854__delay_853____substreamoutput_397 <= 0;
      __delay_data_687__delay_686__delay_685__delay_684___eq_508 <= 0;
      __delay_data_719__delay_718__delay_717__delay_716___eq_511 <= 0;
      __delay_data_812__delay_811__delay_810__delay_809___eq_420 <= 0;
      __delay_data_844__delay_843__delay_842__delay_841___eq_423 <= 0;
      __delay_data_856__delay_855__delay_854____substreamoutput_397 <= 0;
      __delay_data_688__delay_687__delay_686__delay_685___eq_508 <= 0;
      __delay_data_720__delay_719__delay_718__delay_717___eq_511 <= 0;
      __delay_data_813__delay_812__delay_811__delay_810___eq_420 <= 0;
      __delay_data_845__delay_844__delay_843__delay_842___eq_423 <= 0;
      __delay_data_857__delay_856__delay_855____substreamoutput_397 <= 0;
      __delay_data_689__delay_688__delay_687__delay_686___eq_508 <= 0;
      __delay_data_721__delay_720__delay_719__delay_718___eq_511 <= 0;
      __delay_data_814__delay_813__delay_812__delay_811___eq_420 <= 0;
      __delay_data_846__delay_845__delay_844__delay_843___eq_423 <= 0;
      __delay_data_858__delay_857__delay_856____substreamoutput_397 <= 0;
      __delay_data_690__delay_689__delay_688__delay_687___eq_508 <= 0;
      __delay_data_722__delay_721__delay_720__delay_719___eq_511 <= 0;
      __delay_data_815__delay_814__delay_813__delay_812___eq_420 <= 0;
      __delay_data_847__delay_846__delay_845__delay_844___eq_423 <= 0;
      __delay_data_859__delay_858__delay_857____substreamoutput_397 <= 0;
      __delay_data_691__delay_690__delay_689__delay_688___eq_508 <= 0;
      __delay_data_723__delay_722__delay_721__delay_720___eq_511 <= 0;
      __delay_data_816__delay_815__delay_814__delay_813___eq_420 <= 0;
      __delay_data_848__delay_847__delay_846__delay_845___eq_423 <= 0;
      __delay_data_860__delay_859__delay_858____substreamoutput_397 <= 0;
      __delay_data_692__delay_691__delay_690__delay_689___eq_508 <= 0;
      __delay_data_724__delay_723__delay_722__delay_721___eq_511 <= 0;
      __delay_data_817__delay_816__delay_815__delay_814___eq_420 <= 0;
      __delay_data_849__delay_848__delay_847__delay_846___eq_423 <= 0;
      __delay_data_861__delay_860__delay_859____substreamoutput_397 <= 0;
      _greaterthan_data_417 <= 0;
      _greaterthan_data_505 <= 0;
      __delay_data_663__substreamoutput_503 <= 0;
      __delay_data_693__delay_692__delay_691__delay_690___eq_508 <= 0;
      __delay_data_725__delay_724__delay_723__delay_722___eq_511 <= 0;
      __delay_data_788__substreamoutput_415 <= 0;
      __delay_data_818__delay_817__delay_816__delay_815___eq_420 <= 0;
      __delay_data_850__delay_849__delay_848__delay_847___eq_423 <= 0;
      __delay_data_862__delay_861__delay_860____substreamoutput_397 <= 0;
      _cond_data_419 <= 0;
      _cond_data_507 <= 0;
      __delay_data_694__delay_693__delay_692__delay_691___eq_508 <= 0;
      __delay_data_695__delay_663__substreamoutput_503 <= 0;
      __delay_data_726__delay_725__delay_724__delay_723___eq_511 <= 0;
      __delay_data_819__delay_818__delay_817__delay_816___eq_420 <= 0;
      __delay_data_820__delay_788__substreamoutput_415 <= 0;
      __delay_data_851__delay_850__delay_849__delay_848___eq_423 <= 0;
      __delay_data_863__delay_862__delay_861____substreamoutput_397 <= 0;
      _stream_matmul_5_parameter_0_next_parameter_data <= 0;
      __variable_wdata_205 <= 0;
      _stream_matmul_5_parameter_1_next_parameter_data <= 0;
      __variable_wdata_206 <= 0;
      _stream_matmul_5_parameter_2_next_parameter_data <= 0;
      __variable_wdata_207 <= 0;
      _stream_matmul_5_parameter_3_next_parameter_data <= 0;
      __variable_wdata_208 <= 0;
      _stream_matmul_5_parameter_4_next_parameter_data <= 0;
      __variable_wdata_209 <= 0;
      _stream_matmul_5_parameter_6_next_parameter_data <= 0;
      __variable_wdata_226 <= 0;
      _stream_matmul_5_source_7_source_mode <= 5'b0;
      _stream_matmul_5_source_7_source_offset <= 0;
      _source_stream_matmul_5_source_7_pat_size_0 <= 0;
      _source_stream_matmul_5_source_7_pat_stride_0 <= 0;
      _source_stream_matmul_5_source_7_pat_size_1 <= 0;
      _source_stream_matmul_5_source_7_pat_stride_1 <= 0;
      _source_stream_matmul_5_source_7_pat_size_2 <= 0;
      _source_stream_matmul_5_source_7_pat_stride_2 <= 0;
      _source_stream_matmul_5_source_7_pat_size_3 <= 0;
      _source_stream_matmul_5_source_7_pat_stride_3 <= 0;
      _stream_matmul_5_source_7_source_sel <= 0;
      _stream_matmul_5_source_7_source_offset_buf <= 0;
      _source_stream_matmul_5_source_7_pat_cur_offset_0 <= 0;
      _source_stream_matmul_5_source_7_pat_cur_offset_1 <= 0;
      _source_stream_matmul_5_source_7_pat_cur_offset_2 <= 0;
      _source_stream_matmul_5_source_7_pat_cur_offset_3 <= 0;
      _source_stream_matmul_5_source_7_pat_count_0 <= 0;
      _source_stream_matmul_5_source_7_pat_count_1 <= 0;
      _source_stream_matmul_5_source_7_pat_count_2 <= 0;
      _source_stream_matmul_5_source_7_pat_count_3 <= 0;
      _source_stream_matmul_5_source_7_pat_size_buf_0 <= 0;
      _source_stream_matmul_5_source_7_pat_size_buf_1 <= 0;
      _source_stream_matmul_5_source_7_pat_size_buf_2 <= 0;
      _source_stream_matmul_5_source_7_pat_size_buf_3 <= 0;
      _source_stream_matmul_5_source_7_pat_stride_buf_0 <= 0;
      _source_stream_matmul_5_source_7_pat_stride_buf_1 <= 0;
      _source_stream_matmul_5_source_7_pat_stride_buf_2 <= 0;
      _source_stream_matmul_5_source_7_pat_stride_buf_3 <= 0;
      __variable_wdata_227 <= 0;
      _stream_matmul_5_source_7_source_ram_raddr <= 0;
      _stream_matmul_5_parameter_8_next_parameter_data <= 0;
      __variable_wdata_238 <= 0;
      _stream_matmul_5_source_9_source_mode <= 5'b0;
      _stream_matmul_5_source_9_source_empty_data <= 0;
      __variable_wdata_239 <= 0;
      _stream_matmul_5_parameter_10_next_parameter_data <= 0;
      __variable_wdata_250 <= 0;
      _stream_matmul_5_source_11_source_mode <= 5'b0;
      _stream_matmul_5_source_11_source_empty_data <= 0;
      __variable_wdata_251 <= 0;
      _stream_matmul_5_parameter_12_next_parameter_data <= 0;
      __variable_wdata_262 <= 0;
      _stream_matmul_5_source_13_source_mode <= 5'b0;
      _stream_matmul_5_source_13_source_empty_data <= 0;
      __variable_wdata_263 <= 0;
      _stream_matmul_5_parameter_14_next_parameter_data <= 0;
      __variable_wdata_274 <= 0;
      _stream_matmul_5_source_15_source_mode <= 5'b0;
      _stream_matmul_5_source_15_source_empty_data <= 0;
      __variable_wdata_275 <= 0;
      _stream_matmul_5_parameter_16_next_parameter_data <= 0;
      __variable_wdata_286 <= 0;
      _stream_matmul_5_parameter_17_next_parameter_data <= 0;
      __variable_wdata_287 <= 0;
      _stream_matmul_5_parameter_18_next_parameter_data <= 0;
      __variable_wdata_288 <= 0;
      _stream_matmul_5_parameter_19_next_parameter_data <= 0;
      __variable_wdata_289 <= 0;
      _stream_matmul_5_source_20_source_mode <= 5'b0;
      _stream_matmul_5_source_20_source_offset <= 0;
      _source_stream_matmul_5_source_20_pat_size_0 <= 0;
      _source_stream_matmul_5_source_20_pat_stride_0 <= 0;
      _source_stream_matmul_5_source_20_pat_size_1 <= 0;
      _source_stream_matmul_5_source_20_pat_stride_1 <= 0;
      _source_stream_matmul_5_source_20_pat_size_2 <= 0;
      _source_stream_matmul_5_source_20_pat_stride_2 <= 0;
      _source_stream_matmul_5_source_20_pat_size_3 <= 0;
      _source_stream_matmul_5_source_20_pat_stride_3 <= 0;
      _stream_matmul_5_source_20_source_sel <= 0;
      _stream_matmul_5_source_20_source_offset_buf <= 0;
      _source_stream_matmul_5_source_20_pat_cur_offset_0 <= 0;
      _source_stream_matmul_5_source_20_pat_cur_offset_1 <= 0;
      _source_stream_matmul_5_source_20_pat_cur_offset_2 <= 0;
      _source_stream_matmul_5_source_20_pat_cur_offset_3 <= 0;
      _source_stream_matmul_5_source_20_pat_count_0 <= 0;
      _source_stream_matmul_5_source_20_pat_count_1 <= 0;
      _source_stream_matmul_5_source_20_pat_count_2 <= 0;
      _source_stream_matmul_5_source_20_pat_count_3 <= 0;
      _source_stream_matmul_5_source_20_pat_size_buf_0 <= 0;
      _source_stream_matmul_5_source_20_pat_size_buf_1 <= 0;
      _source_stream_matmul_5_source_20_pat_size_buf_2 <= 0;
      _source_stream_matmul_5_source_20_pat_size_buf_3 <= 0;
      _source_stream_matmul_5_source_20_pat_stride_buf_0 <= 0;
      _source_stream_matmul_5_source_20_pat_stride_buf_1 <= 0;
      _source_stream_matmul_5_source_20_pat_stride_buf_2 <= 0;
      _source_stream_matmul_5_source_20_pat_stride_buf_3 <= 0;
      __variable_wdata_290 <= 0;
      _stream_matmul_5_source_20_source_ram_raddr <= 0;
      _stream_matmul_5_source_21_source_mode <= 5'b0;
      _stream_matmul_5_source_21_source_offset <= 0;
      _source_stream_matmul_5_source_21_pat_size_0 <= 0;
      _source_stream_matmul_5_source_21_pat_stride_0 <= 0;
      _source_stream_matmul_5_source_21_pat_size_1 <= 0;
      _source_stream_matmul_5_source_21_pat_stride_1 <= 0;
      _source_stream_matmul_5_source_21_pat_size_2 <= 0;
      _source_stream_matmul_5_source_21_pat_stride_2 <= 0;
      _source_stream_matmul_5_source_21_pat_size_3 <= 0;
      _source_stream_matmul_5_source_21_pat_stride_3 <= 0;
      _stream_matmul_5_source_21_source_sel <= 0;
      _stream_matmul_5_source_21_source_offset_buf <= 0;
      _source_stream_matmul_5_source_21_pat_cur_offset_0 <= 0;
      _source_stream_matmul_5_source_21_pat_cur_offset_1 <= 0;
      _source_stream_matmul_5_source_21_pat_cur_offset_2 <= 0;
      _source_stream_matmul_5_source_21_pat_cur_offset_3 <= 0;
      _source_stream_matmul_5_source_21_pat_count_0 <= 0;
      _source_stream_matmul_5_source_21_pat_count_1 <= 0;
      _source_stream_matmul_5_source_21_pat_count_2 <= 0;
      _source_stream_matmul_5_source_21_pat_count_3 <= 0;
      _source_stream_matmul_5_source_21_pat_size_buf_0 <= 0;
      _source_stream_matmul_5_source_21_pat_size_buf_1 <= 0;
      _source_stream_matmul_5_source_21_pat_size_buf_2 <= 0;
      _source_stream_matmul_5_source_21_pat_size_buf_3 <= 0;
      _source_stream_matmul_5_source_21_pat_stride_buf_0 <= 0;
      _source_stream_matmul_5_source_21_pat_stride_buf_1 <= 0;
      _source_stream_matmul_5_source_21_pat_stride_buf_2 <= 0;
      _source_stream_matmul_5_source_21_pat_stride_buf_3 <= 0;
      __variable_wdata_311 <= 0;
      _stream_matmul_5_source_21_source_ram_raddr <= 0;
      _stream_matmul_5_source_22_source_mode <= 5'b0;
      _stream_matmul_5_source_22_source_offset <= 0;
      _source_stream_matmul_5_source_22_pat_size_0 <= 0;
      _source_stream_matmul_5_source_22_pat_stride_0 <= 0;
      _source_stream_matmul_5_source_22_pat_size_1 <= 0;
      _source_stream_matmul_5_source_22_pat_stride_1 <= 0;
      _source_stream_matmul_5_source_22_pat_size_2 <= 0;
      _source_stream_matmul_5_source_22_pat_stride_2 <= 0;
      _source_stream_matmul_5_source_22_pat_size_3 <= 0;
      _source_stream_matmul_5_source_22_pat_stride_3 <= 0;
      _stream_matmul_5_source_22_source_sel <= 0;
      _stream_matmul_5_source_22_source_offset_buf <= 0;
      _source_stream_matmul_5_source_22_pat_cur_offset_0 <= 0;
      _source_stream_matmul_5_source_22_pat_cur_offset_1 <= 0;
      _source_stream_matmul_5_source_22_pat_cur_offset_2 <= 0;
      _source_stream_matmul_5_source_22_pat_cur_offset_3 <= 0;
      _source_stream_matmul_5_source_22_pat_count_0 <= 0;
      _source_stream_matmul_5_source_22_pat_count_1 <= 0;
      _source_stream_matmul_5_source_22_pat_count_2 <= 0;
      _source_stream_matmul_5_source_22_pat_count_3 <= 0;
      _source_stream_matmul_5_source_22_pat_size_buf_0 <= 0;
      _source_stream_matmul_5_source_22_pat_size_buf_1 <= 0;
      _source_stream_matmul_5_source_22_pat_size_buf_2 <= 0;
      _source_stream_matmul_5_source_22_pat_size_buf_3 <= 0;
      _source_stream_matmul_5_source_22_pat_stride_buf_0 <= 0;
      _source_stream_matmul_5_source_22_pat_stride_buf_1 <= 0;
      _source_stream_matmul_5_source_22_pat_stride_buf_2 <= 0;
      _source_stream_matmul_5_source_22_pat_stride_buf_3 <= 0;
      __variable_wdata_312 <= 0;
      _stream_matmul_5_source_22_source_ram_raddr <= 0;
      _tmp_265 <= 0;
      _tmp_266 <= 0;
      _tmp_267 <= 0;
      _tmp_268 <= 0;
      _tmp_269 <= 0;
      _tmp_270 <= 0;
      _tmp_271 <= 0;
      _tmp_272 <= 0;
      _tmp_273 <= 0;
      _tmp_274 <= 0;
      _tmp_275 <= 0;
      _tmp_276 <= 0;
      _tmp_277 <= 0;
      _tmp_278 <= 0;
      _tmp_279 <= 0;
      _tmp_280 <= 0;
      _tmp_281 <= 0;
      _tmp_282 <= 0;
      _tmp_283 <= 0;
      _tmp_284 <= 0;
      _tmp_285 <= 0;
      _tmp_286 <= 0;
      _tmp_287 <= 0;
      _tmp_288 <= 0;
      _tmp_289 <= 0;
      _tmp_290 <= 0;
      _tmp_291 <= 0;
      _tmp_292 <= 0;
      _tmp_293 <= 0;
      _tmp_294 <= 0;
      _tmp_295 <= 0;
      _tmp_296 <= 0;
      _tmp_297 <= 0;
      _tmp_298 <= 0;
      _tmp_301 <= 0;
      _tmp_302 <= 0;
      _tmp_303 <= 0;
      _tmp_304 <= 0;
      _tmp_305 <= 0;
      _tmp_306 <= 0;
      _tmp_307 <= 0;
      _tmp_308 <= 0;
      _tmp_309 <= 0;
      _tmp_310 <= 0;
      _tmp_311 <= 0;
      _tmp_312 <= 0;
      _tmp_313 <= 0;
      _tmp_314 <= 0;
      _tmp_315 <= 0;
      _tmp_316 <= 0;
      _tmp_317 <= 0;
      _tmp_318 <= 0;
      _tmp_319 <= 0;
      _tmp_320 <= 0;
      _tmp_321 <= 0;
      _tmp_322 <= 0;
      _tmp_323 <= 0;
      _tmp_324 <= 0;
      _tmp_325 <= 0;
      _tmp_326 <= 0;
      _tmp_327 <= 0;
      _tmp_328 <= 0;
      _tmp_329 <= 0;
      _tmp_330 <= 0;
      _tmp_331 <= 0;
      _tmp_332 <= 0;
      _tmp_333 <= 0;
      _tmp_334 <= 0;
      _tmp_335 <= 0;
      _tmp_336 <= 0;
      _tmp_337 <= 0;
      _tmp_338 <= 0;
      _tmp_339 <= 0;
      _tmp_340 <= 0;
      _tmp_341 <= 0;
      _tmp_342 <= 0;
      _tmp_343 <= 0;
      _tmp_344 <= 0;
      _tmp_345 <= 0;
      _tmp_346 <= 0;
      _tmp_347 <= 0;
      _tmp_348 <= 0;
      _tmp_349 <= 0;
      _tmp_350 <= 0;
      _tmp_351 <= 0;
      _tmp_352 <= 0;
      _tmp_353 <= 0;
      _tmp_354 <= 0;
      _tmp_355 <= 0;
      _tmp_356 <= 0;
      _tmp_357 <= 0;
      _tmp_358 <= 0;
      _tmp_359 <= 0;
      _tmp_360 <= 0;
      _tmp_361 <= 0;
      _tmp_362 <= 0;
      _tmp_363 <= 0;
      _tmp_364 <= 0;
      _tmp_365 <= 0;
      _tmp_366 <= 0;
      _tmp_367 <= 0;
      _tmp_368 <= 0;
      _stream_matmul_5_sink_33_sink_mode <= 5'b0;
      _stream_matmul_5_sink_33_sink_offset <= 0;
      _stream_matmul_5_sink_33_sink_size <= 0;
      _stream_matmul_5_sink_33_sink_stride <= 0;
      _stream_matmul_5_sink_33_sink_sel <= 0;
      _stream_matmul_5_sink_33_sink_offset_buf <= 0;
      _stream_matmul_5_sink_33_sink_size_buf <= 0;
      _stream_matmul_5_sink_33_sink_stride_buf <= 0;
      _stream_matmul_5_sink_33_sink_waddr <= 0;
      _stream_matmul_5_sink_33_sink_count <= 0;
      _stream_matmul_5_sink_33_sink_wdata <= 0;
      _tmp_664 <= 0;
      _tmp_665 <= 0;
      _tmp_666 <= 0;
      _tmp_667 <= 0;
      _tmp_668 <= 0;
      _tmp_669 <= 0;
      __variable_wdata_210 <= 0;
      _tmp_670 <= 0;
      _tmp_671 <= 0;
      _tmp_672 <= 0;
      _tmp_673 <= 0;
      _tmp_676 <= 0;
      _tmp_679 <= 0;
      _tmp_680 <= 0;
      _tmp_681 <= 0;
      _tmp_682 <= 0;
      _tmp_683 <= 0;
      _tmp_684 <= 0;
      _tmp_685 <= 0;
      _tmp_686 <= 0;
      _tmp_687 <= 0;
      _tmp_688 <= 0;
      _tmp_689 <= 0;
      _tmp_690 <= 0;
      _tmp_691 <= 0;
      _tmp_692 <= 0;
      _tmp_693 <= 0;
      _tmp_694 <= 0;
      _tmp_695 <= 0;
      _tmp_696 <= 0;
      _tmp_697 <= 0;
      _tmp_698 <= 0;
      _tmp_699 <= 0;
      _tmp_700 <= 0;
      _tmp_701 <= 0;
      _tmp_702 <= 0;
      _tmp_703 <= 0;
      _tmp_704 <= 0;
      _tmp_705 <= 0;
      _tmp_706 <= 0;
      _tmp_707 <= 0;
      _tmp_708 <= 0;
      _tmp_709 <= 0;
      _tmp_710 <= 0;
      _tmp_711 <= 0;
      _tmp_712 <= 0;
      _tmp_713 <= 0;
      _tmp_714 <= 0;
      _tmp_715 <= 0;
      _tmp_716 <= 0;
      _tmp_717 <= 0;
      _tmp_718 <= 0;
      _tmp_719 <= 0;
      _tmp_720 <= 0;
      _tmp_721 <= 0;
      _tmp_722 <= 0;
      _tmp_723 <= 0;
      _tmp_724 <= 0;
      _tmp_725 <= 0;
      _tmp_726 <= 0;
      _tmp_727 <= 0;
      _tmp_728 <= 0;
      _tmp_729 <= 0;
      _tmp_730 <= 0;
      _tmp_731 <= 0;
      _tmp_732 <= 0;
      _tmp_733 <= 0;
      _tmp_734 <= 0;
      _tmp_735 <= 0;
      _tmp_736 <= 0;
      _tmp_737 <= 0;
      _tmp_738 <= 0;
      _tmp_739 <= 0;
      _tmp_740 <= 0;
      _tmp_741 <= 0;
      _tmp_742 <= 0;
      _tmp_743 <= 0;
      _tmp_744 <= 0;
      _tmp_745 <= 0;
      _tmp_746 <= 0;
      _tmp_747 <= 0;
      _tmp_748 <= 0;
      _tmp_749 <= 0;
      _tmp_750 <= 0;
      _tmp_751 <= 0;
      _tmp_752 <= 0;
      _tmp_753 <= 0;
      _tmp_754 <= 0;
      _tmp_755 <= 0;
      _tmp_756 <= 0;
      _tmp_757 <= 0;
      _tmp_758 <= 0;
      _tmp_759 <= 0;
      _tmp_760 <= 0;
      _tmp_761 <= 0;
      _tmp_762 <= 0;
      _tmp_763 <= 0;
      _tmp_764 <= 0;
      _tmp_765 <= 0;
      _tmp_766 <= 0;
      _tmp_767 <= 0;
      _tmp_768 <= 0;
      _tmp_769 <= 0;
      _tmp_770 <= 0;
      _tmp_771 <= 0;
      _tmp_772 <= 0;
      _tmp_773 <= 0;
      _tmp_774 <= 0;
      _tmp_775 <= 0;
      _tmp_776 <= 0;
      _tmp_777 <= 0;
      _tmp_778 <= 0;
      _tmp_779 <= 0;
      _tmp_780 <= 0;
      _tmp_781 <= 0;
      _tmp_782 <= 0;
      _stream_matmul_5_busy_reg <= 0;
    end else begin
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_7_source_ram_renable <= 0;
        _stream_matmul_5_source_7_source_fifo_deq <= 0;
      end 
      _stream_matmul_5_source_7_idle <= _stream_matmul_5_source_7_idle;
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_9_source_ram_renable <= 0;
        _stream_matmul_5_source_9_source_fifo_deq <= 0;
      end 
      _stream_matmul_5_source_9_idle <= _stream_matmul_5_source_9_idle;
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_11_source_ram_renable <= 0;
        _stream_matmul_5_source_11_source_fifo_deq <= 0;
      end 
      _stream_matmul_5_source_11_idle <= _stream_matmul_5_source_11_idle;
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_13_source_ram_renable <= 0;
        _stream_matmul_5_source_13_source_fifo_deq <= 0;
      end 
      _stream_matmul_5_source_13_idle <= _stream_matmul_5_source_13_idle;
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_15_source_ram_renable <= 0;
        _stream_matmul_5_source_15_source_fifo_deq <= 0;
      end 
      _stream_matmul_5_source_15_idle <= _stream_matmul_5_source_15_idle;
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_20_source_ram_renable <= 0;
        _stream_matmul_5_source_20_source_fifo_deq <= 0;
      end 
      _stream_matmul_5_source_20_idle <= _stream_matmul_5_source_20_idle;
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_21_source_ram_renable <= 0;
        _stream_matmul_5_source_21_source_fifo_deq <= 0;
      end 
      _stream_matmul_5_source_21_idle <= _stream_matmul_5_source_21_idle;
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_22_source_ram_renable <= 0;
        _stream_matmul_5_source_22_source_fifo_deq <= 0;
      end 
      _stream_matmul_5_source_22_idle <= _stream_matmul_5_source_22_idle;
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_sink_33_sink_wenable <= 0;
        _stream_matmul_5_sink_33_sink_fifo_enq <= 0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _stream_matmul_5_sink_34_sink_wenable <= 0;
        _stream_matmul_5_sink_34_sink_fifo_enq <= 0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_1 <= _stream_matmul_5_stream_ivalid;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_2 <= __stream_matmul_5_stream_ivalid_1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_3 <= __stream_matmul_5_stream_ivalid_2;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_4 <= __stream_matmul_5_stream_ivalid_3;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_5 <= __stream_matmul_5_stream_ivalid_4;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_6 <= __stream_matmul_5_stream_ivalid_5;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_7 <= __stream_matmul_5_stream_ivalid_6;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_8 <= __stream_matmul_5_stream_ivalid_7;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_9 <= __stream_matmul_5_stream_ivalid_8;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_10 <= __stream_matmul_5_stream_ivalid_9;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_11 <= __stream_matmul_5_stream_ivalid_10;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_12 <= __stream_matmul_5_stream_ivalid_11;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_13 <= __stream_matmul_5_stream_ivalid_12;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_14 <= __stream_matmul_5_stream_ivalid_13;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_15 <= __stream_matmul_5_stream_ivalid_14;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_16 <= __stream_matmul_5_stream_ivalid_15;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_17 <= __stream_matmul_5_stream_ivalid_16;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_18 <= __stream_matmul_5_stream_ivalid_17;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_19 <= __stream_matmul_5_stream_ivalid_18;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_20 <= __stream_matmul_5_stream_ivalid_19;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_21 <= __stream_matmul_5_stream_ivalid_20;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_22 <= __stream_matmul_5_stream_ivalid_21;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_23 <= __stream_matmul_5_stream_ivalid_22;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_24 <= __stream_matmul_5_stream_ivalid_23;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_25 <= __stream_matmul_5_stream_ivalid_24;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_26 <= __stream_matmul_5_stream_ivalid_25;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_27 <= __stream_matmul_5_stream_ivalid_26;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_28 <= __stream_matmul_5_stream_ivalid_27;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_29 <= __stream_matmul_5_stream_ivalid_28;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_30 <= __stream_matmul_5_stream_ivalid_29;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_31 <= __stream_matmul_5_stream_ivalid_30;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __stream_matmul_5_stream_ivalid_32 <= __stream_matmul_5_stream_ivalid_31;
      end 
      if(_stream_matmul_5_stream_ivalid && _stream_matmul_5_stream_oready && _counter_reset_cond_211) begin
        _counter_data_211 <= 1'sd0;
      end 
      if(_stream_matmul_5_stream_ivalid && _stream_matmul_5_stream_oready) begin
        _counter_data_211 <= _counter_current_count_211;
      end 
      if(_stream_matmul_5_stream_ivalid && _stream_matmul_5_stream_oready) begin
        _counter_count_211 <= (_counter_current_count_211 >= stream_matmul_5_parameter_0_data - 2'sd1)? _counter_current_count_211 + 2'sd1 - stream_matmul_5_parameter_0_data : _counter_current_count_211 + 2'sd1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _minus_data_216 <= stream_matmul_5_parameter_0_data - 2'sd1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _minus_data_222 <= stream_matmul_5_parameter_0_data - 2'sd1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _eq_data_291 <= stream_matmul_5_parameter_1_data == 1'sd0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _eq_data_295 <= stream_matmul_5_parameter_2_data == 1'sd0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_358 <= _cond_data_260 + stream_matmul_5_parameter_16_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_379 <= _cond_data_260 + stream_matmul_5_parameter_16_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_395 <= _cond_data_272 + stream_matmul_5_parameter_17_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_414 <= _cond_data_284 + stream_matmul_5_parameter_18_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _eq_data_420 <= stream_matmul_5_parameter_19_data == 1'sd0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _eq_data_423 <= stream_matmul_5_parameter_19_data == 2'sd1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_446 <= _cond_data_261 + stream_matmul_5_parameter_16_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_467 <= _cond_data_261 + stream_matmul_5_parameter_16_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_483 <= _cond_data_273 + stream_matmul_5_parameter_17_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_502 <= _cond_data_285 + stream_matmul_5_parameter_18_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _eq_data_508 <= stream_matmul_5_parameter_19_data == 1'sd0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _eq_data_511 <= stream_matmul_5_parameter_19_data == 2'sd1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_516_pointer_214 <= _pointer_data_214;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_518__variable_290 <= stream_matmul_5_source_20_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_521_pointer_337 <= _pointer_data_337;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_524_reinterpretcast_316 <= _reinterpretcast_data_316;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_529_pointer_220 <= _pointer_data_220;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_533_reinterpretcast_320 <= _reinterpretcast_data_320;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_538__variable_210 <= stream_matmul_5__reduce_reset_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_565__variable_205 <= stream_matmul_5_parameter_0_data;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_579_reinterpretcast_328 <= _reinterpretcast_data_328;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_584_reinterpretcast_332 <= _reinterpretcast_data_332;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_602_cond_237 <= _cond_data_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_622_cond_249 <= _cond_data_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_727_cond_236 <= _cond_data_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_747_cond_248 <= _cond_data_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _eq_data_218 <= _counter_data_211 == _minus_data_216;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _eq_data_224 <= _counter_data_211 == _minus_data_222;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_517__delay_516_pointer_214 <= __delay_data_516_pointer_214;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_519_reinterpretcast_302 <= _reinterpretcast_data_302;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_522__delay_521_pointer_337 <= __delay_data_521_pointer_337;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_525__delay_524_reinterpretcast_316 <= __delay_data_524_reinterpretcast_316;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_527_plus_358 <= _plus_data_358;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_530__delay_529_pointer_220 <= __delay_data_529_pointer_220;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_531_reinterpretcast_306 <= _reinterpretcast_data_306;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_534__delay_533_reinterpretcast_320 <= __delay_data_533_reinterpretcast_320;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_536_plus_379 <= _plus_data_379;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_539__delay_538__variable_210 <= __delay_data_538__variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_552_plus_395 <= _plus_data_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_566__delay_565__variable_205 <= __delay_data_565__variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_580__delay_579_reinterpretcast_328 <= __delay_data_579_reinterpretcast_328;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_582_plus_446 <= _plus_data_446;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_585__delay_584_reinterpretcast_332 <= __delay_data_584_reinterpretcast_332;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_587_plus_467 <= _plus_data_467;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_589_plus_483 <= _plus_data_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_603__delay_602_cond_237 <= __delay_data_602_cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_623__delay_622_cond_249 <= __delay_data_622_cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_643_plus_502 <= _plus_data_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_664_eq_508 <= _eq_data_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_696_eq_511 <= _eq_data_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_728__delay_727_cond_236 <= __delay_data_727_cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_748__delay_747_cond_248 <= __delay_data_747_cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_768_plus_414 <= _plus_data_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_789_eq_420 <= _eq_data_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_821_eq_423 <= _eq_data_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _land_data_219 <= __delay_data_517__delay_516_pointer_214 && _eq_data_218;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _land_data_225 <= __delay_data_530__delay_529_pointer_220 && _eq_data_224;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_520__delay_519_reinterpretcast_302 <= __delay_data_519_reinterpretcast_302;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_523__delay_522__delay_521_pointer_337 <= __delay_data_522__delay_521_pointer_337;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_526__delay_525__delay_524_reinterpretcast_316 <= __delay_data_525__delay_524_reinterpretcast_316;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_528__delay_527_plus_358 <= __delay_data_527_plus_358;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_532__delay_531_reinterpretcast_306 <= __delay_data_531_reinterpretcast_306;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_535__delay_534__delay_533_reinterpretcast_320 <= __delay_data_534__delay_533_reinterpretcast_320;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_537__delay_536_plus_379 <= __delay_data_536_plus_379;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_540__delay_539__delay_538__variable_210 <= __delay_data_539__delay_538__variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_553__delay_552_plus_395 <= __delay_data_552_plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_567__delay_566__delay_565__variable_205 <= __delay_data_566__delay_565__variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_581__delay_580__delay_579_reinterpretcast_328 <= __delay_data_580__delay_579_reinterpretcast_328;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_583__delay_582_plus_446 <= __delay_data_582_plus_446;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_586__delay_585__delay_584_reinterpretcast_332 <= __delay_data_585__delay_584_reinterpretcast_332;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_588__delay_587_plus_467 <= __delay_data_587_plus_467;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_590__delay_589_plus_483 <= __delay_data_589_plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_604__delay_603__delay_602_cond_237 <= __delay_data_603__delay_602_cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_624__delay_623__delay_622_cond_249 <= __delay_data_623__delay_622_cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_644__delay_643_plus_502 <= __delay_data_643_plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_665__delay_664_eq_508 <= __delay_data_664_eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_697__delay_696_eq_511 <= __delay_data_696_eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_729__delay_728__delay_727_cond_236 <= __delay_data_728__delay_727_cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_749__delay_748__delay_747_cond_248 <= __delay_data_748__delay_747_cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_769__delay_768_plus_414 <= __delay_data_768_plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_790__delay_789_eq_420 <= __delay_data_789_eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_822__delay_821_eq_423 <= __delay_data_821_eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_541__delay_540__delay_539____variable_210 <= __delay_data_540__delay_539__delay_538__variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_554__delay_553__delay_552_plus_395 <= __delay_data_553__delay_552_plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_568__delay_567__delay_566____variable_205 <= __delay_data_567__delay_566__delay_565__variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_591__delay_590__delay_589_plus_483 <= __delay_data_590__delay_589_plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_605__delay_604__delay_603__delay_602_cond_237 <= __delay_data_604__delay_603__delay_602_cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_625__delay_624__delay_623__delay_622_cond_249 <= __delay_data_624__delay_623__delay_622_cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_645__delay_644__delay_643_plus_502 <= __delay_data_644__delay_643_plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_666__delay_665__delay_664_eq_508 <= __delay_data_665__delay_664_eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_698__delay_697__delay_696_eq_511 <= __delay_data_697__delay_696_eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_730__delay_729__delay_728__delay_727_cond_236 <= __delay_data_729__delay_728__delay_727_cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_750__delay_749__delay_748__delay_747_cond_248 <= __delay_data_749__delay_748__delay_747_cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_770__delay_769__delay_768_plus_414 <= __delay_data_769__delay_768_plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_791__delay_790__delay_789_eq_420 <= __delay_data_790__delay_789_eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_823__delay_822__delay_821_eq_423 <= __delay_data_822__delay_821_eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_542__delay_541__delay_540____variable_210 <= __delay_data_541__delay_540__delay_539____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_555__delay_554__delay_553__delay_552_plus_395 <= __delay_data_554__delay_553__delay_552_plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_569__delay_568__delay_567____variable_205 <= __delay_data_568__delay_567__delay_566____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_592__delay_591__delay_590__delay_589_plus_483 <= __delay_data_591__delay_590__delay_589_plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_606__delay_605__delay_604__delay_603___cond_237 <= __delay_data_605__delay_604__delay_603__delay_602_cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_626__delay_625__delay_624__delay_623___cond_249 <= __delay_data_625__delay_624__delay_623__delay_622_cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_646__delay_645__delay_644__delay_643_plus_502 <= __delay_data_645__delay_644__delay_643_plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_667__delay_666__delay_665__delay_664_eq_508 <= __delay_data_666__delay_665__delay_664_eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_699__delay_698__delay_697__delay_696_eq_511 <= __delay_data_698__delay_697__delay_696_eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_731__delay_730__delay_729__delay_728___cond_236 <= __delay_data_730__delay_729__delay_728__delay_727_cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_751__delay_750__delay_749__delay_748___cond_248 <= __delay_data_750__delay_749__delay_748__delay_747_cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_771__delay_770__delay_769__delay_768_plus_414 <= __delay_data_770__delay_769__delay_768_plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_792__delay_791__delay_790__delay_789_eq_420 <= __delay_data_791__delay_790__delay_789_eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_824__delay_823__delay_822__delay_821_eq_423 <= __delay_data_823__delay_822__delay_821_eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_543__delay_542__delay_541____variable_210 <= __delay_data_542__delay_541__delay_540____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_556__delay_555__delay_554__delay_553___plus_395 <= __delay_data_555__delay_554__delay_553__delay_552_plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_570__delay_569__delay_568____variable_205 <= __delay_data_569__delay_568__delay_567____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_593__delay_592__delay_591__delay_590___plus_483 <= __delay_data_592__delay_591__delay_590__delay_589_plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_607__delay_606__delay_605__delay_604___cond_237 <= __delay_data_606__delay_605__delay_604__delay_603___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_627__delay_626__delay_625__delay_624___cond_249 <= __delay_data_626__delay_625__delay_624__delay_623___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_647__delay_646__delay_645__delay_644___plus_502 <= __delay_data_646__delay_645__delay_644__delay_643_plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_668__delay_667__delay_666__delay_665___eq_508 <= __delay_data_667__delay_666__delay_665__delay_664_eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_700__delay_699__delay_698__delay_697___eq_511 <= __delay_data_699__delay_698__delay_697__delay_696_eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_732__delay_731__delay_730__delay_729___cond_236 <= __delay_data_731__delay_730__delay_729__delay_728___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_752__delay_751__delay_750__delay_749___cond_248 <= __delay_data_751__delay_750__delay_749__delay_748___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_772__delay_771__delay_770__delay_769___plus_414 <= __delay_data_771__delay_770__delay_769__delay_768_plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_793__delay_792__delay_791__delay_790___eq_420 <= __delay_data_792__delay_791__delay_790__delay_789_eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_825__delay_824__delay_823__delay_822___eq_423 <= __delay_data_824__delay_823__delay_822__delay_821_eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_544__delay_543__delay_542____variable_210 <= __delay_data_543__delay_542__delay_541____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_557__delay_556__delay_555__delay_554___plus_395 <= __delay_data_556__delay_555__delay_554__delay_553___plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_571__delay_570__delay_569____variable_205 <= __delay_data_570__delay_569__delay_568____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_594__delay_593__delay_592__delay_591___plus_483 <= __delay_data_593__delay_592__delay_591__delay_590___plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_608__delay_607__delay_606__delay_605___cond_237 <= __delay_data_607__delay_606__delay_605__delay_604___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_628__delay_627__delay_626__delay_625___cond_249 <= __delay_data_627__delay_626__delay_625__delay_624___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_648__delay_647__delay_646__delay_645___plus_502 <= __delay_data_647__delay_646__delay_645__delay_644___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_669__delay_668__delay_667__delay_666___eq_508 <= __delay_data_668__delay_667__delay_666__delay_665___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_701__delay_700__delay_699__delay_698___eq_511 <= __delay_data_700__delay_699__delay_698__delay_697___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_733__delay_732__delay_731__delay_730___cond_236 <= __delay_data_732__delay_731__delay_730__delay_729___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_753__delay_752__delay_751__delay_750___cond_248 <= __delay_data_752__delay_751__delay_750__delay_749___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_773__delay_772__delay_771__delay_770___plus_414 <= __delay_data_772__delay_771__delay_770__delay_769___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_794__delay_793__delay_792__delay_791___eq_420 <= __delay_data_793__delay_792__delay_791__delay_790___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_826__delay_825__delay_824__delay_823___eq_423 <= __delay_data_825__delay_824__delay_823__delay_822___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_545__delay_544__delay_543____variable_210 <= __delay_data_544__delay_543__delay_542____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_558__delay_557__delay_556__delay_555___plus_395 <= __delay_data_557__delay_556__delay_555__delay_554___plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_572__delay_571__delay_570____variable_205 <= __delay_data_571__delay_570__delay_569____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_595__delay_594__delay_593__delay_592___plus_483 <= __delay_data_594__delay_593__delay_592__delay_591___plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_609__delay_608__delay_607__delay_606___cond_237 <= __delay_data_608__delay_607__delay_606__delay_605___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_629__delay_628__delay_627__delay_626___cond_249 <= __delay_data_628__delay_627__delay_626__delay_625___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_649__delay_648__delay_647__delay_646___plus_502 <= __delay_data_648__delay_647__delay_646__delay_645___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_670__delay_669__delay_668__delay_667___eq_508 <= __delay_data_669__delay_668__delay_667__delay_666___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_702__delay_701__delay_700__delay_699___eq_511 <= __delay_data_701__delay_700__delay_699__delay_698___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_734__delay_733__delay_732__delay_731___cond_236 <= __delay_data_733__delay_732__delay_731__delay_730___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_754__delay_753__delay_752__delay_751___cond_248 <= __delay_data_753__delay_752__delay_751__delay_750___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_774__delay_773__delay_772__delay_771___plus_414 <= __delay_data_773__delay_772__delay_771__delay_770___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_795__delay_794__delay_793__delay_792___eq_420 <= __delay_data_794__delay_793__delay_792__delay_791___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_827__delay_826__delay_825__delay_824___eq_423 <= __delay_data_826__delay_825__delay_824__delay_823___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_546__delay_545__delay_544____variable_210 <= __delay_data_545__delay_544__delay_543____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_559__delay_558__delay_557__delay_556___plus_395 <= __delay_data_558__delay_557__delay_556__delay_555___plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_573__delay_572__delay_571____variable_205 <= __delay_data_572__delay_571__delay_570____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_596__delay_595__delay_594__delay_593___plus_483 <= __delay_data_595__delay_594__delay_593__delay_592___plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_610__delay_609__delay_608__delay_607___cond_237 <= __delay_data_609__delay_608__delay_607__delay_606___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_630__delay_629__delay_628__delay_627___cond_249 <= __delay_data_629__delay_628__delay_627__delay_626___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_650__delay_649__delay_648__delay_647___plus_502 <= __delay_data_649__delay_648__delay_647__delay_646___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_671__delay_670__delay_669__delay_668___eq_508 <= __delay_data_670__delay_669__delay_668__delay_667___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_703__delay_702__delay_701__delay_700___eq_511 <= __delay_data_702__delay_701__delay_700__delay_699___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_735__delay_734__delay_733__delay_732___cond_236 <= __delay_data_734__delay_733__delay_732__delay_731___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_755__delay_754__delay_753__delay_752___cond_248 <= __delay_data_754__delay_753__delay_752__delay_751___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_775__delay_774__delay_773__delay_772___plus_414 <= __delay_data_774__delay_773__delay_772__delay_771___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_796__delay_795__delay_794__delay_793___eq_420 <= __delay_data_795__delay_794__delay_793__delay_792___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_828__delay_827__delay_826__delay_825___eq_423 <= __delay_data_827__delay_826__delay_825__delay_824___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_547__delay_546__delay_545____variable_210 <= __delay_data_546__delay_545__delay_544____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_560__delay_559__delay_558__delay_557___plus_395 <= __delay_data_559__delay_558__delay_557__delay_556___plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_574__delay_573__delay_572____variable_205 <= __delay_data_573__delay_572__delay_571____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_597__delay_596__delay_595__delay_594___plus_483 <= __delay_data_596__delay_595__delay_594__delay_593___plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_611__delay_610__delay_609__delay_608___cond_237 <= __delay_data_610__delay_609__delay_608__delay_607___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_631__delay_630__delay_629__delay_628___cond_249 <= __delay_data_630__delay_629__delay_628__delay_627___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_651__delay_650__delay_649__delay_648___plus_502 <= __delay_data_650__delay_649__delay_648__delay_647___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_672__delay_671__delay_670__delay_669___eq_508 <= __delay_data_671__delay_670__delay_669__delay_668___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_704__delay_703__delay_702__delay_701___eq_511 <= __delay_data_703__delay_702__delay_701__delay_700___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_736__delay_735__delay_734__delay_733___cond_236 <= __delay_data_735__delay_734__delay_733__delay_732___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_756__delay_755__delay_754__delay_753___cond_248 <= __delay_data_755__delay_754__delay_753__delay_752___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_776__delay_775__delay_774__delay_773___plus_414 <= __delay_data_775__delay_774__delay_773__delay_772___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_797__delay_796__delay_795__delay_794___eq_420 <= __delay_data_796__delay_795__delay_794__delay_793___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_829__delay_828__delay_827__delay_826___eq_423 <= __delay_data_828__delay_827__delay_826__delay_825___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_548__delay_547__delay_546____variable_210 <= __delay_data_547__delay_546__delay_545____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_561__delay_560__delay_559__delay_558___plus_395 <= __delay_data_560__delay_559__delay_558__delay_557___plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_575__delay_574__delay_573____variable_205 <= __delay_data_574__delay_573__delay_572____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_598__delay_597__delay_596__delay_595___plus_483 <= __delay_data_597__delay_596__delay_595__delay_594___plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_612__delay_611__delay_610__delay_609___cond_237 <= __delay_data_611__delay_610__delay_609__delay_608___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_632__delay_631__delay_630__delay_629___cond_249 <= __delay_data_631__delay_630__delay_629__delay_628___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_652__delay_651__delay_650__delay_649___plus_502 <= __delay_data_651__delay_650__delay_649__delay_648___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_673__delay_672__delay_671__delay_670___eq_508 <= __delay_data_672__delay_671__delay_670__delay_669___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_705__delay_704__delay_703__delay_702___eq_511 <= __delay_data_704__delay_703__delay_702__delay_701___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_737__delay_736__delay_735__delay_734___cond_236 <= __delay_data_736__delay_735__delay_734__delay_733___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_757__delay_756__delay_755__delay_754___cond_248 <= __delay_data_756__delay_755__delay_754__delay_753___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_777__delay_776__delay_775__delay_774___plus_414 <= __delay_data_776__delay_775__delay_774__delay_773___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_798__delay_797__delay_796__delay_795___eq_420 <= __delay_data_797__delay_796__delay_795__delay_794___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_830__delay_829__delay_828__delay_827___eq_423 <= __delay_data_829__delay_828__delay_827__delay_826___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_549__delay_548__delay_547____variable_210 <= __delay_data_548__delay_547__delay_546____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_562__delay_561__delay_560__delay_559___plus_395 <= __delay_data_561__delay_560__delay_559__delay_558___plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_576__delay_575__delay_574____variable_205 <= __delay_data_575__delay_574__delay_573____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_599__delay_598__delay_597__delay_596___plus_483 <= __delay_data_598__delay_597__delay_596__delay_595___plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_613__delay_612__delay_611__delay_610___cond_237 <= __delay_data_612__delay_611__delay_610__delay_609___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_633__delay_632__delay_631__delay_630___cond_249 <= __delay_data_632__delay_631__delay_630__delay_629___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_653__delay_652__delay_651__delay_650___plus_502 <= __delay_data_652__delay_651__delay_650__delay_649___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_674__delay_673__delay_672__delay_671___eq_508 <= __delay_data_673__delay_672__delay_671__delay_670___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_706__delay_705__delay_704__delay_703___eq_511 <= __delay_data_705__delay_704__delay_703__delay_702___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_738__delay_737__delay_736__delay_735___cond_236 <= __delay_data_737__delay_736__delay_735__delay_734___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_758__delay_757__delay_756__delay_755___cond_248 <= __delay_data_757__delay_756__delay_755__delay_754___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_778__delay_777__delay_776__delay_775___plus_414 <= __delay_data_777__delay_776__delay_775__delay_774___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_799__delay_798__delay_797__delay_796___eq_420 <= __delay_data_798__delay_797__delay_796__delay_795___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_831__delay_830__delay_829__delay_828___eq_423 <= __delay_data_830__delay_829__delay_828__delay_827___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_550__delay_549__delay_548____variable_210 <= __delay_data_549__delay_548__delay_547____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_563__delay_562__delay_561__delay_560___plus_395 <= __delay_data_562__delay_561__delay_560__delay_559___plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_577__delay_576__delay_575____variable_205 <= __delay_data_576__delay_575__delay_574____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_600__delay_599__delay_598__delay_597___plus_483 <= __delay_data_599__delay_598__delay_597__delay_596___plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_614__delay_613__delay_612__delay_611___cond_237 <= __delay_data_613__delay_612__delay_611__delay_610___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_634__delay_633__delay_632__delay_631___cond_249 <= __delay_data_633__delay_632__delay_631__delay_630___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_654__delay_653__delay_652__delay_651___plus_502 <= __delay_data_653__delay_652__delay_651__delay_650___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_675__delay_674__delay_673__delay_672___eq_508 <= __delay_data_674__delay_673__delay_672__delay_671___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_707__delay_706__delay_705__delay_704___eq_511 <= __delay_data_706__delay_705__delay_704__delay_703___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_739__delay_738__delay_737__delay_736___cond_236 <= __delay_data_738__delay_737__delay_736__delay_735___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_759__delay_758__delay_757__delay_756___cond_248 <= __delay_data_758__delay_757__delay_756__delay_755___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_779__delay_778__delay_777__delay_776___plus_414 <= __delay_data_778__delay_777__delay_776__delay_775___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_800__delay_799__delay_798__delay_797___eq_420 <= __delay_data_799__delay_798__delay_797__delay_796___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_832__delay_831__delay_830__delay_829___eq_423 <= __delay_data_831__delay_830__delay_829__delay_828___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_551__delay_550__delay_549____variable_210 <= __delay_data_550__delay_549__delay_548____variable_210;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_564__delay_563__delay_562__delay_561___plus_395 <= __delay_data_563__delay_562__delay_561__delay_560___plus_395;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_578__delay_577__delay_576____variable_205 <= __delay_data_577__delay_576__delay_575____variable_205;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_601__delay_600__delay_599__delay_598___plus_483 <= __delay_data_600__delay_599__delay_598__delay_597___plus_483;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_615__delay_614__delay_613__delay_612___cond_237 <= __delay_data_614__delay_613__delay_612__delay_611___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_635__delay_634__delay_633__delay_632___cond_249 <= __delay_data_634__delay_633__delay_632__delay_631___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_655__delay_654__delay_653__delay_652___plus_502 <= __delay_data_654__delay_653__delay_652__delay_651___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_676__delay_675__delay_674__delay_673___eq_508 <= __delay_data_675__delay_674__delay_673__delay_672___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_708__delay_707__delay_706__delay_705___eq_511 <= __delay_data_707__delay_706__delay_705__delay_704___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_740__delay_739__delay_738__delay_737___cond_236 <= __delay_data_739__delay_738__delay_737__delay_736___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_760__delay_759__delay_758__delay_757___cond_248 <= __delay_data_759__delay_758__delay_757__delay_756___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_780__delay_779__delay_778__delay_777___plus_414 <= __delay_data_779__delay_778__delay_777__delay_776___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_801__delay_800__delay_799__delay_798___eq_420 <= __delay_data_800__delay_799__delay_798__delay_797___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_833__delay_832__delay_831__delay_830___eq_423 <= __delay_data_832__delay_831__delay_830__delay_829___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_616__delay_615__delay_614__delay_613___cond_237 <= __delay_data_615__delay_614__delay_613__delay_612___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_636__delay_635__delay_634__delay_633___cond_249 <= __delay_data_635__delay_634__delay_633__delay_632___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_656__delay_655__delay_654__delay_653___plus_502 <= __delay_data_655__delay_654__delay_653__delay_652___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_677__delay_676__delay_675__delay_674___eq_508 <= __delay_data_676__delay_675__delay_674__delay_673___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_709__delay_708__delay_707__delay_706___eq_511 <= __delay_data_708__delay_707__delay_706__delay_705___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_741__delay_740__delay_739__delay_738___cond_236 <= __delay_data_740__delay_739__delay_738__delay_737___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_761__delay_760__delay_759__delay_758___cond_248 <= __delay_data_760__delay_759__delay_758__delay_757___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_781__delay_780__delay_779__delay_778___plus_414 <= __delay_data_780__delay_779__delay_778__delay_777___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_802__delay_801__delay_800__delay_799___eq_420 <= __delay_data_801__delay_800__delay_799__delay_798___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_834__delay_833__delay_832__delay_831___eq_423 <= __delay_data_833__delay_832__delay_831__delay_830___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_617__delay_616__delay_615__delay_614___cond_237 <= __delay_data_616__delay_615__delay_614__delay_613___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_637__delay_636__delay_635__delay_634___cond_249 <= __delay_data_636__delay_635__delay_634__delay_633___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_657__delay_656__delay_655__delay_654___plus_502 <= __delay_data_656__delay_655__delay_654__delay_653___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_678__delay_677__delay_676__delay_675___eq_508 <= __delay_data_677__delay_676__delay_675__delay_674___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_710__delay_709__delay_708__delay_707___eq_511 <= __delay_data_709__delay_708__delay_707__delay_706___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_742__delay_741__delay_740__delay_739___cond_236 <= __delay_data_741__delay_740__delay_739__delay_738___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_762__delay_761__delay_760__delay_759___cond_248 <= __delay_data_761__delay_760__delay_759__delay_758___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_782__delay_781__delay_780__delay_779___plus_414 <= __delay_data_781__delay_780__delay_779__delay_778___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_803__delay_802__delay_801__delay_800___eq_420 <= __delay_data_802__delay_801__delay_800__delay_799___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_835__delay_834__delay_833__delay_832___eq_423 <= __delay_data_834__delay_833__delay_832__delay_831___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_618__delay_617__delay_616__delay_615___cond_237 <= __delay_data_617__delay_616__delay_615__delay_614___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_638__delay_637__delay_636__delay_635___cond_249 <= __delay_data_637__delay_636__delay_635__delay_634___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_658__delay_657__delay_656__delay_655___plus_502 <= __delay_data_657__delay_656__delay_655__delay_654___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_679__delay_678__delay_677__delay_676___eq_508 <= __delay_data_678__delay_677__delay_676__delay_675___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_711__delay_710__delay_709__delay_708___eq_511 <= __delay_data_710__delay_709__delay_708__delay_707___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_743__delay_742__delay_741__delay_740___cond_236 <= __delay_data_742__delay_741__delay_740__delay_739___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_763__delay_762__delay_761__delay_760___cond_248 <= __delay_data_762__delay_761__delay_760__delay_759___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_783__delay_782__delay_781__delay_780___plus_414 <= __delay_data_782__delay_781__delay_780__delay_779___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_804__delay_803__delay_802__delay_801___eq_420 <= __delay_data_803__delay_802__delay_801__delay_800___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_836__delay_835__delay_834__delay_833___eq_423 <= __delay_data_835__delay_834__delay_833__delay_832___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_619__delay_618__delay_617__delay_616___cond_237 <= __delay_data_618__delay_617__delay_616__delay_615___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_639__delay_638__delay_637__delay_636___cond_249 <= __delay_data_638__delay_637__delay_636__delay_635___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_659__delay_658__delay_657__delay_656___plus_502 <= __delay_data_658__delay_657__delay_656__delay_655___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_680__delay_679__delay_678__delay_677___eq_508 <= __delay_data_679__delay_678__delay_677__delay_676___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_712__delay_711__delay_710__delay_709___eq_511 <= __delay_data_711__delay_710__delay_709__delay_708___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_744__delay_743__delay_742__delay_741___cond_236 <= __delay_data_743__delay_742__delay_741__delay_740___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_764__delay_763__delay_762__delay_761___cond_248 <= __delay_data_763__delay_762__delay_761__delay_760___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_784__delay_783__delay_782__delay_781___plus_414 <= __delay_data_783__delay_782__delay_781__delay_780___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_805__delay_804__delay_803__delay_802___eq_420 <= __delay_data_804__delay_803__delay_802__delay_801___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_837__delay_836__delay_835__delay_834___eq_423 <= __delay_data_836__delay_835__delay_834__delay_833___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_620__delay_619__delay_618__delay_617___cond_237 <= __delay_data_619__delay_618__delay_617__delay_616___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_640__delay_639__delay_638__delay_637___cond_249 <= __delay_data_639__delay_638__delay_637__delay_636___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_660__delay_659__delay_658__delay_657___plus_502 <= __delay_data_659__delay_658__delay_657__delay_656___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_681__delay_680__delay_679__delay_678___eq_508 <= __delay_data_680__delay_679__delay_678__delay_677___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_713__delay_712__delay_711__delay_710___eq_511 <= __delay_data_712__delay_711__delay_710__delay_709___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_745__delay_744__delay_743__delay_742___cond_236 <= __delay_data_744__delay_743__delay_742__delay_741___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_765__delay_764__delay_763__delay_762___cond_248 <= __delay_data_764__delay_763__delay_762__delay_761___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_785__delay_784__delay_783__delay_782___plus_414 <= __delay_data_784__delay_783__delay_782__delay_781___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_806__delay_805__delay_804__delay_803___eq_420 <= __delay_data_805__delay_804__delay_803__delay_802___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_838__delay_837__delay_836__delay_835___eq_423 <= __delay_data_837__delay_836__delay_835__delay_834___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_621__delay_620__delay_619__delay_618___cond_237 <= __delay_data_620__delay_619__delay_618__delay_617___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_641__delay_640__delay_639__delay_638___cond_249 <= __delay_data_640__delay_639__delay_638__delay_637___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_661__delay_660__delay_659__delay_658___plus_502 <= __delay_data_660__delay_659__delay_658__delay_657___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_682__delay_681__delay_680__delay_679___eq_508 <= __delay_data_681__delay_680__delay_679__delay_678___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_714__delay_713__delay_712__delay_711___eq_511 <= __delay_data_713__delay_712__delay_711__delay_710___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_746__delay_745__delay_744__delay_743___cond_236 <= __delay_data_745__delay_744__delay_743__delay_742___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_766__delay_765__delay_764__delay_763___cond_248 <= __delay_data_765__delay_764__delay_763__delay_762___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_786__delay_785__delay_784__delay_783___plus_414 <= __delay_data_785__delay_784__delay_783__delay_782___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_807__delay_806__delay_805__delay_804___eq_420 <= __delay_data_806__delay_805__delay_804__delay_803___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_839__delay_838__delay_837__delay_836___eq_423 <= __delay_data_838__delay_837__delay_836__delay_835___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_398 <= __substreamoutput_data_396 + __delay_data_746__delay_745__delay_744__delay_743___cond_236;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _plus_data_486 <= __substreamoutput_data_484 + __delay_data_621__delay_620__delay_619__delay_618___cond_237;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_642__delay_641__delay_640__delay_639___cond_249 <= __delay_data_641__delay_640__delay_639__delay_638___cond_249;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_662__delay_661__delay_660__delay_659___plus_502 <= __delay_data_661__delay_660__delay_659__delay_658___plus_502;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_683__delay_682__delay_681__delay_680___eq_508 <= __delay_data_682__delay_681__delay_680__delay_679___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_715__delay_714__delay_713__delay_712___eq_511 <= __delay_data_714__delay_713__delay_712__delay_711___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_767__delay_766__delay_765__delay_764___cond_248 <= __delay_data_766__delay_765__delay_764__delay_763___cond_248;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_787__delay_786__delay_785__delay_784___plus_414 <= __delay_data_786__delay_785__delay_784__delay_783___plus_414;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_808__delay_807__delay_806__delay_805___eq_420 <= __delay_data_807__delay_806__delay_805__delay_804___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_840__delay_839__delay_838__delay_837___eq_423 <= __delay_data_839__delay_838__delay_837__delay_836___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_852__substreamoutput_397 <= __substreamoutput_data_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_684__delay_683__delay_682__delay_681___eq_508 <= __delay_data_683__delay_682__delay_681__delay_680___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_716__delay_715__delay_714__delay_713___eq_511 <= __delay_data_715__delay_714__delay_713__delay_712___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_809__delay_808__delay_807__delay_806___eq_420 <= __delay_data_808__delay_807__delay_806__delay_805___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_841__delay_840__delay_839__delay_838___eq_423 <= __delay_data_840__delay_839__delay_838__delay_837___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_853__delay_852__substreamoutput_397 <= __delay_data_852__substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_685__delay_684__delay_683__delay_682___eq_508 <= __delay_data_684__delay_683__delay_682__delay_681___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_717__delay_716__delay_715__delay_714___eq_511 <= __delay_data_716__delay_715__delay_714__delay_713___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_810__delay_809__delay_808__delay_807___eq_420 <= __delay_data_809__delay_808__delay_807__delay_806___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_842__delay_841__delay_840__delay_839___eq_423 <= __delay_data_841__delay_840__delay_839__delay_838___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_854__delay_853__delay_852__substreamoutput_397 <= __delay_data_853__delay_852__substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_686__delay_685__delay_684__delay_683___eq_508 <= __delay_data_685__delay_684__delay_683__delay_682___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_718__delay_717__delay_716__delay_715___eq_511 <= __delay_data_717__delay_716__delay_715__delay_714___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_811__delay_810__delay_809__delay_808___eq_420 <= __delay_data_810__delay_809__delay_808__delay_807___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_843__delay_842__delay_841__delay_840___eq_423 <= __delay_data_842__delay_841__delay_840__delay_839___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_855__delay_854__delay_853____substreamoutput_397 <= __delay_data_854__delay_853__delay_852__substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_687__delay_686__delay_685__delay_684___eq_508 <= __delay_data_686__delay_685__delay_684__delay_683___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_719__delay_718__delay_717__delay_716___eq_511 <= __delay_data_718__delay_717__delay_716__delay_715___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_812__delay_811__delay_810__delay_809___eq_420 <= __delay_data_811__delay_810__delay_809__delay_808___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_844__delay_843__delay_842__delay_841___eq_423 <= __delay_data_843__delay_842__delay_841__delay_840___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_856__delay_855__delay_854____substreamoutput_397 <= __delay_data_855__delay_854__delay_853____substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_688__delay_687__delay_686__delay_685___eq_508 <= __delay_data_687__delay_686__delay_685__delay_684___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_720__delay_719__delay_718__delay_717___eq_511 <= __delay_data_719__delay_718__delay_717__delay_716___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_813__delay_812__delay_811__delay_810___eq_420 <= __delay_data_812__delay_811__delay_810__delay_809___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_845__delay_844__delay_843__delay_842___eq_423 <= __delay_data_844__delay_843__delay_842__delay_841___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_857__delay_856__delay_855____substreamoutput_397 <= __delay_data_856__delay_855__delay_854____substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_689__delay_688__delay_687__delay_686___eq_508 <= __delay_data_688__delay_687__delay_686__delay_685___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_721__delay_720__delay_719__delay_718___eq_511 <= __delay_data_720__delay_719__delay_718__delay_717___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_814__delay_813__delay_812__delay_811___eq_420 <= __delay_data_813__delay_812__delay_811__delay_810___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_846__delay_845__delay_844__delay_843___eq_423 <= __delay_data_845__delay_844__delay_843__delay_842___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_858__delay_857__delay_856____substreamoutput_397 <= __delay_data_857__delay_856__delay_855____substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_690__delay_689__delay_688__delay_687___eq_508 <= __delay_data_689__delay_688__delay_687__delay_686___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_722__delay_721__delay_720__delay_719___eq_511 <= __delay_data_721__delay_720__delay_719__delay_718___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_815__delay_814__delay_813__delay_812___eq_420 <= __delay_data_814__delay_813__delay_812__delay_811___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_847__delay_846__delay_845__delay_844___eq_423 <= __delay_data_846__delay_845__delay_844__delay_843___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_859__delay_858__delay_857____substreamoutput_397 <= __delay_data_858__delay_857__delay_856____substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_691__delay_690__delay_689__delay_688___eq_508 <= __delay_data_690__delay_689__delay_688__delay_687___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_723__delay_722__delay_721__delay_720___eq_511 <= __delay_data_722__delay_721__delay_720__delay_719___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_816__delay_815__delay_814__delay_813___eq_420 <= __delay_data_815__delay_814__delay_813__delay_812___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_848__delay_847__delay_846__delay_845___eq_423 <= __delay_data_847__delay_846__delay_845__delay_844___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_860__delay_859__delay_858____substreamoutput_397 <= __delay_data_859__delay_858__delay_857____substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_692__delay_691__delay_690__delay_689___eq_508 <= __delay_data_691__delay_690__delay_689__delay_688___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_724__delay_723__delay_722__delay_721___eq_511 <= __delay_data_723__delay_722__delay_721__delay_720___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_817__delay_816__delay_815__delay_814___eq_420 <= __delay_data_816__delay_815__delay_814__delay_813___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_849__delay_848__delay_847__delay_846___eq_423 <= __delay_data_848__delay_847__delay_846__delay_845___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_861__delay_860__delay_859____substreamoutput_397 <= __delay_data_860__delay_859__delay_858____substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _greaterthan_data_417 <= __substreamoutput_data_415 > 1'sd0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _greaterthan_data_505 <= __substreamoutput_data_503 > 1'sd0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_663__substreamoutput_503 <= __substreamoutput_data_503;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_693__delay_692__delay_691__delay_690___eq_508 <= __delay_data_692__delay_691__delay_690__delay_689___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_725__delay_724__delay_723__delay_722___eq_511 <= __delay_data_724__delay_723__delay_722__delay_721___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_788__substreamoutput_415 <= __substreamoutput_data_415;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_818__delay_817__delay_816__delay_815___eq_420 <= __delay_data_817__delay_816__delay_815__delay_814___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_850__delay_849__delay_848__delay_847___eq_423 <= __delay_data_849__delay_848__delay_847__delay_846___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_862__delay_861__delay_860____substreamoutput_397 <= __delay_data_861__delay_860__delay_859____substreamoutput_397;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _cond_data_419 <= (_greaterthan_data_417)? __delay_data_788__substreamoutput_415 : 1'sd0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _cond_data_507 <= (_greaterthan_data_505)? __delay_data_663__substreamoutput_503 : 1'sd0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_694__delay_693__delay_692__delay_691___eq_508 <= __delay_data_693__delay_692__delay_691__delay_690___eq_508;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_695__delay_663__substreamoutput_503 <= __delay_data_663__substreamoutput_503;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_726__delay_725__delay_724__delay_723___eq_511 <= __delay_data_725__delay_724__delay_723__delay_722___eq_511;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_819__delay_818__delay_817__delay_816___eq_420 <= __delay_data_818__delay_817__delay_816__delay_815___eq_420;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_820__delay_788__substreamoutput_415 <= __delay_data_788__substreamoutput_415;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_851__delay_850__delay_849__delay_848___eq_423 <= __delay_data_850__delay_849__delay_848__delay_847___eq_423;
      end 
      if(_stream_matmul_5_stream_oready) begin
        __delay_data_863__delay_862__delay_861____substreamoutput_397 <= __delay_data_862__delay_861__delay_860____substreamoutput_397;
      end 
      if(_set_flag_234) begin
        _stream_matmul_5_parameter_0_next_parameter_data <= cparam_matmul_5_stream_reduce_size;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_205 <= _stream_matmul_5_parameter_0_next_parameter_data;
      end 
      if(_set_flag_235) begin
        _stream_matmul_5_parameter_1_next_parameter_data <= matmul_5_col_select;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_206 <= _stream_matmul_5_parameter_1_next_parameter_data;
      end 
      if(_set_flag_236) begin
        _stream_matmul_5_parameter_2_next_parameter_data <= matmul_5_row_select_buf;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_207 <= _stream_matmul_5_parameter_2_next_parameter_data;
      end 
      if(_set_flag_237) begin
        _stream_matmul_5_parameter_3_next_parameter_data <= matmul_5_stream_pad_masks;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_208 <= _stream_matmul_5_parameter_3_next_parameter_data;
      end 
      if(_set_flag_238) begin
        _stream_matmul_5_parameter_4_next_parameter_data <= cparam_matmul_5_stream_omit_mask;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_209 <= _stream_matmul_5_parameter_4_next_parameter_data;
      end 
      if(_set_flag_239) begin
        _stream_matmul_5_parameter_6_next_parameter_data <= cparam_matmul_5_bias_scala;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_226 <= _stream_matmul_5_parameter_6_next_parameter_data;
      end 
      if(_set_flag_240) begin
        _stream_matmul_5_source_7_source_mode <= 5'b10;
        _stream_matmul_5_source_7_source_offset <= (cparam_matmul_5_bias_num == 1)? 0 : matmul_5_och_count_buf;
      end 
      if(_set_flag_240) begin
        _source_stream_matmul_5_source_7_pat_size_0 <= cparam_matmul_5_stream_reduce_size;
        _source_stream_matmul_5_source_7_pat_stride_0 <= 0;
      end 
      if(_set_flag_240) begin
        _source_stream_matmul_5_source_7_pat_size_1 <= matmul_5_next_stream_num_ops;
        _source_stream_matmul_5_source_7_pat_stride_1 <= (cparam_matmul_5_bias_num == 1)? 0 : 1;
      end 
      if(_set_flag_240) begin
        _source_stream_matmul_5_source_7_pat_size_2 <= 1;
        _source_stream_matmul_5_source_7_pat_stride_2 <= 0;
      end 
      if(_set_flag_240) begin
        _source_stream_matmul_5_source_7_pat_size_3 <= 1;
        _source_stream_matmul_5_source_7_pat_stride_3 <= 0;
      end 
      if(_set_flag_240) begin
        _stream_matmul_5_source_7_source_sel <= 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_7_source_offset_buf <= _stream_matmul_5_source_7_source_offset;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_0 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_1 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_2 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_3 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_count_0 <= _source_stream_matmul_5_source_7_pat_size_0 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_count_1 <= _source_stream_matmul_5_source_7_pat_size_1 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_count_2 <= _source_stream_matmul_5_source_7_pat_size_2 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_count_3 <= _source_stream_matmul_5_source_7_pat_size_3 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_size_buf_0 <= _source_stream_matmul_5_source_7_pat_size_0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_size_buf_1 <= _source_stream_matmul_5_source_7_pat_size_1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_size_buf_2 <= _source_stream_matmul_5_source_7_pat_size_2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_size_buf_3 <= _source_stream_matmul_5_source_7_pat_size_3;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_stride_buf_0 <= _source_stream_matmul_5_source_7_pat_stride_0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_stride_buf_1 <= _source_stream_matmul_5_source_7_pat_stride_1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_stride_buf_2 <= _source_stream_matmul_5_source_7_pat_stride_2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_stride_buf_3 <= _source_stream_matmul_5_source_7_pat_stride_3;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_source_busy && _stream_matmul_5_is_root) begin
        __variable_wdata_227 <= _stream_matmul_5_source_7_source_ram_rdata;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_7_idle <= 0;
        _stream_matmul_5_source_7_source_ram_raddr <= _stream_matmul_5_source_7_source_pat_all_offset;
        _stream_matmul_5_source_7_source_ram_renable <= 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_0 <= _source_stream_matmul_5_source_7_pat_cur_offset_0 + _source_stream_matmul_5_source_7_pat_stride_buf_0;
        _source_stream_matmul_5_source_7_pat_count_0 <= _source_stream_matmul_5_source_7_pat_count_0 - 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && (_source_stream_matmul_5_source_7_pat_count_0 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_0 <= 0;
        _source_stream_matmul_5_source_7_pat_count_0 <= _source_stream_matmul_5_source_7_pat_size_buf_0 - 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && (_source_stream_matmul_5_source_7_pat_count_0 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_1 <= _source_stream_matmul_5_source_7_pat_cur_offset_1 + _source_stream_matmul_5_source_7_pat_stride_buf_1;
        _source_stream_matmul_5_source_7_pat_count_1 <= _source_stream_matmul_5_source_7_pat_count_1 - 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && (_source_stream_matmul_5_source_7_pat_count_0 == 0) && (_source_stream_matmul_5_source_7_pat_count_1 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_1 <= 0;
        _source_stream_matmul_5_source_7_pat_count_1 <= _source_stream_matmul_5_source_7_pat_size_buf_1 - 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && ((_source_stream_matmul_5_source_7_pat_count_0 == 0) && (_source_stream_matmul_5_source_7_pat_count_1 == 0)) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_2 <= _source_stream_matmul_5_source_7_pat_cur_offset_2 + _source_stream_matmul_5_source_7_pat_stride_buf_2;
        _source_stream_matmul_5_source_7_pat_count_2 <= _source_stream_matmul_5_source_7_pat_count_2 - 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && ((_source_stream_matmul_5_source_7_pat_count_0 == 0) && (_source_stream_matmul_5_source_7_pat_count_1 == 0)) && (_source_stream_matmul_5_source_7_pat_count_2 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_2 <= 0;
        _source_stream_matmul_5_source_7_pat_count_2 <= _source_stream_matmul_5_source_7_pat_size_buf_2 - 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && ((_source_stream_matmul_5_source_7_pat_count_0 == 0) && (_source_stream_matmul_5_source_7_pat_count_1 == 0) && (_source_stream_matmul_5_source_7_pat_count_2 == 0)) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_3 <= _source_stream_matmul_5_source_7_pat_cur_offset_3 + _source_stream_matmul_5_source_7_pat_stride_buf_3;
        _source_stream_matmul_5_source_7_pat_count_3 <= _source_stream_matmul_5_source_7_pat_count_3 - 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && ((_source_stream_matmul_5_source_7_pat_count_0 == 0) && (_source_stream_matmul_5_source_7_pat_count_1 == 0) && (_source_stream_matmul_5_source_7_pat_count_2 == 0)) && (_source_stream_matmul_5_source_7_pat_count_3 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_7_pat_cur_offset_3 <= 0;
        _source_stream_matmul_5_source_7_pat_count_3 <= _source_stream_matmul_5_source_7_pat_size_buf_3 - 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 1) && _stream_matmul_5_source_stop && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_7_source_ram_renable <= 0;
        _stream_matmul_5_source_7_idle <= 1;
      end 
      if((_stream_matmul_5_source_7_source_pat_fsm_0 == 2) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_7_source_ram_renable <= 0;
        _stream_matmul_5_source_7_idle <= 1;
      end 
      if(_set_flag_243) begin
        _stream_matmul_5_parameter_8_next_parameter_data <= 1;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_238 <= _stream_matmul_5_parameter_8_next_parameter_data;
      end 
      if(_set_flag_244) begin
        _stream_matmul_5_source_9_source_mode <= 5'b0;
        _stream_matmul_5_source_9_source_empty_data <= 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready && !(|(_stream_matmul_5_source_9_source_mode & 5'b0))) begin
        _stream_matmul_5_source_9_idle <= 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready && !(|(_stream_matmul_5_source_9_source_mode & 5'b0)) && _stream_matmul_5_is_root) begin
        __variable_wdata_239 <= _stream_matmul_5_source_9_source_empty_data;
      end 
      if(_set_flag_245) begin
        _stream_matmul_5_parameter_10_next_parameter_data <= 1;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_250 <= _stream_matmul_5_parameter_10_next_parameter_data;
      end 
      if(_set_flag_246) begin
        _stream_matmul_5_source_11_source_mode <= 5'b0;
        _stream_matmul_5_source_11_source_empty_data <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready && !(|(_stream_matmul_5_source_11_source_mode & 5'b0))) begin
        _stream_matmul_5_source_11_idle <= 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready && !(|(_stream_matmul_5_source_11_source_mode & 5'b0)) && _stream_matmul_5_is_root) begin
        __variable_wdata_251 <= _stream_matmul_5_source_11_source_empty_data;
      end 
      if(_set_flag_247) begin
        _stream_matmul_5_parameter_12_next_parameter_data <= 1;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_262 <= _stream_matmul_5_parameter_12_next_parameter_data;
      end 
      if(_set_flag_248) begin
        _stream_matmul_5_source_13_source_mode <= 5'b0;
        _stream_matmul_5_source_13_source_empty_data <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready && !(|(_stream_matmul_5_source_13_source_mode & 5'b0))) begin
        _stream_matmul_5_source_13_idle <= 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready && !(|(_stream_matmul_5_source_13_source_mode & 5'b0)) && _stream_matmul_5_is_root) begin
        __variable_wdata_263 <= _stream_matmul_5_source_13_source_empty_data;
      end 
      if(_set_flag_249) begin
        _stream_matmul_5_parameter_14_next_parameter_data <= 1;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_274 <= _stream_matmul_5_parameter_14_next_parameter_data;
      end 
      if(_set_flag_250) begin
        _stream_matmul_5_source_15_source_mode <= 5'b0;
        _stream_matmul_5_source_15_source_empty_data <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready && !(|(_stream_matmul_5_source_15_source_mode & 5'b0))) begin
        _stream_matmul_5_source_15_idle <= 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready && !(|(_stream_matmul_5_source_15_source_mode & 5'b0)) && _stream_matmul_5_is_root) begin
        __variable_wdata_275 <= _stream_matmul_5_source_15_source_empty_data;
      end 
      if(_set_flag_251) begin
        _stream_matmul_5_parameter_16_next_parameter_data <= cparam_matmul_5_cshamt_mul_value;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_286 <= _stream_matmul_5_parameter_16_next_parameter_data;
      end 
      if(_set_flag_252) begin
        _stream_matmul_5_parameter_17_next_parameter_data <= cparam_matmul_5_cshamt_sum_value;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_287 <= _stream_matmul_5_parameter_17_next_parameter_data;
      end 
      if(_set_flag_253) begin
        _stream_matmul_5_parameter_18_next_parameter_data <= cparam_matmul_5_cshamt_out_value;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_288 <= _stream_matmul_5_parameter_18_next_parameter_data;
      end 
      if(_set_flag_254) begin
        _stream_matmul_5_parameter_19_next_parameter_data <= cparam_matmul_5_act_func_index;
      end 
      if(_stream_matmul_5_source_start) begin
        __variable_wdata_289 <= _stream_matmul_5_parameter_19_next_parameter_data;
      end 
      if(_set_flag_255) begin
        _stream_matmul_5_source_20_source_mode <= 5'b10;
        _stream_matmul_5_source_20_source_offset <= matmul_5_stream_act_local_0 + matmul_5_act_page_comp_offset_buf_0;
      end 
      if(_set_flag_255) begin
        _source_stream_matmul_5_source_20_pat_size_0 <= cparam_matmul_5_stream_reduce_size;
        _source_stream_matmul_5_source_20_pat_stride_0 <= 1;
      end 
      if(_set_flag_255) begin
        _source_stream_matmul_5_source_20_pat_size_1 <= matmul_5_next_stream_num_ops;
        _source_stream_matmul_5_source_20_pat_stride_1 <= 0;
      end 
      if(_set_flag_255) begin
        _source_stream_matmul_5_source_20_pat_size_2 <= 1;
        _source_stream_matmul_5_source_20_pat_stride_2 <= 0;
      end 
      if(_set_flag_255) begin
        _source_stream_matmul_5_source_20_pat_size_3 <= 1;
        _source_stream_matmul_5_source_20_pat_stride_3 <= 0;
      end 
      if(_set_flag_255) begin
        _stream_matmul_5_source_20_source_sel <= 2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_20_source_offset_buf <= _stream_matmul_5_source_20_source_offset;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_0 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_1 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_2 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_3 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_count_0 <= _source_stream_matmul_5_source_20_pat_size_0 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_count_1 <= _source_stream_matmul_5_source_20_pat_size_1 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_count_2 <= _source_stream_matmul_5_source_20_pat_size_2 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_count_3 <= _source_stream_matmul_5_source_20_pat_size_3 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_size_buf_0 <= _source_stream_matmul_5_source_20_pat_size_0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_size_buf_1 <= _source_stream_matmul_5_source_20_pat_size_1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_size_buf_2 <= _source_stream_matmul_5_source_20_pat_size_2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_size_buf_3 <= _source_stream_matmul_5_source_20_pat_size_3;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_stride_buf_0 <= _source_stream_matmul_5_source_20_pat_stride_0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_stride_buf_1 <= _source_stream_matmul_5_source_20_pat_stride_1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_stride_buf_2 <= _source_stream_matmul_5_source_20_pat_stride_2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_stride_buf_3 <= _source_stream_matmul_5_source_20_pat_stride_3;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_source_busy && _stream_matmul_5_is_root) begin
        __variable_wdata_290 <= _stream_matmul_5_source_20_source_ram_rdata;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_20_idle <= 0;
        _stream_matmul_5_source_20_source_ram_raddr <= _stream_matmul_5_source_20_source_pat_all_offset;
        _stream_matmul_5_source_20_source_ram_renable <= 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_0 <= _source_stream_matmul_5_source_20_pat_cur_offset_0 + _source_stream_matmul_5_source_20_pat_stride_buf_0;
        _source_stream_matmul_5_source_20_pat_count_0 <= _source_stream_matmul_5_source_20_pat_count_0 - 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && (_source_stream_matmul_5_source_20_pat_count_0 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_0 <= 0;
        _source_stream_matmul_5_source_20_pat_count_0 <= _source_stream_matmul_5_source_20_pat_size_buf_0 - 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && (_source_stream_matmul_5_source_20_pat_count_0 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_1 <= _source_stream_matmul_5_source_20_pat_cur_offset_1 + _source_stream_matmul_5_source_20_pat_stride_buf_1;
        _source_stream_matmul_5_source_20_pat_count_1 <= _source_stream_matmul_5_source_20_pat_count_1 - 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && (_source_stream_matmul_5_source_20_pat_count_0 == 0) && (_source_stream_matmul_5_source_20_pat_count_1 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_1 <= 0;
        _source_stream_matmul_5_source_20_pat_count_1 <= _source_stream_matmul_5_source_20_pat_size_buf_1 - 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && ((_source_stream_matmul_5_source_20_pat_count_0 == 0) && (_source_stream_matmul_5_source_20_pat_count_1 == 0)) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_2 <= _source_stream_matmul_5_source_20_pat_cur_offset_2 + _source_stream_matmul_5_source_20_pat_stride_buf_2;
        _source_stream_matmul_5_source_20_pat_count_2 <= _source_stream_matmul_5_source_20_pat_count_2 - 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && ((_source_stream_matmul_5_source_20_pat_count_0 == 0) && (_source_stream_matmul_5_source_20_pat_count_1 == 0)) && (_source_stream_matmul_5_source_20_pat_count_2 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_2 <= 0;
        _source_stream_matmul_5_source_20_pat_count_2 <= _source_stream_matmul_5_source_20_pat_size_buf_2 - 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && ((_source_stream_matmul_5_source_20_pat_count_0 == 0) && (_source_stream_matmul_5_source_20_pat_count_1 == 0) && (_source_stream_matmul_5_source_20_pat_count_2 == 0)) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_3 <= _source_stream_matmul_5_source_20_pat_cur_offset_3 + _source_stream_matmul_5_source_20_pat_stride_buf_3;
        _source_stream_matmul_5_source_20_pat_count_3 <= _source_stream_matmul_5_source_20_pat_count_3 - 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && ((_source_stream_matmul_5_source_20_pat_count_0 == 0) && (_source_stream_matmul_5_source_20_pat_count_1 == 0) && (_source_stream_matmul_5_source_20_pat_count_2 == 0)) && (_source_stream_matmul_5_source_20_pat_count_3 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_20_pat_cur_offset_3 <= 0;
        _source_stream_matmul_5_source_20_pat_count_3 <= _source_stream_matmul_5_source_20_pat_size_buf_3 - 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 1) && _stream_matmul_5_source_stop && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_20_source_ram_renable <= 0;
        _stream_matmul_5_source_20_idle <= 1;
      end 
      if((_stream_matmul_5_source_20_source_pat_fsm_1 == 2) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_20_source_ram_renable <= 0;
        _stream_matmul_5_source_20_idle <= 1;
      end 
      if(_set_flag_258) begin
        _stream_matmul_5_source_21_source_mode <= 5'b10;
        _stream_matmul_5_source_21_source_offset <= matmul_5_filter_page_comp_offset_buf;
      end 
      if(_set_flag_258) begin
        _source_stream_matmul_5_source_21_pat_size_0 <= cparam_matmul_5_stream_reduce_size;
        _source_stream_matmul_5_source_21_pat_stride_0 <= 1;
      end 
      if(_set_flag_258) begin
        _source_stream_matmul_5_source_21_pat_size_1 <= matmul_5_next_stream_num_ops;
        _source_stream_matmul_5_source_21_pat_stride_1 <= cparam_matmul_5_stream_aligned_reduce_size;
      end 
      if(_set_flag_258) begin
        _source_stream_matmul_5_source_21_pat_size_2 <= 1;
        _source_stream_matmul_5_source_21_pat_stride_2 <= 0;
      end 
      if(_set_flag_258) begin
        _source_stream_matmul_5_source_21_pat_size_3 <= 1;
        _source_stream_matmul_5_source_21_pat_stride_3 <= 0;
      end 
      if(_set_flag_258) begin
        _stream_matmul_5_source_21_source_sel <= 3;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_21_source_offset_buf <= _stream_matmul_5_source_21_source_offset;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_0 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_1 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_2 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_3 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_count_0 <= _source_stream_matmul_5_source_21_pat_size_0 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_count_1 <= _source_stream_matmul_5_source_21_pat_size_1 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_count_2 <= _source_stream_matmul_5_source_21_pat_size_2 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_count_3 <= _source_stream_matmul_5_source_21_pat_size_3 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_size_buf_0 <= _source_stream_matmul_5_source_21_pat_size_0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_size_buf_1 <= _source_stream_matmul_5_source_21_pat_size_1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_size_buf_2 <= _source_stream_matmul_5_source_21_pat_size_2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_size_buf_3 <= _source_stream_matmul_5_source_21_pat_size_3;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_stride_buf_0 <= _source_stream_matmul_5_source_21_pat_stride_0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_stride_buf_1 <= _source_stream_matmul_5_source_21_pat_stride_1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_stride_buf_2 <= _source_stream_matmul_5_source_21_pat_stride_2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_stride_buf_3 <= _source_stream_matmul_5_source_21_pat_stride_3;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_source_busy && _stream_matmul_5_is_root) begin
        __variable_wdata_311 <= _stream_matmul_5_source_21_source_ram_rdata;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_21_idle <= 0;
        _stream_matmul_5_source_21_source_ram_raddr <= _stream_matmul_5_source_21_source_pat_all_offset;
        _stream_matmul_5_source_21_source_ram_renable <= 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_0 <= _source_stream_matmul_5_source_21_pat_cur_offset_0 + _source_stream_matmul_5_source_21_pat_stride_buf_0;
        _source_stream_matmul_5_source_21_pat_count_0 <= _source_stream_matmul_5_source_21_pat_count_0 - 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && (_source_stream_matmul_5_source_21_pat_count_0 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_0 <= 0;
        _source_stream_matmul_5_source_21_pat_count_0 <= _source_stream_matmul_5_source_21_pat_size_buf_0 - 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && (_source_stream_matmul_5_source_21_pat_count_0 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_1 <= _source_stream_matmul_5_source_21_pat_cur_offset_1 + _source_stream_matmul_5_source_21_pat_stride_buf_1;
        _source_stream_matmul_5_source_21_pat_count_1 <= _source_stream_matmul_5_source_21_pat_count_1 - 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && (_source_stream_matmul_5_source_21_pat_count_0 == 0) && (_source_stream_matmul_5_source_21_pat_count_1 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_1 <= 0;
        _source_stream_matmul_5_source_21_pat_count_1 <= _source_stream_matmul_5_source_21_pat_size_buf_1 - 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && ((_source_stream_matmul_5_source_21_pat_count_0 == 0) && (_source_stream_matmul_5_source_21_pat_count_1 == 0)) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_2 <= _source_stream_matmul_5_source_21_pat_cur_offset_2 + _source_stream_matmul_5_source_21_pat_stride_buf_2;
        _source_stream_matmul_5_source_21_pat_count_2 <= _source_stream_matmul_5_source_21_pat_count_2 - 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && ((_source_stream_matmul_5_source_21_pat_count_0 == 0) && (_source_stream_matmul_5_source_21_pat_count_1 == 0)) && (_source_stream_matmul_5_source_21_pat_count_2 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_2 <= 0;
        _source_stream_matmul_5_source_21_pat_count_2 <= _source_stream_matmul_5_source_21_pat_size_buf_2 - 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && ((_source_stream_matmul_5_source_21_pat_count_0 == 0) && (_source_stream_matmul_5_source_21_pat_count_1 == 0) && (_source_stream_matmul_5_source_21_pat_count_2 == 0)) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_3 <= _source_stream_matmul_5_source_21_pat_cur_offset_3 + _source_stream_matmul_5_source_21_pat_stride_buf_3;
        _source_stream_matmul_5_source_21_pat_count_3 <= _source_stream_matmul_5_source_21_pat_count_3 - 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && ((_source_stream_matmul_5_source_21_pat_count_0 == 0) && (_source_stream_matmul_5_source_21_pat_count_1 == 0) && (_source_stream_matmul_5_source_21_pat_count_2 == 0)) && (_source_stream_matmul_5_source_21_pat_count_3 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_21_pat_cur_offset_3 <= 0;
        _source_stream_matmul_5_source_21_pat_count_3 <= _source_stream_matmul_5_source_21_pat_size_buf_3 - 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 1) && _stream_matmul_5_source_stop && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_21_source_ram_renable <= 0;
        _stream_matmul_5_source_21_idle <= 1;
      end 
      if((_stream_matmul_5_source_21_source_pat_fsm_2 == 2) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_21_source_ram_renable <= 0;
        _stream_matmul_5_source_21_idle <= 1;
      end 
      if(_set_flag_261) begin
        _stream_matmul_5_source_22_source_mode <= 5'b10;
        _stream_matmul_5_source_22_source_offset <= matmul_5_filter_page_comp_offset_buf;
      end 
      if(_set_flag_261) begin
        _source_stream_matmul_5_source_22_pat_size_0 <= cparam_matmul_5_stream_reduce_size;
        _source_stream_matmul_5_source_22_pat_stride_0 <= 1;
      end 
      if(_set_flag_261) begin
        _source_stream_matmul_5_source_22_pat_size_1 <= matmul_5_next_stream_num_ops;
        _source_stream_matmul_5_source_22_pat_stride_1 <= cparam_matmul_5_stream_aligned_reduce_size;
      end 
      if(_set_flag_261) begin
        _source_stream_matmul_5_source_22_pat_size_2 <= 1;
        _source_stream_matmul_5_source_22_pat_stride_2 <= 0;
      end 
      if(_set_flag_261) begin
        _source_stream_matmul_5_source_22_pat_size_3 <= 1;
        _source_stream_matmul_5_source_22_pat_stride_3 <= 0;
      end 
      if(_set_flag_261) begin
        _stream_matmul_5_source_22_source_sel <= 4;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_22_source_offset_buf <= _stream_matmul_5_source_22_source_offset;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_0 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_1 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_2 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_3 <= 0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_count_0 <= _source_stream_matmul_5_source_22_pat_size_0 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_count_1 <= _source_stream_matmul_5_source_22_pat_size_1 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_count_2 <= _source_stream_matmul_5_source_22_pat_size_2 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_count_3 <= _source_stream_matmul_5_source_22_pat_size_3 - 1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_size_buf_0 <= _source_stream_matmul_5_source_22_pat_size_0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_size_buf_1 <= _source_stream_matmul_5_source_22_pat_size_1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_size_buf_2 <= _source_stream_matmul_5_source_22_pat_size_2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_size_buf_3 <= _source_stream_matmul_5_source_22_pat_size_3;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_stride_buf_0 <= _source_stream_matmul_5_source_22_pat_stride_0;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_stride_buf_1 <= _source_stream_matmul_5_source_22_pat_stride_1;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_stride_buf_2 <= _source_stream_matmul_5_source_22_pat_stride_2;
      end 
      if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_stride_buf_3 <= _source_stream_matmul_5_source_22_pat_stride_3;
      end 
      if(_stream_matmul_5_stream_oready && _stream_matmul_5_source_busy && _stream_matmul_5_is_root) begin
        __variable_wdata_312 <= _stream_matmul_5_source_22_source_ram_rdata;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_22_idle <= 0;
        _stream_matmul_5_source_22_source_ram_raddr <= _stream_matmul_5_source_22_source_pat_all_offset;
        _stream_matmul_5_source_22_source_ram_renable <= 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_0 <= _source_stream_matmul_5_source_22_pat_cur_offset_0 + _source_stream_matmul_5_source_22_pat_stride_buf_0;
        _source_stream_matmul_5_source_22_pat_count_0 <= _source_stream_matmul_5_source_22_pat_count_0 - 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && (_source_stream_matmul_5_source_22_pat_count_0 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_0 <= 0;
        _source_stream_matmul_5_source_22_pat_count_0 <= _source_stream_matmul_5_source_22_pat_size_buf_0 - 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && (_source_stream_matmul_5_source_22_pat_count_0 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_1 <= _source_stream_matmul_5_source_22_pat_cur_offset_1 + _source_stream_matmul_5_source_22_pat_stride_buf_1;
        _source_stream_matmul_5_source_22_pat_count_1 <= _source_stream_matmul_5_source_22_pat_count_1 - 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && (_source_stream_matmul_5_source_22_pat_count_0 == 0) && (_source_stream_matmul_5_source_22_pat_count_1 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_1 <= 0;
        _source_stream_matmul_5_source_22_pat_count_1 <= _source_stream_matmul_5_source_22_pat_size_buf_1 - 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && ((_source_stream_matmul_5_source_22_pat_count_0 == 0) && (_source_stream_matmul_5_source_22_pat_count_1 == 0)) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_2 <= _source_stream_matmul_5_source_22_pat_cur_offset_2 + _source_stream_matmul_5_source_22_pat_stride_buf_2;
        _source_stream_matmul_5_source_22_pat_count_2 <= _source_stream_matmul_5_source_22_pat_count_2 - 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && ((_source_stream_matmul_5_source_22_pat_count_0 == 0) && (_source_stream_matmul_5_source_22_pat_count_1 == 0)) && (_source_stream_matmul_5_source_22_pat_count_2 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_2 <= 0;
        _source_stream_matmul_5_source_22_pat_count_2 <= _source_stream_matmul_5_source_22_pat_size_buf_2 - 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && ((_source_stream_matmul_5_source_22_pat_count_0 == 0) && (_source_stream_matmul_5_source_22_pat_count_1 == 0) && (_source_stream_matmul_5_source_22_pat_count_2 == 0)) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_3 <= _source_stream_matmul_5_source_22_pat_cur_offset_3 + _source_stream_matmul_5_source_22_pat_stride_buf_3;
        _source_stream_matmul_5_source_22_pat_count_3 <= _source_stream_matmul_5_source_22_pat_count_3 - 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && ((_source_stream_matmul_5_source_22_pat_count_0 == 0) && (_source_stream_matmul_5_source_22_pat_count_1 == 0) && (_source_stream_matmul_5_source_22_pat_count_2 == 0)) && (_source_stream_matmul_5_source_22_pat_count_3 == 0) && _stream_matmul_5_stream_oready) begin
        _source_stream_matmul_5_source_22_pat_cur_offset_3 <= 0;
        _source_stream_matmul_5_source_22_pat_count_3 <= _source_stream_matmul_5_source_22_pat_size_buf_3 - 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 1) && _stream_matmul_5_source_stop && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_22_source_ram_renable <= 0;
        _stream_matmul_5_source_22_idle <= 1;
      end 
      if((_stream_matmul_5_source_22_source_pat_fsm_3 == 2) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_source_22_source_ram_renable <= 0;
        _stream_matmul_5_source_22_idle <= 1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_265 <= _set_flag_264;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_266 <= _tmp_265;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_267 <= _tmp_266;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_268 <= _tmp_267;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_269 <= _tmp_268;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_270 <= _tmp_269;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_271 <= _tmp_270;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_272 <= _tmp_271;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_273 <= _tmp_272;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_274 <= _tmp_273;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_275 <= _tmp_274;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_276 <= _tmp_275;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_277 <= _tmp_276;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_278 <= _tmp_277;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_279 <= _tmp_278;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_280 <= _tmp_279;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_281 <= _tmp_280;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_282 <= _tmp_281;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_283 <= _tmp_282;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_284 <= _tmp_283;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_285 <= _tmp_284;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_286 <= _tmp_285;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_287 <= _tmp_286;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_288 <= _tmp_287;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_289 <= _tmp_288;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_290 <= _tmp_289;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_291 <= _tmp_290;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_292 <= _tmp_291;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_293 <= _tmp_292;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_294 <= _tmp_293;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_295 <= _tmp_294;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_296 <= _tmp_295;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_297 <= _tmp_296;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_298 <= _tmp_297;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_301 <= _tmp_300;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_302 <= _tmp_301;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_303 <= _tmp_302;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_304 <= _tmp_303;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_305 <= _tmp_304;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_306 <= _tmp_305;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_307 <= _tmp_306;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_308 <= _tmp_307;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_309 <= _tmp_308;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_310 <= _tmp_309;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_311 <= _tmp_310;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_312 <= _tmp_311;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_313 <= _tmp_312;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_314 <= _tmp_313;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_315 <= _tmp_314;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_316 <= _tmp_315;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_317 <= _tmp_316;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_318 <= _tmp_317;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_319 <= _tmp_318;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_320 <= _tmp_319;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_321 <= _tmp_320;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_322 <= _tmp_321;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_323 <= _tmp_322;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_324 <= _tmp_323;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_325 <= _tmp_324;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_326 <= _tmp_325;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_327 <= _tmp_326;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_328 <= _tmp_327;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_329 <= _tmp_328;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_330 <= _tmp_329;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_331 <= _tmp_330;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_332 <= _tmp_331;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_333 <= _tmp_332;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_334 <= _tmp_333;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_335 <= matmul_5_next_stream_num_ops;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_336 <= _tmp_335;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_337 <= _tmp_336;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_338 <= _tmp_337;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_339 <= _tmp_338;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_340 <= _tmp_339;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_341 <= _tmp_340;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_342 <= _tmp_341;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_343 <= _tmp_342;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_344 <= _tmp_343;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_345 <= _tmp_344;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_346 <= _tmp_345;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_347 <= _tmp_346;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_348 <= _tmp_347;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_349 <= _tmp_348;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_350 <= _tmp_349;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_351 <= _tmp_350;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_352 <= _tmp_351;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_353 <= _tmp_352;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_354 <= _tmp_353;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_355 <= _tmp_354;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_356 <= _tmp_355;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_357 <= _tmp_356;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_358 <= _tmp_357;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_359 <= _tmp_358;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_360 <= _tmp_359;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_361 <= _tmp_360;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_362 <= _tmp_361;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_363 <= _tmp_362;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_364 <= _tmp_363;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_365 <= _tmp_364;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_366 <= _tmp_365;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_367 <= _tmp_366;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_368 <= _tmp_367;
      end 
      if(_tmp_298) begin
        _stream_matmul_5_sink_33_sink_mode <= 5'b1;
        _stream_matmul_5_sink_33_sink_offset <= _tmp_334;
        _stream_matmul_5_sink_33_sink_size <= _tmp_368;
        _stream_matmul_5_sink_33_sink_stride <= 1;
      end 
      if(_tmp_298) begin
        _stream_matmul_5_sink_33_sink_sel <= 5;
      end 
      if(_stream_matmul_5_sink_start && _stream_matmul_5_sink_33_sink_mode & 5'b1 && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_sink_33_sink_offset_buf <= _stream_matmul_5_sink_33_sink_offset;
        _stream_matmul_5_sink_33_sink_size_buf <= _stream_matmul_5_sink_33_sink_size;
        _stream_matmul_5_sink_33_sink_stride_buf <= _stream_matmul_5_sink_33_sink_stride;
      end 
      if((_stream_matmul_5_sink_33_sink_fsm_4 == 1) && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_sink_33_sink_waddr <= _stream_matmul_5_sink_33_sink_offset_buf - _stream_matmul_5_sink_33_sink_stride_buf;
        _stream_matmul_5_sink_33_sink_count <= _stream_matmul_5_sink_33_sink_size_buf;
      end 
      if((_stream_matmul_5_sink_33_sink_fsm_4 == 2) && stream_matmul_5_sink_34_data && _stream_matmul_5_stream_oready) begin
        _stream_matmul_5_sink_33_sink_waddr <= _stream_matmul_5_sink_33_sink_waddr + _stream_matmul_5_sink_33_sink_stride_buf;
        _stream_matmul_5_sink_33_sink_wdata <= stream_matmul_5_sink_33_data;
        _stream_matmul_5_sink_33_sink_wenable <= 1;
        _stream_matmul_5_sink_33_sink_count <= _stream_matmul_5_sink_33_sink_count - 1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_664 <= _stream_matmul_5_source_start;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_665 <= _tmp_664;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_666 <= _tmp_665;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_667 <= _stream_matmul_5_source_start;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_668 <= _tmp_667;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_669 <= _tmp_668;
      end 
      if(_stream_matmul_5_stream_oready && _tmp_669) begin
        __variable_wdata_210 <= 1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_670 <= _stream_matmul_5_source_start;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_671 <= _tmp_670;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_672 <= _tmp_671;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_673 <= _tmp_672;
      end 
      if(_stream_matmul_5_stream_oready && _tmp_673) begin
        __variable_wdata_210 <= 0;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_676 <= _tmp_675;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_679 <= _tmp_678;
      end 
      if(_stream_matmul_5_stream_oready && _tmp_679) begin
        __variable_wdata_210 <= 1;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_680 <= _stream_matmul_5_source_start;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_681 <= _tmp_680;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_682 <= _tmp_681;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_683 <= _tmp_682;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_684 <= _tmp_683;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_685 <= _tmp_684;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_686 <= _tmp_685;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_687 <= _tmp_686;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_688 <= _tmp_687;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_689 <= _tmp_688;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_690 <= _tmp_689;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_691 <= _tmp_690;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_692 <= _tmp_691;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_693 <= _tmp_692;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_694 <= _tmp_693;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_695 <= _tmp_694;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_696 <= _tmp_695;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_697 <= _tmp_696;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_698 <= _tmp_697;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_699 <= _tmp_698;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_700 <= _tmp_699;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_701 <= _tmp_700;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_702 <= _tmp_701;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_703 <= _tmp_702;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_704 <= _tmp_703;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_705 <= _tmp_704;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_706 <= _tmp_705;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_707 <= _tmp_706;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_708 <= _tmp_707;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_709 <= _tmp_708;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_710 <= _tmp_709;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_711 <= _tmp_710;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_712 <= _tmp_711;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_713 <= _tmp_712;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_714 <= _stream_matmul_5_source_stop;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_715 <= _tmp_714;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_716 <= _tmp_715;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_717 <= _tmp_716;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_718 <= _tmp_717;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_719 <= _tmp_718;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_720 <= _tmp_719;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_721 <= _tmp_720;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_722 <= _tmp_721;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_723 <= _tmp_722;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_724 <= _tmp_723;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_725 <= _tmp_724;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_726 <= _tmp_725;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_727 <= _tmp_726;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_728 <= _tmp_727;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_729 <= _tmp_728;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_730 <= _tmp_729;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_731 <= _tmp_730;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_732 <= _tmp_731;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_733 <= _tmp_732;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_734 <= _tmp_733;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_735 <= _tmp_734;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_736 <= _tmp_735;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_737 <= _tmp_736;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_738 <= _tmp_737;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_739 <= _tmp_738;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_740 <= _tmp_739;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_741 <= _tmp_740;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_742 <= _tmp_741;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_743 <= _tmp_742;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_744 <= _tmp_743;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_745 <= _tmp_744;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_746 <= _tmp_745;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_747 <= _tmp_746;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_748 <= _stream_matmul_5_source_busy;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_749 <= _tmp_748;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_750 <= _tmp_749;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_751 <= _tmp_750;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_752 <= _tmp_751;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_753 <= _tmp_752;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_754 <= _tmp_753;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_755 <= _tmp_754;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_756 <= _tmp_755;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_757 <= _tmp_756;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_758 <= _tmp_757;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_759 <= _tmp_758;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_760 <= _tmp_759;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_761 <= _tmp_760;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_762 <= _tmp_761;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_763 <= _tmp_762;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_764 <= _tmp_763;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_765 <= _tmp_764;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_766 <= _tmp_765;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_767 <= _tmp_766;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_768 <= _tmp_767;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_769 <= _tmp_768;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_770 <= _tmp_769;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_771 <= _tmp_770;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_772 <= _tmp_771;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_773 <= _tmp_772;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_774 <= _tmp_773;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_775 <= _tmp_774;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_776 <= _tmp_775;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_777 <= _tmp_776;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_778 <= _tmp_777;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_779 <= _tmp_778;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_780 <= _tmp_779;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_781 <= _tmp_780;
      end 
      if(_stream_matmul_5_stream_oready) begin
        _tmp_782 <= _stream_matmul_5_sink_busy;
      end 
      if(!_stream_matmul_5_sink_busy && _tmp_782) begin
        _stream_matmul_5_busy_reg <= 0;
      end 
      if(_stream_matmul_5_source_busy) begin
        _stream_matmul_5_busy_reg <= 1;
      end 
    end
  end

  localparam _stream_matmul_5_fsm_1 = 1;
  localparam _stream_matmul_5_fsm_2 = 2;
  localparam _stream_matmul_5_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _stream_matmul_5_fsm <= _stream_matmul_5_fsm_init;
      _stream_matmul_5_source_start <= 0;
      _stream_matmul_5_source_busy <= 0;
      _stream_matmul_5_stream_ivalid <= 0;
    end else begin
      if(_stream_matmul_5_stream_oready && _tmp_666) begin
        _stream_matmul_5_stream_ivalid <= 1;
      end 
      if(_stream_matmul_5_stream_oready && _tmp_676) begin
        _stream_matmul_5_stream_ivalid <= 0;
      end 
      case(_stream_matmul_5_fsm)
        _stream_matmul_5_fsm_init: begin
          if(_stream_matmul_5_run_flag) begin
            _stream_matmul_5_source_start <= 1;
          end 
          if(_stream_matmul_5_run_flag) begin
            _stream_matmul_5_fsm <= _stream_matmul_5_fsm_1;
          end 
        end
        _stream_matmul_5_fsm_1: begin
          if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_start <= 0;
            _stream_matmul_5_source_busy <= 1;
          end 
          if(_stream_matmul_5_source_start && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_fsm <= _stream_matmul_5_fsm_2;
          end 
        end
        _stream_matmul_5_fsm_2: begin
          if(_stream_matmul_5_stream_oready) begin
            _stream_matmul_5_fsm <= _stream_matmul_5_fsm_3;
          end 
        end
        _stream_matmul_5_fsm_3: begin
          if(_stream_matmul_5_stream_oready && (_stream_matmul_5_source_11_idle && _stream_matmul_5_source_13_idle && _stream_matmul_5_source_15_idle && _stream_matmul_5_source_20_idle && _stream_matmul_5_source_21_idle && _stream_matmul_5_source_22_idle && _stream_matmul_5_source_7_idle && _stream_matmul_5_source_9_idle && (_stream_matmul_5_fsm == 3))) begin
            _stream_matmul_5_source_busy <= 0;
          end 
          if(_stream_matmul_5_stream_oready && (_stream_matmul_5_source_11_idle && _stream_matmul_5_source_13_idle && _stream_matmul_5_source_15_idle && _stream_matmul_5_source_20_idle && _stream_matmul_5_source_21_idle && _stream_matmul_5_source_22_idle && _stream_matmul_5_source_7_idle && _stream_matmul_5_source_9_idle && (_stream_matmul_5_fsm == 3)) && _stream_matmul_5_run_flag) begin
            _stream_matmul_5_source_start <= 1;
          end 
          if(_stream_matmul_5_stream_oready && (_stream_matmul_5_source_11_idle && _stream_matmul_5_source_13_idle && _stream_matmul_5_source_15_idle && _stream_matmul_5_source_20_idle && _stream_matmul_5_source_21_idle && _stream_matmul_5_source_22_idle && _stream_matmul_5_source_7_idle && _stream_matmul_5_source_9_idle && (_stream_matmul_5_fsm == 3))) begin
            _stream_matmul_5_fsm <= _stream_matmul_5_fsm_init;
          end 
          if(_stream_matmul_5_stream_oready && (_stream_matmul_5_source_11_idle && _stream_matmul_5_source_13_idle && _stream_matmul_5_source_15_idle && _stream_matmul_5_source_20_idle && _stream_matmul_5_source_21_idle && _stream_matmul_5_source_22_idle && _stream_matmul_5_source_7_idle && _stream_matmul_5_source_9_idle && (_stream_matmul_5_fsm == 3)) && _stream_matmul_5_run_flag) begin
            _stream_matmul_5_fsm <= _stream_matmul_5_fsm_1;
          end 
        end
      endcase
    end
  end

  localparam main_fsm_1 = 1;
  localparam main_fsm_2 = 2;
  localparam main_fsm_3 = 3;
  localparam main_fsm_4 = 4;
  localparam main_fsm_5 = 5;
  localparam main_fsm_6 = 6;
  localparam main_fsm_7 = 7;
  localparam main_fsm_8 = 8;
  localparam main_fsm_9 = 9;
  localparam main_fsm_10 = 10;
  localparam main_fsm_11 = 11;
  localparam main_fsm_12 = 12;
  localparam main_fsm_13 = 13;
  localparam main_fsm_14 = 14;
  localparam main_fsm_15 = 15;
  localparam main_fsm_16 = 16;
  localparam main_fsm_17 = 17;
  localparam main_fsm_18 = 18;
  localparam main_fsm_19 = 19;
  localparam main_fsm_20 = 20;
  localparam main_fsm_21 = 21;
  localparam main_fsm_22 = 22;
  localparam main_fsm_23 = 23;
  localparam main_fsm_24 = 24;
  localparam main_fsm_25 = 25;
  localparam main_fsm_26 = 26;
  localparam main_fsm_27 = 27;
  localparam main_fsm_28 = 28;
  localparam main_fsm_29 = 29;
  localparam main_fsm_30 = 30;
  localparam main_fsm_31 = 31;
  localparam main_fsm_32 = 32;
  localparam main_fsm_33 = 33;
  localparam main_fsm_34 = 34;
  localparam main_fsm_35 = 35;
  localparam main_fsm_36 = 36;
  localparam main_fsm_37 = 37;
  localparam main_fsm_38 = 38;
  localparam main_fsm_39 = 39;
  localparam main_fsm_40 = 40;
  localparam main_fsm_41 = 41;
  localparam main_fsm_42 = 42;
  localparam main_fsm_43 = 43;
  localparam main_fsm_44 = 44;
  localparam main_fsm_45 = 45;
  localparam main_fsm_46 = 46;
  localparam main_fsm_47 = 47;
  localparam main_fsm_48 = 48;
  localparam main_fsm_49 = 49;
  localparam main_fsm_50 = 50;
  localparam main_fsm_51 = 51;
  localparam main_fsm_52 = 52;
  localparam main_fsm_53 = 53;
  localparam main_fsm_54 = 54;
  localparam main_fsm_55 = 55;
  localparam main_fsm_56 = 56;
  localparam main_fsm_57 = 57;
  localparam main_fsm_58 = 58;
  localparam main_fsm_59 = 59;
  localparam main_fsm_60 = 60;
  localparam main_fsm_61 = 61;
  localparam main_fsm_62 = 62;
  localparam main_fsm_63 = 63;

  always @(posedge CLK) begin
    if(RST) begin
      main_fsm <= main_fsm_init;
      transpose_14_objaddr <= 0;
      transpose_14_arg_objaddr_0 <= 0;
      transpose_14_control_param_index <= 0;
      _lazy_reshape_1_objaddr <= 0;
      _lazy_reshape_1_arg_objaddr_0 <= 0;
      matmul_5_objaddr <= 0;
      matmul_5_arg_objaddr_0 <= 0;
      matmul_5_arg_objaddr_1 <= 0;
      matmul_5_arg_objaddr_2 <= 0;
      matmul_5_control_param_index <= 0;
    end else begin
      case(main_fsm)
        main_fsm_init: begin
          if(_saxi_register_4 != 0) begin
            main_fsm <= main_fsm_1;
          end 
        end
        main_fsm_1: begin
          main_fsm <= main_fsm_2;
        end
        main_fsm_2: begin
          main_fsm <= main_fsm_3;
        end
        main_fsm_3: begin
          main_fsm <= main_fsm_4;
        end
        main_fsm_4: begin
          main_fsm <= main_fsm_5;
        end
        main_fsm_5: begin
          transpose_14_objaddr <= _saxi_register_33 + 219072;
          main_fsm <= main_fsm_6;
        end
        main_fsm_6: begin
          transpose_14_arg_objaddr_0 <= _saxi_register_36 + 217472;
          main_fsm <= main_fsm_7;
        end
        main_fsm_7: begin
          transpose_14_control_param_index <= 0;
          main_fsm <= main_fsm_8;
        end
        main_fsm_8: begin
          main_fsm <= main_fsm_9;
        end
        main_fsm_9: begin
          main_fsm <= main_fsm_10;
        end
        main_fsm_10: begin
          if(control_transpose_14 == 12) begin
            main_fsm <= main_fsm_11;
          end 
        end
        main_fsm_11: begin
          main_fsm <= main_fsm_12;
        end
        main_fsm_12: begin
          transpose_14_objaddr <= _saxi_register_33 + 202560;
          main_fsm <= main_fsm_13;
        end
        main_fsm_13: begin
          transpose_14_arg_objaddr_0 <= _saxi_register_36 + 200960;
          main_fsm <= main_fsm_14;
        end
        main_fsm_14: begin
          transpose_14_control_param_index <= 1;
          main_fsm <= main_fsm_15;
        end
        main_fsm_15: begin
          main_fsm <= main_fsm_16;
        end
        main_fsm_16: begin
          main_fsm <= main_fsm_17;
        end
        main_fsm_17: begin
          if(control_transpose_14 == 12) begin
            main_fsm <= main_fsm_18;
          end 
        end
        main_fsm_18: begin
          main_fsm <= main_fsm_19;
        end
        main_fsm_19: begin
          transpose_14_objaddr <= _saxi_register_33 + 1600;
          main_fsm <= main_fsm_20;
        end
        main_fsm_20: begin
          transpose_14_arg_objaddr_0 <= _saxi_register_36;
          main_fsm <= main_fsm_21;
        end
        main_fsm_21: begin
          transpose_14_control_param_index <= 2;
          main_fsm <= main_fsm_22;
        end
        main_fsm_22: begin
          main_fsm <= main_fsm_23;
        end
        main_fsm_23: begin
          main_fsm <= main_fsm_24;
        end
        main_fsm_24: begin
          if(control_transpose_14 == 12) begin
            main_fsm <= main_fsm_25;
          end 
        end
        main_fsm_25: begin
          main_fsm <= main_fsm_26;
        end
        main_fsm_26: begin
          _lazy_reshape_1_objaddr <= _saxi_register_33;
          main_fsm <= main_fsm_27;
        end
        main_fsm_27: begin
          _lazy_reshape_1_arg_objaddr_0 <= _saxi_register_35;
          main_fsm <= main_fsm_28;
        end
        main_fsm_28: begin
          main_fsm <= main_fsm_29;
        end
        main_fsm_29: begin
          main_fsm <= main_fsm_30;
        end
        main_fsm_30: begin
          if(control__lazy_reshape_1 == 15) begin
            main_fsm <= main_fsm_31;
          end 
        end
        main_fsm_31: begin
          main_fsm <= main_fsm_32;
        end
        main_fsm_32: begin
          matmul_5_objaddr <= _saxi_register_33 + 202304;
          main_fsm <= main_fsm_33;
        end
        main_fsm_33: begin
          matmul_5_arg_objaddr_0 <= _saxi_register_33;
          main_fsm <= main_fsm_34;
        end
        main_fsm_34: begin
          matmul_5_arg_objaddr_1 <= _saxi_register_33 + 1600;
          main_fsm <= main_fsm_35;
        end
        main_fsm_35: begin
          matmul_5_arg_objaddr_2 <= _saxi_register_36 + 200704;
          main_fsm <= main_fsm_36;
        end
        main_fsm_36: begin
          matmul_5_control_param_index <= 0;
          main_fsm <= main_fsm_37;
        end
        main_fsm_37: begin
          main_fsm <= main_fsm_38;
        end
        main_fsm_38: begin
          main_fsm <= main_fsm_39;
        end
        main_fsm_39: begin
          if(control_matmul_5 == 26) begin
            main_fsm <= main_fsm_40;
          end 
        end
        main_fsm_40: begin
          main_fsm <= main_fsm_41;
        end
        main_fsm_41: begin
          matmul_5_objaddr <= _saxi_register_33 + 218944;
          main_fsm <= main_fsm_42;
        end
        main_fsm_42: begin
          matmul_5_arg_objaddr_0 <= _saxi_register_33 + 202304;
          main_fsm <= main_fsm_43;
        end
        main_fsm_43: begin
          matmul_5_arg_objaddr_1 <= _saxi_register_33 + 202560;
          main_fsm <= main_fsm_44;
        end
        main_fsm_44: begin
          matmul_5_arg_objaddr_2 <= _saxi_register_36 + 217344;
          main_fsm <= main_fsm_45;
        end
        main_fsm_45: begin
          matmul_5_control_param_index <= 1;
          main_fsm <= main_fsm_46;
        end
        main_fsm_46: begin
          main_fsm <= main_fsm_47;
        end
        main_fsm_47: begin
          main_fsm <= main_fsm_48;
        end
        main_fsm_48: begin
          if(control_matmul_5 == 26) begin
            main_fsm <= main_fsm_49;
          end 
        end
        main_fsm_49: begin
          main_fsm <= main_fsm_50;
        end
        main_fsm_50: begin
          matmul_5_objaddr <= _saxi_register_34;
          main_fsm <= main_fsm_51;
        end
        main_fsm_51: begin
          matmul_5_arg_objaddr_0 <= _saxi_register_33 + 218944;
          main_fsm <= main_fsm_52;
        end
        main_fsm_52: begin
          matmul_5_arg_objaddr_1 <= _saxi_register_33 + 219072;
          main_fsm <= main_fsm_53;
        end
        main_fsm_53: begin
          matmul_5_arg_objaddr_2 <= _saxi_register_36 + 218752;
          main_fsm <= main_fsm_54;
        end
        main_fsm_54: begin
          matmul_5_control_param_index <= 2;
          main_fsm <= main_fsm_55;
        end
        main_fsm_55: begin
          main_fsm <= main_fsm_56;
        end
        main_fsm_56: begin
          main_fsm <= main_fsm_57;
        end
        main_fsm_57: begin
          if(control_matmul_5 == 26) begin
            main_fsm <= main_fsm_58;
          end 
        end
        main_fsm_58: begin
          main_fsm <= main_fsm_59;
        end
        main_fsm_59: begin
          main_fsm <= main_fsm_60;
        end
        main_fsm_60: begin
          main_fsm <= main_fsm_61;
        end
        main_fsm_61: begin
          main_fsm <= main_fsm_62;
        end
        main_fsm_62: begin
          main_fsm <= main_fsm_63;
        end
        main_fsm_63: begin
          main_fsm <= main_fsm_init;
        end
      endcase
    end
  end

  localparam control_transpose_14_1 = 1;
  localparam control_transpose_14_2 = 2;
  localparam control_transpose_14_3 = 3;
  localparam control_transpose_14_4 = 4;
  localparam control_transpose_14_5 = 5;
  localparam control_transpose_14_6 = 6;
  localparam control_transpose_14_7 = 7;
  localparam control_transpose_14_8 = 8;
  localparam control_transpose_14_9 = 9;
  localparam control_transpose_14_10 = 10;
  localparam control_transpose_14_11 = 11;
  localparam control_transpose_14_12 = 12;

  always @(posedge CLK) begin
    if(RST) begin
      control_transpose_14 <= control_transpose_14_init;
      _control_transpose_14_called <= 0;
      _tmp_54 <= 0;
      _tmp_55 <= 0;
      _tmp_56 <= 0;
      _tmp_57 <= 0;
      _tmp_58 <= 0;
      read_rdata_113 <= 0;
    end else begin
      case(control_transpose_14)
        control_transpose_14_init: begin
          if(main_fsm == 8) begin
            _control_transpose_14_called <= 1;
          end 
          if(main_fsm == 15) begin
            _control_transpose_14_called <= 1;
          end 
          if(main_fsm == 22) begin
            _control_transpose_14_called <= 1;
          end 
          if(main_fsm == 8) begin
            control_transpose_14 <= control_transpose_14_1;
          end 
          if(main_fsm == 15) begin
            control_transpose_14 <= control_transpose_14_1;
          end 
          if(main_fsm == 22) begin
            control_transpose_14 <= control_transpose_14_1;
          end 
        end
        control_transpose_14_1: begin
          control_transpose_14 <= control_transpose_14_2;
        end
        control_transpose_14_2: begin
          _tmp_54 <= 0;
          _tmp_55 <= 0;
          _tmp_56 <= 0;
          _tmp_57 <= 0;
          _tmp_58 <= 0;
          control_transpose_14 <= control_transpose_14_3;
        end
        control_transpose_14_3: begin
          if(_maxi_read_req_idle) begin
            control_transpose_14 <= control_transpose_14_4;
          end 
        end
        control_transpose_14_4: begin
          if(_maxi_read_idle) begin
            control_transpose_14 <= control_transpose_14_5;
          end 
        end
        control_transpose_14_5: begin
          if(_maxi_read_req_idle) begin
            control_transpose_14 <= control_transpose_14_6;
          end 
        end
        control_transpose_14_6: begin
          if(_maxi_read_idle) begin
            control_transpose_14 <= control_transpose_14_7;
          end 
        end
        control_transpose_14_7: begin
          if(read_rtl_rvalid_112) begin
            read_rdata_113 <= read_rtl_rdata_111;
          end 
          if(read_rtl_rvalid_112) begin
            control_transpose_14 <= control_transpose_14_8;
          end 
        end
        control_transpose_14_8: begin
          control_transpose_14 <= control_transpose_14_9;
        end
        control_transpose_14_9: begin
          if(_maxi_write_req_idle) begin
            control_transpose_14 <= control_transpose_14_10;
          end 
        end
        control_transpose_14_10: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            control_transpose_14 <= control_transpose_14_11;
          end 
        end
        control_transpose_14_11: begin
          if(1) begin
            _tmp_57 <= _tmp_57 + 1;
            _tmp_55 <= _tmp_55 + 128;
          end 
          if(1 && (_tmp_57 == 9)) begin
            _tmp_57 <= 0;
            _tmp_55 <= 0;
          end 
          if(1 && (_tmp_57 == 9)) begin
            _tmp_58 <= _tmp_58 + 1;
            _tmp_56 <= _tmp_56 + 2;
          end 
          if(1 && (_tmp_57 == 9) && (_tmp_58 == 63)) begin
            _tmp_58 <= 0;
            _tmp_56 <= 0;
          end 
          if(_tmp_57 == 9) begin
            _tmp_54 <= _tmp_54 + 20;
          end 
          if(_tmp_57 < 9) begin
            control_transpose_14 <= control_transpose_14_5;
          end 
          if(_tmp_57 == 9) begin
            control_transpose_14 <= control_transpose_14_3;
          end 
          if(1 && (_tmp_57 == 9) && (_tmp_58 == 63)) begin
            control_transpose_14 <= control_transpose_14_12;
          end 
        end
        control_transpose_14_12: begin
          if(main_fsm == 11) begin
            _control_transpose_14_called <= 0;
          end 
          if(main_fsm == 18) begin
            _control_transpose_14_called <= 0;
          end 
          if(main_fsm == 25) begin
            _control_transpose_14_called <= 0;
          end 
          if(main_fsm == 11) begin
            control_transpose_14 <= control_transpose_14_init;
          end 
          if(main_fsm == 18) begin
            control_transpose_14 <= control_transpose_14_init;
          end 
          if(main_fsm == 25) begin
            control_transpose_14 <= control_transpose_14_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_read_req_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _maxi_read_req_fsm <= _maxi_read_req_fsm_init;
      _maxi_read_cont <= 0;
    end else begin
      case(_maxi_read_req_fsm)
        _maxi_read_req_fsm_init: begin
          if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full) begin
            _maxi_read_req_fsm <= _maxi_read_req_fsm_1;
          end 
        end
        _maxi_read_req_fsm_1: begin
          if(maxi_arready || !maxi_arvalid) begin
            _maxi_read_cont <= 1;
          end 
          if((maxi_arready || !maxi_arvalid) && (_maxi_read_global_size == 0)) begin
            _maxi_read_cont <= 0;
          end 
          if(maxi_arready || !maxi_arvalid) begin
            _maxi_read_req_fsm <= _maxi_read_req_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_read_data_fsm_1 = 1;
  localparam _maxi_read_data_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
    end else begin
      case(_maxi_read_data_fsm)
        _maxi_read_data_fsm_init: begin
          if(!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_1;
          end 
          if(!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_1;
          end 
          if(!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_1;
          end 
          if(!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 4)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_1;
          end 
          if(!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 5)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_1;
          end 
        end
        _maxi_read_data_fsm_1: begin
          _maxi_read_data_fsm <= _maxi_read_data_fsm_2;
          _maxi_read_data_fsm <= _maxi_read_data_fsm_2;
          _maxi_read_data_fsm <= _maxi_read_data_fsm_2;
          _maxi_read_data_fsm <= _maxi_read_data_fsm_2;
          _maxi_read_data_fsm <= _maxi_read_data_fsm_2;
        end
        _maxi_read_data_fsm_2: begin
          if(_maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
          end 
          if(_maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
          end 
          if(_maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
          end 
          if(_maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
          end 
          if(_maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_packed_fsm_0_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
      write_burst_packed_addr_84 <= 0;
      write_burst_packed_stride_85 <= 0;
      write_burst_packed_length_86 <= 0;
      write_burst_packed_done_87 <= 0;
    end else begin
      case(write_burst_packed_fsm_0)
        write_burst_packed_fsm_0_init: begin
          write_burst_packed_addr_84 <= _maxi_read_local_addr_buf;
          write_burst_packed_stride_85 <= _maxi_read_local_stride_buf;
          write_burst_packed_length_86 <= _maxi_read_local_size_buf;
          write_burst_packed_done_87 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 1) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_1;
          end 
        end
        write_burst_packed_fsm_0_1: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_packed_addr_84 <= write_burst_packed_addr_84 + write_burst_packed_stride_85;
            write_burst_packed_length_86 <= write_burst_packed_length_86 - 1;
            write_burst_packed_done_87 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_packed_length_86 <= 1)) begin
            write_burst_packed_done_87 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_packed_done_87 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_packed_length_86 <= 1)) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
          end 
          if(0) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_packed_fsm_1_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
      write_burst_packed_addr_97 <= 0;
      write_burst_packed_stride_98 <= 0;
      write_burst_packed_length_99 <= 0;
      write_burst_packed_done_100 <= 0;
    end else begin
      case(write_burst_packed_fsm_1)
        write_burst_packed_fsm_1_init: begin
          write_burst_packed_addr_97 <= _maxi_read_local_addr_buf;
          write_burst_packed_stride_98 <= _maxi_read_local_stride_buf;
          write_burst_packed_length_99 <= _maxi_read_local_size_buf;
          write_burst_packed_done_100 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 2) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_1;
          end 
        end
        write_burst_packed_fsm_1_1: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_packed_addr_97 <= write_burst_packed_addr_97 + write_burst_packed_stride_98;
            write_burst_packed_length_99 <= write_burst_packed_length_99 - 1;
            write_burst_packed_done_100 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_packed_length_99 <= 1)) begin
            write_burst_packed_done_100 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_packed_done_100 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_packed_length_99 <= 1)) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
          end 
          if(0) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _tmp_106 <= 0;
      _tmp_170 <= 0;
    end else begin
      if(control_transpose_14 == 7) begin
        _tmp_106 <= read_rtl_bank_105;
      end 
      if(_stream__lazy_reshape_1_stream_oready && _stream__lazy_reshape_1_source_0_source_ram_renable && (_stream__lazy_reshape_1_source_0_source_sel == 1)) begin
        _tmp_170 <= read_rtl_bank_169;
      end 
    end
  end

  localparam _maxi_write_req_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _maxi_write_req_fsm <= _maxi_write_req_fsm_init;
      _maxi_write_cont <= 0;
    end else begin
      case(_maxi_write_req_fsm)
        _maxi_write_req_fsm_init: begin
          if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full) begin
            _maxi_write_req_fsm <= _maxi_write_req_fsm_1;
          end 
        end
        _maxi_write_req_fsm_1: begin
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6)) begin
            _maxi_write_cont <= 1;
          end 
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6) && (_maxi_write_global_size == 0)) begin
            _maxi_write_cont <= 0;
          end 
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6)) begin
            _maxi_write_req_fsm <= _maxi_write_req_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_write_data_fsm_1 = 1;
  localparam _maxi_write_data_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RESETN_inv_buf) begin
      _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
    end else begin
      case(_maxi_write_data_fsm)
        _maxi_write_data_fsm_init: begin
          if(!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1)) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_1;
          end 
          if(!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 2)) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_1;
          end 
        end
        _maxi_write_data_fsm_1: begin
          _maxi_write_data_fsm <= _maxi_write_data_fsm_2;
          _maxi_write_data_fsm <= _maxi_write_data_fsm_2;
        end
        _maxi_write_data_fsm_2: begin
          if((_maxi_write_op_sel_buf == 1) && read_burst_packed_rvalid_152 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && read_burst_packed_rlast_153) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
          end 
          if((_maxi_write_op_sel_buf == 2) && read_burst_rvalid_788 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && read_burst_rlast_789) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_packed_fsm_2_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_packed_fsm_2 <= read_burst_packed_fsm_2_init;
      read_burst_packed_addr_149 <= 0;
      read_burst_packed_stride_150 <= 0;
      read_burst_packed_length_151 <= 0;
      read_burst_packed_rvalid_152 <= 0;
      read_burst_packed_rlast_153 <= 0;
    end else begin
      case(read_burst_packed_fsm_2)
        read_burst_packed_fsm_2_init: begin
          read_burst_packed_addr_149 <= _maxi_write_local_addr_buf;
          read_burst_packed_stride_150 <= _maxi_write_local_stride_buf;
          read_burst_packed_length_151 <= _maxi_write_size_buf;
          read_burst_packed_rvalid_152 <= 0;
          read_burst_packed_rlast_153 <= 0;
          if((_maxi_write_data_fsm == 1) && (_maxi_write_op_sel_buf == 1) && (_maxi_write_size_buf > 0)) begin
            read_burst_packed_fsm_2 <= read_burst_packed_fsm_2_1;
          end 
        end
        read_burst_packed_fsm_2_1: begin
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_packed_length_151 > 0)) begin
            read_burst_packed_addr_149 <= read_burst_packed_addr_149 + read_burst_packed_stride_150;
            read_burst_packed_length_151 <= read_burst_packed_length_151 - 1;
            read_burst_packed_rvalid_152 <= 1;
          end 
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_packed_length_151 <= 1)) begin
            read_burst_packed_rlast_153 <= 1;
          end 
          if(read_burst_packed_rlast_153 && read_burst_packed_rvalid_152 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_packed_rvalid_152 <= 0;
            read_burst_packed_rlast_153 <= 0;
          end 
          if(0) begin
            read_burst_packed_rvalid_152 <= 0;
            read_burst_packed_rlast_153 <= 0;
          end 
          if(read_burst_packed_rlast_153 && read_burst_packed_rvalid_152 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_packed_fsm_2 <= read_burst_packed_fsm_2_init;
          end 
          if(0) begin
            read_burst_packed_fsm_2 <= read_burst_packed_fsm_2_init;
          end 
        end
      endcase
    end
  end

  localparam control__lazy_reshape_1_1 = 1;
  localparam control__lazy_reshape_1_2 = 2;
  localparam control__lazy_reshape_1_3 = 3;
  localparam control__lazy_reshape_1_4 = 4;
  localparam control__lazy_reshape_1_5 = 5;
  localparam control__lazy_reshape_1_6 = 6;
  localparam control__lazy_reshape_1_7 = 7;
  localparam control__lazy_reshape_1_8 = 8;
  localparam control__lazy_reshape_1_9 = 9;
  localparam control__lazy_reshape_1_10 = 10;
  localparam control__lazy_reshape_1_11 = 11;
  localparam control__lazy_reshape_1_12 = 12;
  localparam control__lazy_reshape_1_13 = 13;
  localparam control__lazy_reshape_1_14 = 14;
  localparam control__lazy_reshape_1_15 = 15;

  always @(posedge CLK) begin
    if(RST) begin
      control__lazy_reshape_1 <= control__lazy_reshape_1_init;
      _control__lazy_reshape_1_called <= 0;
      _lazy_reshape_1_total_count <= 0;
      _lazy_reshape_1_in_offset <= 0;
      _lazy_reshape_1_out_offset <= 0;
      _lazy_reshape_1_count_read <= 0;
      _lazy_reshape_1_count_copy <= 0;
      _lazy_reshape_1_count_write <= 0;
      _lazy_reshape_1_copy_src <= 0;
      _lazy_reshape_1_copy_dst <= 0;
      _lazy_reshape_1_copy_size <= 0;
    end else begin
      case(control__lazy_reshape_1)
        control__lazy_reshape_1_init: begin
          if(main_fsm == 28) begin
            _control__lazy_reshape_1_called <= 1;
          end 
          if(main_fsm == 28) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_1;
          end 
        end
        control__lazy_reshape_1_1: begin
          control__lazy_reshape_1 <= control__lazy_reshape_1_2;
        end
        control__lazy_reshape_1_2: begin
          _lazy_reshape_1_total_count <= 0;
          _lazy_reshape_1_in_offset <= 0;
          _lazy_reshape_1_out_offset <= 0;
          _lazy_reshape_1_count_read <= 0;
          _lazy_reshape_1_count_copy <= 0;
          _lazy_reshape_1_count_write <= 0;
          _lazy_reshape_1_copy_src <= 0;
          _lazy_reshape_1_copy_dst <= 0;
          _lazy_reshape_1_copy_size <= 0;
          control__lazy_reshape_1 <= control__lazy_reshape_1_3;
        end
        control__lazy_reshape_1_3: begin
          if(_maxi_read_req_idle) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_4;
          end 
        end
        control__lazy_reshape_1_4: begin
          if(_maxi_read_idle) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_5;
          end 
        end
        control__lazy_reshape_1_5: begin
          _lazy_reshape_1_in_offset <= _lazy_reshape_1_in_offset + cparam__lazy_reshape_1_in_offset_inc;
          _lazy_reshape_1_count_read <= _lazy_reshape_1_count_read + cparam__lazy_reshape_1_read_size;
          _lazy_reshape_1_copy_src <= 0;
          control__lazy_reshape_1 <= control__lazy_reshape_1_6;
        end
        control__lazy_reshape_1_6: begin
          if(cparam__lazy_reshape_1_read_size <= cparam__lazy_reshape_1_write_size) begin
            _lazy_reshape_1_copy_size <= cparam__lazy_reshape_1_read_size;
          end 
          if((cparam__lazy_reshape_1_read_size <= cparam__lazy_reshape_1_write_size) && (_lazy_reshape_1_count_read - _lazy_reshape_1_count_copy < cparam__lazy_reshape_1_read_size)) begin
            _lazy_reshape_1_copy_size <= _lazy_reshape_1_count_read - _lazy_reshape_1_count_copy;
          end 
          if(cparam__lazy_reshape_1_write_size < cparam__lazy_reshape_1_read_size) begin
            _lazy_reshape_1_copy_size <= cparam__lazy_reshape_1_write_size;
          end 
          if((cparam__lazy_reshape_1_write_size < cparam__lazy_reshape_1_read_size) && (_lazy_reshape_1_count_read - _lazy_reshape_1_count_copy < cparam__lazy_reshape_1_write_size)) begin
            _lazy_reshape_1_copy_size <= _lazy_reshape_1_count_read - _lazy_reshape_1_count_copy;
          end 
          if(_lazy_reshape_1_count_read == _lazy_reshape_1_count_copy) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_3;
          end 
          if(_lazy_reshape_1_count_read > _lazy_reshape_1_count_copy) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_7;
          end 
        end
        control__lazy_reshape_1_7: begin
          control__lazy_reshape_1 <= control__lazy_reshape_1_8;
          if(_stream__lazy_reshape_1_stream_oready) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_8;
          end 
        end
        control__lazy_reshape_1_8: begin
          control__lazy_reshape_1 <= control__lazy_reshape_1_9;
        end
        control__lazy_reshape_1_9: begin
          if(_stream__lazy_reshape_1_busy) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_10;
          end 
        end
        control__lazy_reshape_1_10: begin
          if(!_stream__lazy_reshape_1_busy) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_11;
          end 
        end
        control__lazy_reshape_1_11: begin
          _lazy_reshape_1_count_copy <= _lazy_reshape_1_count_copy + _lazy_reshape_1_copy_size;
          if(_lazy_reshape_1_count_write + cparam__lazy_reshape_1_write_size > _lazy_reshape_1_count_copy + _lazy_reshape_1_copy_size) begin
            _lazy_reshape_1_copy_src <= 0;
            _lazy_reshape_1_copy_dst <= _lazy_reshape_1_copy_dst + _lazy_reshape_1_copy_size;
          end 
          if(_lazy_reshape_1_count_write + cparam__lazy_reshape_1_write_size <= _lazy_reshape_1_count_copy + _lazy_reshape_1_copy_size) begin
            _lazy_reshape_1_copy_src <= _lazy_reshape_1_copy_src + _lazy_reshape_1_copy_size;
            _lazy_reshape_1_copy_dst <= 0;
          end 
          if(_lazy_reshape_1_count_write + cparam__lazy_reshape_1_write_size > _lazy_reshape_1_count_copy + _lazy_reshape_1_copy_size) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_3;
          end 
          if(_lazy_reshape_1_count_write + cparam__lazy_reshape_1_write_size <= _lazy_reshape_1_count_copy + _lazy_reshape_1_copy_size) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_12;
          end 
        end
        control__lazy_reshape_1_12: begin
          if(_maxi_write_req_idle) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_13;
          end 
        end
        control__lazy_reshape_1_13: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_14;
          end 
        end
        control__lazy_reshape_1_14: begin
          _lazy_reshape_1_total_count <= _lazy_reshape_1_total_count + cparam__lazy_reshape_1_write_size;
          _lazy_reshape_1_out_offset <= _lazy_reshape_1_out_offset + cparam__lazy_reshape_1_out_offset_inc;
          _lazy_reshape_1_count_write <= _lazy_reshape_1_count_write + cparam__lazy_reshape_1_write_size;
          _lazy_reshape_1_copy_dst <= 0;
          control__lazy_reshape_1 <= control__lazy_reshape_1_6;
          if(_lazy_reshape_1_total_count + cparam__lazy_reshape_1_write_size >= cparam__lazy_reshape_1_total_size) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_15;
          end 
        end
        control__lazy_reshape_1_15: begin
          if(main_fsm == 31) begin
            _control__lazy_reshape_1_called <= 0;
          end 
          if(main_fsm == 31) begin
            control__lazy_reshape_1 <= control__lazy_reshape_1_init;
          end 
        end
      endcase
    end
  end

  localparam _stream__lazy_reshape_1_source_0_source_fsm_0_1 = 1;
  localparam _stream__lazy_reshape_1_source_0_source_fsm_0_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _stream__lazy_reshape_1_source_0_source_fsm_0 <= _stream__lazy_reshape_1_source_0_source_fsm_0_init;
    end else begin
      case(_stream__lazy_reshape_1_source_0_source_fsm_0)
        _stream__lazy_reshape_1_source_0_source_fsm_0_init: begin
          if(_stream__lazy_reshape_1_source_start && _stream__lazy_reshape_1_source_0_source_mode & 5'b1 && _stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_source_0_source_fsm_0 <= _stream__lazy_reshape_1_source_0_source_fsm_0_1;
          end 
        end
        _stream__lazy_reshape_1_source_0_source_fsm_0_1: begin
          if(_stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_source_0_source_fsm_0 <= _stream__lazy_reshape_1_source_0_source_fsm_0_2;
          end 
        end
        _stream__lazy_reshape_1_source_0_source_fsm_0_2: begin
          if((_stream__lazy_reshape_1_source_0_source_count == 1) && _stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_source_0_source_fsm_0 <= _stream__lazy_reshape_1_source_0_source_fsm_0_init;
          end 
          if(_stream__lazy_reshape_1_source_stop && _stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_source_0_source_fsm_0 <= _stream__lazy_reshape_1_source_0_source_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam _stream__lazy_reshape_1_sink_1_sink_fsm_1_1 = 1;
  localparam _stream__lazy_reshape_1_sink_1_sink_fsm_1_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _stream__lazy_reshape_1_sink_1_sink_fsm_1 <= _stream__lazy_reshape_1_sink_1_sink_fsm_1_init;
    end else begin
      case(_stream__lazy_reshape_1_sink_1_sink_fsm_1)
        _stream__lazy_reshape_1_sink_1_sink_fsm_1_init: begin
          if(_stream__lazy_reshape_1_sink_start && _stream__lazy_reshape_1_sink_1_sink_mode & 5'b1 && _stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_sink_1_sink_fsm_1 <= _stream__lazy_reshape_1_sink_1_sink_fsm_1_1;
          end 
        end
        _stream__lazy_reshape_1_sink_1_sink_fsm_1_1: begin
          if(_stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_sink_1_sink_fsm_1 <= _stream__lazy_reshape_1_sink_1_sink_fsm_1_2;
          end 
        end
        _stream__lazy_reshape_1_sink_1_sink_fsm_1_2: begin
          if((_stream__lazy_reshape_1_sink_1_sink_count == 1) && _stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_sink_1_sink_fsm_1 <= _stream__lazy_reshape_1_sink_1_sink_fsm_1_init;
          end 
          if(_stream__lazy_reshape_1_sink_stop && _stream__lazy_reshape_1_stream_oready) begin
            _stream__lazy_reshape_1_sink_1_sink_fsm_1 <= _stream__lazy_reshape_1_sink_1_sink_fsm_1_init;
          end 
        end
      endcase
    end
  end

  localparam control_matmul_5_1 = 1;
  localparam control_matmul_5_2 = 2;
  localparam control_matmul_5_3 = 3;
  localparam control_matmul_5_4 = 4;
  localparam control_matmul_5_5 = 5;
  localparam control_matmul_5_6 = 6;
  localparam control_matmul_5_7 = 7;
  localparam control_matmul_5_8 = 8;
  localparam control_matmul_5_9 = 9;
  localparam control_matmul_5_10 = 10;
  localparam control_matmul_5_11 = 11;
  localparam control_matmul_5_12 = 12;
  localparam control_matmul_5_13 = 13;
  localparam control_matmul_5_14 = 14;
  localparam control_matmul_5_15 = 15;
  localparam control_matmul_5_16 = 16;
  localparam control_matmul_5_17 = 17;
  localparam control_matmul_5_18 = 18;
  localparam control_matmul_5_19 = 19;
  localparam control_matmul_5_20 = 20;
  localparam control_matmul_5_21 = 21;
  localparam control_matmul_5_22 = 22;
  localparam control_matmul_5_23 = 23;
  localparam control_matmul_5_24 = 24;
  localparam control_matmul_5_25 = 25;
  localparam control_matmul_5_26 = 26;

  always @(posedge CLK) begin
    if(RST) begin
      control_matmul_5 <= control_matmul_5_init;
      _control_matmul_5_called <= 0;
      matmul_5_filter_base_offset <= 0;
      matmul_5_filter_page_comp_offset <= 0;
      matmul_5_filter_page_dma_offset <= 0;
      matmul_5_act_base_offset_row <= 0;
      matmul_5_act_base_offset_bat <= 0;
      matmul_5_dma_flag_0 <= 0;
      matmul_5_act_page_comp_offset_0 <= 0;
      matmul_5_act_page_dma_offset_0 <= 0;
      matmul_5_out_base_offset_val <= 0;
      matmul_5_out_base_offset_col <= 0;
      matmul_5_out_base_offset_row <= 0;
      matmul_5_out_base_offset_bat <= 0;
      matmul_5_out_base_offset_och <= 0;
      matmul_5_out_page <= 0;
      matmul_5_out_page_comp_offset <= 0;
      matmul_5_out_page_dma_offset <= 0;
      matmul_5_out_laddr_offset <= 0;
      matmul_5_sync_out_count <= 0;
      matmul_5_write_count <= 0;
      matmul_5_next_out_write_size <= 0;
      matmul_5_row_count <= 0;
      matmul_5_bat_count <= 0;
      matmul_5_och_count <= 0;
      matmul_5_row_select <= 0;
      matmul_5_prev_row_count <= 0;
      matmul_5_prev_bat_count <= 0;
      matmul_5_prev_och_count <= 0;
      matmul_5_prev_row_select <= 0;
      matmul_5_out_col_count <= 0;
      matmul_5_out_row_count <= 0;
      matmul_5_out_ram_select <= 0;
      matmul_5_skip_read_filter <= 0;
      matmul_5_skip_read_act <= 0;
      matmul_5_skip_comp <= 0;
      matmul_5_skip_write_out <= 1;
    end else begin
      case(control_matmul_5)
        control_matmul_5_init: begin
          if(main_fsm == 37) begin
            _control_matmul_5_called <= 1;
          end 
          if(main_fsm == 46) begin
            _control_matmul_5_called <= 1;
          end 
          if(main_fsm == 55) begin
            _control_matmul_5_called <= 1;
          end 
          if(main_fsm == 37) begin
            control_matmul_5 <= control_matmul_5_1;
          end 
          if(main_fsm == 46) begin
            control_matmul_5 <= control_matmul_5_1;
          end 
          if(main_fsm == 55) begin
            control_matmul_5 <= control_matmul_5_1;
          end 
        end
        control_matmul_5_1: begin
          control_matmul_5 <= control_matmul_5_2;
        end
        control_matmul_5_2: begin
          matmul_5_filter_base_offset <= 0;
          matmul_5_filter_page_comp_offset <= 0;
          matmul_5_filter_page_dma_offset <= 0;
          matmul_5_act_base_offset_row <= 0;
          matmul_5_act_base_offset_bat <= 0;
          matmul_5_dma_flag_0 <= 1;
          matmul_5_act_page_comp_offset_0 <= 0;
          matmul_5_act_page_dma_offset_0 <= 0;
          matmul_5_out_base_offset_val <= 0;
          matmul_5_out_base_offset_col <= 0;
          matmul_5_out_base_offset_row <= 0;
          matmul_5_out_base_offset_bat <= 0;
          matmul_5_out_base_offset_och <= 0;
          matmul_5_out_page <= 0;
          matmul_5_out_page_comp_offset <= 0;
          matmul_5_out_page_dma_offset <= 0;
          matmul_5_out_laddr_offset <= 0;
          matmul_5_sync_out_count <= 0;
          matmul_5_write_count <= 0;
          matmul_5_next_out_write_size <= (cparam_matmul_5_max_och_count == 0)? cparam_matmul_5_out_write_size_res : cparam_matmul_5_out_write_size;
          matmul_5_row_count <= 0;
          matmul_5_bat_count <= 0;
          matmul_5_och_count <= 0;
          matmul_5_row_select <= 0;
          matmul_5_prev_row_count <= 0;
          matmul_5_prev_bat_count <= 0;
          matmul_5_prev_och_count <= 0;
          matmul_5_prev_row_select <= 0;
          matmul_5_out_col_count <= 0;
          matmul_5_out_row_count <= 0;
          matmul_5_out_ram_select <= 0;
          matmul_5_skip_read_filter <= 0;
          matmul_5_skip_read_act <= 0;
          matmul_5_skip_comp <= 0;
          matmul_5_skip_write_out <= 1;
          if(_maxi_read_req_idle) begin
            control_matmul_5 <= control_matmul_5_3;
          end 
        end
        control_matmul_5_3: begin
          if(_maxi_read_idle) begin
            control_matmul_5 <= control_matmul_5_4;
          end 
        end
        control_matmul_5_4: begin
          if(cparam_matmul_5_data_stationary == 0) begin
            control_matmul_5 <= control_matmul_5_5;
          end 
          if(cparam_matmul_5_data_stationary == 1) begin
            control_matmul_5 <= control_matmul_5_10;
          end 
        end
        control_matmul_5_5: begin
          control_matmul_5 <= control_matmul_5_6;
          if(matmul_5_skip_read_filter) begin
            control_matmul_5 <= control_matmul_5_9;
          end 
        end
        control_matmul_5_6: begin
          if(_maxi_read_req_idle) begin
            control_matmul_5 <= control_matmul_5_7;
          end 
        end
        control_matmul_5_7: begin
          if(_maxi_read_idle) begin
            control_matmul_5 <= control_matmul_5_8;
          end 
        end
        control_matmul_5_8: begin
          control_matmul_5 <= control_matmul_5_9;
        end
        control_matmul_5_9: begin
          if(cparam_matmul_5_data_stationary == 0) begin
            control_matmul_5 <= control_matmul_5_10;
          end 
          if(cparam_matmul_5_data_stationary == 1) begin
            control_matmul_5 <= control_matmul_5_16;
          end 
        end
        control_matmul_5_10: begin
          control_matmul_5 <= control_matmul_5_11;
          if(matmul_5_skip_read_act) begin
            control_matmul_5 <= control_matmul_5_15;
          end 
        end
        control_matmul_5_11: begin
          control_matmul_5 <= control_matmul_5_12;
          if(matmul_5_mux_dma_pad_mask_0 || !matmul_5_mux_dma_flag_0) begin
            control_matmul_5 <= control_matmul_5_14;
          end 
        end
        control_matmul_5_12: begin
          if(_maxi_read_req_idle) begin
            control_matmul_5 <= control_matmul_5_13;
          end 
        end
        control_matmul_5_13: begin
          if(_maxi_read_idle) begin
            control_matmul_5 <= control_matmul_5_14;
          end 
        end
        control_matmul_5_14: begin
          control_matmul_5 <= control_matmul_5_15;
        end
        control_matmul_5_15: begin
          if(cparam_matmul_5_data_stationary == 0) begin
            control_matmul_5 <= control_matmul_5_16;
          end 
          if(cparam_matmul_5_data_stationary == 1) begin
            control_matmul_5 <= control_matmul_5_5;
          end 
        end
        control_matmul_5_16: begin
          if(_maxi_write_idle) begin
            control_matmul_5 <= control_matmul_5_17;
          end 
        end
        control_matmul_5_17: begin
          if(matmul_5_comp_fsm == 0) begin
            control_matmul_5 <= control_matmul_5_18;
          end 
        end
        control_matmul_5_18: begin
          control_matmul_5 <= control_matmul_5_19;
          if(matmul_5_skip_write_out) begin
            control_matmul_5 <= control_matmul_5_24;
          end 
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_prev_och_count < cparam_matmul_5_max_och_count)) begin
            control_matmul_5 <= control_matmul_5_24;
          end 
        end
        control_matmul_5_19: begin
          if(matmul_5_sync_comp_count >= matmul_5_sync_out_count + cparam_matmul_5_inc_sync_out) begin
            control_matmul_5 <= control_matmul_5_20;
          end 
        end
        control_matmul_5_20: begin
          if(!matmul_5_dma_out_mask_0) begin
            control_matmul_5 <= control_matmul_5_21;
          end 
          if(matmul_5_dma_out_mask_0) begin
            control_matmul_5 <= control_matmul_5_22;
          end 
        end
        control_matmul_5_21: begin
          if(_maxi_write_req_idle) begin
            control_matmul_5 <= control_matmul_5_22;
          end 
        end
        control_matmul_5_22: begin
          control_matmul_5 <= control_matmul_5_23;
        end
        control_matmul_5_23: begin
          matmul_5_write_count <= matmul_5_write_count + 1;
          if(matmul_5_out_ram_select == 0) begin
            matmul_5_out_laddr_offset <= matmul_5_out_laddr_offset + matmul_5_next_out_write_size;
          end 
          if((cparam_matmul_5_data_stationary == 0) && !cparam_matmul_5_keep_filter) begin
            matmul_5_out_base_offset_col <= matmul_5_out_base_offset_col + cparam_matmul_5_out_col_step;
            matmul_5_out_col_count <= matmul_5_out_col_count + 1;
          end 
          matmul_5_out_ram_select <= matmul_5_out_ram_select + 1;
          if(matmul_5_out_ram_select == 0) begin
            matmul_5_out_ram_select <= 0;
          end 
          matmul_5_sync_out_count <= matmul_5_sync_out_count + cparam_matmul_5_inc_sync_out;
          if((cparam_matmul_5_data_stationary == 0) && !cparam_matmul_5_keep_filter && (matmul_5_write_count >= cparam_matmul_5_out_num_col - 1) || (cparam_matmul_5_data_stationary == 0) && cparam_matmul_5_keep_filter || (cparam_matmul_5_data_stationary == 1)) begin
            matmul_5_sync_out_count <= matmul_5_sync_out_count + (cparam_matmul_5_inc_sync_out + cparam_matmul_5_inc_sync_out_res);
          end 
          if((cparam_matmul_5_data_stationary == 0) && !cparam_matmul_5_keep_filter) begin
            control_matmul_5 <= control_matmul_5_18;
          end 
          if((cparam_matmul_5_data_stationary == 0) && !cparam_matmul_5_keep_filter && (matmul_5_write_count >= cparam_matmul_5_out_num_col - 1) || (cparam_matmul_5_data_stationary == 0) && cparam_matmul_5_keep_filter || (cparam_matmul_5_data_stationary == 1)) begin
            control_matmul_5 <= control_matmul_5_24;
          end 
        end
        control_matmul_5_24: begin
          if(matmul_5_update_filter) begin
            matmul_5_filter_base_offset <= matmul_5_filter_base_offset + cparam_matmul_5_filter_base_step;
          end 
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_och_count >= cparam_matmul_5_max_och_count)) begin
            matmul_5_filter_base_offset <= 0;
          end 
          if(matmul_5_update_filter) begin
            matmul_5_och_count <= matmul_5_och_count + cparam_matmul_5_och_count_step;
          end 
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_och_count >= cparam_matmul_5_max_och_count)) begin
            matmul_5_och_count <= 0;
          end 
          if(matmul_5_update_filter) begin
            matmul_5_filter_page_comp_offset <= matmul_5_filter_page_comp_offset + cparam_matmul_5_filter_read_step;
            matmul_5_filter_page_dma_offset <= matmul_5_filter_page_dma_offset + cparam_matmul_5_filter_read_step;
          end 
          if(matmul_5_update_filter && (matmul_5_filter_page_comp_offset + cparam_matmul_5_filter_read_step + cparam_matmul_5_filter_read_step > 1024)) begin
            matmul_5_filter_page_comp_offset <= 0;
            matmul_5_filter_page_dma_offset <= 0;
          end 
          if(matmul_5_update_act) begin
            matmul_5_act_base_offset_row <= matmul_5_act_base_offset_row + cparam_matmul_5_act_row_step;
          end 
          if(matmul_5_update_act && (matmul_5_row_count >= cparam_matmul_5_max_row_count)) begin
            matmul_5_act_base_offset_row <= 0;
            matmul_5_act_base_offset_bat <= matmul_5_act_base_offset_bat + cparam_matmul_5_act_bat_step;
          end 
          if(matmul_5_update_act && (matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count)) begin
            matmul_5_act_base_offset_bat <= 0;
          end 
          if(!matmul_5_update_act) begin
            matmul_5_dma_flag_0 <= 0;
          end 
          if(matmul_5_update_act) begin
            matmul_5_dma_flag_0 <= cparam_matmul_5_dma_flag_conds_0;
          end 
          if(matmul_5_update_act && (matmul_5_row_count >= cparam_matmul_5_max_row_count)) begin
            matmul_5_dma_flag_0 <= 1;
          end 
          if(matmul_5_update_act) begin
            matmul_5_row_count <= matmul_5_row_count + cparam_matmul_5_stride_row_par_row;
          end 
          if(matmul_5_update_act && (matmul_5_row_count >= cparam_matmul_5_max_row_count)) begin
            matmul_5_row_count <= 0;
            matmul_5_bat_count <= matmul_5_bat_count + 1;
          end 
          if(matmul_5_update_act && (matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count)) begin
            matmul_5_bat_count <= 0;
          end 
          if(matmul_5_update_act && (cparam_matmul_5_stride_row_par_row < 1)) begin
            matmul_5_row_select <= matmul_5_row_select + cparam_matmul_5_stride_row_par_row;
            matmul_5_prev_row_select <= matmul_5_row_select;
          end 
          if(matmul_5_update_act && (cparam_matmul_5_stride_row_par_row < 1) && (matmul_5_row_select + cparam_matmul_5_stride_row_par_row >= 1)) begin
            matmul_5_row_select <= matmul_5_row_select - (1 - cparam_matmul_5_stride_row_par_row);
            matmul_5_prev_row_select <= matmul_5_row_select;
          end 
          if(matmul_5_update_act && !(cparam_matmul_5_stride_row_par_row < 1)) begin
            matmul_5_row_select <= 0;
            matmul_5_prev_row_select <= 0;
          end 
          if(matmul_5_update_act && (matmul_5_row_count >= cparam_matmul_5_max_row_count)) begin
            matmul_5_row_select <= 0;
            matmul_5_prev_row_select <= 0;
          end 
          if(matmul_5_update_act && matmul_5_mux_next_dma_flag_0) begin
            matmul_5_act_page_comp_offset_0 <= matmul_5_act_page_comp_offset_0 + cparam_matmul_5_act_read_step;
            matmul_5_act_page_dma_offset_0 <= matmul_5_act_page_dma_offset_0 + cparam_matmul_5_act_read_step;
          end 
          if(matmul_5_update_act && matmul_5_mux_next_dma_flag_0 && (matmul_5_act_page_comp_offset_0 + cparam_matmul_5_act_read_step + cparam_matmul_5_act_read_step > 512)) begin
            matmul_5_act_page_comp_offset_0 <= 0;
            matmul_5_act_page_dma_offset_0 <= 0;
          end 
          if((cparam_matmul_5_data_stationary == 0) && (matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count) && cparam_matmul_5_keep_input) begin
            matmul_5_act_page_comp_offset_0 <= 0;
            matmul_5_act_page_dma_offset_0 <= 0;
          end 
          matmul_5_next_out_write_size <= (matmul_5_och_count >= cparam_matmul_5_max_och_count)? cparam_matmul_5_out_write_size_res : cparam_matmul_5_out_write_size;
          if(!matmul_5_skip_write_out) begin
            matmul_5_write_count <= 0;
            matmul_5_out_laddr_offset <= 0;
            matmul_5_out_ram_select <= 0;
          end 
          if((cparam_matmul_5_data_stationary == 0) && !matmul_5_skip_write_out) begin
            matmul_5_out_base_offset_col <= 0;
            matmul_5_out_base_offset_row <= matmul_5_out_base_offset_row + cparam_matmul_5_out_row_step;
            matmul_5_out_col_count <= 0;
            matmul_5_out_row_count <= matmul_5_out_row_count + 1;
          end 
          if((cparam_matmul_5_data_stationary == 0) && !matmul_5_skip_write_out && (matmul_5_prev_row_count >= cparam_matmul_5_max_row_count)) begin
            matmul_5_out_base_offset_row <= 0;
            matmul_5_out_base_offset_bat <= matmul_5_out_base_offset_bat + cparam_matmul_5_out_bat_step;
            matmul_5_out_row_count <= 0;
          end 
          if((cparam_matmul_5_data_stationary == 0) && !matmul_5_skip_write_out && (matmul_5_prev_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_prev_bat_count >= cparam_matmul_5_max_bat_count)) begin
            matmul_5_out_base_offset_bat <= 0;
            matmul_5_out_base_offset_och <= matmul_5_out_base_offset_och + cparam_matmul_5_out_och_step;
          end 
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_prev_och_count >= cparam_matmul_5_max_och_count) && !matmul_5_skip_write_out) begin
            matmul_5_out_base_offset_row <= matmul_5_out_base_offset_row + cparam_matmul_5_out_row_step;
          end 
          if((cparam_matmul_5_data_stationary == 0) && !matmul_5_out_page) begin
            matmul_5_out_page_comp_offset <= 64;
            matmul_5_out_page_dma_offset <= 0;
            matmul_5_out_page <= 1;
          end 
          if((cparam_matmul_5_data_stationary == 0) && matmul_5_out_page) begin
            matmul_5_out_page_comp_offset <= 0;
            matmul_5_out_page_dma_offset <= 64;
            matmul_5_out_page <= 0;
          end 
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_och_count >= cparam_matmul_5_max_och_count) && !matmul_5_out_page) begin
            matmul_5_out_page_comp_offset <= 64;
            matmul_5_out_page_dma_offset <= 0;
            matmul_5_out_page <= 1;
          end 
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_och_count >= cparam_matmul_5_max_och_count) && matmul_5_out_page) begin
            matmul_5_out_page_comp_offset <= 0;
            matmul_5_out_page_dma_offset <= 64;
            matmul_5_out_page <= 0;
          end 
          matmul_5_prev_row_count <= matmul_5_row_count;
          matmul_5_prev_bat_count <= matmul_5_bat_count;
          matmul_5_prev_och_count <= matmul_5_och_count;
          if((matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count) && (matmul_5_och_count >= cparam_matmul_5_max_och_count)) begin
            matmul_5_skip_read_filter <= 1;
          end 
          if((cparam_matmul_5_data_stationary == 1) && cparam_matmul_5_keep_filter) begin
            matmul_5_skip_read_filter <= 1;
          end 
          if((matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count) && (matmul_5_och_count >= cparam_matmul_5_max_och_count)) begin
            matmul_5_skip_read_act <= 1;
          end 
          if((cparam_matmul_5_data_stationary == 0) && (matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count) && cparam_matmul_5_keep_input) begin
            matmul_5_skip_read_act <= 1;
          end 
          if((matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count) && (matmul_5_och_count >= cparam_matmul_5_max_och_count)) begin
            matmul_5_skip_comp <= 1;
          end 
          if(matmul_5_skip_write_out && (matmul_5_prev_row_count == 0) && (matmul_5_prev_bat_count == 0) && (matmul_5_prev_och_count == 0)) begin
            matmul_5_skip_write_out <= 0;
          end 
          if(cparam_matmul_5_data_stationary == 0) begin
            control_matmul_5 <= control_matmul_5_10;
          end 
          if((cparam_matmul_5_data_stationary == 0) && (matmul_5_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_bat_count >= cparam_matmul_5_max_bat_count)) begin
            control_matmul_5 <= control_matmul_5_5;
          end 
          if(cparam_matmul_5_data_stationary == 1) begin
            control_matmul_5 <= control_matmul_5_5;
          end 
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_och_count >= cparam_matmul_5_max_och_count)) begin
            control_matmul_5 <= control_matmul_5_10;
          end 
          if(!matmul_5_skip_write_out && (matmul_5_prev_och_count >= cparam_matmul_5_max_och_count) && (matmul_5_prev_row_count >= cparam_matmul_5_max_row_count) && (matmul_5_prev_bat_count >= cparam_matmul_5_max_bat_count)) begin
            control_matmul_5 <= control_matmul_5_25;
          end 
        end
        control_matmul_5_25: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            control_matmul_5 <= control_matmul_5_26;
          end 
        end
        control_matmul_5_26: begin
          if(main_fsm == 40) begin
            _control_matmul_5_called <= 0;
          end 
          if(main_fsm == 49) begin
            _control_matmul_5_called <= 0;
          end 
          if(main_fsm == 58) begin
            _control_matmul_5_called <= 0;
          end 
          if(main_fsm == 40) begin
            control_matmul_5 <= control_matmul_5_init;
          end 
          if(main_fsm == 49) begin
            control_matmul_5 <= control_matmul_5_init;
          end 
          if(main_fsm == 58) begin
            control_matmul_5 <= control_matmul_5_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_3_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_3 <= write_burst_fsm_3_init;
      write_burst_addr_206 <= 0;
      write_burst_stride_207 <= 0;
      write_burst_length_208 <= 0;
      write_burst_done_209 <= 0;
    end else begin
      case(write_burst_fsm_3)
        write_burst_fsm_3_init: begin
          write_burst_addr_206 <= _maxi_read_local_addr_buf;
          write_burst_stride_207 <= _maxi_read_local_stride_buf;
          write_burst_length_208 <= _maxi_read_local_size_buf;
          write_burst_done_209 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 3) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_fsm_3 <= write_burst_fsm_3_1;
          end 
        end
        write_burst_fsm_3_1: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_addr_206 <= write_burst_addr_206 + write_burst_stride_207;
            write_burst_length_208 <= write_burst_length_208 - 1;
            write_burst_done_209 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_208 <= 1)) begin
            write_burst_done_209 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_done_209 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_208 <= 1)) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
          if(0) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_4_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_4 <= write_burst_fsm_4_init;
      write_burst_addr_214 <= 0;
      write_burst_stride_215 <= 0;
      write_burst_length_216 <= 0;
      write_burst_done_217 <= 0;
    end else begin
      case(write_burst_fsm_4)
        write_burst_fsm_4_init: begin
          write_burst_addr_214 <= _maxi_read_local_addr_buf;
          write_burst_stride_215 <= _maxi_read_local_stride_buf;
          write_burst_length_216 <= _maxi_read_local_size_buf;
          write_burst_done_217 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 4) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_fsm_4 <= write_burst_fsm_4_1;
          end 
        end
        write_burst_fsm_4_1: begin
          if(write_burst_block_ram_wvalid_212) begin
            write_burst_addr_214 <= write_burst_addr_214 + write_burst_stride_215;
            write_burst_length_216 <= write_burst_length_216 - 1;
            write_burst_done_217 <= 0;
          end 
          if(write_burst_block_ram_wvalid_212 && (write_burst_length_216 <= 1)) begin
            write_burst_done_217 <= 1;
          end 
          if(write_burst_block_ram_wvalid_212 && 0) begin
            write_burst_done_217 <= 1;
          end 
          if(write_burst_block_ram_wvalid_212 && (write_burst_length_216 <= 1)) begin
            write_burst_fsm_4 <= write_burst_fsm_4_init;
          end 
          if(write_burst_block_ram_wvalid_212 && 0) begin
            write_burst_fsm_4 <= write_burst_fsm_4_init;
          end 
          if(write_burst_block_ram_wquit_213) begin
            write_burst_fsm_4 <= write_burst_fsm_4_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_5_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_5 <= write_burst_fsm_5_init;
      write_burst_addr_220 <= 0;
      write_burst_stride_221 <= 0;
      write_burst_length_222 <= 0;
      write_burst_done_223 <= 0;
    end else begin
      case(write_burst_fsm_5)
        write_burst_fsm_5_init: begin
          write_burst_addr_220 <= _maxi_read_local_addr_buf;
          write_burst_stride_221 <= _maxi_read_local_stride_buf;
          write_burst_length_222 <= _maxi_read_local_size_buf;
          write_burst_done_223 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 4) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_fsm_5 <= write_burst_fsm_5_1;
          end 
        end
        write_burst_fsm_5_1: begin
          if(write_burst_block_ram_wvalid_218) begin
            write_burst_addr_220 <= write_burst_addr_220 + write_burst_stride_221;
            write_burst_length_222 <= write_burst_length_222 - 1;
            write_burst_done_223 <= 0;
          end 
          if(write_burst_block_ram_wvalid_218 && (write_burst_length_222 <= 1)) begin
            write_burst_done_223 <= 1;
          end 
          if(write_burst_block_ram_wvalid_218 && 0) begin
            write_burst_done_223 <= 1;
          end 
          if(write_burst_block_ram_wvalid_218 && (write_burst_length_222 <= 1)) begin
            write_burst_fsm_5 <= write_burst_fsm_5_init;
          end 
          if(write_burst_block_ram_wvalid_218 && 0) begin
            write_burst_fsm_5 <= write_burst_fsm_5_init;
          end 
          if(write_burst_block_ram_wquit_219) begin
            write_burst_fsm_5 <= write_burst_fsm_5_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_block_fsm_6_1 = 1;
  localparam write_burst_block_fsm_6_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_block_fsm_6 <= write_burst_block_fsm_6_init;
      write_burst_block_length_224 <= 0;
      write_burst_block_blocksize_225 <= 0;
      write_burst_block_done_226 <= 0;
      write_burst_block_count_227 <= 0;
    end else begin
      case(write_burst_block_fsm_6)
        write_burst_block_fsm_6_init: begin
          write_burst_block_length_224 <= _maxi_read_local_size_buf;
          write_burst_block_blocksize_225 <= _maxi_read_local_blocksize_buf;
          write_burst_block_done_226 <= 0;
          write_burst_block_count_227 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 4) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_1;
          end 
        end
        write_burst_block_fsm_6_1: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_block_length_224 <= write_burst_block_length_224 - 1;
            write_burst_block_done_226 <= 0;
            write_burst_block_count_227 <= write_burst_block_count_227 + 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_block_length_224 <= 1)) begin
            write_burst_block_done_226 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_block_done_226 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_block_count_227 == write_burst_block_blocksize_225 - 1)) begin
            write_burst_block_count_227 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_block_count_227 == write_burst_block_blocksize_225 - 1)) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_2;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_block_length_224 <= 1)) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_init;
          end 
          if(0) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_init;
          end 
        end
        write_burst_block_fsm_6_2: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_block_length_224 <= write_burst_block_length_224 - 1;
            write_burst_block_done_226 <= 0;
            write_burst_block_count_227 <= write_burst_block_count_227 + 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_block_length_224 <= 1)) begin
            write_burst_block_done_226 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_block_done_226 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_block_count_227 == write_burst_block_blocksize_225 - 1)) begin
            write_burst_block_count_227 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_block_count_227 == write_burst_block_blocksize_225 - 1)) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_block_length_224 <= 1)) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_init;
          end 
          if(0) begin
            write_burst_block_fsm_6 <= write_burst_block_fsm_6_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_7_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_7 <= write_burst_fsm_7_init;
      write_burst_addr_230 <= 0;
      write_burst_stride_231 <= 0;
      write_burst_length_232 <= 0;
      write_burst_done_233 <= 0;
    end else begin
      case(write_burst_fsm_7)
        write_burst_fsm_7_init: begin
          write_burst_addr_230 <= _maxi_read_local_addr_buf;
          write_burst_stride_231 <= _maxi_read_local_stride_buf;
          write_burst_length_232 <= _maxi_read_local_size_buf;
          write_burst_done_233 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 5) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_fsm_7 <= write_burst_fsm_7_1;
          end 
        end
        write_burst_fsm_7_1: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_addr_230 <= write_burst_addr_230 + write_burst_stride_231;
            write_burst_length_232 <= write_burst_length_232 - 1;
            write_burst_done_233 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_232 <= 1)) begin
            write_burst_done_233 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_done_233 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_232 <= 1)) begin
            write_burst_fsm_7 <= write_burst_fsm_7_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_fsm_7 <= write_burst_fsm_7_init;
          end 
          if(0) begin
            write_burst_fsm_7 <= write_burst_fsm_7_init;
          end 
        end
      endcase
    end
  end

  localparam matmul_5_comp_fsm_1 = 1;
  localparam matmul_5_comp_fsm_2 = 2;
  localparam matmul_5_comp_fsm_3 = 3;
  localparam matmul_5_comp_fsm_4 = 4;
  localparam matmul_5_comp_fsm_5 = 5;
  localparam matmul_5_comp_fsm_6 = 6;

  always @(posedge CLK) begin
    if(RST) begin
      matmul_5_comp_fsm <= matmul_5_comp_fsm_init;
      matmul_5_stream_act_local_0 <= 0;
      matmul_5_stream_out_local_col <= 0;
      matmul_5_stream_out_local_val <= 0;
      matmul_5_col_count <= 0;
      matmul_5_col_select <= 0;
      matmul_5_filter_page_comp_offset_buf <= 0;
      matmul_5_act_page_comp_offset_buf_0 <= 0;
      matmul_5_out_page_comp_offset_buf <= 0;
      matmul_5_row_count_buf <= 0;
      matmul_5_row_select_buf <= 0;
      matmul_5_och_count_buf <= 0;
      matmul_5_next_stream_num_ops <= 0;
      matmul_5_stream_pad_masks <= 0;
      matmul_5_sync_comp_count <= 0;
    end else begin
      if(_stream_matmul_5_sink_stop) begin
        matmul_5_sync_comp_count <= matmul_5_sync_comp_count + 1;
      end 
      if(control_matmul_5 == 4) begin
        matmul_5_sync_comp_count <= 0;
      end 
      case(matmul_5_comp_fsm)
        matmul_5_comp_fsm_init: begin
          if((control_matmul_5 == 17) && !matmul_5_skip_comp) begin
            matmul_5_comp_fsm <= matmul_5_comp_fsm_1;
          end 
        end
        matmul_5_comp_fsm_1: begin
          matmul_5_stream_act_local_0 <= 0;
          if(cparam_matmul_5_stream_act_local_small_flags_0) begin
            matmul_5_stream_act_local_0 <= cparam_matmul_5_stream_act_local_small_offset;
          end 
          if(cparam_matmul_5_stream_act_local_large_flags_0) begin
            matmul_5_stream_act_local_0 <= cparam_matmul_5_stream_act_local_large_offset;
          end 
          matmul_5_stream_out_local_col <= 0;
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_och_count == 0)) begin
            matmul_5_stream_out_local_val <= 0;
          end 
          matmul_5_col_count <= 0;
          matmul_5_col_select <= cparam_matmul_5_col_select_initval;
          matmul_5_filter_page_comp_offset_buf <= matmul_5_filter_page_comp_offset;
          matmul_5_act_page_comp_offset_buf_0 <= matmul_5_act_page_comp_offset_0;
          matmul_5_out_page_comp_offset_buf <= matmul_5_out_page_comp_offset;
          matmul_5_row_count_buf <= matmul_5_row_count;
          matmul_5_row_select_buf <= matmul_5_row_select;
          matmul_5_och_count_buf <= matmul_5_och_count;
          matmul_5_next_stream_num_ops <= (matmul_5_och_count >= cparam_matmul_5_max_och_count)? cparam_matmul_5_stream_num_ops_res : cparam_matmul_5_stream_num_ops;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_2;
        end
        matmul_5_comp_fsm_2: begin
          matmul_5_stream_pad_masks <= { matmul_5_stream_pad_mask_0_0 };
          matmul_5_comp_fsm <= matmul_5_comp_fsm_3;
        end
        matmul_5_comp_fsm_3: begin
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          if(_stream_matmul_5_stream_oready) begin
            matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
          end 
          matmul_5_comp_fsm <= matmul_5_comp_fsm_4;
        end
        matmul_5_comp_fsm_4: begin
          if(!_stream_matmul_5_source_busy) begin
            matmul_5_comp_fsm <= matmul_5_comp_fsm_5;
          end 
        end
        matmul_5_comp_fsm_5: begin
          if(_stream_matmul_5_busy) begin
            matmul_5_comp_fsm <= matmul_5_comp_fsm_6;
          end 
        end
        matmul_5_comp_fsm_6: begin
          if(!((matmul_5_col_select == 0)? cparam_matmul_5_inc_act_laddr_conds_0 : 0)) begin
            matmul_5_stream_act_local_0 <= matmul_5_stream_act_local_0 + cparam_matmul_5_inc_act_laddr_small;
          end 
          if((matmul_5_col_select == 0)? cparam_matmul_5_inc_act_laddr_conds_0 : 0) begin
            matmul_5_stream_act_local_0 <= matmul_5_stream_act_local_0 + cparam_matmul_5_inc_act_laddr_large;
          end 
          if(matmul_5_col_count >= cparam_matmul_5_max_col_count) begin
            matmul_5_stream_act_local_0 <= 0;
          end 
          if((matmul_5_col_count >= cparam_matmul_5_max_col_count) && cparam_matmul_5_stream_act_local_small_flags_0) begin
            matmul_5_stream_act_local_0 <= cparam_matmul_5_stream_act_local_small_offset;
          end 
          if((matmul_5_col_count >= cparam_matmul_5_max_col_count) && cparam_matmul_5_stream_act_local_large_flags_0) begin
            matmul_5_stream_act_local_0 <= cparam_matmul_5_stream_act_local_large_offset;
          end 
          if(cparam_matmul_5_data_stationary == 0) begin
            matmul_5_stream_out_local_col <= matmul_5_stream_out_local_col + matmul_5_next_stream_num_ops;
          end 
          if((cparam_matmul_5_data_stationary == 0) && (matmul_5_col_count >= cparam_matmul_5_max_col_count)) begin
            matmul_5_stream_out_local_col <= 0;
          end 
          if(cparam_matmul_5_data_stationary == 1) begin
            matmul_5_stream_out_local_col <= matmul_5_stream_out_local_col + cparam_matmul_5_inc_out_laddr_col;
          end 
          if((cparam_matmul_5_data_stationary == 1) && (matmul_5_col_count >= cparam_matmul_5_max_col_count)) begin
            matmul_5_stream_out_local_val <= matmul_5_stream_out_local_val + matmul_5_next_stream_num_ops;
            matmul_5_stream_out_local_col <= 0;
          end 
          matmul_5_col_count <= matmul_5_col_count + cparam_matmul_5_stride_col_par_col;
          if(matmul_5_col_count >= cparam_matmul_5_max_col_count) begin
            matmul_5_col_count <= 0;
          end 
          matmul_5_col_select <= matmul_5_col_select + cparam_matmul_5_stride_col_mod_filter_num;
          if(matmul_5_col_select + cparam_matmul_5_stride_col_mod_filter_num >= 1) begin
            matmul_5_col_select <= matmul_5_col_select - cparam_matmul_5_filter_num_col_minus_stride_col_mod;
          end 
          if(matmul_5_col_count >= cparam_matmul_5_max_col_count) begin
            matmul_5_col_select <= cparam_matmul_5_col_select_initval;
          end 
          matmul_5_comp_fsm <= matmul_5_comp_fsm_2;
          if(matmul_5_col_count >= cparam_matmul_5_max_col_count) begin
            matmul_5_comp_fsm <= matmul_5_comp_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _stream_matmul_5_source_7_source_pat_fsm_0_1 = 1;
  localparam _stream_matmul_5_source_7_source_pat_fsm_0_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _stream_matmul_5_source_7_source_pat_fsm_0 <= _stream_matmul_5_source_7_source_pat_fsm_0_init;
    end else begin
      case(_stream_matmul_5_source_7_source_pat_fsm_0)
        _stream_matmul_5_source_7_source_pat_fsm_0_init: begin
          if(_stream_matmul_5_source_start && _stream_matmul_5_source_7_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_7_source_pat_fsm_0 <= _stream_matmul_5_source_7_source_pat_fsm_0_1;
          end 
        end
        _stream_matmul_5_source_7_source_pat_fsm_0_1: begin
          if(_stream_matmul_5_source_stop && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_7_source_pat_fsm_0 <= _stream_matmul_5_source_7_source_pat_fsm_0_init;
          end 
          if((_source_stream_matmul_5_source_7_pat_count_0 == 0) && (_source_stream_matmul_5_source_7_pat_count_1 == 0) && (_source_stream_matmul_5_source_7_pat_count_2 == 0) && (_source_stream_matmul_5_source_7_pat_count_3 == 0) && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_7_source_pat_fsm_0 <= _stream_matmul_5_source_7_source_pat_fsm_0_2;
          end 
        end
        _stream_matmul_5_source_7_source_pat_fsm_0_2: begin
          if(_stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_7_source_pat_fsm_0 <= _stream_matmul_5_source_7_source_pat_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam _stream_matmul_5_source_20_source_pat_fsm_1_1 = 1;
  localparam _stream_matmul_5_source_20_source_pat_fsm_1_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _stream_matmul_5_source_20_source_pat_fsm_1 <= _stream_matmul_5_source_20_source_pat_fsm_1_init;
    end else begin
      case(_stream_matmul_5_source_20_source_pat_fsm_1)
        _stream_matmul_5_source_20_source_pat_fsm_1_init: begin
          if(_stream_matmul_5_source_start && _stream_matmul_5_source_20_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_20_source_pat_fsm_1 <= _stream_matmul_5_source_20_source_pat_fsm_1_1;
          end 
        end
        _stream_matmul_5_source_20_source_pat_fsm_1_1: begin
          if(_stream_matmul_5_source_stop && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_20_source_pat_fsm_1 <= _stream_matmul_5_source_20_source_pat_fsm_1_init;
          end 
          if((_source_stream_matmul_5_source_20_pat_count_0 == 0) && (_source_stream_matmul_5_source_20_pat_count_1 == 0) && (_source_stream_matmul_5_source_20_pat_count_2 == 0) && (_source_stream_matmul_5_source_20_pat_count_3 == 0) && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_20_source_pat_fsm_1 <= _stream_matmul_5_source_20_source_pat_fsm_1_2;
          end 
        end
        _stream_matmul_5_source_20_source_pat_fsm_1_2: begin
          if(_stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_20_source_pat_fsm_1 <= _stream_matmul_5_source_20_source_pat_fsm_1_init;
          end 
        end
      endcase
    end
  end

  localparam _stream_matmul_5_source_21_source_pat_fsm_2_1 = 1;
  localparam _stream_matmul_5_source_21_source_pat_fsm_2_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _stream_matmul_5_source_21_source_pat_fsm_2 <= _stream_matmul_5_source_21_source_pat_fsm_2_init;
    end else begin
      case(_stream_matmul_5_source_21_source_pat_fsm_2)
        _stream_matmul_5_source_21_source_pat_fsm_2_init: begin
          if(_stream_matmul_5_source_start && _stream_matmul_5_source_21_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_21_source_pat_fsm_2 <= _stream_matmul_5_source_21_source_pat_fsm_2_1;
          end 
        end
        _stream_matmul_5_source_21_source_pat_fsm_2_1: begin
          if(_stream_matmul_5_source_stop && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_21_source_pat_fsm_2 <= _stream_matmul_5_source_21_source_pat_fsm_2_init;
          end 
          if((_source_stream_matmul_5_source_21_pat_count_0 == 0) && (_source_stream_matmul_5_source_21_pat_count_1 == 0) && (_source_stream_matmul_5_source_21_pat_count_2 == 0) && (_source_stream_matmul_5_source_21_pat_count_3 == 0) && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_21_source_pat_fsm_2 <= _stream_matmul_5_source_21_source_pat_fsm_2_2;
          end 
        end
        _stream_matmul_5_source_21_source_pat_fsm_2_2: begin
          if(_stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_21_source_pat_fsm_2 <= _stream_matmul_5_source_21_source_pat_fsm_2_init;
          end 
        end
      endcase
    end
  end

  localparam _stream_matmul_5_source_22_source_pat_fsm_3_1 = 1;
  localparam _stream_matmul_5_source_22_source_pat_fsm_3_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _stream_matmul_5_source_22_source_pat_fsm_3 <= _stream_matmul_5_source_22_source_pat_fsm_3_init;
    end else begin
      case(_stream_matmul_5_source_22_source_pat_fsm_3)
        _stream_matmul_5_source_22_source_pat_fsm_3_init: begin
          if(_stream_matmul_5_source_start && _stream_matmul_5_source_22_source_mode & 5'b10 && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_22_source_pat_fsm_3 <= _stream_matmul_5_source_22_source_pat_fsm_3_1;
          end 
        end
        _stream_matmul_5_source_22_source_pat_fsm_3_1: begin
          if(_stream_matmul_5_source_stop && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_22_source_pat_fsm_3 <= _stream_matmul_5_source_22_source_pat_fsm_3_init;
          end 
          if((_source_stream_matmul_5_source_22_pat_count_0 == 0) && (_source_stream_matmul_5_source_22_pat_count_1 == 0) && (_source_stream_matmul_5_source_22_pat_count_2 == 0) && (_source_stream_matmul_5_source_22_pat_count_3 == 0) && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_22_source_pat_fsm_3 <= _stream_matmul_5_source_22_source_pat_fsm_3_2;
          end 
        end
        _stream_matmul_5_source_22_source_pat_fsm_3_2: begin
          if(_stream_matmul_5_stream_oready) begin
            _stream_matmul_5_source_22_source_pat_fsm_3 <= _stream_matmul_5_source_22_source_pat_fsm_3_init;
          end 
        end
      endcase
    end
  end

  localparam _stream_matmul_5_sink_33_sink_fsm_4_1 = 1;
  localparam _stream_matmul_5_sink_33_sink_fsm_4_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _stream_matmul_5_sink_33_sink_fsm_4 <= _stream_matmul_5_sink_33_sink_fsm_4_init;
    end else begin
      case(_stream_matmul_5_sink_33_sink_fsm_4)
        _stream_matmul_5_sink_33_sink_fsm_4_init: begin
          if(_stream_matmul_5_sink_start && _stream_matmul_5_sink_33_sink_mode & 5'b1 && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_sink_33_sink_fsm_4 <= _stream_matmul_5_sink_33_sink_fsm_4_1;
          end 
        end
        _stream_matmul_5_sink_33_sink_fsm_4_1: begin
          if(_stream_matmul_5_stream_oready) begin
            _stream_matmul_5_sink_33_sink_fsm_4 <= _stream_matmul_5_sink_33_sink_fsm_4_2;
          end 
        end
        _stream_matmul_5_sink_33_sink_fsm_4_2: begin
          if(stream_matmul_5_sink_34_data && (_stream_matmul_5_sink_33_sink_count == 1) && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_sink_33_sink_fsm_4 <= _stream_matmul_5_sink_33_sink_fsm_4_init;
          end 
          if(_stream_matmul_5_sink_stop && _stream_matmul_5_stream_oready) begin
            _stream_matmul_5_sink_33_sink_fsm_4 <= _stream_matmul_5_sink_33_sink_fsm_4_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_8_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_8 <= read_burst_fsm_8_init;
      read_burst_addr_785 <= 0;
      read_burst_stride_786 <= 0;
      read_burst_length_787 <= 0;
      read_burst_rvalid_788 <= 0;
      read_burst_rlast_789 <= 0;
    end else begin
      case(read_burst_fsm_8)
        read_burst_fsm_8_init: begin
          read_burst_addr_785 <= _maxi_write_local_addr_buf;
          read_burst_stride_786 <= _maxi_write_local_stride_buf;
          read_burst_length_787 <= _maxi_write_size_buf;
          read_burst_rvalid_788 <= 0;
          read_burst_rlast_789 <= 0;
          if((_maxi_write_data_fsm == 1) && (_maxi_write_op_sel_buf == 2) && (_maxi_write_size_buf > 0)) begin
            read_burst_fsm_8 <= read_burst_fsm_8_1;
          end 
        end
        read_burst_fsm_8_1: begin
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_787 > 0)) begin
            read_burst_addr_785 <= read_burst_addr_785 + read_burst_stride_786;
            read_burst_length_787 <= read_burst_length_787 - 1;
            read_burst_rvalid_788 <= 1;
          end 
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_787 <= 1)) begin
            read_burst_rlast_789 <= 1;
          end 
          if(read_burst_rlast_789 && read_burst_rvalid_788 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_rvalid_788 <= 0;
            read_burst_rlast_789 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_788 <= 0;
            read_burst_rlast_789 <= 0;
          end 
          if(read_burst_rlast_789 && read_burst_rvalid_788 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_fsm_8 <= read_burst_fsm_8_init;
          end 
          if(0) begin
            read_burst_fsm_8 <= read_burst_fsm_8_init;
          end 
        end
      endcase
    end
  end


endmodule



module _maxi_read_req_fifo
(
  input CLK,
  input RST,
  input _maxi_read_req_fifo_enq,
  input [137-1:0] _maxi_read_req_fifo_wdata,
  output _maxi_read_req_fifo_full,
  output _maxi_read_req_fifo_almost_full,
  input _maxi_read_req_fifo_deq,
  output [137-1:0] _maxi_read_req_fifo_rdata,
  output _maxi_read_req_fifo_empty,
  output _maxi_read_req_fifo_almost_empty
);

  reg [137-1:0] mem [0:8-1];
  reg [3-1:0] head;
  reg [3-1:0] tail;
  wire is_empty;
  wire is_almost_empty;
  wire is_full;
  wire is_almost_full;
  assign is_empty = head == tail;
  assign is_almost_empty = head == (tail + 1 & 7);
  assign is_full = (head + 1 & 7) == tail;
  assign is_almost_full = (head + 2 & 7) == tail;
  wire [137-1:0] rdata;
  assign _maxi_read_req_fifo_full = is_full;
  assign _maxi_read_req_fifo_almost_full = is_almost_full || is_full;
  assign _maxi_read_req_fifo_empty = is_empty;
  assign _maxi_read_req_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _maxi_read_req_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_maxi_read_req_fifo_enq && !is_full) begin
        mem[head] <= _maxi_read_req_fifo_wdata;
        head <= head + 1;
      end 
      if(_maxi_read_req_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module _maxi_write_req_fifo
(
  input CLK,
  input RST,
  input _maxi_write_req_fifo_enq,
  input [137-1:0] _maxi_write_req_fifo_wdata,
  output _maxi_write_req_fifo_full,
  output _maxi_write_req_fifo_almost_full,
  input _maxi_write_req_fifo_deq,
  output [137-1:0] _maxi_write_req_fifo_rdata,
  output _maxi_write_req_fifo_empty,
  output _maxi_write_req_fifo_almost_empty
);

  reg [137-1:0] mem [0:8-1];
  reg [3-1:0] head;
  reg [3-1:0] tail;
  wire is_empty;
  wire is_almost_empty;
  wire is_full;
  wire is_almost_full;
  assign is_empty = head == tail;
  assign is_almost_empty = head == (tail + 1 & 7);
  assign is_full = (head + 1 & 7) == tail;
  assign is_almost_full = (head + 2 & 7) == tail;
  wire [137-1:0] rdata;
  assign _maxi_write_req_fifo_full = is_full;
  assign _maxi_write_req_fifo_almost_full = is_almost_full || is_full;
  assign _maxi_write_req_fifo_empty = is_empty;
  assign _maxi_write_req_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _maxi_write_req_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_maxi_write_req_fifo_enq && !is_full) begin
        mem[head] <= _maxi_write_req_fifo_wdata;
        head <= head + 1;
      end 
      if(_maxi_write_req_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module ram_w32_l1024_id0
(
  input CLK,
  input [10-1:0] ram_w32_l1024_id0_0_addr,
  output [32-1:0] ram_w32_l1024_id0_0_rdata,
  input [32-1:0] ram_w32_l1024_id0_0_wdata,
  input ram_w32_l1024_id0_0_wenable,
  input ram_w32_l1024_id0_0_enable,
  input [10-1:0] ram_w32_l1024_id0_1_addr,
  output [32-1:0] ram_w32_l1024_id0_1_rdata,
  input [32-1:0] ram_w32_l1024_id0_1_wdata,
  input ram_w32_l1024_id0_1_wenable,
  input ram_w32_l1024_id0_1_enable
);

  reg [32-1:0] ram_w32_l1024_id0_0_rdata_out;
  assign ram_w32_l1024_id0_0_rdata = ram_w32_l1024_id0_0_rdata_out;
  reg [32-1:0] ram_w32_l1024_id0_1_rdata_out;
  assign ram_w32_l1024_id0_1_rdata = ram_w32_l1024_id0_1_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_w32_l1024_id0_0_enable) begin
      if(ram_w32_l1024_id0_0_wenable) begin
        mem[ram_w32_l1024_id0_0_addr] <= ram_w32_l1024_id0_0_wdata;
        ram_w32_l1024_id0_0_rdata_out <= ram_w32_l1024_id0_0_wdata;
      end else begin
        ram_w32_l1024_id0_0_rdata_out <= mem[ram_w32_l1024_id0_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w32_l1024_id0_1_enable) begin
      if(ram_w32_l1024_id0_1_wenable) begin
        mem[ram_w32_l1024_id0_1_addr] <= ram_w32_l1024_id0_1_wdata;
        ram_w32_l1024_id0_1_rdata_out <= ram_w32_l1024_id0_1_wdata;
      end else begin
        ram_w32_l1024_id0_1_rdata_out <= mem[ram_w32_l1024_id0_1_addr];
      end
    end 
  end


endmodule



module ram_w32_l1024_id1
(
  input CLK,
  input [10-1:0] ram_w32_l1024_id1_0_addr,
  output [32-1:0] ram_w32_l1024_id1_0_rdata,
  input [32-1:0] ram_w32_l1024_id1_0_wdata,
  input ram_w32_l1024_id1_0_wenable,
  input ram_w32_l1024_id1_0_enable,
  input [10-1:0] ram_w32_l1024_id1_1_addr,
  output [32-1:0] ram_w32_l1024_id1_1_rdata,
  input [32-1:0] ram_w32_l1024_id1_1_wdata,
  input ram_w32_l1024_id1_1_wenable,
  input ram_w32_l1024_id1_1_enable
);

  reg [32-1:0] ram_w32_l1024_id1_0_rdata_out;
  assign ram_w32_l1024_id1_0_rdata = ram_w32_l1024_id1_0_rdata_out;
  reg [32-1:0] ram_w32_l1024_id1_1_rdata_out;
  assign ram_w32_l1024_id1_1_rdata = ram_w32_l1024_id1_1_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_w32_l1024_id1_0_enable) begin
      if(ram_w32_l1024_id1_0_wenable) begin
        mem[ram_w32_l1024_id1_0_addr] <= ram_w32_l1024_id1_0_wdata;
        ram_w32_l1024_id1_0_rdata_out <= ram_w32_l1024_id1_0_wdata;
      end else begin
        ram_w32_l1024_id1_0_rdata_out <= mem[ram_w32_l1024_id1_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w32_l1024_id1_1_enable) begin
      if(ram_w32_l1024_id1_1_wenable) begin
        mem[ram_w32_l1024_id1_1_addr] <= ram_w32_l1024_id1_1_wdata;
        ram_w32_l1024_id1_1_rdata_out <= ram_w32_l1024_id1_1_wdata;
      end else begin
        ram_w32_l1024_id1_1_rdata_out <= mem[ram_w32_l1024_id1_1_addr];
      end
    end 
  end


endmodule



module ram_w16_l1024_id0_0
(
  input CLK,
  input [9-1:0] ram_w16_l1024_id0_0_0_addr,
  output [16-1:0] ram_w16_l1024_id0_0_0_rdata,
  input [16-1:0] ram_w16_l1024_id0_0_0_wdata,
  input ram_w16_l1024_id0_0_0_wenable,
  input ram_w16_l1024_id0_0_0_enable,
  input [9-1:0] ram_w16_l1024_id0_0_1_addr,
  output [16-1:0] ram_w16_l1024_id0_0_1_rdata,
  input [16-1:0] ram_w16_l1024_id0_0_1_wdata,
  input ram_w16_l1024_id0_0_1_wenable,
  input ram_w16_l1024_id0_0_1_enable
);

  reg [16-1:0] ram_w16_l1024_id0_0_0_rdata_out;
  assign ram_w16_l1024_id0_0_0_rdata = ram_w16_l1024_id0_0_0_rdata_out;
  reg [16-1:0] ram_w16_l1024_id0_0_1_rdata_out;
  assign ram_w16_l1024_id0_0_1_rdata = ram_w16_l1024_id0_0_1_rdata_out;
  reg [16-1:0] mem [0:512-1];

  always @(posedge CLK) begin
    if(ram_w16_l1024_id0_0_0_enable) begin
      if(ram_w16_l1024_id0_0_0_wenable) begin
        mem[ram_w16_l1024_id0_0_0_addr] <= ram_w16_l1024_id0_0_0_wdata;
        ram_w16_l1024_id0_0_0_rdata_out <= ram_w16_l1024_id0_0_0_wdata;
      end else begin
        ram_w16_l1024_id0_0_0_rdata_out <= mem[ram_w16_l1024_id0_0_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w16_l1024_id0_0_1_enable) begin
      if(ram_w16_l1024_id0_0_1_wenable) begin
        mem[ram_w16_l1024_id0_0_1_addr] <= ram_w16_l1024_id0_0_1_wdata;
        ram_w16_l1024_id0_0_1_rdata_out <= ram_w16_l1024_id0_0_1_wdata;
      end else begin
        ram_w16_l1024_id0_0_1_rdata_out <= mem[ram_w16_l1024_id0_0_1_addr];
      end
    end 
  end


endmodule



module ram_w16_l1024_id0_1
(
  input CLK,
  input [9-1:0] ram_w16_l1024_id0_1_0_addr,
  output [16-1:0] ram_w16_l1024_id0_1_0_rdata,
  input [16-1:0] ram_w16_l1024_id0_1_0_wdata,
  input ram_w16_l1024_id0_1_0_wenable,
  input ram_w16_l1024_id0_1_0_enable,
  input [9-1:0] ram_w16_l1024_id0_1_1_addr,
  output [16-1:0] ram_w16_l1024_id0_1_1_rdata,
  input [16-1:0] ram_w16_l1024_id0_1_1_wdata,
  input ram_w16_l1024_id0_1_1_wenable,
  input ram_w16_l1024_id0_1_1_enable
);

  reg [16-1:0] ram_w16_l1024_id0_1_0_rdata_out;
  assign ram_w16_l1024_id0_1_0_rdata = ram_w16_l1024_id0_1_0_rdata_out;
  reg [16-1:0] ram_w16_l1024_id0_1_1_rdata_out;
  assign ram_w16_l1024_id0_1_1_rdata = ram_w16_l1024_id0_1_1_rdata_out;
  reg [16-1:0] mem [0:512-1];

  always @(posedge CLK) begin
    if(ram_w16_l1024_id0_1_0_enable) begin
      if(ram_w16_l1024_id0_1_0_wenable) begin
        mem[ram_w16_l1024_id0_1_0_addr] <= ram_w16_l1024_id0_1_0_wdata;
        ram_w16_l1024_id0_1_0_rdata_out <= ram_w16_l1024_id0_1_0_wdata;
      end else begin
        ram_w16_l1024_id0_1_0_rdata_out <= mem[ram_w16_l1024_id0_1_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w16_l1024_id0_1_1_enable) begin
      if(ram_w16_l1024_id0_1_1_wenable) begin
        mem[ram_w16_l1024_id0_1_1_addr] <= ram_w16_l1024_id0_1_1_wdata;
        ram_w16_l1024_id0_1_1_rdata_out <= ram_w16_l1024_id0_1_1_wdata;
      end else begin
        ram_w16_l1024_id0_1_1_rdata_out <= mem[ram_w16_l1024_id0_1_1_addr];
      end
    end 
  end


endmodule



module ram_w16_l1024_id1_0
(
  input CLK,
  input [9-1:0] ram_w16_l1024_id1_0_0_addr,
  output [16-1:0] ram_w16_l1024_id1_0_0_rdata,
  input [16-1:0] ram_w16_l1024_id1_0_0_wdata,
  input ram_w16_l1024_id1_0_0_wenable,
  input ram_w16_l1024_id1_0_0_enable,
  input [9-1:0] ram_w16_l1024_id1_0_1_addr,
  output [16-1:0] ram_w16_l1024_id1_0_1_rdata,
  input [16-1:0] ram_w16_l1024_id1_0_1_wdata,
  input ram_w16_l1024_id1_0_1_wenable,
  input ram_w16_l1024_id1_0_1_enable
);

  reg [16-1:0] ram_w16_l1024_id1_0_0_rdata_out;
  assign ram_w16_l1024_id1_0_0_rdata = ram_w16_l1024_id1_0_0_rdata_out;
  reg [16-1:0] ram_w16_l1024_id1_0_1_rdata_out;
  assign ram_w16_l1024_id1_0_1_rdata = ram_w16_l1024_id1_0_1_rdata_out;
  reg [16-1:0] mem [0:512-1];

  always @(posedge CLK) begin
    if(ram_w16_l1024_id1_0_0_enable) begin
      if(ram_w16_l1024_id1_0_0_wenable) begin
        mem[ram_w16_l1024_id1_0_0_addr] <= ram_w16_l1024_id1_0_0_wdata;
        ram_w16_l1024_id1_0_0_rdata_out <= ram_w16_l1024_id1_0_0_wdata;
      end else begin
        ram_w16_l1024_id1_0_0_rdata_out <= mem[ram_w16_l1024_id1_0_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w16_l1024_id1_0_1_enable) begin
      if(ram_w16_l1024_id1_0_1_wenable) begin
        mem[ram_w16_l1024_id1_0_1_addr] <= ram_w16_l1024_id1_0_1_wdata;
        ram_w16_l1024_id1_0_1_rdata_out <= ram_w16_l1024_id1_0_1_wdata;
      end else begin
        ram_w16_l1024_id1_0_1_rdata_out <= mem[ram_w16_l1024_id1_0_1_addr];
      end
    end 
  end


endmodule



module ram_w16_l1024_id1_1
(
  input CLK,
  input [9-1:0] ram_w16_l1024_id1_1_0_addr,
  output [16-1:0] ram_w16_l1024_id1_1_0_rdata,
  input [16-1:0] ram_w16_l1024_id1_1_0_wdata,
  input ram_w16_l1024_id1_1_0_wenable,
  input ram_w16_l1024_id1_1_0_enable,
  input [9-1:0] ram_w16_l1024_id1_1_1_addr,
  output [16-1:0] ram_w16_l1024_id1_1_1_rdata,
  input [16-1:0] ram_w16_l1024_id1_1_1_wdata,
  input ram_w16_l1024_id1_1_1_wenable,
  input ram_w16_l1024_id1_1_1_enable
);

  reg [16-1:0] ram_w16_l1024_id1_1_0_rdata_out;
  assign ram_w16_l1024_id1_1_0_rdata = ram_w16_l1024_id1_1_0_rdata_out;
  reg [16-1:0] ram_w16_l1024_id1_1_1_rdata_out;
  assign ram_w16_l1024_id1_1_1_rdata = ram_w16_l1024_id1_1_1_rdata_out;
  reg [16-1:0] mem [0:512-1];

  always @(posedge CLK) begin
    if(ram_w16_l1024_id1_1_0_enable) begin
      if(ram_w16_l1024_id1_1_0_wenable) begin
        mem[ram_w16_l1024_id1_1_0_addr] <= ram_w16_l1024_id1_1_0_wdata;
        ram_w16_l1024_id1_1_0_rdata_out <= ram_w16_l1024_id1_1_0_wdata;
      end else begin
        ram_w16_l1024_id1_1_0_rdata_out <= mem[ram_w16_l1024_id1_1_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w16_l1024_id1_1_1_enable) begin
      if(ram_w16_l1024_id1_1_1_wenable) begin
        mem[ram_w16_l1024_id1_1_1_addr] <= ram_w16_l1024_id1_1_1_wdata;
        ram_w16_l1024_id1_1_1_rdata_out <= ram_w16_l1024_id1_1_1_wdata;
      end else begin
        ram_w16_l1024_id1_1_1_rdata_out <= mem[ram_w16_l1024_id1_1_1_addr];
      end
    end 
  end


endmodule



module ram_w32_l512_id0
(
  input CLK,
  input [9-1:0] ram_w32_l512_id0_0_addr,
  output [32-1:0] ram_w32_l512_id0_0_rdata,
  input [32-1:0] ram_w32_l512_id0_0_wdata,
  input ram_w32_l512_id0_0_wenable,
  input ram_w32_l512_id0_0_enable,
  input [9-1:0] ram_w32_l512_id0_1_addr,
  output [32-1:0] ram_w32_l512_id0_1_rdata,
  input [32-1:0] ram_w32_l512_id0_1_wdata,
  input ram_w32_l512_id0_1_wenable,
  input ram_w32_l512_id0_1_enable
);

  reg [32-1:0] ram_w32_l512_id0_0_rdata_out;
  assign ram_w32_l512_id0_0_rdata = ram_w32_l512_id0_0_rdata_out;
  reg [32-1:0] ram_w32_l512_id0_1_rdata_out;
  assign ram_w32_l512_id0_1_rdata = ram_w32_l512_id0_1_rdata_out;
  reg [32-1:0] mem [0:512-1];

  always @(posedge CLK) begin
    if(ram_w32_l512_id0_0_enable) begin
      if(ram_w32_l512_id0_0_wenable) begin
        mem[ram_w32_l512_id0_0_addr] <= ram_w32_l512_id0_0_wdata;
        ram_w32_l512_id0_0_rdata_out <= ram_w32_l512_id0_0_wdata;
      end else begin
        ram_w32_l512_id0_0_rdata_out <= mem[ram_w32_l512_id0_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w32_l512_id0_1_enable) begin
      if(ram_w32_l512_id0_1_wenable) begin
        mem[ram_w32_l512_id0_1_addr] <= ram_w32_l512_id0_1_wdata;
        ram_w32_l512_id0_1_rdata_out <= ram_w32_l512_id0_1_wdata;
      end else begin
        ram_w32_l512_id0_1_rdata_out <= mem[ram_w32_l512_id0_1_addr];
      end
    end 
  end


endmodule



module ram_w32_l128_id0
(
  input CLK,
  input [7-1:0] ram_w32_l128_id0_0_addr,
  output [32-1:0] ram_w32_l128_id0_0_rdata,
  input [32-1:0] ram_w32_l128_id0_0_wdata,
  input ram_w32_l128_id0_0_wenable,
  input ram_w32_l128_id0_0_enable,
  input [7-1:0] ram_w32_l128_id0_1_addr,
  output [32-1:0] ram_w32_l128_id0_1_rdata,
  input [32-1:0] ram_w32_l128_id0_1_wdata,
  input ram_w32_l128_id0_1_wenable,
  input ram_w32_l128_id0_1_enable
);

  reg [32-1:0] ram_w32_l128_id0_0_rdata_out;
  assign ram_w32_l128_id0_0_rdata = ram_w32_l128_id0_0_rdata_out;
  reg [32-1:0] ram_w32_l128_id0_1_rdata_out;
  assign ram_w32_l128_id0_1_rdata = ram_w32_l128_id0_1_rdata_out;
  reg [32-1:0] mem [0:128-1];

  always @(posedge CLK) begin
    if(ram_w32_l128_id0_0_enable) begin
      if(ram_w32_l128_id0_0_wenable) begin
        mem[ram_w32_l128_id0_0_addr] <= ram_w32_l128_id0_0_wdata;
        ram_w32_l128_id0_0_rdata_out <= ram_w32_l128_id0_0_wdata;
      end else begin
        ram_w32_l128_id0_0_rdata_out <= mem[ram_w32_l128_id0_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w32_l128_id0_1_enable) begin
      if(ram_w32_l128_id0_1_wenable) begin
        mem[ram_w32_l128_id0_1_addr] <= ram_w32_l128_id0_1_wdata;
        ram_w32_l128_id0_1_rdata_out <= ram_w32_l128_id0_1_wdata;
      end else begin
        ram_w32_l128_id0_1_rdata_out <= mem[ram_w32_l128_id0_1_addr];
      end
    end 
  end


endmodule



module ram_w32_l128_id1
(
  input CLK,
  input [7-1:0] ram_w32_l128_id1_0_addr,
  output [32-1:0] ram_w32_l128_id1_0_rdata,
  input [32-1:0] ram_w32_l128_id1_0_wdata,
  input ram_w32_l128_id1_0_wenable,
  input ram_w32_l128_id1_0_enable,
  input [7-1:0] ram_w32_l128_id1_1_addr,
  output [32-1:0] ram_w32_l128_id1_1_rdata,
  input [32-1:0] ram_w32_l128_id1_1_wdata,
  input ram_w32_l128_id1_1_wenable,
  input ram_w32_l128_id1_1_enable
);

  reg [32-1:0] ram_w32_l128_id1_0_rdata_out;
  assign ram_w32_l128_id1_0_rdata = ram_w32_l128_id1_0_rdata_out;
  reg [32-1:0] ram_w32_l128_id1_1_rdata_out;
  assign ram_w32_l128_id1_1_rdata = ram_w32_l128_id1_1_rdata_out;
  reg [32-1:0] mem [0:128-1];

  always @(posedge CLK) begin
    if(ram_w32_l128_id1_0_enable) begin
      if(ram_w32_l128_id1_0_wenable) begin
        mem[ram_w32_l128_id1_0_addr] <= ram_w32_l128_id1_0_wdata;
        ram_w32_l128_id1_0_rdata_out <= ram_w32_l128_id1_0_wdata;
      end else begin
        ram_w32_l128_id1_0_rdata_out <= mem[ram_w32_l128_id1_0_addr];
      end
    end 
  end


  always @(posedge CLK) begin
    if(ram_w32_l128_id1_1_enable) begin
      if(ram_w32_l128_id1_1_wenable) begin
        mem[ram_w32_l128_id1_1_addr] <= ram_w32_l128_id1_1_wdata;
        ram_w32_l128_id1_1_rdata_out <= ram_w32_l128_id1_1_wdata;
      end else begin
        ram_w32_l128_id1_1_rdata_out <= mem[ram_w32_l128_id1_1_addr];
      end
    end 
  end


endmodule



module madd_0
(
  input CLK,
  input update,
  input [16-1:0] a,
  input [16-1:0] b,
  input [16-1:0] c,
  output [32-1:0] d
);


  madd_core_0
  madd
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );


endmodule



module madd_core_0
(
  input CLK,
  input update,
  input [16-1:0] a,
  input [16-1:0] b,
  input [16-1:0] c,
  output [32-1:0] d
);

  reg signed [16-1:0] _a;
  reg signed [16-1:0] _b;
  reg signed [16-1:0] _c;
  wire signed [32-1:0] _mul;
  wire signed [32-1:0] _madd;
  reg signed [32-1:0] _pipe_madd0;
  reg signed [32-1:0] _pipe_madd1;
  assign _mul = _a * _b;
  assign _madd = _mul + _c;
  assign d = _pipe_madd1;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _c <= c;
      _pipe_madd0 <= _madd;
      _pipe_madd1 <= _pipe_madd0;
    end 
  end


endmodule



module madd_1
(
  input CLK,
  input update,
  input [16-1:0] a,
  input [16-1:0] b,
  input [16-1:0] c,
  output [32-1:0] d
);


  madd_core_1
  madd
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );


endmodule



module madd_core_1
(
  input CLK,
  input update,
  input [16-1:0] a,
  input [16-1:0] b,
  input [16-1:0] c,
  output [32-1:0] d
);

  reg signed [16-1:0] _a;
  reg signed [16-1:0] _b;
  reg signed [16-1:0] _c;
  wire signed [32-1:0] _mul;
  wire signed [32-1:0] _madd;
  reg signed [32-1:0] _pipe_madd0;
  reg signed [32-1:0] _pipe_madd1;
  assign _mul = _a * _b;
  assign _madd = _mul + _c;
  assign d = _pipe_madd1;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _c <= c;
      _pipe_madd0 <= _madd;
      _pipe_madd1 <= _pipe_madd0;
    end 
  end


endmodule



module multiplier_0
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [16-1:0] b,
  output [48-1:0] c
);


  multiplier_core_0
  mult
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c)
  );


endmodule



module multiplier_core_0
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [16-1:0] b,
  output [48-1:0] c
);

  reg signed [32-1:0] _a;
  reg signed [16-1:0] _b;
  wire signed [48-1:0] _mul;
  reg signed [48-1:0] _pipe_mul0;
  reg signed [48-1:0] _pipe_mul1;
  assign _mul = _a * _b;
  assign c = _pipe_mul1;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _pipe_mul0 <= _mul;
      _pipe_mul1 <= _pipe_mul0;
    end 
  end


endmodule



module madd_2
(
  input CLK,
  input update,
  input [16-1:0] a,
  input [16-1:0] b,
  input [16-1:0] c,
  output [32-1:0] d
);


  madd_core_2
  madd
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );


endmodule



module madd_core_2
(
  input CLK,
  input update,
  input [16-1:0] a,
  input [16-1:0] b,
  input [16-1:0] c,
  output [32-1:0] d
);

  reg signed [16-1:0] _a;
  reg signed [16-1:0] _b;
  reg signed [16-1:0] _c;
  wire signed [32-1:0] _mul;
  wire signed [32-1:0] _madd;
  reg signed [32-1:0] _pipe_madd0;
  reg signed [32-1:0] _pipe_madd1;
  assign _mul = _a * _b;
  assign _madd = _mul + _c;
  assign d = _pipe_madd1;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _c <= c;
      _pipe_madd0 <= _madd;
      _pipe_madd1 <= _pipe_madd0;
    end 
  end


endmodule



module madd_3
(
  input CLK,
  input update,
  input [16-1:0] a,
  input [16-1:0] b,
  input [16-1:0] c,
  output [32-1:0] d
);


  madd_core_3
  madd
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );


endmodule



module madd_core_3
(
  input CLK,
  input update,
  input [16-1:0] a,
  input [16-1:0] b,
  input [16-1:0] c,
  output [32-1:0] d
);

  reg signed [16-1:0] _a;
  reg signed [16-1:0] _b;
  reg signed [16-1:0] _c;
  wire signed [32-1:0] _mul;
  wire signed [32-1:0] _madd;
  reg signed [32-1:0] _pipe_madd0;
  reg signed [32-1:0] _pipe_madd1;
  assign _mul = _a * _b;
  assign _madd = _mul + _c;
  assign d = _pipe_madd1;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _c <= c;
      _pipe_madd0 <= _madd;
      _pipe_madd1 <= _pipe_madd0;
    end 
  end


endmodule



module multiplier_1
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [16-1:0] b,
  output [48-1:0] c
);


  multiplier_core_1
  mult
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c)
  );


endmodule



module multiplier_core_1
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [16-1:0] b,
  output [48-1:0] c
);

  reg signed [32-1:0] _a;
  reg signed [16-1:0] _b;
  wire signed [48-1:0] _mul;
  reg signed [48-1:0] _pipe_mul0;
  reg signed [48-1:0] _pipe_mul1;
  assign _mul = _a * _b;
  assign c = _pipe_mul1;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _pipe_mul0 <= _mul;
      _pipe_mul1 <= _pipe_mul0;
    end 
  end


endmodule

