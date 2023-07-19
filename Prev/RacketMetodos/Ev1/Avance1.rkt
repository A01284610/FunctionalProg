#lang racket

; Lee un archivo de texto y lo guarda en una lista
(define archivo "input.txt")

(define in (open-input-file archivo))
(define codigo (string-split (string-join (sequence->list (in-lines in)) " ") " "))
(close-input-port in)

; Imprime la lista
(for-each display codigo)
(newline)

; Crea un archivo .css
(define sty (open-output-file "style.css"))
(display "body {background-color: rgb(14, 11, 35);}" sty)
(newline sty)
(display ".int {color: purple;}" sty)
(newline sty)
(display ".float {color: red;}" sty)
(newline sty)
(display ".keyword {color: yellow;}" sty)
(newline sty)
(display ".comment {color: green;}" sty)
(newline sty)
(display ".otro {color: white;}" sty)
(close-output-port sty)

; Crea un archivo .html 
(define out (open-output-file "output.html"))
(display "<!DOCTYPE html>" out)
(newline out)
(newline out)
(display "<html>" out)
(newline out)
(newline out)
(display "<head>" out)
(newline out)
(display "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />" out)
(newline out)
(display "<title>Resaltador de sintaxis</title>" out)
(newline out)
(display "</head>" out)
(newline out)
(newline out)
(display "<body>" out)
(newline out)
(close-output-port out)

; Verifica el contenido de acuerdo sintaxis de un lenguaje 
; Expresiones regulares (regex)
(define (esInt? elemento)
  (regexp-match? #px"^-?\\d+$" elemento))

(define (esFloat? elemento)
  (regexp-match? #px"^-?\\d+\\.\\d+$" elemento))

(define (esCommentario? elemento)
  (cond
    [(regexp-match? #px"//"  elemento) #t]
    [else #f]
  )
)

(define (esKeyword? elemento)
  (cond
    [(regexp-match? #px"(int|float|string|char)" elemento)
     #t]
    [else #f]
  )
)

; Verificación de sintaxis y escritura en archivo .html
(define (escribir elemento) 
  (define escritura (open-output-file "output.html" #:exists 'append))
  (cond
    [(esInt? elemento)
     (begin
       (display "<text class='int'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura)
      )
    ]
    
    [(esFloat? elemento)
     (begin
       (display "<text class='float'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura)
      )
    ]

    [(esKeyword? elemento)
      (begin
        (display "<text class='keyword'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura)
        )
    ]

    [(esCommentario? elemento)
      (begin
        (display "<text class='comment'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura)
        )
    ]

    [else
      (display "<text class='otro'>" escritura)
      (display elemento escritura)
      (display "</text>" escritura)
      (newline escritura)
    ]
  )
  (close-output-port escritura)
)

; Escritura de lista
(define (escribir-lista lista)
  (for-each escribir lista)
)
(define ejemplo-lista '(123 "Hola" 3.14 "Mundo" 42))
;(escribir-lista ejemplo-lista)
(escribir-lista codigo)

; Escritura final del archivo .html
(define escritura-final (open-output-file "output.html" #:exists 'append))
(display "</body>" escritura-final)
(newline escritura-final)
(newline escritura-final)
(display "</html>" escritura-final)
(close-output-port escritura-final)