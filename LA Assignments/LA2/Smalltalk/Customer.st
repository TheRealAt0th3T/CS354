"AMARA TARIQ"
"CUSTOMER.ST"

"NOTES:"

Object subclass: Customer[

  |name|
  
  Customer class[
    new: n[ ^self new init: n]
  ]

  init: n[ 
    name:= n
  ]
  
  asString[
    ^name
  ]
]


"TESTING TIMMMEEEE"
"
|customer| customer:= Customer new: 'amara'.
(customer) printNl.
(customer asString) printNl.
"
