calc.o: calc.s
	as -g  calc.s -o calc.o

calc_basic: and.o or.o sum.o calc.o data/basic_cmds.o upper.o
	ld -g  calc.o and.o or.o sum.o upper.o data/basic_cmds.o -o calc_basic

and.o: and.s
	as -g and.s -o and.o

or.o: or.s
	as -g or.s -o or.o

sum.o: sum.s
	as -g sum.s -o sum.o

basics_cmds.o: data/basics_cmds.s
	as -g data/basics_cmds.s -o data/basics_cmds.o

calc_simpleone: data/simpleone_cmds.o and.o or.o sum.o calc.o upper.o
	ld -g calc.o and.o or.o sum.o upper.o data/simpleone_cmds.o -o calc_simpleone

upper.o: upper.s
	as -g upper.s -o upper.o

calc_upperonly: and.o or.o sum.o upper.o calc.o data/upperonly_cmds.o
	ld -g and.o or.o sum.o upper.o calc.o data/upperonly_cmds.o -o calc_upperonly

calc_easy: and.o or.o sum.o calc.o upper.o data/easy_cmds.o
	ld -g and.o or.o sum.o upper.o calc.o data/easy_cmds.o -o calc_easy

calc_basicwithupper: and.o or.o sum.o upper.o calc.o data/basicwithupper_cmds.o 
	ld -g and.o or.o sum.o upper.o calc.o data/basicwithupper_cmds.o -o calc_basicwithupper

calc_simplerandom: and.o or.o sum.o calc.o upper.o data/simplerandom_cmds.o
	ld -g and.o or.o sum.o upper.o calc.o data/simplerandom_cmds.o -o calc_simplerandom
