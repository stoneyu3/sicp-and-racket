#lang racket
(define (p) (p))
(define (test x y)
 (if (= x 0) 0 y))

(test 0 (p))
;若是应用序，则会先对 (p) 求值，程序将陷入死循环；
;若是正常序，则会先对 if 求值，test 最终结果为 0 ，(p) 不会被执行。
