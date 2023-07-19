;; clj -M test3.clj
;; corrrer en terminal


(defn display-element [x]
  (print x)
  (println))

(defn display-elements [lst]
  (pmap display-element lst))

(display-elements '(1 2 3 4 5))
