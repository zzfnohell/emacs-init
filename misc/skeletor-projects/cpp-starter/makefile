include makefile.inc

.DEFAULT_GOAL := debug

all: debug release

.PHONY: clean debug release

PRJ=__PROJECT-NAME__
debug: OUT_DIR=.
release: OUT_DIR=.

debug: BIN_NAME=$(PRJ)d
release: BIN_NAME=$(PRJ)

debug: CFLAGS += -g
release: CFLAGS += -O2

CFLAGS += -I./include

debug: LIBPATH += -L$(OUT_DIR)
release: LIBPATH += -L$(OUT_DIR)

LDFLAGS += $(LIBPATH) $(LDLIBS)

SRCS = $(wildcard *.cpp)
OBJS = $(patsubst %.cpp,%.o,$(SRCS))

debug: $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(OUT_DIR)/$(BIN_NAME)

release: $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(OUT_DIR)/$(BIN_NAME)

%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) *.o
	$(RM) *.od
	$(RM) *.exe
	$(RM) *.dll
	$(RM) *.a
	$(RM) *.so
	$(RM) *.log
	$(RM) build
