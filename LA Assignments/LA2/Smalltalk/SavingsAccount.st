"AMARA TARIQ"
"SAVINGSACCOUNT.ST"

Account subclass: SavingsAccount[

  |interest|
  
  
  
  SavingsAccount class[
    new:n customer: c balance: b[
      ^super new init: n customer:c balance: b
    ]
  ]
  
  init: n customer: c balance: b[
    number:= n.
    customer:= c.
    balance:= b.
    interest:= 0
  ]

  accrue: rate[
    balance:= balance+(balance*rate).
    interest:= interest+(interest*rate).
  ]
]


"TESTING TIMEMMEE"
"
|account| account:= SavingsAccount new: '01003' customer: 'killme' balance: 200.00.
(account asString) printNl.
account accrue: 0.2.
(account asString) printNl.
|customer| customer:= Customer new:'AMARA'.
(customer asString) printNl.
|secondAccount| secondAccount:=SavingsAccount new:'01004' customer: customer balance: 300.00.
(secondAccount asString) printNl.
secondAccount accrue: 0.4.
(secondAccount asString) printNl.
"
