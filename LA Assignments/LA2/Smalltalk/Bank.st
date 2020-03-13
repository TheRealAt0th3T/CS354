"AMARA TARIQ"
"BANK.ST"

"NOTES:"
"https://www.gnu.org/software/smalltalk/manual/html_node/Sets.html"
"printNl (lowercase l as in line) for printing new line"
"https://www.gnu.org/software/smalltalk/manual-base/html_node/Character-class_002dconstants.html"

Object subclass: Bank[
  
  |accounts|
  
  Bank class[
    new [ ^super new init ] 
  ]

  init[
    accounts:= Set new
  ]

  add: account[
    accounts add: account
  ]
  
  accrue: rate[
    accounts do: [:account | account accrue: rate]
  ]

  asString[
    |r|
    r:= ''.
    accounts do: [:account | r:= r, account asString, Character nl asString].
    ^r
  ]
]

"main section"
|bank| bank:= Bank new.
|c| c:= Customer new: 'AMARATARIQ'.

bank add: (CheckingAccount new: '01001' customer: c balance: 100.00).
bank add: (SavingsAccount new: '01002' customer: c balance: 200.00).
bank accrue: 0.02.
bank asString print
