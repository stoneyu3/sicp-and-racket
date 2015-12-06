#lang racket
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next)))
    )
  (try first-guess))

;; Use fixed-point to cal sqrt
(define (avg x y)
  (/ (+ x y) 2))
(define (sqrt x)
  (fixed-point (lambda (y) (avg y (/ x y))) 1.0))