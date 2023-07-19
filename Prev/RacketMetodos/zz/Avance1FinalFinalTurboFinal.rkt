#lang racket

; Lee un archivo de texto y lo guarda en una lista
(define archivo "input.txt")

(define in (open-input-file archivo))
(define codigo (string-split (string-join (sequence->list (in-lines in)) " <br> ") " "))

(close-input-port in)

; Crea un archivo .css
(define sty (open-output-file "style.css"))
(displayln "body {background-color: rgb(14, 11, 35);}" sty)
(displayln ".num {color: rgb(255, 176, 116);}" sty)
(displayln ".string {color: rgb(154, 255, 113);}" sty)
(displayln ".keyword {color: rgb(205, 111, 255);}" sty)
(displayln ".comment {color: rgb(123, 123, 123);}" sty)
(displayln ".loop {color: pink;}" sty)
(displayln ".otro {color: white;}" sty)
(displayln ".extra {color: rgb(100, 252, 255);}" sty)
(displayln ".extra2 {color: rgb(86, 100, 255);}" sty)
(displayln ".funcion {color: rgb(25, 44, 255);}" sty)
(displayln ".variable {color: rgb(255, 63, 130);}" sty)
(close-output-port sty)

; Crea un archivo .html 
(define out (open-output-file "output.html"))
(displayln "<!DOCTYPE html>" out)
(newline out)
(displayln "<html>" out)
(newline out)
(displayln "<head>" out)
(displayln "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />" out)
(displayln "<title>Resaltador de sintaxis</title>" out)
(displayln "</head>" out)
(newline out)
(displayln "<body>" out)
(close-output-port out)

; Crea un archivo respuestas .html 
(define out2 (open-output-file "zconsole.html"))
(displayln "<!DOCTYPE html>" out2)
(newline out2)
(displayln "<html>" out2)
(newline out2)
(displayln "<head>" out2)
(displayln "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />" out2)
(displayln "<title>Consola de resaltador</title>" out2)
(displayln "</head>" out2)
(newline out2)
(displayln "<body>" out2)
(close-output-port out2)



