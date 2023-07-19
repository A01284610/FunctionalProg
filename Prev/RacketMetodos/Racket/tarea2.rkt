#lang racket ;Alejandro Lizárraga Vizcarra A01284610

(display "\nTarea2 Alejandro Lizárraga Vizcarra A01284610\n")
;;; ;; factorial
;;; (display "\n=Factorial=\n")
;;; (define (fact n)

;;;     (if (> n 0)
;;;         (* n (fact(- n 1)))
;;;         1
;;;     )
;;; )
;;; (fact 5)

;;; ;; fibonacci
;;; (display "\n=Fibonacci=\n")
;;; (define (fib n)

;;;     (if (> n 2)
;;;         (+ (fib (- n 1)) (fib (- n 2)))
;;;         1
;;;     )
;;; )
;;; (fib 6)

;;; ;; potencias
;;; (display "\n=Potencias=\n")
;;; (define (potencias n p)

;;;     (if (> p 1)
;;;         (* n (potencias n (- p 1)))
;;;         n
;;;     )
;;; )
;;; (potencias 2 6)

;;; (display "\n=Sumatoria 0 a 'n'=\n")
;;; ;; sumatoria de 0 a n
;;; (define (sumatoria n)
;;;     (if (> n 0)
;;;         (+ n (sumatoria(- n 1)))
;;;         0
;;;     )
;;; )
;;; (sumatoria 10)

;;; ;; despliega n veces “hola”
;;; (display "\n='n' veces \"hola\"=\n")
;;; (define (hola n)
;;;   (if (<= n 0)
;;;       '()
;;;       (cons "hola" (hola (- n 1))))
;;; )
;;; (hola 3)

;;; ;; despliega N a 1
;;; (display "\n=Enlistar de 'n' a 1=\n")
;;; (define (Na1 n)
;;;   (if (<= n 0)
;;;       '()
;;;       (cons n (Na1 (- n 1))))
;;; )
;;; (Na1 4)

;;; ;; despliega 1 a N
;;; (display "\n=Enlistar de 1 a 'n'=\n")
;;; (define (1aN n)
;;;   (if (<= n 0)
;;;       '()
;;;       (append (1aN (- n 1)) (list n)))
;;; )
;;; (1aN 7)

(display "\n='n' veces \"hola\" v2=\n")
(define (hola2 n)
  (cond 
        [(> n 1)
            (display "hola ")
            (hola2(- n 1))]
        [else (display "hola\n")]
  )
)
(hola2 6)

(display "\n=Enlistar de 'n' a 1 v2=\n")
(define (Na1v2 n)
  (cond 
        [(> n 1)
            (display n)
            (display " ")
            (Na1v2(- n 1))]
        [else
            (display n)
            (display "\n")]
  )
)
(Na1v2 6)

(display "\n=Enlistar de 1 a 'n' v2=\n")
(define (1aNv2 n)
  (cond 
        [(= n 1)
            (display n)]
        [else
            (1aNv2(- n 1))
            (display " ")
            (display n)]
  )
)
(1aNv2 9)

;; Función que dadas tres coordenadas distintas
;; diga si son un triangulo isósceles, equilátero o escaleno
(display "\n\n=Identificador de triangulos=\n")
(define (triangIdent a b c)
  (cond
    [(= (/ 1000 (round (* 1000 a))) (/ 1000 (round (* 1000 b))) (/ 1000 (round (* 1000 c))))
        (display "equilatero\n")]
    [(= (/ 1000 (round (* 1000 a))) (/ 1000 (round (* 1000 b)))) (display "isósceles\n")]
    [(= (/ 1000 (round (* 1000 b))) (/ 1000 (round (* 1000 c)))) (display "isósceles\n")]
    [(= (/ 1000 (round (* 1000 a))) (/ 1000 (round (* 1000 c)))) (display "isósceles\n")]
    [else (display "escaleno\n")]
  )
)
;; se redondea a 3 decimales debido a la dicultad
;; con decimales para tener un triangulo equilatero en 2 dimensiones

(define (distancia x1 y1 x2 y2)
    (
        sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1)))
    )
)

(define (triangulo x1 y1 x2 y2 x3 y3)
    (
        triangIdent (distancia x1 y1 x2 y2) (distancia x2 y2 x3 y3) (distancia x1 y1 x3 y3)
    )
)

(triangulo -2 0 2 0 0 (* 2 (sqrt 3)))
(triangulo 0 0 4 0 2 5)
(triangulo 0 0 9 3 8 1)


(display "\n\n")
