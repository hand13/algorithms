(define filter
  (lambda (x f)
    (if (null? x)
        '()
        (if (f (car x))
            (cons (car x) (filter (cdr x) f))
            (filter (cdr x) f)))))
(define rtail
  (lambda (x)
    (if (or (null? x) (null? (cdr x)))
        '()
        (cons (car x) (rtail (cdr x))))))
(define last
  (lambda (x)
    (if (null? x)
        '()
        (if (null? (cdr x))
            (car x)
            (last (cdr x))))))
(define quicksort
  (lambda (x)
    (if (or (null? x) (null? (cdr x)))
        x
        (append
         (quicksort (filter (rtail x) (lambda (k) (<= k (last x)))))
         (cons
          (last x)
          (quicksort (filter (rtail x) (lambda (k) (> k (last x))))))))))
