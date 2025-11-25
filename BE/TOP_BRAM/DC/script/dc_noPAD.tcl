#------------------------------------------------------------------------------
#                            0   Setup
#------------------------------------------------------------------------------
# 0.1   logic Library settings
set root_dir        "../../../.."
set rtl_src_dir     "$root_dir/src"
# set rtl_inc_dir     "$root_dir/rtl/config"
set be_src_dir      "$root_dir/BE"
set sram_dir        "$be_src_dir/SRAM"
set search_path     "
                    /data/EDA/t28/tcbn28hpcplusbwp12t40p140lvt_180a/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn28hpcplusbwp12t40p140lvt_180a \
                    $rtl_src_dir \
                    $rtl_src_dir/define "
set link_library    "* tcbn28hpcplusbwp12t40p140lvttt0p9v25c_ccs.db\
                    "
set target_library  "tcbn28hpcplusbwp12t40p140lvttt0p9v25c_ccs.db"
set top_design      "gpgpu_axi_top"
# 0.2   outputfile path
set log_path            "../log"
set report_path         "../report"
set export_path         "../netlist"
set_svf $export_path/$top_design.svf
# 2.1   clock and rst
set clk_name "clk"
set rst_name "rst_n"
set clk_freq 500
set max_area 100000000
# 0.3   RTL design
#  ***   UPDATE   *************************************************************************
#  ****************************************************************************************
set dla_files          " \
    $rtl_src_dir/define/define.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/gpu_interface.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/wg_slot_id_convert_opt.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/ram.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/top_resource_table.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/allocator_neo.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/dis_controller.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/prefer_select.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/throttling_engine.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/inflight_wg_buffer.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/wg_resource_table_neo.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/resource_table.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/cam_allocator.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/cam_allocator_neo.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/cu_handler.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/cta_scheduler.v
    $rtl_src_dir/gpgpu_top/cta_top/cta/resource_table_group.v
    $rtl_src_dir/gpgpu_top/cta_top/cta_interface.v
    $rtl_src_dir/gpgpu_top/cta_top/wf_done_interface_single.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/tag_access/tag_checker.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/tag_access/tag_access_top_v2.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/l1_dcache.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/dcache_control.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/get_data_access_banken.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/gen_data_map_per_byte.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/l1_mshr/get_entry_status_req.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/l1_mshr/l1_mshr.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/l1_mshr/get_entry_status_rsp.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/dcache_wshr.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/dcache/gen_data_map_same_word.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/common/lru_matrix.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/common/sram_template_l1d_tag.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/common/sram_template.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/icache/tag_checker_icache.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/icache/get_entry_status.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/icache/instruction_cache.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/icache/mshr_icache.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/icache/get_setid.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/icache/tag_access_icache.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/shared_memory/bankconflict_arb.v
    $rtl_src_dir/gpgpu_top/sm/l1cache/shared_memory/sharemem.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/common_cells/near_path.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/common_cells/shift_right_jam.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/common_cells/far_path.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/common_cells/rounding.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/common_cells/lza.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/common_cells/clz.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/common_cells/clz_49.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/fcmp.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/fpmv.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/fp_to_int_core.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/fadd_pipe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/fcmp_core.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/scalar_fpu.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/fmul_pipe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/fp_to_int.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/int_to_fp.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/int_to_fp_postnorm.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/fma.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu/int_to_fp_prenorm.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/vfpu.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu_no_ctrl/scalar_fpu_no_ctrl.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu_no_ctrl/fmul_pipe_no_ctrl.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu_no_ctrl/fp_to_int_no_ctrl.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu_no_ctrl/int_to_fp_no_ctrl.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu_no_ctrl/fma_no_ctrl.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu_no_ctrl/fcmp_no_ctrl.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu_no_ctrl/fpmv_no_ctrl.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpu_no_ctrl/fadd_pipe_no_ctrl.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/vfpu_v2.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/fpu/fpuexe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/operand_collector/crossbar.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/operand_collector/inst_demux.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/operand_collector/operand_arbiter.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/operand_collector/operandcollector_top.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/operand_collector/collector_unit.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/operand_collector/vector_regfile_bank.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/operand_collector/gen_imm.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/operand_collector/scalar_regfile_bank.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/issue.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/simt_stack/branch_join_stack.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/simt_stack/simt_stack.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/input_fifo.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/lsu_exe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/shiftboard.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/mshr_reg.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/addrcalculate.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/rsp_arb.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/byte_extract.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/lsu2wb.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/lsu/mshr_backup.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/pipe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/float_div_mvp/defs_div_sqrt_mvp.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/float_div_mvp/div_sqrt_top_mvp.sv

    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/float_div_mvp/iteration_div_sqrt_mvp.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/float_div_mvp/nrbd_nrsc_mvp.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/float_div_mvp/control_mvp.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/float_div_mvp/preprocess_mvp.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/float_div_mvp/lzc.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/float_div_mvp/norm_div_sqrt_mvp.sv
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/int_div.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/sfu_v2/sfu_exe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/warp_scheduler/pc_align.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/warp_scheduler/pc_control.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/warp_scheduler/warp_scheduler.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/valu/alu.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/valu/valu.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/valu/valu_top.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/valu/valu_v2.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/tc_dot_product.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/tensor_core_fp32.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/tc_mul_pipe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/fadd_s1.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/fadd_s2.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/tensor_core_exe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/fmul_s1.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/fmul_s2.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/fmul_s3.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/naivemultiplier.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/tensor/tc_add_pipe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/ibuffer/slowdown.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/ibuffer/ibuffer.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/writeback.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/branch_back.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/ibuffer2issue.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/vmul/wallace_adder_18.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/vmul/full_adder.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/vmul/vmul.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/vmul/array_multiplier.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/vmul/mult_32.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/vmul/vmul_top.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/vmul/vmul_v2.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/vmul/booth.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/csr/csrfile.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/csr/csrexe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/aluexe.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/decodeUnit.v
    $rtl_src_dir/gpgpu_top/sm/pipeline/scoreboard.v
    $rtl_src_dir/gpgpu_top/sm/sm_wrapper.v
    $rtl_src_dir/gpgpu_top/sm/cta2warp.v
    $rtl_src_dir/gpgpu_top/sm/l1cache_arb.v
    $rtl_src_dir/gpgpu_top/gpgpu_axi_top.sv
    $rtl_src_dir/gpgpu_top/sm2cluster_arb.v
    $rtl_src_dir/gpgpu_top/axi4lite_2_cta.v
    $rtl_src_dir/gpgpu_top/l2_distribute.v
    $rtl_src_dir/gpgpu_top/l2cache/Listbuffer.v
    $rtl_src_dir/gpgpu_top/l2cache/sinkA.v
    $rtl_src_dir/gpgpu_top/l2cache/sinkD.v
    $rtl_src_dir/gpgpu_top/l2cache/Listbuffer_no_push_opc_put_source.v
    $rtl_src_dir/gpgpu_top/l2cache/MSHR.v
    $rtl_src_dir/gpgpu_top/l2cache/Scheduler.v
    $rtl_src_dir/gpgpu_top/l2cache/banked_store.v
    $rtl_src_dir/gpgpu_top/l2cache/SourceA.v
    $rtl_src_dir/gpgpu_top/l2cache/directory_test.v
    $rtl_src_dir/gpgpu_top/l2cache/sourceD.v
    $rtl_src_dir/gpgpu_top/axi4_adapter/axi4_adapter.sv
    $rtl_src_dir/gpgpu_top/axi4_adapter/axi4_adapter_top.sv
    $rtl_src_dir/gpgpu_top/axi4_adapter/axi4_cut.sv
    $rtl_src_dir/gpgpu_top/axi4_adapter/spill_register.sv
    $rtl_src_dir/gpgpu_top/axi4_adapter/spill_register_flushable.sv
    $rtl_src_dir/gpgpu_top/GPGPU_top.v
    $rtl_src_dir/gpgpu_top/cluster_to_l2_arb.v
    $rtl_src_dir/common_cell/stream_fifo_flow_true.v
    $rtl_src_dir/common_cell/stream_fifo_hasflush_true_no_empty_full.v
    $rtl_src_dir/common_cell/fifo_with_count.v
    $rtl_src_dir/common_cell/find_first.v
    $rtl_src_dir/common_cell/stream_fifo_with_incount_useSRAM.v
    $rtl_src_dir/common_cell/stream_fifo_hasflush_true.v
    $rtl_src_dir/common_cell/input_reverse.v
    $rtl_src_dir/common_cell/one2bin.v
    $rtl_src_dir/common_cell/bin2one.v
    $rtl_src_dir/common_cell/stream_fifo_useSRAM.v
    $rtl_src_dir/common_cell/stream_fifo_useSRAM_with_count.v
    $rtl_src_dir/common_cell/fixed_pri_arb.v
    $rtl_src_dir/common_cell/stream_fifo.v
    $rtl_src_dir/common_cell/pop_cnt.v
    $rtl_src_dir/common_cell/round_robin_arb.v
    $rtl_src_dir/common_cell/stream_fifo_pipe_true.v
    $rtl_src_dir/common_cell/stream_fifo_pipe_true_has_flush.v
    $rtl_src_dir/common_cell/stream_fifo_pipe_true_with_count.v
    $rtl_src_dir/common_cell/dualportSRAM.v
    $rtl_src_dir/common_cell/fifo_with_flush.v
    $rtl_src_dir/common_cell/fifo.v
    $rtl_src_dir/common_cell/stream_fifo_pipe_true_has_flush.v
    $rtl_src_dir/define/undefine.v


