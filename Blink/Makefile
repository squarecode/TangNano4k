SOURCES       := $(shell find . -name '*.v' -not -name '*_tb.v')

PWD = $(shell pwd)
YOSYS     = yosys
NEXTPNR   = nextpnr-gowin
GOWINPACK = gowin_pack

all: top.fs

top.fs: top.pack
	$(GOWINPACK) -d GW1NSR-LV4CQN48PC7/I6 -o $@ $^

top.pack: top.json
	$(NEXTPNR) --json top.json --write top.pack --device GW1NSR-LV4CQN48PC7/I6 --cst tangnano4k.cst

top.json:
	$(YOSYS) -p "synth_gowin -json top.json -top top" $(SOURCES)

prog: top.fs
	openFPGALoader -b tangnano4k $^

clean:
	rm -f *.json *.fs *.pack

.PHONY: %-tangnano-prog clean all
