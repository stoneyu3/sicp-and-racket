#lang racket

(define (reverse l)
  (if (null? l)
    '()
    (append (reverse (cdr l)) (list (car l)))))

(reverse (list (list 1 2) (list 3 4)))

(define (deep-reverse l)
  (if (null? l)
    '()
    (append (deep-reverse (cdr l))
      (list
        (if (pair? (car l))
          (deep-reverse (car l))
          (car l))))))

(deep-reverse (list (list 1 2) (list 3 4)))
