
(define-type env-record type value)
(define (make-env) '())
(define (push-env name type val env)
  (if (member type '(macro var))
      (cons (cons name (make-env-record type val)) env)
      (error (string-append (symbol->string name)
                            " name not in environment"))))
(define (push-env-macro name val env)
  (push-env name 'macro val env))
(define (push-env-var name env)
  (push-env name 'var '() env))

(define (get-env-macro name env)
  (let ((record (assoc name env)))
    (and (pair? record)
         (env-record? (cdr record))
         (eq? 'macro (env-record-type (cdr record)))
         (env-record-value (cdr record)))))

