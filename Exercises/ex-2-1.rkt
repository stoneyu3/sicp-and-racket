#lang racket
(define (make-rat a b)
  (if (< (* a b) 0)
    (cons (- (abs a)) (abs b))
    (cons (abs a) (abs b))
  )
)
(define (numer n)(car n))
(define (denom n)(cdr n))

(define (print-rat n)
  (display (numer n))
  (display "/")
  (display (denom n))
  (newline)
)

(print-rat (make-rat -1 2))
