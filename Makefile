SRC_DIRS := ./chapters
SRCS := $(shell find $(SRC_DIRS) -name '*.s')
EXECUTABLES := $(patsubst %.s,%,$(SRCS))
OBJS := $(patsubst %.s,%.o,$(SRCS))
CC := as

.PHONY: all
all: $(EXECUTABLES)
	$(EXECUTABLES)

%: %.o

%.o: %.s
	$(CC) $< -o $@

.PHONY: clean
clean: 
	rm -rf $(EXECUTABLES) $(OBJS)