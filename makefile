# Makefile for Nasm assembly projects

TARGET  = hello

FILES   = $(wildcard *.asm)
OBJS    = $(FILES:.asm=.o)

# tools used ----------------------------------
AS      = nasm
CPP     = gcc
RM      = rm -f

AFLAGS  = -f elf64

# build targets follow-------------------------
all:	$(TARGET)

$(TARGET):  $(OBJS)
	$(CPP) -o $@ $^

# implicit targets follow ---------------------
%.o:	%.asm
	$(AS) $(AFLAGS) $< -o $@

# utility targets -----------------------------
clean:
	rm -f $(OBJS) $(TARGET)
