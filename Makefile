
F90=gfortran
PATHLIB=/usr/local/lib/
FFLAGS=-std=legacy

all: lib

SRC=$(wildcard *.F)
OBJ=$(patsubst %.F, %.o, $(SRC))

lib: $(OBJ)
	ar rcs libminuit.a $^
%.o: %.F
	$(F90) -c $(FFLAGS) $<

install: all
	cp libminuit.a  $(PATHLIB)

clean: 
	rm *.o 
	rm *.mod
	rm *.a