"

#  ****************************************************************************************

# 0.3   enable logging
set timestamp [clock format [clock scan now] -format "%Y-%m-%d_%H-%M"]
set sh_output_log_file  "$log_path/log.[pid].$timestamp"
set sh_command_log_file "$log_path/cmd.[pid].$timestamp"

# 0.4   name rules
define_name_rules BORG -allowed {A-Za-z0-9_} -first_restricted "_" -last_restricted "_" -max_length 30

# 0.5   no tri-state gate
set verilogout_no_tri true
set verilogout_equation false

# 0.6   show unconnected pins 
set verilogout_show_unconnected_pins  true


# 0.7   scan chain
set test_default_scan_style  multiplexed_flip_flop

#set_clock_gating_style -num_stages 2 -minimum_bitwidth 4 -setup 2 -hold 2


#------------------------------------------------------------------------------
#                            1  Translate
#------------------------------------------------------------------------------
# remove_design $top_design
analyze -format sverilog $dla_files
elaborate $top_design -arch "verilog" -lib work -update
current_design $top_design

link  
uniquify
check_design


#------------------------------------------------------------------------------
#                            2  Constraint
#------------------------------------------------------------------------------
#  ***   UPDATE   *************************************************************************

#  ****************************************************************************************
#  **************************set clk + rst*****************************************************
#  ****************************************************************************************
create_clock -name $clk_name -period [expr 1000.0/$clk_freq] [get_ports $clk_name]
#create_generated_clock -name core_clk_gated -source [get_ports $clk_name] -combinational [get_pins U_TOP_CORE/u_core/U_CLK_CTRL/clkctl_clk_gated_o]
#create_generated_clock -name clk_gated -source [get_ports $clk_name] -combinational [get_pins U_TOP_CORE/U_CLK_CTRL/clkctl_clk_gated_o]
#  ****************************************************************************************

