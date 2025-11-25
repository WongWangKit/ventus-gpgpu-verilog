无pad
set clk_freq 1200
set max_area 4000000
set_clock_transition -max 3 [all_clocks]
set_input_delay -clock $clk_name  -max 5  [get_ports $rst_name]
set_input_delay -max 35 -clock $clk_name  [remove_from_collection [all_inputs] [get_ports "$clk_name $rst_name"]]
set_input_delay -min 15 -clock $clk_name  [remove_from_collection [all_inputs] [get_ports "$clk_name $rst_name"]]
set_output_delay -max 25 -clock $clk_name [all_outputs]
set_output_delay -min 15 -clock $clk_name [all_outputs]
set_input_transition -max 3 [all_inputs]