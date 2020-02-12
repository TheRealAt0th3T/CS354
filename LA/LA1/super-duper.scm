;Amara Tariq
;CS354
;LA1 - Scheme

(define (super-duper source count)
    (cond
        ;checking if null and if so - return empty list
        ((null? source) '() )



(define testing-suit
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
