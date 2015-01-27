#lang racket
#|
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))
|#

(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (fast* a b)
  (cond ((= b 0) 0)
        ((even? b) (fast* (double a) (halve b)))
        (else (+ a (fast* a (- b 1))))))

; ex-1-18
(define (fast-*-iter prod a b)
  (cond ((= b 0) prod)
        ;((= b 1) prod)
        ((even? b) (fast-*-iter prod (double a) (halve b)))
        (else (fast-*-iter (+ prod a) a (- b 1)))))
(define (fast*iter a b)
  (fast-*-iter 0 a b))