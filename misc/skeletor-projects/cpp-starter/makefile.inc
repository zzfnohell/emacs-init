CC	= g++
CFLAGS= -c -Wall -D _GNU_SOURCE -fPIC -std=c++20

LD	= g++
LDFLAGS=
LDLIBS= -lstdc++
LIBPATH= -L./

AR	= ar
ARFLAGS	=

AS=nasm
ASFLAGS= -f elf

SWIG=swig

RANLIB	= ranlib
RM	= rm -rvf
ECHO	= echo
MKDIR = mkdir -p
SHELL	= /bin/sh

.SILENT :
