# Makefile lists top level folders and tests if there's a Makefile in them.
# If there is, it runs 'make' in that directory; if not, it runs the compiler.

include mem.mk

all: $(MEM_DIR)

$(MEM_DIR):
	if test -f $(MEM_DIR)/Makefile; then make -C $(MEM_DIR); fi;

clean:
	@find . -name "*.vcd" -type f -delete
	@find . -name "a.out" -type f -delete

.PHONY: all $(MEM_DIR) clean
