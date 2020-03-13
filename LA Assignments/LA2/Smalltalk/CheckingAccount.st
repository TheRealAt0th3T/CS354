"AMARATARIQ"
"CHECKINGACCOUNT.ST"

"NOTES:"

Account subclass: CheckingAccount[

  init: n customer: c balance: b[
    number:= n.
    customer:= c.
    balance:= b.
  ]
  
  accrue: rate[]

]



"TESTING TIMEEEEEE"
"
|account| account:= CheckingAccount new: '01001' customer: 'uhhhh' balance: 100.00.
(account asString) printNl.
|c| c:=Customer new:'HAHA'.
(c asString) printNl.
|secondAccount| secondAccount:= CheckingAccount new: '01002' customer: c asString balance: 200.00.
(secondAccount asString) printNl.
secondAccount accrue: 0.3.
(secondAccount asString) printNl.
"
