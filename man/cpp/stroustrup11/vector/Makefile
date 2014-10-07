CC = g++
CFLAGS = -std=c++0x

.PHONY: clean cleanall

OBJS = vector.o main.o

.cpp.o:
	$(CC) $(CFLAGS) -c -o $@ $<


vector: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

clean:
	rm -rf $(OBJS)

cleanall :clean
	rm -rf vector
	
