#lang racket

(define (my-for-each proc items)
  (if (null? items)
    (newline)
    (or (and (proc (car items)) #f)
    (my-for-each proc (cdr items)))))

;; test
(my-for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
