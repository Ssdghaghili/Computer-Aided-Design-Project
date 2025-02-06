onerror {resume}
quietly virtual function -install /PE_testbench -env /PE_testbench { &{/PE_testbench/filter_din[15], /PE_testbench/filter_din[14], /PE_testbench/filter_din[13], /PE_testbench/filter_din[12], /PE_testbench/filter_din[11], /PE_testbench/filter_din[10], /PE_testbench/filter_din[9], /PE_testbench/filter_din[8], /PE_testbench/filter_din[7], /PE_testbench/filter_din[6], /PE_testbench/filter_din[5], /PE_testbench/filter_din[4], /PE_testbench/filter_din[3], /PE_testbench/filter_din[2], /PE_testbench/filter_din[1], /PE_testbench/filter_din[0] }} d0
quietly WaveActivateNextPane {} 0
add wave -noupdate /PE_testbench/clk
add wave -noupdate /PE_testbench/rstn
add wave -noupdate /PE_testbench/en
add wave -noupdate /PE_testbench/ifmap_wen
add wave -noupdate /PE_testbench/ifmap_ready
add wave -noupdate /PE_testbench/filter_wen
add wave -noupdate /PE_testbench/filter_ready
add wave -noupdate -radix binary -childformat {{{/PE_testbench/ifmap_din[15]} -radix binary} {{/PE_testbench/ifmap_din[14]} -radix binary} {{/PE_testbench/ifmap_din[13]} -radix binary} {{/PE_testbench/ifmap_din[12]} -radix binary} {{/PE_testbench/ifmap_din[11]} -radix binary} {{/PE_testbench/ifmap_din[10]} -radix binary} {{/PE_testbench/ifmap_din[9]} -radix binary} {{/PE_testbench/ifmap_din[8]} -radix binary} {{/PE_testbench/ifmap_din[7]} -radix binary} {{/PE_testbench/ifmap_din[6]} -radix binary} {{/PE_testbench/ifmap_din[5]} -radix binary} {{/PE_testbench/ifmap_din[4]} -radix binary} {{/PE_testbench/ifmap_din[3]} -radix binary} {{/PE_testbench/ifmap_din[2]} -radix binary} {{/PE_testbench/ifmap_din[1]} -radix binary} {{/PE_testbench/ifmap_din[0]} -radix binary}} -subitemconfig {{/PE_testbench/ifmap_din[15]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[14]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[13]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[12]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[11]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[10]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[9]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[8]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[7]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[6]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[5]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[4]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[3]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[2]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[1]} {-height 23 -radix binary} {/PE_testbench/ifmap_din[0]} {-height 23 -radix binary}} /PE_testbench/ifmap_din
add wave -noupdate -radix decimal -childformat {{{/PE_testbench/filter_din[15]} -radix decimal} {{/PE_testbench/filter_din[14]} -radix decimal} {{/PE_testbench/filter_din[13]} -radix decimal} {{/PE_testbench/filter_din[12]} -radix decimal} {{/PE_testbench/filter_din[11]} -radix decimal} {{/PE_testbench/filter_din[10]} -radix decimal} {{/PE_testbench/filter_din[9]} -radix decimal} {{/PE_testbench/filter_din[8]} -radix decimal} {{/PE_testbench/filter_din[7]} -radix decimal} {{/PE_testbench/filter_din[6]} -radix decimal} {{/PE_testbench/filter_din[5]} -radix decimal} {{/PE_testbench/filter_din[4]} -radix decimal} {{/PE_testbench/filter_din[3]} -radix decimal} {{/PE_testbench/filter_din[2]} -radix decimal} {{/PE_testbench/filter_din[1]} -radix decimal} {{/PE_testbench/filter_din[0]} -radix decimal}} -subitemconfig {{/PE_testbench/filter_din[15]} {-height 23 -radix decimal} {/PE_testbench/filter_din[14]} {-height 23 -radix decimal} {/PE_testbench/filter_din[13]} {-height 23 -radix decimal} {/PE_testbench/filter_din[12]} {-height 23 -radix decimal} {/PE_testbench/filter_din[11]} {-height 23 -radix decimal} {/PE_testbench/filter_din[10]} {-height 23 -radix decimal} {/PE_testbench/filter_din[9]} {-height 23 -radix decimal} {/PE_testbench/filter_din[8]} {-height 23 -radix decimal} {/PE_testbench/filter_din[7]} {-height 23 -radix decimal} {/PE_testbench/filter_din[6]} {-height 23 -radix decimal} {/PE_testbench/filter_din[5]} {-height 23 -radix decimal} {/PE_testbench/filter_din[4]} {-height 23 -radix decimal} {/PE_testbench/filter_din[3]} {-height 23 -radix decimal} {/PE_testbench/filter_din[2]} {-height 23 -radix decimal} {/PE_testbench/filter_din[1]} {-height 23 -radix decimal} {/PE_testbench/filter_din[0]} {-height 23 -radix decimal}} /PE_testbench/filter_din
add wave -noupdate -childformat {{{/PE_testbench/ifmap_rand_data[0]} -radix decimal}} -subitemconfig {{/PE_testbench/ifmap_rand_data[0]} {-height 23 -radix decimal}} /PE_testbench/ifmap_rand_data
add wave -noupdate -childformat {{{/PE_testbench/filter_rand_data[0]} -radix decimal}} -subitemconfig {{/PE_testbench/filter_rand_data[0]} {-height 23 -radix decimal}} /PE_testbench/filter_rand_data
add wave -noupdate -radix unsigned /PE_testbench/dut/ifmap_spad_write_counter/count
add wave -noupdate -group ifmap_spad /PE_testbench/dut/ifmap_spad/en
add wave -noupdate -group ifmap_spad /PE_testbench/dut/ifmap_spad/wen
add wave -noupdate -group ifmap_spad -radix unsigned /PE_testbench/dut/ifmap_spad/raddr
add wave -noupdate -group ifmap_spad -radix unsigned -childformat {{{/PE_testbench/dut/ifmap_spad/waddr[4]} -radix unsigned} {{/PE_testbench/dut/ifmap_spad/waddr[3]} -radix unsigned} {{/PE_testbench/dut/ifmap_spad/waddr[2]} -radix unsigned} {{/PE_testbench/dut/ifmap_spad/waddr[1]} -radix unsigned} {{/PE_testbench/dut/ifmap_spad/waddr[0]} -radix unsigned}} -subitemconfig {{/PE_testbench/dut/ifmap_spad/waddr[4]} {-height 23 -radix unsigned} {/PE_testbench/dut/ifmap_spad/waddr[3]} {-height 23 -radix unsigned} {/PE_testbench/dut/ifmap_spad/waddr[2]} {-height 23 -radix unsigned} {/PE_testbench/dut/ifmap_spad/waddr[1]} {-height 23 -radix unsigned} {/PE_testbench/dut/ifmap_spad/waddr[0]} {-height 23 -radix unsigned}} /PE_testbench/dut/ifmap_spad/waddr
add wave -noupdate -group ifmap_spad -radix decimal -childformat {{{/PE_testbench/dut/ifmap_spad/regs[0]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[1]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[2]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[3]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[4]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[5]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[6]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[7]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[8]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[9]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[10]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[11]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[12]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[13]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[14]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[15]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[16]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[17]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[18]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[19]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[20]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[21]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[22]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[23]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[24]} -radix decimal}} -subitemconfig {{/PE_testbench/dut/ifmap_spad/regs[0]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[1]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[2]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[3]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[4]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[5]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[6]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[7]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[8]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[9]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[10]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[11]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[12]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[13]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[14]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[15]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[16]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[17]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[18]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[19]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[20]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[21]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[22]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[23]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[24]} {-height 23 -radix decimal}} /PE_testbench/dut/ifmap_spad/regs
add wave -noupdate -group ifmap_spad -radix decimal /PE_testbench/dut/ifmap_spad/din
add wave -noupdate -group ifmap_spad -radix decimal /PE_testbench/dut/ifmap_spad/dout
add wave -noupdate -group ifmap_spad -radix decimal -childformat {{{/PE_testbench/dut/ifmap_spad/regs[0]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[1]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[2]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[3]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[4]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[5]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[6]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[7]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[8]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[9]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[10]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[11]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[12]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[13]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[14]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[15]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[16]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[17]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[18]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[19]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[20]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[21]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[22]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[23]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[24]} -radix decimal}} -subitemconfig {{/PE_testbench/dut/ifmap_spad/regs[0]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[1]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[2]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[3]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[4]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[5]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[6]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[7]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[8]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[9]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[10]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[11]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[12]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[13]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[14]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[15]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[16]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[17]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[18]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[19]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[20]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[21]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[22]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[23]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[24]} {-height 23 -radix decimal}} /PE_testbench/dut/ifmap_spad/regs
add wave -noupdate -group ifmap_spad /PE_testbench/dut/ifmap_spad/counter
add wave -noupdate -group filter_spad /PE_testbench/dut/filter_spad/chip_en
add wave -noupdate -group filter_spad /PE_testbench/dut/filter_spad/wen
add wave -noupdate -group filter_spad -radix unsigned /PE_testbench/dut/filter_spad/waddr
add wave -noupdate -group filter_spad -radix unsigned -childformat {{{/PE_testbench/dut/filter_spad/raddr[2]} -radix unsigned} {{/PE_testbench/dut/filter_spad/raddr[1]} -radix unsigned} {{/PE_testbench/dut/filter_spad/raddr[0]} -radix unsigned}} -subitemconfig {{/PE_testbench/dut/filter_spad/raddr[2]} {-height 23 -radix unsigned} {/PE_testbench/dut/filter_spad/raddr[1]} {-height 23 -radix unsigned} {/PE_testbench/dut/filter_spad/raddr[0]} {-height 23 -radix unsigned}} /PE_testbench/dut/filter_spad/raddr
add wave -noupdate -group filter_spad -radix decimal /PE_testbench/dut/filter_spad/din
add wave -noupdate -group filter_spad -radix decimal /PE_testbench/dut/filter_spad/dout
add wave -noupdate -group filter_spad -radix decimal -childformat {{{/PE_testbench/dut/filter_spad/mem[0]} -radix decimal} {{/PE_testbench/dut/filter_spad/mem[1]} -radix decimal} {{/PE_testbench/dut/filter_spad/mem[2]} -radix decimal} {{/PE_testbench/dut/filter_spad/mem[3]} -radix decimal} {{/PE_testbench/dut/filter_spad/mem[4]} -radix decimal}} -expand -subitemconfig {{/PE_testbench/dut/filter_spad/mem[0]} {-height 23 -radix decimal} {/PE_testbench/dut/filter_spad/mem[1]} {-height 23 -radix decimal} {/PE_testbench/dut/filter_spad/mem[2]} {-height 23 -radix decimal} {/PE_testbench/dut/filter_spad/mem[3]} {-height 23 -radix decimal} {/PE_testbench/dut/filter_spad/mem[4]} {-height 23 -radix decimal}} /PE_testbench/dut/filter_spad/mem
add wave -noupdate -group ifmap_buffer -radix unsigned /PE_testbench/dut/ifmap_buffer/raddr_cnt
add wave -noupdate -group ifmap_buffer -radix unsigned /PE_testbench/dut/ifmap_buffer/waddr_cnt
add wave -noupdate -group ifmap_buffer /PE_testbench/dut/ifmap_buffer/clear
add wave -noupdate -group ifmap_buffer /PE_testbench/dut/ifmap_buffer/ren
add wave -noupdate -group ifmap_buffer /PE_testbench/dut/ifmap_buffer/wen
add wave -noupdate -group ifmap_buffer -radix decimal /PE_testbench/dut/ifmap_buffer/din
add wave -noupdate -group ifmap_buffer -radix decimal /PE_testbench/dut/ifmap_buffer/dout
add wave -noupdate -group ifmap_buffer /PE_testbench/dut/ifmap_buffer/full
add wave -noupdate -group ifmap_buffer /PE_testbench/dut/ifmap_buffer/empty
add wave -noupdate -group ifmap_buffer -radix decimal -childformat {{{/PE_testbench/dut/ifmap_buffer/buffer/memory[0]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[1]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[2]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[3]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[4]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[5]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[6]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[7]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[8]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[9]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[10]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[11]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[12]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[13]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[14]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[15]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[16]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[17]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[18]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[19]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[20]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[21]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[22]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[23]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[24]} -radix decimal} {{/PE_testbench/dut/ifmap_buffer/buffer/memory[25]} -radix decimal}} -subitemconfig {{/PE_testbench/dut/ifmap_buffer/buffer/memory[0]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[1]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[2]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[3]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[4]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[5]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[6]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[7]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[8]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[9]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[10]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[11]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[12]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[13]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[14]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[15]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[16]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[17]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[18]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[19]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[20]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[21]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[22]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[23]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[24]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_buffer/buffer/memory[25]} {-height 23 -radix decimal}} /PE_testbench/dut/ifmap_buffer/buffer/memory
add wave -noupdate -group filter_read_controller /PE_testbench/dut/filter_read_controller/en
add wave -noupdate -group filter_read_controller /PE_testbench/dut/filter_read_controller/empty
add wave -noupdate -group filter_read_controller /PE_testbench/dut/filter_read_controller/ready
add wave -noupdate -group filter_waddr_counter /PE_testbench/dut/filter_spad_write_counter/clk
add wave -noupdate -group filter_waddr_counter /PE_testbench/dut/filter_spad_write_counter/en
add wave -noupdate -group filter_waddr_counter /PE_testbench/dut/filter_spad_write_counter/rstn
add wave -noupdate -group filter_waddr_counter /PE_testbench/dut/filter_spad_write_counter/clear
add wave -noupdate -group filter_waddr_counter /PE_testbench/dut/filter_spad_write_counter/at_max
add wave -noupdate -group filter_waddr_counter -radix unsigned -childformat {{{/PE_testbench/dut/filter_spad_write_counter/count[2]} -radix unsigned} {{/PE_testbench/dut/filter_spad_write_counter/count[1]} -radix unsigned} {{/PE_testbench/dut/filter_spad_write_counter/count[0]} -radix unsigned}} -subitemconfig {{/PE_testbench/dut/filter_spad_write_counter/count[2]} {-height 23 -radix unsigned} {/PE_testbench/dut/filter_spad_write_counter/count[1]} {-height 23 -radix unsigned} {/PE_testbench/dut/filter_spad_write_counter/count[0]} {-height 23 -radix unsigned}} /PE_testbench/dut/filter_spad_write_counter/count
add wave -noupdate -group filter_waddr_counter /PE_testbench/dut/filter_spad_write_counter/prev_count
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/clear
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/ren
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/wen
add wave -noupdate -group filter_buffer -radix decimal /PE_testbench/dut/filter_buffer/din
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/dout
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/full
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/empty
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/raddr_cnt
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/waddr_cnt
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/buffer_wen
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/buffer_ren
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/at_max_write
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/at_max_read
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/full_conditions
add wave -noupdate -group filter_buffer /PE_testbench/dut/filter_buffer/empty_conditions
add wave -noupdate -group DUT /PE_testbench/dut/clk
add wave -noupdate -group DUT /PE_testbench/dut/rstn
add wave -noupdate -group DUT /PE_testbench/dut/en
add wave -noupdate -group DUT /PE_testbench/dut/filter_done
add wave -noupdate -group DUT /PE_testbench/dut/filter_size
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_size
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_wen
add wave -noupdate -group DUT -color {Medium Orchid} -radix decimal /PE_testbench/dut/ifmap_din
add wave -noupdate -group DUT -color Gold -radix decimal /PE_testbench/dut/filter_din
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_ready
add wave -noupdate -group DUT /PE_testbench/dut/filter_wen
add wave -noupdate -group DUT /PE_testbench/dut/filter_ready
add wave -noupdate -group DUT /PE_testbench/dut/psum_ready
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_full
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_empty
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_valid
add wave -noupdate -group DUT /PE_testbench/dut/if_read
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_buf_clear
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_spad_dout
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_spad_dout_1
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_buf_dout
add wave -noupdate -group DUT /PE_testbench/dut/if_base_address
add wave -noupdate -group DUT /PE_testbench/dut/if_write_grant
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_rcnt_clear
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_wcnt_clear
add wave -noupdate -group DUT /PE_testbench/dut/if_spad_raddr
add wave -noupdate -group DUT /PE_testbench/dut/if_spad_waddr
add wave -noupdate -group DUT /PE_testbench/dut/filter_full
add wave -noupdate -group DUT /PE_testbench/dut/filter_empty
add wave -noupdate -group DUT /PE_testbench/dut/filter_valid
add wave -noupdate -group DUT /PE_testbench/dut/filter_read
add wave -noupdate -group DUT /PE_testbench/dut/filter_buf_clear
add wave -noupdate -group DUT /PE_testbench/dut/filter_spad_dout
add wave -noupdate -group DUT -radix decimal /PE_testbench/dut/filter_buf_dout
add wave -noupdate -group DUT /PE_testbench/dut/filter_write_grant
add wave -noupdate -group DUT /PE_testbench/dut/filter_rcnt_clear
add wave -noupdate -group DUT /PE_testbench/dut/filter_wcnt_clear
add wave -noupdate -group DUT /PE_testbench/dut/filter_spad_raddr
add wave -noupdate -group DUT /PE_testbench/dut/filter_spad_waddr
add wave -noupdate -group DUT /PE_testbench/dut/filter_read_grant
add wave -noupdate -group DUT /PE_testbench/dut/if_read_grant
add wave -noupdate -group DUT /PE_testbench/dut/if_addr_clear
add wave -noupdate -group DUT /PE_testbench/dut/filter_addr_clear
add wave -noupdate -group DUT /PE_testbench/dut/psum_ready_0
add wave -noupdate -group DUT /PE_testbench/dut/psum_ready_1
add wave -noupdate -group DUT /PE_testbench/dut/psum_ready_2
add wave -noupdate -group DUT /PE_testbench/dut/psum_clear_2
add wave -noupdate -group DUT /PE_testbench/dut/pipe_en
add wave -noupdate -group DUT /PE_testbench/dut/filter_mult_in
add wave -noupdate -group DUT /PE_testbench/dut/ifmap_mult_in
add wave -noupdate -group DUT /PE_testbench/dut/mult_out
add wave -noupdate -group DUT /PE_testbench/dut/adder_out
add wave -noupdate -group DUT /PE_testbench/dut/psum
add wave -noupdate -group DUT /PE_testbench/dut/offset_co
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/buffer/memory
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/clk
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/rstn
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/clear
add wave -noupdate -group FILTER_BUFFER -color Gold /PE_testbench/dut/filter_buffer/ren
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/wen
add wave -noupdate -group FILTER_BUFFER -radix decimal /PE_testbench/dut/filter_buffer/din
add wave -noupdate -group FILTER_BUFFER -radix decimal /PE_testbench/dut/filter_buffer/dout
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/full
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/empty
add wave -noupdate -group FILTER_BUFFER -radix unsigned /PE_testbench/dut/filter_buffer/raddr_cnt
add wave -noupdate -group FILTER_BUFFER -radix unsigned /PE_testbench/dut/filter_buffer/waddr_cnt
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/buffer_wen
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/buffer_ren
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/at_max_write
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/at_max_read
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/full_conditions
add wave -noupdate -group FILTER_BUFFER /PE_testbench/dut/filter_buffer/empty_conditions
add wave -noupdate -group Filter_Spad -radix decimal -childformat {{{/PE_testbench/dut/filter_spad/mem[0]} -radix decimal} {{/PE_testbench/dut/filter_spad/mem[1]} -radix decimal} {{/PE_testbench/dut/filter_spad/mem[2]} -radix decimal} {{/PE_testbench/dut/filter_spad/mem[3]} -radix decimal} {{/PE_testbench/dut/filter_spad/mem[4]} -radix decimal}} -subitemconfig {{/PE_testbench/dut/filter_spad/mem[0]} {-height 23 -radix decimal} {/PE_testbench/dut/filter_spad/mem[1]} {-height 23 -radix decimal} {/PE_testbench/dut/filter_spad/mem[2]} {-height 23 -radix decimal} {/PE_testbench/dut/filter_spad/mem[3]} {-height 23 -radix decimal} {/PE_testbench/dut/filter_spad/mem[4]} {-height 23 -radix decimal}} /PE_testbench/dut/filter_spad/mem
add wave -noupdate -group Filter_Spad /PE_testbench/dut/filter_spad/clk
add wave -noupdate -group Filter_Spad /PE_testbench/dut/filter_spad/chip_en
add wave -noupdate -group Filter_Spad /PE_testbench/dut/filter_spad/wen
add wave -noupdate -group Filter_Spad /PE_testbench/dut/filter_spad/ren
add wave -noupdate -group Filter_Spad -color {Sky Blue} -radix unsigned /PE_testbench/dut/filter_spad/waddr
add wave -noupdate -group Filter_Spad -color {Sky Blue} -radix unsigned /PE_testbench/dut/filter_spad/raddr
add wave -noupdate -group Filter_Spad -radix decimal /PE_testbench/dut/filter_spad/din
add wave -noupdate -group Filter_Spad -radix decimal /PE_testbench/dut/filter_spad/dout
add wave -noupdate -group Filter_read_controller /PE_testbench/dut/filter_read_controller/clk
add wave -noupdate -group Filter_read_controller /PE_testbench/dut/filter_read_controller/rstn
add wave -noupdate -group Filter_read_controller /PE_testbench/dut/filter_read_controller/en
add wave -noupdate -group Filter_read_controller /PE_testbench/dut/filter_read_controller/empty
add wave -noupdate -group Filter_read_controller -color Gold /PE_testbench/dut/filter_read_controller/write_grant
add wave -noupdate -group Filter_read_controller /PE_testbench/dut/filter_read_controller/first_write
add wave -noupdate -group Filter_read_controller /PE_testbench/dut/filter_read_controller/ready
add wave -noupdate -group Filter_read_controller /PE_testbench/dut/filter_read_controller/ps
add wave -noupdate -group Filter_read_controller /PE_testbench/dut/filter_read_controller/ns
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/clk
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/rstn
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/clear
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/ren
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/wen
add wave -noupdate -group Ifmap_buffer -radix decimal /PE_testbench/dut/ifmap_buffer/din
add wave -noupdate -group Ifmap_buffer -radix decimal /PE_testbench/dut/ifmap_buffer/dout
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/full
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/empty
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/raddr_cnt
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/waddr_cnt
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/buffer_wen
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/buffer_ren
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/at_max_write
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/at_max_read
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/full_conditions
add wave -noupdate -group Ifmap_buffer /PE_testbench/dut/ifmap_buffer/empty_conditions
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/clk
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/rstn
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/en
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/empty
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/write_grant
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/first_write
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/ready
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/ps
add wave -noupdate -group Ifmap_read_controller /PE_testbench/dut/ifmap_read_controller/ns
add wave -noupdate -group Ifmap_spad /PE_testbench/dut/ifmap_spad/clk
add wave -noupdate -group Ifmap_spad /PE_testbench/dut/ifmap_spad/rstn
add wave -noupdate -group Ifmap_spad /PE_testbench/dut/ifmap_spad/en
add wave -noupdate -group Ifmap_spad /PE_testbench/dut/ifmap_spad/wen
add wave -noupdate -group Ifmap_spad -color {Sky Blue} -radix unsigned /PE_testbench/dut/ifmap_spad/raddr
add wave -noupdate -group Ifmap_spad -radix decimal /PE_testbench/dut/ifmap_spad/dout
add wave -noupdate -group Ifmap_spad -color {Sky Blue} -radix unsigned /PE_testbench/dut/ifmap_spad/waddr
add wave -noupdate -group Ifmap_spad -radix decimal /PE_testbench/dut/ifmap_spad/din
add wave -noupdate -group Ifmap_spad -radix decimal -childformat {{{/PE_testbench/dut/ifmap_spad/regs[0]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[1]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[2]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[3]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[4]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[5]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[6]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[7]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[8]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[9]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[10]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[11]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[12]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[13]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[14]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[15]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[16]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[17]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[18]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[19]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[20]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[21]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[22]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[23]} -radix decimal} {{/PE_testbench/dut/ifmap_spad/regs[24]} -radix decimal}} -subitemconfig {{/PE_testbench/dut/ifmap_spad/regs[0]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[1]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[2]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[3]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[4]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[5]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[6]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[7]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[8]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[9]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[10]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[11]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[12]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[13]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[14]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[15]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[16]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[17]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[18]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[19]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[20]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[21]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[22]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[23]} {-height 23 -radix decimal} {/PE_testbench/dut/ifmap_spad/regs[24]} {-height 23 -radix decimal}} /PE_testbench/dut/ifmap_spad/regs
add wave -noupdate -group Ifmap_spad /PE_testbench/dut/ifmap_spad/counter
add wave -noupdate -group ifmap_write_counter /PE_testbench/dut/ifmap_spad_write_counter/MAX
add wave -noupdate -group ifmap_write_counter /PE_testbench/dut/ifmap_spad_write_counter/WIDTH
add wave -noupdate -group ifmap_write_counter /PE_testbench/dut/ifmap_spad_write_counter/clk
add wave -noupdate -group ifmap_write_counter /PE_testbench/dut/ifmap_spad_write_counter/en
add wave -noupdate -group ifmap_write_counter /PE_testbench/dut/ifmap_spad_write_counter/rstn
add wave -noupdate -group ifmap_write_counter /PE_testbench/dut/ifmap_spad_write_counter/clear
add wave -noupdate -group ifmap_write_counter /PE_testbench/dut/ifmap_spad_write_counter/at_max
add wave -noupdate -group ifmap_write_counter -radix unsigned /PE_testbench/dut/ifmap_spad_write_counter/count
add wave -noupdate -group ifmap_write_counter /PE_testbench/dut/ifmap_spad_write_counter/prev_count
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator /PE_testbench/dut/address_generator/if_address_generator/clk
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator /PE_testbench/dut/address_generator/if_address_generator/rstn
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator /PE_testbench/dut/address_generator/if_address_generator/offset_co
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator /PE_testbench/dut/address_generator/if_address_generator/clear
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator -radix unsigned /PE_testbench/dut/address_generator/if_address_generator/offset_cnt
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator -radix unsigned /PE_testbench/dut/address_generator/if_address_generator/ifmap_size
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator -radix unsigned /PE_testbench/dut/address_generator/if_address_generator/readAddress
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator -radix unsigned /PE_testbench/dut/address_generator/if_address_generator/if_base_address
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator -color Plum /PE_testbench/dut/address_generator/if_address_generator/if_co
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator -radix unsigned /PE_testbench/dut/address_generator/if_address_generator/base_address
add wave -noupdate -expand -group address_generator -expand -group If_addr_generator -color Cyan -radix unsigned /PE_testbench/dut/address_generator/if_address_generator/if_adr_reg
add wave -noupdate -expand -group address_generator /PE_testbench/dut/address_generator/clk
add wave -noupdate -expand -group address_generator /PE_testbench/dut/address_generator/rstn
add wave -noupdate -expand -group address_generator /PE_testbench/dut/address_generator/if_clear
add wave -noupdate -expand -group address_generator -radix unsigned /PE_testbench/dut/address_generator/filter_size
add wave -noupdate -expand -group address_generator -radix unsigned /PE_testbench/dut/address_generator/ifmap_size
add wave -noupdate -expand -group address_generator /PE_testbench/dut/address_generator/pipe_en
add wave -noupdate -expand -group address_generator -color Plum -radix unsigned /PE_testbench/dut/address_generator/if_read_address
add wave -noupdate -expand -group address_generator -color Plum -radix unsigned /PE_testbench/dut/address_generator/filter_read_address
add wave -noupdate -expand -group address_generator -radix unsigned /PE_testbench/dut/address_generator/if_base_address
add wave -noupdate -expand -group address_generator /PE_testbench/dut/address_generator/if_co
add wave -noupdate -expand -group address_generator /PE_testbench/dut/address_generator/offset_co
add wave -noupdate -expand -group address_generator -radix unsigned /PE_testbench/dut/address_generator/offset_cnt
add wave -noupdate -expand -group address_generator /PE_testbench/dut/address_generator/offset_cnt_clear
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/clk
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/rstn
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/en
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/start
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/filter_done
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/filter_read_grant
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/if_read_grant
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/if_buffer_empty
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/if_spad_wen
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/filter_spad_wen
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/if_addr_clear
add wave -noupdate -group pipe_controller -color Cyan /PE_testbench/dut/controller_unit/pipe_en
add wave -noupdate -group pipe_controller -radix unsigned /PE_testbench/dut/controller_unit/ps
add wave -noupdate -group pipe_controller /PE_testbench/dut/controller_unit/ns
add wave -noupdate -expand -group mult /PE_testbench/dut/mult/clk
add wave -noupdate -expand -group mult /PE_testbench/dut/mult/en
add wave -noupdate -expand -group mult /PE_testbench/dut/mult/rstn
add wave -noupdate -expand -group mult -color {Medium Orchid} /PE_testbench/dut/mult/data_in_a
add wave -noupdate -expand -group mult -color Gold /PE_testbench/dut/mult/data_in_b
add wave -noupdate -expand -group mult /PE_testbench/dut/mult/data_out
add wave -noupdate -expand -group adder -radix decimal /PE_testbench/dut/adder/data_in_a
add wave -noupdate -expand -group adder -radix decimal /PE_testbench/dut/adder/data_in_b
add wave -noupdate -expand -group adder -radix decimal /PE_testbench/dut/adder/data_out
add wave -noupdate -expand -group Filter_Reg /PE_testbench/dut/filter_reg/clk
add wave -noupdate -expand -group Filter_Reg /PE_testbench/dut/filter_reg/en
add wave -noupdate -expand -group Filter_Reg /PE_testbench/dut/filter_reg/rstn
add wave -noupdate -expand -group Filter_Reg /PE_testbench/dut/filter_reg/clear
add wave -noupdate -expand -group Filter_Reg -radix decimal /PE_testbench/dut/filter_reg/data_in
add wave -noupdate -expand -group Filter_Reg -color Gold -radix decimal /PE_testbench/dut/filter_reg/data_out
add wave -noupdate -expand -group Ifmap_reg_1 /PE_testbench/dut/ifmap_reg_1/clk
add wave -noupdate -expand -group Ifmap_reg_1 /PE_testbench/dut/ifmap_reg_1/en
add wave -noupdate -expand -group Ifmap_reg_1 /PE_testbench/dut/ifmap_reg_1/rstn
add wave -noupdate -expand -group Ifmap_reg_1 /PE_testbench/dut/ifmap_reg_1/clear
add wave -noupdate -expand -group Ifmap_reg_1 -radix decimal /PE_testbench/dut/ifmap_reg_1/data_in
add wave -noupdate -expand -group Ifmap_reg_1 -color {Medium Orchid} -radix decimal /PE_testbench/dut/ifmap_reg_1/data_out
add wave -noupdate -expand -group Psum_reg /PE_testbench/dut/psum_reg/clk
add wave -noupdate -expand -group Psum_reg /PE_testbench/dut/psum_reg/en
add wave -noupdate -expand -group Psum_reg /PE_testbench/dut/psum_reg/rstn
add wave -noupdate -expand -group Psum_reg /PE_testbench/dut/psum_reg/clear
add wave -noupdate -expand -group Psum_reg -radix decimal /PE_testbench/dut/psum_reg/data_in
add wave -noupdate -expand -group Psum_reg -color Cyan -radix decimal /PE_testbench/dut/psum_reg/data_out
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/clk
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/rstn
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/clear
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/ren
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/wen
add wave -noupdate -expand -group Psum_Buffer -radix decimal /PE_testbench/dut/psum_buffer/din
add wave -noupdate -expand -group Psum_Buffer -radix decimal -childformat {{{/PE_testbench/dut/psum_buffer/dout[31]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[30]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[29]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[28]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[27]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[26]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[25]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[24]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[23]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[22]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[21]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[20]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[19]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[18]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[17]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[16]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[15]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[14]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[13]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[12]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[11]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[10]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[9]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[8]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[7]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[6]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[5]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[4]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[3]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[2]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[1]} -radix decimal} {{/PE_testbench/dut/psum_buffer/dout[0]} -radix decimal}} -subitemconfig {{/PE_testbench/dut/psum_buffer/dout[31]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[30]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[29]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[28]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[27]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[26]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[25]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[24]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[23]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[22]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[21]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[20]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[19]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[18]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[17]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[16]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[15]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[14]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[13]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[12]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[11]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[10]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[9]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[8]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[7]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[6]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[5]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[4]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[3]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[2]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[1]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/dout[0]} {-height 23 -radix decimal}} /PE_testbench/dut/psum_buffer/dout
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/full
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/empty
add wave -noupdate -expand -group Psum_Buffer -radix unsigned /PE_testbench/dut/psum_buffer/raddr_cnt
add wave -noupdate -expand -group Psum_Buffer -radix unsigned /PE_testbench/dut/psum_buffer/waddr_cnt
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/buffer_wen
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/buffer_ren
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/at_max_write
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/at_max_read
add wave -noupdate -expand -group Psum_Buffer -childformat {{{/PE_testbench/dut/psum_buffer/buffer/memory[0]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[1]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[2]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[3]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[4]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[5]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[6]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[7]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[8]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[9]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[10]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[11]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[12]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[13]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[14]} -radix decimal} {{/PE_testbench/dut/psum_buffer/buffer/memory[15]} -radix decimal}} -expand -subitemconfig {{/PE_testbench/dut/psum_buffer/buffer/memory[0]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[1]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[2]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[3]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[4]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[5]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[6]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[7]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[8]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[9]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[10]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[11]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[12]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[13]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[14]} {-height 23 -radix decimal} {/PE_testbench/dut/psum_buffer/buffer/memory[15]} {-height 23 -radix decimal}} /PE_testbench/dut/psum_buffer/buffer/memory
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/full_conditions
add wave -noupdate -expand -group Psum_Buffer /PE_testbench/dut/psum_buffer/empty_conditions
add wave -noupdate -expand -group TestCase -radix decimal -childformat {{{/PE_testbench/filters[0]} -radix decimal} {{/PE_testbench/filters[1]} -radix decimal} {{/PE_testbench/filters[2]} -radix decimal} {{/PE_testbench/filters[3]} -radix decimal}} -subitemconfig {{/PE_testbench/filters[0]} {-height 23 -radix decimal} {/PE_testbench/filters[1]} {-height 23 -radix decimal} {/PE_testbench/filters[2]} {-height 23 -radix decimal} {/PE_testbench/filters[3]} {-height 23 -radix decimal}} /PE_testbench/filters
add wave -noupdate -expand -group TestCase -radix decimal -childformat {{{/PE_testbench/ifmaps[0]} -radix decimal} {{/PE_testbench/ifmaps[1]} -radix decimal} {{/PE_testbench/ifmaps[2]} -radix decimal} {{/PE_testbench/ifmaps[3]} -radix decimal} {{/PE_testbench/ifmaps[4]} -radix decimal} {{/PE_testbench/ifmaps[5]} -radix decimal} {{/PE_testbench/ifmaps[6]} -radix decimal} {{/PE_testbench/ifmaps[7]} -radix decimal} {{/PE_testbench/ifmaps[8]} -radix decimal} {{/PE_testbench/ifmaps[9]} -radix decimal} {{/PE_testbench/ifmaps[10]} -radix decimal} {{/PE_testbench/ifmaps[11]} -radix decimal} {{/PE_testbench/ifmaps[12]} -radix decimal} {{/PE_testbench/ifmaps[13]} -radix decimal} {{/PE_testbench/ifmaps[14]} -radix decimal} {{/PE_testbench/ifmaps[15]} -radix decimal} {{/PE_testbench/ifmaps[16]} -radix decimal} {{/PE_testbench/ifmaps[17]} -radix decimal} {{/PE_testbench/ifmaps[18]} -radix decimal} {{/PE_testbench/ifmaps[19]} -radix decimal} {{/PE_testbench/ifmaps[20]} -radix decimal} {{/PE_testbench/ifmaps[21]} -radix decimal} {{/PE_testbench/ifmaps[22]} -radix decimal} {{/PE_testbench/ifmaps[23]} -radix decimal}} -subitemconfig {{/PE_testbench/ifmaps[0]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[1]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[2]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[3]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[4]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[5]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[6]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[7]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[8]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[9]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[10]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[11]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[12]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[13]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[14]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[15]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[16]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[17]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[18]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[19]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[20]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[21]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[22]} {-height 23 -radix decimal} {/PE_testbench/ifmaps[23]} {-height 23 -radix decimal}} /PE_testbench/ifmaps
add wave -noupdate -expand -group TestCase -radix decimal -childformat {{{/PE_testbench/psums[0]} -radix decimal} {{/PE_testbench/psums[1]} -radix decimal} {{/PE_testbench/psums[2]} -radix decimal} {{/PE_testbench/psums[3]} -radix decimal} {{/PE_testbench/psums[4]} -radix decimal} {{/PE_testbench/psums[5]} -radix decimal} {{/PE_testbench/psums[6]} -radix decimal} {{/PE_testbench/psums[7]} -radix decimal} {{/PE_testbench/psums[8]} -radix decimal} {{/PE_testbench/psums[9]} -radix decimal} {{/PE_testbench/psums[10]} -radix decimal} {{/PE_testbench/psums[11]} -radix decimal} {{/PE_testbench/psums[12]} -radix decimal} {{/PE_testbench/psums[13]} -radix decimal} {{/PE_testbench/psums[14]} -radix decimal}} -expand -subitemconfig {{/PE_testbench/psums[0]} {-height 23 -radix decimal} {/PE_testbench/psums[1]} {-height 23 -radix decimal} {/PE_testbench/psums[2]} {-height 23 -radix decimal} {/PE_testbench/psums[3]} {-height 23 -radix decimal} {/PE_testbench/psums[4]} {-height 23 -radix decimal} {/PE_testbench/psums[5]} {-height 23 -radix decimal} {/PE_testbench/psums[6]} {-height 23 -radix decimal} {/PE_testbench/psums[7]} {-height 23 -radix decimal} {/PE_testbench/psums[8]} {-height 23 -radix decimal} {/PE_testbench/psums[9]} {-height 23 -radix decimal} {/PE_testbench/psums[10]} {-height 23 -radix decimal} {/PE_testbench/psums[11]} {-height 23 -radix decimal} {/PE_testbench/psums[12]} {-height 23 -radix decimal} {/PE_testbench/psums[13]} {-height 23 -radix decimal} {/PE_testbench/psums[14]} {-height 23 -radix decimal}} /PE_testbench/psums
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {165 ns} 1} {{Cursor 2} {145 ns} 1} {{Cursor 3} {325 ns} 1} {{Cursor 4} {480 ns} 1} {{Cursor 5} {492 ns} 1} {{Cursor 6} {500 ns} 1} {{First Error} {695 ns} 1} {{Cursor 8} {926 ns} 0}
quietly wave cursor active 8
configure wave -namecolwidth 235
configure wave -valuecolwidth 149
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {45 ns} {1138 ns}
