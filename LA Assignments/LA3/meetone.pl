#!/bin/gprolog --consult-file

:- include('data.pl').

math(time(_,_,am),time(_,_,pm)).

math(time(T1H,_,AP),time(T2H,_,AP)) :-
  T1H<T2H.
  
math(time(TH,T1M,AP),time(TH,T2M,AP)) :-
  T1M=<T2M.

timein(slot(startHour, startMin), slot(endHour, endMin)) :-
  math(startHour, startMin), math(endHour, endMin).

meetone(Person, meetSlot) :-
  free(Person, slot), timein(meetSlot, slot).
   
main :- findall(Person,
		meetone(Person,slot(time(8,30,am),time(8,45,am))),
		People),
	write(People), nl, halt.

:- initialization(main).
