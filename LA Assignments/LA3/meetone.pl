#!/bin/gprolog --consult-file

:- include('data.pl').

meetone(Person, slot(time(startHour, startMinute, startZone), time(endHour, endMinute, endZone))) :-
free(Person, slot(time(sH, sM, sZ), time(eH, eM, eZ))), 
  sH*60+sM =< endHour*60+endMinute, eH *60+eM >= startHour*60+startMinute.
   
main :- findall(Person,
		meetone(Person,slot(time(8,30,am),time(8,45,am))),
		People),
	write(People), nl, halt.

:- initialization(main).
