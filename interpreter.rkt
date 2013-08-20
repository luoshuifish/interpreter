;;一个scheme写的解释器

;;name:yuyongjiang
;;school:Buaa
;;Email:yuyongjianghit@163.com

(define (atom? exp)
  (not (pair? exp)))

(define (eprogn exps env)
  (if (pair? exps)
      (if (pair? (cdr exps))
          (begin (evaluate (car exps) env)
                 (eprogn (cdr exps env))))
      empty-begin))

(define empty-begin 813)


;(define (evlis exps env)
;  (if (pair? exps)
;      (cons (evaluate (car exps) env)
;            (evlis (cdr exps) env))
;      '()))

(define (evlis exps env)
  (if (pair? exps)
      (cons (evaluate (car exps) env)
            (evlis (cdr exps) env))
      '()))

(define (evaluate exp env)
  (if (atom? exp)
      (cond ((symbol? exp) (lookup exp env))
            ((or (number? e) (string? e) (char? e) (boolean? e) (vector? e)) e)
            (else (display "wrong")
                  ))
      (case (car exp)
        ((quote) (cadr exp))
        ((if) (if (evaluate (cadr exp) env)
                  (evaluate (caddr exp) env)
                  (evaluate (cadddr exp) env))
              )
        ((set!) (update! (cadr exp) env (evaluate (caddr exp) env)))
        ((begin) (eprogn (edr e) env)) 
        ((lambda) (make-function (cadr e) (cddr e) env)) 
        (else (invoke (evaluate (cadr exp) env)
                      (evlis (cdr exp) env))))))


      