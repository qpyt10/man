#
# 12/12/12
#
# http://www.gnu.org/software/make/manual/make.html
#

CC = g++

INC = 

CFLAGS =-g 
#CFLAGS =  -std=gnu++0x
#CFLAGS = -Wall -pedantic

SRCS := $(wildcard *.cpp)
OBJS := $(patsubst %.cpp,%.o,$(wildcard *.cpp))
EXES := $(patsubst %.cpp,%.x,$(wildcard *.cpp))

.SUFFIXES: .cpp .o .x

%.o: %.cpp
	$(CC) $(CFLAGS) -c -o $@ $< $(INC)
%.x: %.cpp
	$(CC) $(CFLAGS) -o $@ $< $(INC)

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
