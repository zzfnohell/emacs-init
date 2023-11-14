include makefile.inc

all:Debug Release

PRJ=oanda
EXPORTS=$(PRJ).def
LIB_NAME=$(PRJ)
STATIC_LIB_NAME=lib$(LIB_NAME).a
DYNAMIC_LIB_NAME=lib$(LIB_NAME).so
LIB_TARGET_NAME=$(DYNAMIC_LIB_NAME)

.PHONY:clean
Debug:OUT_DIR=./build/Debug
Release:OUT_DIR=./build/Release

# add debug flags
Debug:ASFLAGS += -g -F stabs 

Debug:CFLAGS += -g
Release:CFLAGS += -O2

CFLAGS+= $(shell pkg-config --cflags lua5.3)

CFLAGS+= -I./include

# ldconfig -p
LDLIBS+= $(shell pkg-config --libs lua5.3)

Debug:LIBPATH+= -L$(OUT_DIR)
Release:LIBPATH+= -L$(OUT_DIR)
LDFLAGS+= $(LIBPATH) $(LDLIBS)


SRCS=$(wildcard *.c)
OBJS=$(patsubst %.c,%.o,$(SRCS))

Debug:BIN_NAME=oandad
Release:BIN_NAME=oanda

DEBUG_OUT_DIR:
	$(MKDIR) $(OUT_DIR)

Debug: $(OBJS) | DEBUG_OUT_DIR
	$(LD) $(OBJS) $(LDFLAGS) -o $(OUT_DIR)/$(BIN_NAME)

RELEASE_OUT_DIR:
	$(MKDIR) $(OUT_DIR)

Release: $(OBJS) | RELEASE_OUT_DIR
	$(LD) $(OBJS) $(LDFLAGS) -o $(OUT_DIR)/$(BIN_NAME)

%.o: %.c
	$(CC) -c -fPIC $(CFLAGS) -o $@ $<


# $(TARGET_DIR)/%.o:%.i
# 	$(SWIG) -lua -o $(basename $<).c $<
# 	$(CC) -o $@ -c $(CFLAGS) $(basename $<).c

# $(TARGET_DIR)/%.o:%.c
# 	$(CC) -o $@ -c $(CFLAGS) $<

# $(TARGET_DIR)%.o:%.asm
# 	$(AS) $(ASFLAGS) -o $@ $<

clean:
	$(RM) *.o
	$(RM) *.od
	$(RM) *.exe
	$(RM) *.dll
	$(RM) *.a
	$(RM) *.so
	$(RM) *.log
	$(RM) build