set_dont_touch_network [all_clocks]
#set_dont_touch_network [get_clocks core_clk_gated]
#set_dont_touch_network [get_clocks clk_gated]
#set_clock_latency 4 [all_clocks]
set_clock_uncertainty -setup [expr 30.0/$clk_freq] [all_clocks]
set_clock_uncertainty -hold [expr 15.0/$clk_freq] [all_clocks]
set_clock_transition -max [expr 4.0/$clk_freq] [all_clocks]

# set_dont_touch [get_nets u_spi/spi_cr_trans_inhibit_q] true
# set_dont_touch [get_nets u_spi/spi_cr_loop_q] true
# set_dont_touch [get_nets u_spi/spi_miso_i] true

#set_ideal_network [get_ports "$rst_name"]
#set_false_path -from [get_ports "$rst_name"]
set_dont_touch_network [get_ports "$rst_name"]

set_drive 0  $clk_name
set_drive 0  $rst_name
set_load  0 [all_outputs]


#  ****************************************************************************************
#  **************************timing constraint*********************************************
#  ****************************************************************************************

set_input_delay -clock $clk_name  -max [expr 0.0/$clk_freq]  [get_ports $rst_name]
set_input_delay -max [expr 0.0/$clk_freq] -clock $clk_name  [remove_from_collection [all_inputs] [get_ports "$clk_name $rst_name"]]
set_input_delay -min [expr 0.0/$clk_freq] -clock $clk_name  [remove_from_collection [all_inputs] [get_ports "$clk_name $rst_name"]]

set_output_delay -max [expr 0.0/$clk_freq] -clock $clk_name [all_outputs]
set_output_delay -min [expr 0.0/$clk_freq] -clock $clk_name [all_outputs]

#  ****************************************************************************************
#  **************************enviroment constraint*****************************************
#  ****************************************************************************************
# 2.3   environment
#set_operating_conditions WCCOM
# set_wire_load_mode top

#operating condition
set     LIB_NAME    tcbn28hpcplusbwp12t40p140lvttt0p9v25c_ccs                  
set     OPERATION_CONDITIONS        tt0p9v25c
set_operating_conditions            $OPERATION_CONDITIONS

set             DRIVE_CELL                              BUFFD0BWP12T40P140LVT
set             DRIVE_PIN                               Z
set             LOAD_PIN                                I

#driving cell
set             INPORTS_WITHOUT_CLK_RST           [remove_from_collection [all_inputs] [get_ports "$clk_name $rst_name"]]
set_driving_cell -lib_cell $DRIVE_CELL -library $LIB_NAME -pin $DRIVE_PIN [get_ports $INPORTS_WITHOUT_CLK_RST]
#set_input_transition -max [expr 40.0/$clk_freq] [all_inputs]

