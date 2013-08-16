;;一个scheme写的解释器

;;name:yuyongjiang
;;school:Buaa
;;Email:yuyongjianghit@163.com

(define (atom? exp)
  (not (pair? exp)))

(define (evaluate exp env)
  (if (atom? exp)
      (cond ((symbol? exp) (lookup exp env))
            ((or (number? e) (string? e) (char? e) (boolean? e) (vector? e)) e)
            (else (display "wrong" e)
                  ))
      (case (car exp)
        ...
        (else ...)))
      )