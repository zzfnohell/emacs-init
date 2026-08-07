include makefile.inc

all: debug release

PRJ=__PROJECT-NAME__

.PHONY: clean debug release

debug: OUT_DIR=./build/Debug
release: OUT_DIR=./build/Release

debug: CFLAGS += -g
release: CFLAGS += -O2

CFLAGS += -I./include

debug: LIBPATH += -L$(OUT_DIR)
release: LIBPATH += -L$(OUT_DIR)
LDFLAGS += $(LIBPATH) $(LDLIBS)

SRCS = $(wildcard *.c)
OBJS = $(patsubst %.c,%.o,$(SRCS))

debug: BIN_NAME=$(PRJ)d
release: BIN_NAME=$(PRJ)

debug: $(OBJS)
	$(MKDIR) $(OUT_DIR)
	$(LD) $(OBJS) $(LDFLAGS) -o $(OUT_DIR)/$(BIN_NAME)

release: $(OBJS)
	$(MKDIR) $(OUT_DIR)
	$(LD) $(OBJS) $(LDFLAGS) -o $(OUT_DIR)/$(BIN_NAME)

%.o: %.c
	$(CC) -c -fPIC $(CFLAGS) -o $@ $<

clean:
	$(RM) *.o
	$(RM) *.od
	$(RM) *.exe
	$(RM) *.dll
	$(RM) *.a
	$(RM) *.so
	$(RM) *.log
	$(RM) build