; Verifica el contenido de acuerdo a la sintaxis de un lenguaje 
; Expresiones regulares (regex)
(define (esBR? elemento)
  (regexp-match? #px"<br>" elemento))

(define (esInt? elemento)
  (regexp-match? #px"^-?\\d+$" elemento))

(define (esFloat? elemento)
  (regexp-match? #px"^-?\\d+\\.\\d+$" elemento))

(define (esNumero? elemento)
  (or (esInt? elemento) (esFloat? elemento)))

(define (esString? elemento)
  (regexp-match? #px"\"[^\"]*\"" elemento))

(define (esCommentario? elemento)
  (regexp-match? #px"//.*" elemento))

(define (esKeyword? elemento)
  (regexp-match? #px"(int|float|string|char)" elemento))

(define (esLoop? elemento)
  (regexp-match? #px"(for|while)" elemento))

(define (esExtra? elemento)
  (regexp-match? #px"(;|,|=|\\(|\\)|\\+\\+|#)" elemento))

(define (esExtra2? elemento)
  (regexp-match? #px"(<<|endl|\\{|\\})" elemento))

(define (esFuncion? elemento) 
  (regexp-match? #px"\\(" elemento))

(define (esVariable? elemento)
  (regexp-match? #px"(=|return|,|\\))" elemento))

(define (esVariable2? elemento)
  (regexp-match? #rx"^[a-zA-Z]$" elemento))

(define (esSuma? elemento)
  (regexp-match? #px"\\+" elemento))

(define (esResta? elemento)
  (regexp-match? #px"\\-" elemento))

(define (esMult? elemento)
  (regexp-match? #px"\\*" elemento))

(define (esDiv? elemento)
  (regexp-match? #px"\\/" elemento))

(define (esPow? elemento)
  (regexp-match? #px"\\^" elemento))

(define (esReminder? elemento)
  (regexp-match? #px"\\%" elemento))

(define (esStringStart? elemento)
  (regexp-match? #px"^\".*" elemento))

(define (esStringEnd? elemento)
  (regexp-match? #px".*\"$" elemento))


; Verificación de sintaxis y escritura en archivo .html
(define (escribir elemento escritura)
  (cond
    [(esBR? elemento)
     (begin
       (display "<br>" escritura)
       (newline escritura))]
    [(esCommentario? elemento)
     (begin
       (display "<text class='comment'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esNumero? elemento)
     (begin
       (display "<text class='num'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esString? elemento)
      (begin
        (display "<text class='string'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esLoop? elemento)
      (begin
        (display "<text class='loop'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esExtra? elemento)
      (begin
        (display "<text class='extra'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esExtra2? elemento)
      (begin
        (display "<text class='extra2'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esFuncion? elemento)
      (begin
        (display "<text class='funcion'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esVariable2? elemento)
      (begin
        (display "<text class='variable'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [else
     (display "<text class='otro'>" escritura)
     (display elemento escritura)
     (display "</text>" escritura)
     (newline escritura)])
)

(define (marca-comment lista escritura)
  (let loop ((lst lista))
    (cond
      [(esBR? (car lst)) lst]
      [else
        ( begin
          (display "<text class='comment'>" escritura)
          (display (car lst) escritura)
          (display "</text>" escritura)
          (newline escritura)
          (loop (cdr lst))
        )
      ]
    )
  )
)

(define (marca-string lista escritura)
  (let loop ((lst lista))
    (cond
      [(esStringEnd? (car lst))
          (display "<text class='string'>" escritura)
          (display (car lst) escritura)
          (display "</text>" escritura)
          (newline escritura)
          (cdr lst)
      ]
      [else
        ( begin
          (display "<text class='string'>" escritura)
          (display (car lst) escritura)
          (display "</text>" escritura)
          (newline escritura)
          (loop (cdr lst))
        )
      ]
    )
  )
)


; Llamada a la función escribir, recorre la lista y verifica la sintaxis
(define (escribir-lista lista)
  (define escritura (open-output-file "output.html" #:exists 'append))
  (define escritura2 (open-output-file "zconsole.html" #:exists 'append))
  (let loop ((lst lista))
    (cond
      [(null? lst) (close-output-port escritura)]
      [(esCommentario? (car lst))
        (loop (marca-comment lst escritura))
      ]
      [(esStringStart? (car lst))
        (loop (marca-string lst escritura))
      ]
      [(esKeyword? (car lst))
          (begin
            (display "<text class='keyword'>" escritura)
            (display (car lst) escritura)
            (display "</text>" escritura)
            (newline escritura))
          (cond
            [(esFuncion? (caddr lst))
                (begin
                    (display "<text class='funcion'>" escritura)
                    (display (cadr lst) escritura)
                    (display "</text>" escritura)
                    (newline escritura)
                    (loop (cddr lst)))]
            [(esVariable? (caddr lst))
                (begin
                    (display "<text class='variable'>" escritura)
                    (display (cadr lst) escritura)
                    (display "</text>" escritura)
                    (newline escritura)
                    (loop (cddr lst)))]
            [else
                (loop (cdr lst))])]
      [(and (esSuma? (car lst)) (esNumero? (cadr lst)))
        (escribir (car lst) escritura) (escribir (cadr lst) escritura)
        (escribir (caddr lst) escritura) (escribir (cadddr lst) escritura)
        (display "<text class='otro'>" escritura2)
        (display (number->string (+ (string->number (cadr lst)) (string->number (caddr lst)))) escritura2)
        (display "</text>" escritura2)
        (newline escritura2)
        (display "<br>" escritura2)
        (newline escritura2)
        
        (loop (cddddr lst))]
      [(and (esResta? (car lst)) (esNumero? (cadr lst)))
        (escribir (car lst) escritura) (escribir (cadr lst) escritura)
        (escribir (caddr lst) escritura) (escribir (cadddr lst) escritura)
        (display "<text class='otro'>" escritura2)
        (display (number->string (- (string->number (cadr lst)) (string->number (caddr lst)))) escritura2)
        (display "</text>" escritura2)
        (newline escritura2)
        (display "<br>" escritura2)
        (newline escritura2)

        (loop (cddddr lst))]
      [(and (esMult? (car lst)) (esNumero? (cadr lst)))
        (escribir (car lst) escritura) (escribir (cadr lst) escritura)
        (escribir (caddr lst) escritura) (escribir (cadddr lst) escritura)
        (display "<text class='otro'>" escritura2)
        (display (number->string (* (string->number (cadr lst)) (string->number (caddr lst)))) escritura2)
        (display "</text>" escritura2)
        (newline escritura2)
        (display "<br>" escritura2)
        (newline escritura2)

        (loop (cddddr lst))]
      [(and (esDiv? (car lst)) (esNumero? (cadr lst)))
        (escribir (car lst) escritura) (escribir (cadr lst) escritura)
        (escribir (caddr lst) escritura) (escribir (cadddr lst) escritura)
        (display "<text class='otro'>" escritura2)
        (display (number->string (/ (string->number (cadr lst)) (string->number (caddr lst)))) escritura2)
        (display "</text>" escritura2)
        (newline escritura2)
        (display "<br>" escritura2)
        (newline escritura2)

        (loop (cddddr lst))]
      [(and (esPow? (car lst)) (esNumero? (cadr lst)))
        (escribir (car lst) escritura) (escribir (cadr lst) escritura)
        (escribir (caddr lst) escritura) (escribir (cadddr lst) escritura)
        (display "<text class='otro'>" escritura2)
        (display (number->string (expt (string->number (cadr lst)) (string->number (caddr lst)))) escritura2)
        (display "</text>" escritura2)
        (newline escritura2)
        (display "<br>" escritura2)
        (newline escritura2)
        
        (loop (cddddr lst))]
      [(and (esReminder? (car lst)) (esNumero? (cadr lst)))
        (escribir (car lst) escritura) (escribir (cadr lst) escritura)
        (escribir (caddr lst) escritura) (escribir (cadddr lst) escritura)
        (display "<text class='otro'>" escritura2)
        (display (number->string (remainder (string->number (cadr lst)) (string->number (caddr lst)))) escritura2)
        (display "</text>" escritura2)
        (newline escritura2)
        (display "<br>" escritura2)
        (newline escritura2)

        (loop (cddddr lst))]
      [else
        (begin
            (escribir (car lst) escritura)
            (loop (cdr lst)))]))
)

(escribir-lista codigo)

; Escritura final del archivo .html
(define escritura-final (open-output-file "output.html" #:exists 'append))
(display "</body>" escritura-final)
(newline escritura-final)
(newline escritura-final)
(display "</html>" escritura-final)
(close-output-port escritura-final)

; Escritura final del consola .html

(define escritura-final2 (open-output-file "zconsole.html" #:exists 'append))
(display "</body>" escritura-final2)
(newline escritura-final2)
(newline escritura-final2)
(display "</html>" escritura-final2)
(close-output-port escritura-final2)