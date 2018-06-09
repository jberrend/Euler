;;;; euler.lisp

(in-package #:euler)

(defun main ()
  (time (problem9)))

(defun problem9 ()
  (pythagoreanTriplet 498 499 500))

;;; 0.23 seconds!
(defun pythagoreanTriplet (a b c)
  (cond
    ((and (= (+ (square a) (square b))
             (square c))
          (= (+ a b c)
             1000))
     (* a b c))
    ((= c 0) 'ERROR)
    ((= b 0) (pythagoreanTriplet (- c 3) (- c 2) (- c 1)))
    ((= a 0) (pythagoreanTriplet (- b 2) (- b 1) c))
    (T       (pythagoreanTriplet (- a 1) b c))))

(defun square (x)
  (expt x 2))
