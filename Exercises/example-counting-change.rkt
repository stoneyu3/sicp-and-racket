#lang racket
(define (count-change amount)
  (cc amount 5)); 5 中硬币
;各种硬币的面值，从小到大排列
;？乱序排列是否可以？
; 可以。因为算法中没有涉及“第一种”硬币的面值。
(define (first-denomination k)
  (cond ((= k 1) 1)
        ((= k 2) 50)
        ((= k 3) 10)
        ((= k 4) 25)
        ((= k 5) 5)))

(define (cc amount n)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= n 0)) 0)
        (else (+
               (cc amount (- n 1))
               (cc (- amount (first-denomination n)) n)))))