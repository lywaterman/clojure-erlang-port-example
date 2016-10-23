(ql:quickload "swank")
(ql:quickload "nibbles")
(ql:quickload "FLEXI-STREAMS")
(ql:quickload "erlang-term")

(swank:create-server)

(defvar buf nil)

(setq buf (make-array 4 :element-type '(unsigned-byte 8)))
(read-sequence buf *standard-input*)
(defvar result (nibbles:ub32ref/be (coerce buf '(vector (unsigned-byte 8))) 0))

(setq buf (make-array result :element-type '(unsigned-byte 8)))
(read-sequence buf *standard-input*)


