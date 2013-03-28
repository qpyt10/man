#
# 12/12/12
#
# http://www.gnu.org/software/make/manual/make.html
#

CC = gcc

CFLAGS = 
#CFLAGS = -Wall -pedantic

SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,%.o,$(wildcard *.c))
EXES := $(patsubst %.c,%.x,$(wildcard *.c))


.SUFFIXES: .c .o .x

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<
%.x: %.c
	$(CC) $(CFLAGS) -o $@ $<

#dummy: $(OBJS) $(EXES)
dummy: $(EXES)

exe: $(EXES)
obj: $(OBJS)

help:
	@echo "\tmake          \t $(CC) $(CFLAGS) $(SRCS)"
	@echo "\tmake exe      \t $(EXES)"
	@echo "\tmake obj      \t $(OBJS)"
	@echo "\tmake help     \t "
	@echo "\tmake clean    \t rm -rf $(OBJS)"
	@echo "\tmake cleanall \t rm -rf $(EXES)"

clean:
	rm -rf $(OBJS) $(EXES)
cleanall: clean
	rm -rf $(EXES)
