#lang racket
(define (inc a)
  (+ a 1))
(define (dec a)
  (- a 1))
(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))
; (plus 4 5)
#|
(inc (plus 3 5))
(inc (inc (plus 2 5)))
...
(inc (inc ...(plus 0 5)))...
(inc (inc ...(inc 5)))...
(inc (inc ...6)...
...
9
因此可见这个方法描述的是一个递归计算过程。
|#
(define (plus-2 a b)
  (if (= a 0)
      b
      (plus-2 (dec a) (inc b))))
; (plus-2 4 5)
#|
(plus-2 3 6)
(plus-2 2 7)
(plus-2 1 8)
(plus-2 0 9)
9
由此可见这个方法描述的是一个迭代计算过程。
|#