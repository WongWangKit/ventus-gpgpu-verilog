
.PHONY: dc clean
all: dc

dc:
	mkdir -p ../log; \
	mkdir -p ../report; \
	mkdir -p ../netlist; \
	dc_shell -f ../script/dc_noPAD.tcl

clean:
	rm -rf *.pvl *.syn *.mr *.pvk *.log
	rm -rf ../report/*
	rm -rf ../netlist/*
	rm -rf ../log/*