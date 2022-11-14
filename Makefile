SRC_DIRS := ./chapters
SRCS := $(shell find $(SRC_DIRS) -name '*.s')
EXECUTABLES := $(patsubst %.s,%,$(SRCS))
OBJS := $(patsubst %.s,%.o,$(SRCS))
COMPILER := as
LINKER := ld

.PHONY: all
all: $(EXECUTABLES)

$(EXECUTABLES): $(OBJS)
	$(LD) $< -o $@

%.o: %.s
	$(COMPILER) $< -o $@

.PHONY: clean
clean: 
	rm -rf $(EXECUTABLES) $(OBJS)

.PHONY: lint
lint: 
	asmfmt -w $(SRCS)
