#set path

set CURR_PATH "/home/users5/ec385912/ECE527LSP22/ECE527L-LAB5/state_machine"

#specify SVF output file
set_svf $CURR_PATH/syn/guidance/state_machine.svf

#read in the entire design
read_verilog $CURR_PATH/src/state_machine.v
link

#apply constraints and attributes
create_clock -period 100 [get_ports clk]
set_clock_uncertainty 1 [get_ports clk]
set_operating_conditions -max "WCCOM"

#compile the design
compile

#analye and debug the design
report_timing > $CURR_PATH/syn/log/state_machine_timing.rpt
report_area > $CURR_PATH/syn/log/state_machine_area.rpt

#save design database
write_file -format ddc -hierarchy -output $CURR_PATH/syn/mapped/state_machine_synthesized.ddc
write_file -format verilog -hierarchy -output $CURR_PATH/syn/netlist/state_machine_netlist.v

#exit dc shell
exit