#load
set             MAX_LOAD                                [expr [load_of $LIB_NAME/$DRIVE_CELL/$LOAD_PIN] * 10 ]
set_load        [expr $MAX_LOAD * 5]                     [all_outputs]

#wire load model
set     auto_wire_load_selection    true
set_wire_load_mode                  top

set_fix_multiple_port_nets -feedthrough

#  ****************************************************************************************
#  **************************drc constraint************************************************
#  ****************************************************************************************
# 2.4   rule
#set_max_fanout 50 $top_design

# report_constraint -max_capacitance -significant_digits 13
# report_constraint -max_transition  -significant_digits 13
# report_constraint -max_fanout      -significant_digits 13
# set_max_capacitance 0.5 $top_design
#set             MAX_CAP                                 [get_attribute $LIB_NAME/$DRIVE_CELL/$DRIVE_PIN max_capacitance]
#set             CONSERVATIVE_MAX_CAP                    [expr $MAX_CAP / 2.0]
#set_max_capacitance  $CONSERVATIVE_MAX_CAP              [get_ports $INPORTS_WITHOUT_CLK_RST]
# set_max_transition 0.4 $top_design
#set             MAX_TRANS                               [get_attribute $LIB_NAME/$DRIVE_CELL/$DRIVE_PIN max_transition]
#set             CONSERVATIVE_MAX_TRANS                  [expr $MAX_TRANS / 2.0]
#set_max_transition  $CONSERVATIVE_MAX_TRANS            [get_ports $INPORTS_WITHOUT_CLK_RST]

# set_max_fanout 50 $top_design

# 2.5   area_opt
#  ****************************************************************************************
#  **************************area constraint***********************************************
#  ****************************************************************************************
set_max_area $max_area

set_fix_multiple_port_nets -all -buffer_constants
set compile_seqmap_propagate_constants false

#------------------------------------------------------------------------------
#                            3  map
#------------------------------------------------------------------------------
# compile_ultra
compile -map_effort low
change_names -rules verilog -hier

#------------------------------------------------------------------------------
#                            4  report
#------------------------------------------------------------------------------
report_constraint             > "$report_path/constraint.rpt"
report_constraint -all        > "$report_path/constraint_violator.rpt"
report_timing                 > "$report_path/timing.rpt"
report_timing -nworst 10      > "$report_path/timing_10.rpt"
report_timing -nworst 1000    > "$report_path/timing_1000.rpt"
report_area                   > "$report_path/area.rpt"
report_area -hierarchy        > "$report_path/area_hie.rpt"
report_power                  > "$report_path/power.rpt"

#setup time
report_timing -significant_digits 4 -nets -max_paths 100 -delay max -nworst 1 -from [all_registers -clock_pins] -to [all_registers -data_pins]  > "$report_path/timing_reg2reg.rpt"
report_timing -significant_digits 4 -nets -max_paths 20  -delay max -nworst 1 -from [all_registers -clock_pins] -to [all_outputs]               > "$report_path/timing_reg2out.rpt"
report_timing -significant_digits 4 -nets -max_paths 10  -delay max -nworst 1 -from [all_inputs]                -to [all_outputs]               > "$report_path/timing_in2out.rpt"
report_timing -significant_digits 4 -nets -max_paths 20  -delay max -nworst 1 -from [all_inputs]                -to [all_registers -data_pins]  > "$report_path/timing_in2reg.rpt"
#hold time
report_timing -significant_digits 4 -nets -max_paths 100 -delay min -nworst 1  -from [all_registers -clock_pins] -to [all_registers -data_pins]  > "$report_path/hold_timing_reg2reg.rpt"
report_timing -significant_digits 4 -nets -max_paths 20  -delay min -nworst 1  -from [all_registers -clock_pins] -to [all_outputs]               > "$report_path/hold_timing_reg2out.rpt"
report_timing -significant_digits 4 -nets -max_paths 10  -delay min -nworst 1  -from [all_inputs]                -to [all_outputs]               > "$report_path/hold_timing_in2out.rpt"
report_timing -significant_digits 4 -nets -max_paths 20  -delay min -nworst 1  -from [all_inputs]                -to [all_registers -data_pins]  > "$report_path/hold_timing_in2reg.rpt"
#------------------------------------------------------------------------------
#                            5  export
#------------------------------------------------------------------------------
write -hierarchy -format verilog -output "$export_path/$top_design.dc.v"
write_sdc "$export_path/$top_design.dc.sdc"
write_sdf "$export_path/$top_design.dc.sdf"
write -format ddc -hierarchy -output $export_path/$top_design.ddc
set_svf -off
