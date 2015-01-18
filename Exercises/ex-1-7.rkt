#lang racket/load
(load "example-1-1-7.rkt")
(printf "~a\n" (sqrt-newton 0.001)); should be=> 0.03162277660168379
;=> 0.04124542607499115
;(printf "~a\n" (sqrt-newton 900000000000000000000000000000000000000000000000000000000000000000000000000000000000))
; 死循环


(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (good-enough? guess prev-guess)
  (< (abs (- 1 (/ guess prev-guess))) 0.001))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
    guess
    (sqrt-iter (improve guess x) guess x)))
(define (sqrt-newton x)
  (sqrt-iter 1.0 0.9 x))
;(sqrt-newton 2)
(printf "~a\n" (sqrt-newton 0.001)); should be=> 0.03162277660168379
(printf "~a\n" (sqrt-newton 900000000000000000000000000000000000000000000000000000000000000000000000000000000000));