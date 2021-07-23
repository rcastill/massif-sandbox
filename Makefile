CFLAGS=\
	   -Wall\
	   -Werror\
	   -g

transgressor: transgressor.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

massif: transgressor
	valgrind --tool=massif --massif-out-file=transgressor.massif ./transgressor
	massif-visualizer transgressor.massif

clean:
	rm -f *.o transgressor *.massif
