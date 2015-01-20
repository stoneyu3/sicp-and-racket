#lang racket
(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

(fact 6)
; 720
(define (fact-iter prod counter n)
  (if (> counter n)
      prod
      (fact-iter (* prod counter) (+ counter 1) n)))
(define (fact-2 n)
  (fact-iter 1 1 n))
(fact-2 6)