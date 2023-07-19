;; clj -M test.clj


;;; 2) Contar el numero de ocurrencias de un elemento en la lista
(defn ocurrencias [lista n]
  (cond (empty? lista) 0
        (= (first lista) n) (inc (ocurrencias (rest lista) n))
        :else (ocurrencias (rest lista) n)))

(println "\nocurrencias en lista")
(println (ocurrencias '(1 2 3 4 3 6) 3))
(println (ocurrencias '(1 7 77 4 7 7) 7))
(println (ocurrencias '(1 2 3 4 5 6) 9))



;;; 4) Promdeio de lista
(defn sumatoria [lista]
  (if (empty? lista)
    0
    (+ (first lista) (sumatoria (rest lista)))))

(defn promedio [lista]
  (if (empty? lista)
    0
    (/ (sumatoria lista) (count lista))))

(println "\npromedio de lista")
(println (promedio '(2 2)))
(println (promedio '(2 3 10)))
(println (promedio '(1)))


