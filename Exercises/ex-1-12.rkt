#lang racket
; 限制条件 j <= i
(define (pascal i j)
  (if (or (= j 1) (= j i))
      1
      (+ (pascal (- i 1) (- j 1))
         (pascal (- i 1) j))))