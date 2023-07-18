include makefile.inc

.DEFAULT_GOAL := debug

all:debug release

.PHONY:clean
debug:OUT_DIR=.
release:OUT_DIR=.

PRJ=app
debug:BIN_NAME=$(PRJ)d
release:BIN_NAME=$(PRJ)

# add debug flags
debug:ASFLAGS += -g -F stabs 

debug:CFLAGS += -g
release:CFLAGS += -O2

# CFLAGS+= $(shell pkg-config --cflags lua5.3)

CFLAGS+= -I./include

# ldconfig -p
# LDLIBS+= $(shell pkg-config --libs lua5.3)

debug:LIBPATH+= -L$(OUT_DIR)
release:LIBPATH+= -L$(OUT_DIR)

LDFLAGS+= $(LIBPATH) $(LDLIBS)

SRCS=$(wildcard *.cpp)
OBJS=$(patsubst %.cpp,%.o,$(SRCS))

debug: $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(OUT_DIR)/$(BIN_NAME)

release: $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(OUT_DIR)/$(BIN_NAME)

%.o: %.cpp
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

