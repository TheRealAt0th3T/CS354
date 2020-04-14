#!/bin/gprolog --consult-file

:- include('data.pl').

meetone(Person, slot(time(StartHour, StartMinute, StartAP), time(EndHour, EndMinute, EndAP))) :- 
	free(Person, slot(time(StartHourSlot, StartMinuteSlot, StartAPSlot), time(EndHourSlot, EndMinuteSlot, EndAPSlot))),

%-----------MATH------------
	(StartAP = pm -> StartMeetTime is (StartHour * 100) + (StartMinute) + 1200; 
		StartMeetTime is (StartHour * 100) + (StartMinute)),
	
	(EndAP = pm -> EndMeetTime is (EndHour * 100) + (EndMinute) + 1200;
		EndMeetTime is (EndHour * 100) + (EndMinute)),
		
	(StartAPSlot = pm -> StartSlotTime is (StartHourSlot * 100) + (StartMinuteSlot) + 1200;
		StartSlotTime is (StartHourSlot * 100) + (StartMinuteSlot)),

	(EndAPSlot = pm -> EndSlotTime is (EndHourSlot * 100) + (EndMinuteSlot) + 1200;
		EndSlotTime is (EndHourSlot * 100) + (EndMinuteSlot)),
		
	(StartSlotTime =< StartMeetTime), (EndSlotTime >= EndMeetTime).
	
main :- findall(Person,
		meetone(Person,slot(time(8,30,am),time(8,45,am))),
		People),
	write(People), nl, halt.

:- initialization(main).
