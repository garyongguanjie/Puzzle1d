set projDir "E:/Downloads/Puzzle1d/work/planAhead"
set projName "puzzleboard1d"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "E:/Downloads/Puzzle1d/work/verilog/mojo_top_0.v" "E:/Downloads/Puzzle1d/work/verilog/alu_1.v" "E:/Downloads/Puzzle1d/work/verilog/reset_conditioner_2.v" "E:/Downloads/Puzzle1d/work/verilog/edge_detector_3.v" "E:/Downloads/Puzzle1d/work/verilog/button_conditioner_4.v" "E:/Downloads/Puzzle1d/work/verilog/edge_detector_3.v" "E:/Downloads/Puzzle1d/work/verilog/button_conditioner_4.v" "E:/Downloads/Puzzle1d/work/verilog/edge_detector_3.v" "E:/Downloads/Puzzle1d/work/verilog/button_conditioner_4.v" "E:/Downloads/Puzzle1d/work/verilog/edge_detector_3.v" "E:/Downloads/Puzzle1d/work/verilog/button_conditioner_4.v" "E:/Downloads/Puzzle1d/work/verilog/edge_detector_3.v" "E:/Downloads/Puzzle1d/work/verilog/button_conditioner_4.v" "E:/Downloads/Puzzle1d/work/verilog/edge_detector_3.v" "E:/Downloads/Puzzle1d/work/verilog/button_conditioner_4.v" "E:/Downloads/Puzzle1d/work/verilog/display_15.v" "E:/Downloads/Puzzle1d/work/verilog/position_16.v" "E:/Downloads/Puzzle1d/work/verilog/seven_Seg_17.v" "E:/Downloads/Puzzle1d/work/verilog/adder_18.v" "E:/Downloads/Puzzle1d/work/verilog/boolean_19.v" "E:/Downloads/Puzzle1d/work/verilog/compare_20.v" "E:/Downloads/Puzzle1d/work/verilog/shifter_21.v" "E:/Downloads/Puzzle1d/work/verilog/pipeline_22.v" "E:/Downloads/Puzzle1d/work/verilog/pipeline_22.v" "E:/Downloads/Puzzle1d/work/verilog/pipeline_22.v" "E:/Downloads/Puzzle1d/work/verilog/pipeline_22.v" "E:/Downloads/Puzzle1d/work/verilog/pipeline_22.v" "E:/Downloads/Puzzle1d/work/verilog/pipeline_22.v" "E:/Downloads/Puzzle1d/work/verilog/counter_28.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "E:/Downloads/Puzzle1d/constraint/output_pins.ucf" "E:/Programs/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
