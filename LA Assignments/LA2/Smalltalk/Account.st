"AMARA TARIQ"
"ACCOUNT.ST"

"notes:"
"good website for referencing:"
"http://rigaux.org/language-study/syntax-across-languages-per-language/Smalltalk.html"
"comments with quotations"
" ^ returns a value"
"end statements with . "


Object subclass: Account[

  |number|
  |customer|
  |balance|
  
  "this is the constructor"
  Account class[
    "creating new instances of all the variables"
    new:n customer:c balance:b[ 
      ^self new init: n customer:c balance:b 
    ]
  ]
  
  init: n customer:c balance:b[
    ^self subclassResponsibility
  ]
  
  balance[
   ^balance
  ]
  
  deposit: amount[
    balance:=balance+amount.
  ]

  withdraw: amount[
    balance:=balance-amount.
  ]
  
  accrue: rate[
    ^self subclassResponsibility
  ]
  
  "toString"
  asString[
    ^(number asString, ':', customer asString, ':', balance asString)
  ]

]
