;Amara Tariq
;CS354 Programming Languages
;LA1 - Scheme
;take an atom (list) and duplicate the elements by the number of times that the user specifies in the input

;notes
;car evals first element of a list
;cdr evals the rest of the list

;function to be able to recursively deal with repeating elements
(define (repeat sourceR countR)
  (cond
    ;checking if count is greater than one 
    ((> countR 1) 
      (cond
        ;check if pair -- if so move down list repeating and consing 
        ;count down the countR in order to access entire list/pair
        ((pair? sourceR) (cons (car sourceR) (repeat sourceR (- countR 1))) sourceR)
      )
    sourceR
    )
  )
)


;source is the list 
;count is the amount neet to be repeated/copied
(define (super-duper source count) 
        ;check if number or null -- if so just simply return the source
        (if (or (number? source)(null? source))
          source
          )
         ;check count to see if list/pair or just a single element 
         ;if single element -- just repeat it as necessary and return source
         (if (> count 1)
           ;if greater than one -- tis a list or pair
           (if (list? source)
             ;if pair -- call function to be repeating the elements and recontructing list
             (if (pair? source)
               (repeat (cons (super-duper (car source) count) (super-duper (cdr source) count)) count) source
             )
             source
           )
           ;source
          )
)
     

;testing to see if same output as provided examples in the assignment pdf

        (display "\n input: 123 1 \n expected output: 123 \n my output: ")
        (display (super-duper 123 1))
        (display " \n \n ")
        (display "input: 123 2 \n expected output: 123 \n my output: ")
        (display (super-duper 123 2))
        (display " \n \n ")

        (display "input: '() 1 \n expected output: () \n my output: ")
        (display (super-duper '() 1))
        (display " \n \n ")
        (display "input: '() 2 \n expected output: () \n my output: ")
        (display (super-duper '() 2))
        (display " \n \n ")

        (display "input: '(x) 1 \n expected output: (x) \n my output: ")
        (display (super-duper '(x) 1))
        (display " \n \n ")
        (display "input: '(x) 2 \n expected output: (x x) \n my output: ")
        (display (super-duper '(x) 2))
        (display " \n \n ")
        (display "input: '(x y) 1 \n expected output: (x y) \n my output: ")
        (display (super-duper '(x y) 1))
        (display " \n \n ")
        (display "input: '(x y) 2 \n expected output: (x x y y) \n my output: ")
        (display (super-duper '(x y) 2))
        (display " \n \n ")
        (display "input: '((a b) y) 3 \n expected output: ((a a a b b b) (a a a b b b) (a a a b b b) y y y) \n my output: ")
        (display (super-duper '((a b) y) 3))
        (display " \n \n ")
    
