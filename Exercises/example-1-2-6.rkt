#lang racket
(define (square a) (* a a))
(define (divides? test n)
  (= (remainder n test) 0))
(define (find-divisor n test-div)
  (cond ((> (square test-div) n) n)
        ((divides? test-div n) test-div)
        (else (find-divisor n (+ test-div 1)))))
(define (smallest-divisor n) (find-divisor n 2))
(define (prime? n)
  (= (smallest-divisor n) n))

; Fermat test
(define (expmod base exp m)
  (cond ((= 0 exp) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) 
                    m))
        ;基于：(xy)%b = (x%b * y%b) % b
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times); 如果n是素数，即便times再大也一定返回#t
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))