#lang racket

; commentario

(+)

(+ 1 2 3)

; formas de imprimir

"hello world"
(print "print hello \n")
(display "\t\n display hello\n")

(define a 7)

(define S +)
(S 4 5)

(define c (+ 7 8))
c

(display "\t\n operaciones hello\n")
(- 10 5 1)
(* 10 2 2)
(/ 20 2 2)

; definicion de funciones
;(define (id params) body)

(define (suma a b)
    (+ a b)
)
(suma 1 298)

(define (positivo a) (>= a 0))
(positivo 23)

(positive? 5) ;positive? ya esta definido

(define (igual a b) (= a b))
(igual 8 (suma 3 5))
(equal? 2 2) ;predefinido

; if
; (if test-exp then-exp else-exp)

(define (factorial n)
    (if (= n 0)
        1
        (* n (factorial (- n 1) ) )
    )
)
(factorial 2)

; numero divisble entre 2 o 3 o 4


;;; (define (div2 n)
;;;     (cond
;;;             ((remainder n 2) (disp("2")))
;;;             (else disp("no"))
;;;     )
;;; )
;;; div2(10)

(cond
    ((= 0 (remainder 10 2)) (display "divisible entre 2\n"))
    (else display "no\n")
)

(define (square n) 
    (expt n 2)
)

(define (half n) 
    (/ n 2)
)

(define (operacion n)
    (+ (square n) (half n))
)
(operacion 6)

(display "\nTarea\n")
;; factorial
(define (fact n)

    (if (> n 0)
        (* n (fact(- n 1)))
        1
    )
)
(fact 6)

;; fibonacci
(define (fib n)

    (if (> n 2)
        (+ (fib (- n 1)) (fib (- n 2)))
        1
    )
)
(fib 6)

;; potencias
(define (potencias n p)

    (if (> p 1)
        (* n (potencias n (- p 1)))
        n
    )
)
(potencias 2 6)

;; sumatoria de 0 a n
(define (sumatoria n)
    (if (> n 0)
        (+ n (sumatoria(- n 1)))
        0
    )
)
(sumatoria 10)

;; despliega n veces “hola”
(define (hola n)
  (if (<= n 0)
      '()
      (cons "Hola" (hola (- n 1))))
)
(hola 3)

;; despliega N a 1
(define (Na1 n)
  (if (<= n 0)
      '()
      (cons n (Na1 (- n 1))))
)
(Na1 4)

;; despliega 1 a N
(define (1aN n)
  (if (<= n 0)
      '()
      (append (1aN (- n 1)) (list n)))
)
(1aN 7)

;; Función que dadas tres coordenadas distintas, diga si son un triangulo isósceles, equilátero o escaleno
(define (triangIdent a b c)
  (cond
    [(= a b c) (display "equilatero")]
    [(= a b) (display "isósceles")]
    [(= b c) (display "isósceles")]
    [(= a c) (display "isósceles")]
    [else (display "escaleno")]
  )
)
(triangIdent 3 2 4)

