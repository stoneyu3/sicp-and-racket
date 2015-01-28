#lang racket
(define (rr a b)
  (display "remainder called\n")
  (remainder a b))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (rr a b))))

; 应用序：先计算参数后带入，因而在调用(gcd b (remainder a b))的时候
; 先计算remainder，后带入gcd，共执行4次。


; 正常序：先展开后带入计算，每一次b != 0时调用(gcd b (remainder a b))
; 其中下一层调用的a来自于上一层调用的(remainder a b)
; 而所有的remainder要等全部展开至b=0为止，比应用序多得多。
