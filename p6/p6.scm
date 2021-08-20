#lang scheme
; p6.scm
; A prototype for program 6 in Scheme
;
;
; Edit this file to add your documentation and function definitions.
; Leave the rest of this file unchanged.
;
; To run this file, you would start scheme at edoras command line prompt:
; scheme --load p6.scm, where the file is in the current directory
; and then in scheme type the load command (from the '%' prompt):
;(load "p6.scm")
;
; Defined LISTS for use with testing your functions.
; Defined LISTS for use with testing your functions.
(define list0 (list 'j 'k 'l 'm 'n 'o 'j) )
(define list1 (list 'a 'b 'c 'd 'e 'f 'g) )
(define list2 (list 's 't 'u 'v 'w 'x 'y 'z) )
(define list3 (list 'j 'k 'l 'm 'l 'k 'j) )
(define list4 (list 'n 'o 'p 'q 'q 'p 'o 'n) )
(define list5 '((a b) c (d e d) c (a b)) )
(define list6 '((h i) (j k) l (m n)) ) 
(define list7 '(f (a b) c (d e d) (b a) f) )
; The above five lines are the sort of definition you would need to add to
; this file if asked to define an ADDER function.
; Uncomment and complete the following four definitions. At least have ODDS
; so the program can be tested.

; EVENS METHOD
(define (evens lst)
     (cond
       ((list? lst)
        (cond
          ((null? lst) '())
          ((null? (cdr lst)) '())
          (else (cons (cadr lst) (evens (cddr lst))))))
       (else "USAGE: (evens {list})")))
; evens TESTS
(display "Evens Tests")(newline)(evens 5)(evens '(a b c d e f g))(evens (list 's 't 'u 'v 'w 'x 'y 'z))(evens '(f (a b) c (d e d) (b a) f))(evens '())(evens '(a))

; ODDREV METHOD
(define (oddrev lst)
     (cond
       ((list? lst) (revlist (odds lst)))
       (else "USAGE: (oddrev {list})")))
(define (odds lst)
    (cond
      ((null? lst) lst)
      ((null? (cdr lst)) lst)
      (else (cons (car lst) (odds (cddr lst))))))
(define (revlist lst)
  (if (null? lst)
     lst
     (append (revlist (cdr lst)) (list (car lst)))))
;oddrev TESTS
(display "Oddrev Tests")(newline)(oddrev 5)(oddrev '(a b c d e f g))(oddrev (list 's 't 'u 'v 'w 'x 'y 'z))(oddrev '((h i) (j k) l (m n)))(oddrev '())

; MIDDLE METHOD
(define (middle lst)
  (cond
    ((list? lst)
     (if (null? lst)
       '()
       (torthare lst (cdr lst))))
    (else "USAGE: (middle {list})")))
(define (torthare t h)
       (cond
         ((null? h)(list (car t)))
         ((null? (cdr h)) '())
         (else (torthare (cdr t) (cddr h)))))
;middle TESTS
(display "Middle Tests")(newline)(middle 5)(middle '(a b c d e f g))(middle '(s t u v w x y z))(middle '((a b) c (d e d) c (b a)))(middle '())(middle '(a))
                                            
; BOOKENDS METHOD
(define (bookends lst)
  (cond
    ((list? lst)
     (cond
       ((null? lst) #t)
       ((equal? (car lst)(findlast lst)) #t)
       (else #f)))
     (else "USAGE: (bookends {list})")))
(define (findlast lst)
  (cond
    ((null? lst) '())
    ((null? (cdr lst)) (car lst))
    (else (findlast (cdr lst)))))
  
;bookends TESTS
(display "Bookends Tests")(newline)(bookends 5)(bookends '(s t u v w x y z))(bookends '(j k l m n o j))(bookends '())(bookends '(a))(bookends '((h i) j (k l k) j (h i)))(bookends '((a b) c (d e d) c (b a)))(bookends '((y z) y))