;Amara Tariq
;CS354 Programming Languages
;LA1 - Scheme
;take an atom (list) and duplicate the elements by the number of times that the user specifies in the input

;notes
;car evals first element of a list
;cdr evals the rest of the list

(define (repeat sourceR countR)
  (if (> countR 1) 
    (if (pair? sourceR)
      (cons (car sourceR) (repeat sourceR (- countR 1)))
      sourceR
    )
    sourceR
  )
)

;source is the list 
;count is the amount neet to be repeated/copied
(define (super-duper source count) 
        (if (or (number? source)(null? source))
          source
          )
         (if (> count 1)
           (if (list? source)
             (if (pair? source)
               (repeat (cons (super-duper (car source) count) (super-duper (cdr source) count)) count) source
             )
             source
           )
           source
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
    
