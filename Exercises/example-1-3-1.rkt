#lang racket
(define (sum-int a b)
  (if (> a b)
      0
      (+ a (sum-int (+ a 1) b))))

(define (cube a) (* a a a))
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
         (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))
#|
(define (<name> a b)
 (if (> a b)
    0
    (+ (<term> a)
       (<name> (<next> a) b))))
|#