#lang racket
#|
 | (define (sqrt-iter guess x)
 |  (if (good-enough? guess x)
 |      guess
 |      (sqrt-iter (improve guess x) x)))
 |#
(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt-newton x)
  (sqrt-iter 1.0 x))
;(sqrt-newton 1)


; 替换成 new-if 程序将陷入死循环。
; 由于新定义的 new-if 并非 if 一样的特殊形式，而只是一个普通的过程，
; new-if 的参数会先进行求值后替换入定义，因此当递归调用的 else-clause 无法求值
; 即陷入死循环。
