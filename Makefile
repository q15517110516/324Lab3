adder8bit.o: adder8bit.vhd
	vhdl adder8bit.vhd
ALU.o: ALU.vhd
	vhdl ALU.vhd
CTRL_UNIT.o: CTRL_UNIT.vhd
	vhdl CTRL_UNIT.vhd
DISPLAY.o: DISPLAY.vhd
	vhdl DISPLAY.vhd
EXT.o: EXT.vhd
	vhdl EXT.vhd
fa.o: fa.vhd
	vhdl fa.vhd
IR.o: IR.vhd
	vhdl IR.vhd
MUX.o: MUX.vhd
	vhdl MUX.vhd
RF.o: RF.vhd
	vhdl RF.vhd
Tb_Top.o: Tb_Top.vhd
	vhdl Tb_Top.vhd
TOP.o: TOP.vhd
	vhdl TOP.vhd

simulation: TOP.o Tb_Top.o RF.o MUX.o IR.o fa.o EXT.o DISPLAY.o CTRL_UNIT.o ALU.o adder8bit.o
	sim Tb_Top