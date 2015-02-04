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

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (display "")))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
(define runtime current-inexact-milliseconds)

(define (iter-test start end)
  (timed-prime-test start)
  (if (< start end)
      (iter-test (+ start 2) end)
      (display "")))
(define (search-for-primes start end)
  (if (even? start)
      (iter-test (+ start 1) end)
      (iter-test start end)))