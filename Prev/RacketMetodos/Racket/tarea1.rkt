#lang racket ;Alejandro Lizárraga Vizcarra A01284610

(display "\t\n presentación\n")
(/ (+ 20 10) 2)
(+ (/ 20 2) 10)
(/ (* (+ 10 20) (* 10 2)) (expt 10 3))

(display "\t\n fahrenheit-to-celsius\n")
(define (fahrenheit-to-celsius f)
    (/ (* 5 (- f 32)) 9)
)
(fahrenheit-to-celsius 212.0)
(fahrenheit-to-celsius 32.0)
(fahrenheit-to-celsius -40.0)

(display "\t\n sign\n")
(define (sign n)
    (if (= n 0)
        0
        (if (< n 0)
            -1
            1
        )
    )
)
(sign -5)
(sign 10)
(sign 0)

(display "\t\n roots\n")
(define (roots a b c)
    (/ (+ (- b) (sqrt (- (expt b 2) (* 4 a c)))) (* 2 a))
)
(roots 2 4 2)
(roots 1 0 0)
(roots 4 5 1)

;'if' y 'cond' ambos son condicionales
;Con el condicional de if se:
;   revisa por una condicion
;   hay una expresion then por si la condicion se cumple
;   y hay una expresion else por si la condicion no se cumple
;Con el condicional de cond se pueden tener condiciones mas complejas
;Aqui se pueden revisar por varias diferentes condiciones
;   revisa por una condicion
;       si se cumple se lleva a una expresion
;   se puede revisar por mas condiciones
;       si se cumple se lleva a diferentes expresion
;   se puede llegar a la expresion else si ninguna condicion se cumple 
;Esta diferencia se pudiera comparar a la de un 'if' y un 'switch'
;pero no es exatamente igual