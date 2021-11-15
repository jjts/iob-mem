# generate .vcd file by default
VCD ?=1

# optional ram
USE_RAM ?=1

#
# Paths
#

MEM_HW_DIR=$(MEM_DIR)/hardware
MEM_SW_DIR=$(MEM_DIR)/software
MEM_PYTHON_DIR=$(SW_DIR)/python

# Default module to simulate
MODULE_DIR ?= $(MEM_HW_DIR)/ram/sp_ram

#
# Defines
#

defmacro:=-D
incdir:=-I

ifeq ($(USE_RAM),1)
DEFINE+=$(defmacro)USE_RAM
endif

ifeq ($(VCD),1)
DEFINE+=$(defmacro)VCD
endif

#
# Sources
#

include $(MODULE_DIR)/hardware.mk

# testbench
VSRC+=$(wildcard $(MODULE_DIR)/*_tb.v)

# hex files generation for tb
# generate .hex file from string, checks from ram if string is valid
HEX_FILES:= tb1.hex tb2.hex
GEN_HEX1:=echo "!IObundle 2020!" | od -A n -t x1 > tb1.hex
GEN_HEX2:=echo "10 9 8 7 5 4 32" | od -A n -t x1 > tb2.hex

#
# Simulator flags
#

VLOG=iverilog -W all -g2005-sv $(INCLUDE) $(DEFINE)

#
# Wave viewer
#

GTKW=gtkwave -a
WSRC=waves.gtkw *.vcd