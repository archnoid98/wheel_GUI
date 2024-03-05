;; Auto-generated. Do not edit!


(when (boundp 'command_pkg::sermon)
  (if (not (find-package "COMMAND_PKG"))
    (make-package "COMMAND_PKG"))
  (shadow 'sermon (find-package "COMMAND_PKG")))
(unless (find-package "COMMAND_PKG::SERMON")
  (make-package "COMMAND_PKG::SERMON"))

(in-package "ROS")
;;//! \htmlinclude sermon.msg.html


(defclass command_pkg::sermon
  :super ros::object
  :slots (_advice _speed ))

(defmethod command_pkg::sermon
  (:init
   (&key
    ((:advice __advice) "")
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _advice (string __advice))
   (setq _speed (round __speed))
   self)
  (:advice
   (&optional __advice)
   (if __advice (setq _advice __advice)) _advice)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; string _advice
    4 (length _advice)
    ;; int64 _speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _advice
       (write-long (length _advice) s) (princ _advice s)
     ;; int64 _speed
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _speed (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _speed) (= (length (_speed . bv)) 2)) ;; bignum
              (write-long (ash (elt (_speed . bv) 0) 0) s)
              (write-long (ash (elt (_speed . bv) 1) -1) s))
             ((and (class _speed) (= (length (_speed . bv)) 1)) ;; big1
              (write-long (elt (_speed . bv) 0) s)
              (write-long (if (>= _speed 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _speed s)(write-long (if (>= _speed 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _advice
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _advice (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _speed
#+(or :alpha :irix6 :x86_64)
      (setf _speed (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _speed (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get command_pkg::sermon :md5sum-) "b5fad3c1c2010335da2f9cba98fcf299")
(setf (get command_pkg::sermon :datatype-) "command_pkg/sermon")
(setf (get command_pkg::sermon :definition-)
      "string advice
int64 speed
")



(provide :command_pkg/sermon "b5fad3c1c2010335da2f9cba98fcf299")


