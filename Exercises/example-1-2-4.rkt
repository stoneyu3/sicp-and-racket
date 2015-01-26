#lang racket
; 求幂
; 1. 线性递归的计算过程(linear recursive process)
; 步数增长的阶theta(n)，空间增长的阶theta(n)
(define (expt-lrp b n)
  (if (= n 0)
      1
      (* b(expt-lrp b (- n 1)))))

; 2. 线性迭代的计算过程(linear iteration process)
; 步数增长的阶theta(n)，空间增长的阶theta(1)
(define (expt-iter b n prod)
  (if (= n 0)
      prod
      (expt-iter b (- n 1) (* b prod))))
(define (expt-lip b n)
  (expt-iter b n 1))

; 3. fast-expt 步数增长的阶为theta(log n)
(define (square x)
  (* x x))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))