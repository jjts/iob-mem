# optional VCD
ifeq ($(VCD),1)
	DEFINE += -DVCD
endif

# simulator flags
VSRC += *.v
VLOG := iverilog -W all -g2005-sv $(DEFINE)
CMPLR := $(VLOG) $(VSRC)

# hex files generation for tb
GEN_HEX1 := echo "!IObundle 2020!" | od -A n -t x1 > tb1.hex
GEN_HEX2 := echo "10 9 8 7 5 4 32" | od -A n -t x1 > tb2.hex
