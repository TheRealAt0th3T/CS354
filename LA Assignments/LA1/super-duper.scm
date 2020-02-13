;Amara Tariq
;CS354
;LA1 - Scheme

;notes
;car evals first element of a list
;cdr evals the rest of the list

;source is the list 
;count is the amount neet to be repeated/copied
(define (super-duper source count)
    (cond
        ;checking if source is null -- if so return it
        ((null? source) source)
     
        ;is it a number? if so return the number 
        ;based of examples -- numbers get returned regaurdless of count number
        ((number? source) source)
     
        ;is it a list?? repeat count times and return it
        ;check if more than one element exists, if not, make a list that repeats count times for that first element
        ((null? (cdr source)) (make-list count (car source)))
     
        ;otherwise that means its a much longer list with multiple elements
        ;repeat first element and then cons it to the next repeat
        (else (cons (make-list count (super-duper (car source) count)) super-duper(cdr source count)))
     )
  )

;testing to see if same output as provided examples in the assignment pdf
(define testing-suite
    (test ()
        (display "Number based examples \n ")
        (display "input: 123 1 \n expected output: 123 \n my output: ")
        (display (super-duper 123 1))
        (display " \n ")
        (display "input: 123 2 \n expected output: 123 \n my output: ")
        (display (super-duper 123 2))
        (display " \n ")

        (display "Empty List based examples \n ")
        (display "input: '() 1 \n expected output: () \n my output: ")
        (display (super-duper '() 1))
        (display " \n ")
        (display "input: '() 2 \n expected output: () \n my output: ")
        (display (super-duper '() 2))
        (display " \n ")

        (display "Character based examples \n ")
        (display "input: '(x) 1 \n expected output: (x) \n my output: ")
        (display (super-duper '(x) 1))
        (display " \n ")
        (display "input: '(x) 2 \n expected output: (x x) \n my output: ")
        (display (super-duper '(x) 2))
        (display " \n ")
        (display "input: '(x y) 1 \n expected output: (x y) \n my output: ")
        (display (super-duper '(x y) 1))
        (display " \n ")
        (display "input: '(x y) 2 \n expected output: (x x y y) \n my output: ")
        (display (super-duper '(x y) 2))
        (display " \n ")
        (display "input: '((a b) y) 3 \n expected output: ((a a a b b b) (a a a b b b) (a a a b b b) y y y) \n my output: ")
        (display (super-duper '((a b) y) 3))
        (display " \n ")
    )
)
