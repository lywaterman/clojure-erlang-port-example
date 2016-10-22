(require '[clojure.core.async :as async :refer [<! >! <!! go]])
(require '[clojure-erlastic.core :refer [port-connection log]])
(use '[clojure.core.match :only (match)])

(let [[in out] (clojure-erlastic.core/port-connection)]
  (<!! (go 
         (loop [num 0]
           (match (<! in)
                  [:add n] (recur (+ num n))
                  [:rem n] (recur (- num n))
                  :get (do (>! out num) (recur num)))))))
