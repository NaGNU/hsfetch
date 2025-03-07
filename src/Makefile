FC = gfortran
FLAGS = -O0 -Wall
OBJ = parse_release.o main.o

rfetch: $(OBJ)
	$(FC) -o ../build/rfetch $(OBJ)

%.o: %.f90
	$(FC) $(FLAGS) -c $<

clean:
	rm -f *.o *.mod rfetch
