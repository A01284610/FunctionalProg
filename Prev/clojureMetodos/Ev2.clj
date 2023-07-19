;; clj -M Ev2.clj

(ns Ev2
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(defn read-file [file-path]
  (slurp file-path))

(defn read-file [file-path]
  (slurp file-path))

(defn split-text [text]
  (str/split text #"\s+"))

(defn conv [file-path]
  (let [content (read-file file-path)
        lines (str/split-lines content)
        joined-text (str/join " <br> " lines)
        words (split-text joined-text)]
    words))

; t_list es la lista de elementos en el .txt
; file -> input.txt ---

; Imprimir lo que tiene la lista
(defn printList [myList]
  (if (not (nil? (first myList)))
    (do
      (println (first myList))
      (recur (rest myList)))))


; Se crean los archivos base (2 html, 1 css)
; style.css

;css->"style.css" ---
(defn create-css-file []
  (with-open [file (io/writer "style.css")]
    (.write file "")))
(create-css-file)

(defn css_a [text]
  (with-open [file (io/writer "style.css" :append true)]
    (.write file (str text))))

; output.html

;output -> "output.html"

(defn create-html-file [f1]
  (with-open [file (io/writer f1)]
    (.write file "")))


(defn html_a [text f1]
  (with-open [file (io/writer f1 :append true)]
    (.write file (str text))))

; zconsole.html
(defn create-html2-file [f2]
  (with-open [file (io/writer f2)]
    (.write file "")))


(defn html2_a [text f2]
  (with-open [file (io/writer f2 :append true)]
    (.write file (str text))))

; Escribir en el archivo css los colores
(css_a "body {background-color: rgb(14, 11, 35);} \n")
(css_a ".num {color: rgb(255, 176, 116);} \n")
(css_a ".string {color: rgb(154, 255, 113);} \n")
(css_a ".keyword {color: rgb(205, 111, 255);} \n")
(css_a ".comment {color: rgb(123, 123, 123);} \n")
(css_a ".palabraClave {color: rgb(0, 136, 105);} \n")
(css_a ".loop {color: pink;} \n")
(css_a ".caracter {color: rgb(100, 252, 255);} \n")
(css_a ".caracter2 {color: rgb(86, 100, 255);} \n")
(css_a ".funcion {color: rgb(25, 44, 255);} \n")
(css_a ".variable {color: rgb(255, 63, 130);} \n")
(css_a ".operacion {color: rgb(237, 255, 118);} \n")
(css_a ".otro {color: white;}")

; Empezar formato del archivo output.html
(defn append_inicial [f1 f2]
  (html_a "<!DOCTYPE html> \n" f1)
  (html_a "<html> \n" f1)
  (html_a "<head> \n" f1)
  (html_a "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\"/> \n" f1)
  (html_a "<title>Resaltador de sintaxis</title> \n" f1)
  (html_a "</head> \n" f1)
  (html_a "<body> \n" f1)

; Empezar formato del archivo zconsole.html
  (html2_a "<!DOCTYPE html> \n" f2)
  (html2_a "<html> \n" f2)
  (html2_a "<head> \n" f2)
  (html2_a "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" /> \n" f2)
  (html2_a "<title>Consola</title> \n" f2)
  (html2_a "</head> \n" f2)
  (html2_a "<body> \n" f2))

; Evaluar expreciones regulares
(defn esBR? [elemento]
  (re-find #"<br>" elemento))

(defn esInt? [elemento]
  (re-find #"^-?\d+$" elemento))

(defn esFloat? [elemento]
  (re-find #"^-?\d+\.\d+$" elemento))

(defn esNumero? [elemento]
  (or (esInt? elemento) (esFloat? elemento)))

(defn esString? [elemento]
  (re-find #"(?i)\"[^\"]*\"" elemento))

(defn esKeyword? [elemento]
  (re-find #"(?i)(int|float|string|char)" elemento))

(defn esComentario? [elemento]
  (re-find #"(?i)//.*" elemento))

(defn esPalabraClave? [elemento]
  (re-find #"(?i)(return|cout|endl|using)" elemento))

(defn esLoop? [elemento]
  (re-find #"(?i)(for|while)" elemento))

(defn esCaracter? [elemento]
  (re-find #"(;|,|=|\(|\)|\+\+|#)" elemento))

(defn esCaracter2? [elemento]
  (re-find #"(<<|>>|\{|\})" elemento))

(defn esFuncion? [elemento]
  (re-find #"\(" elemento))

(defn esVariable? [elemento]
  (re-find #"(=|return|,|\))" elemento))

(defn esVariable2? [elemento]
  (re-find #"^[a-zA-Z]$" elemento))

(defn esSuma? [elemento]
  (re-find #"\+" elemento))

(defn esResta? [elemento]
  (re-find #"\-" elemento))

(defn esMult? [elemento]
  (re-find #"\*" elemento))

(defn esDiv? [elemento]
  (re-find #"\/" elemento))

(defn esPow? [elemento]
  (re-find #"\^" elemento))

(defn esReminder? [elemento]
  (re-find #"\%" elemento))

(defn esOperacion? [elemento]
  (or (esSuma? elemento)
      (esResta? elemento)
      (esMult? elemento)
      (esDiv? elemento)
      (esPow? elemento)
      (esReminder? elemento)))

(defn esStringStart? [elemento]
  (re-find #"^\".*" elemento))

(defn esStringEnd? [elemento]
  (re-find #".*\"$" elemento))

; Verificación de sintaxis y escritura en archivo .html
(defn procesar-elemento [elemento f1]
  (cond
    (esBR? elemento)
    (do
      (html_a "<br> \n" f1))
    (esComentario? elemento)
    (do
      (html_a "<text class='comment'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esPalabraClave? elemento)
    (do
      (html_a "<text class='palabraClave'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esNumero? elemento)
    (do
      (html_a "<text class='num'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esString? elemento)
    (do
      (html_a "<text class='string'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esLoop? elemento)
    (do
      (html_a "<text class='loop'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esCaracter? elemento)
    (do
      (html_a "<text class='caracter'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esCaracter2? elemento)
    (do
      (html_a "<text class='caracter2'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esFuncion? elemento)
    (do
      (html_a "<text class='funcion'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esVariable2? elemento)
    (do
      (html_a "<text class='variable'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    (esOperacion? elemento)
    (do
      (html_a "<text class='operacion'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))
    :else
    (do
      (html_a "<text class='otro'>" f1)
      (html_a elemento f1)
      (html_a "</text> \n" f1))))

; Verificación de longitud de comentario
(defn marca-comment [lista f1]
  (if (empty? lista)
    lista
    (if (esBR? (first lista))
      lista
      (do
        (html_a (str "<text class='comment'>") f1)
        (html_a (str (first lista)) f1)
        (html_a (str "</text> \n") f1)
        (marca-comment (rest lista) f1)))))

; Verificación de longitud de string
(defn marca-string [lista f1]
  (if (empty? lista)
    lista
    (if (esStringEnd? (first lista))
      (do
        (html_a "<text class='string'>" f1)
        (html_a (first lista) f1)
        (html_a "</text> \n" f1)
        (rest lista))
      (do
        (html_a "<text class='string'>" f1)
        (html_a (first lista) f1)
        (html_a "</text> \n" f1)
        (marca-string (rest lista) f1)))))

; Llamada a la función procesar-elemento, recorre la lista, verifica la sintaxis, y realiza operaciones
(defn throughList [myList f1 f2]
  (if (not (nil? (first myList)))
    (do
      (cond
        (esComentario? (first myList))
        (do
          (let [newList (marca-comment myList f1)]
            (throughList newList f1 f2)))
        (esStringStart? (first myList))
        (do
          (let [newList2 (marca-string myList f1)]
            (throughList newList2 f1 f2)))
        (esKeyword? (first myList))
        (do
          (html_a "<text class='keyword'>" f1)
          (html_a (first myList) f1)
          (html_a "</text> \n" f1)
          (cond
            (esFuncion? (nth myList 2))
            (do
              (html_a "<text class='funcion'>" f1)
              (html_a (nth myList 1) f1)
              (html_a "</text> \n" f1)
              (throughList (drop 2 myList) f1 f2))
            (esVariable? (nth myList 2))
            (do
              (html_a "<text class='variable'>" f1)
              (html_a (nth myList 1) f1)
              (html_a "</text>" f1)
              (throughList (drop 2 myList) f1 f2))
            :else
            (throughList (rest myList) f1 f2)))
        (and (esSuma? (first myList)) (esNumero? (second myList)))
        (do
          (procesar-elemento (first myList) f1)
          (procesar-elemento (second myList) f1)
          (procesar-elemento (nth myList 2) f1)
          (procesar-elemento (nth myList 3) f1)
          (html2_a "<text class='otro'>" f2)
          (html2_a (str (+ (read-string (second myList)) (read-string (nth myList 2)))) f2)
          (html2_a "</text> \n" f2)
          (html2_a "<br> \n" f2)
          (throughList (nthnext myList 4) f1 f2))
        (and (esResta? (first myList)) (esNumero? (second myList)))
        (do
          (procesar-elemento (first myList) f1)
          (procesar-elemento (second myList) f1)
          (procesar-elemento (nth myList 2) f1)
          (procesar-elemento (nth myList 3) f1)
          (html2_a "<text class='otro'>" f2)
          (html2_a (str (- (read-string (second myList)) (read-string (nth myList 2)))) f2)
          (html2_a "</text> \n" f2)
          (html2_a "<br> \n" f2)
          (throughList (nthnext myList 4) f1 f2))
        (and (esMult? (first myList)) (esNumero? (second myList)))
        (do
          (procesar-elemento (first myList) f1)
          (procesar-elemento (second myList) f1)
          (procesar-elemento (nth myList 2) f1)
          (procesar-elemento (nth myList 3) f1)
          (html2_a "<text class='otro'>" f2)
          (html2_a (str (* (read-string (second myList)) (read-string (nth myList 2)))) f2)
          (html2_a "</text> \n" f2)
          (html2_a "<br> \n" f2)
          (throughList (nthnext myList 4) f1 f2))
        (and (esDiv? (first myList)) (esNumero? (second myList)))
        (do
          (procesar-elemento (first myList) f1)
          (procesar-elemento (second myList) f1)
          (procesar-elemento (nth myList 2) f1)
          (procesar-elemento (nth myList 3) f1)
          (html2_a "<text class='otro'>" f2)
          (html2_a (str (/ (read-string (second myList)) (read-string (nth myList 2)))) f2)
          (html2_a "</text> \n" f2)
          (html2_a "<br> \n" f2)
          (throughList (nthnext myList 4) f1 f2))
        (and (esReminder? (first myList)) (esNumero? (second myList)))
        (do
          (procesar-elemento (first myList) f1)
          (procesar-elemento (second myList) f1)
          (procesar-elemento (nth myList 2) f1)
          (procesar-elemento (nth myList 3) f1)
          (html2_a "<text class='otro'>" f2)
          (html2_a (str (rem (read-string (second myList)) (read-string (nth myList 2)))) f2)
          (html2_a "</text> \n" f2)
          (html2_a "<br> \n" f2)
          (throughList (nthnext myList 4) f1 f2))
        (and (esPow? (first myList)) (esNumero? (second myList)))
        (do
          (procesar-elemento (first myList) f1)
          (procesar-elemento (second myList) f1)
          (procesar-elemento (nth myList 2) f1)
          (procesar-elemento (nth myList 3) f1)
          (html2_a "<text class='otro'>" f2)
          (html2_a (str (Math/pow (read-string (second myList)) (read-string (nth myList 2)))) f2)
          (html2_a "</text> \n" f2)
          (html2_a "<br> \n" f2)
          (throughList (nthnext myList 4) f1 f2))
        :else
        (do
          (procesar-elemento (first myList) f1)
          (throughList (rest myList) f1 f2))))))



;escribe en los archivos correspondientes






(defn lomein [input output console]
  ;(printList (conv input))
  ;crear los archivos 
  (create-html-file output)
  (create-html2-file console)
  ;append inicial
  (append_inicial output console)
  ;hacer los appends correctos con los datos leidos del txt
  (throughList (conv input) output console)

  ; Escritura final del output.html
  (html_a "</body> \n" output)
  (html_a "</html>" output)

; Escritura final del zconsole.html
  (html2_a "</body > \n" console)
  (html2_a "</html>" console))
;(lomein "input.txt" "1.html" "2.html")
;(lomein "input2.txt" "3.html" "4.html")

(defn process-multiple-files-Par [input-files]
  (pmap #(lomein % (str % ".html") (str % "-console.html")) input-files))



(println "Método Paralelizado")
(defn threading []
  (let [input-files ["input.txt" "input2.txt" "input3.txt" "input4.txt"]]
    (process-multiple-files-Par input-files)))
(time (threading))

(println "Método Secuencial")
((defn secuencial []
        (lomein "input.txt" "aa.html" "ab.html")
        (lomein "input2.txt" "ba.html" "bb.html")
        (lomein "input3.txt" "ca.html" "cb.html")
        (lomein "input4.txt" "da.html" "db.html")))
(time (secuencial))


(println "fin")


