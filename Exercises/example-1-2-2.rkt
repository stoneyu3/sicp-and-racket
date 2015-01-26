#lang racket
; 树形递归
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))
; 迭代计算过程
(define (fib-iter a b n)
  (if (= n 0)
      b
      (fib-iter (+ a b) a (- n 1))))

(define (fib-2 n)
  (fib-iter 1 0 n))