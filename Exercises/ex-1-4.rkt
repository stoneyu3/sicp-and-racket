#lang racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; (if (> b 0) + -)
; 若 b > 0，if 语句的值为 +，反之则为 -，
; 也就是说 if 语句的求值得到的是一个过程
; a-plus-abs-b 则根据 b 的正负求值为 (+ a b) 或 (- a b)
