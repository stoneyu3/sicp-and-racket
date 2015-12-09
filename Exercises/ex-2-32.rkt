#lang racket

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (e) (append (list (car s)) e)) rest)))))


;; test
(subsets (list 1 2 3))
