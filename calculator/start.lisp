(ql:quickload "swank")
(ql:quickload "nibbles")
(ql:quickload "FLEXI-STREAMS")
(ql:quickload "erlang-term")

(swank:create-server)

(defvar show-content nil)

(defun get-content ()
  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
    (read-sequence buf *standard-input*)
    (let* ((result (nibbles:ub32ref/be (coerce buf '(vector (unsigned-byte 8))) 0))
           (buf (make-array result :element-type '(unsigned-byte 8))))
      (read-sequence buf *standard-input*)
      (erlang-term:decode buf))))

(loop (setq show-content (get-content)))

