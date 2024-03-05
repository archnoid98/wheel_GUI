; Auto-generated. Do not edit!


(cl:in-package command_pkg-msg)


;//! \htmlinclude sermon.msg.html

(cl:defclass <sermon> (roslisp-msg-protocol:ros-message)
  ((advice
    :reader advice
    :initarg :advice
    :type cl:string
    :initform "")
   (speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0))
)

(cl:defclass sermon (<sermon>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sermon>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sermon)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name command_pkg-msg:<sermon> is deprecated: use command_pkg-msg:sermon instead.")))

(cl:ensure-generic-function 'advice-val :lambda-list '(m))
(cl:defmethod advice-val ((m <sermon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader command_pkg-msg:advice-val is deprecated.  Use command_pkg-msg:advice instead.")
  (advice m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <sermon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader command_pkg-msg:speed-val is deprecated.  Use command_pkg-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sermon>) ostream)
  "Serializes a message object of type '<sermon>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'advice))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'advice))
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sermon>) istream)
  "Deserializes a message object of type '<sermon>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'advice) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'advice) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sermon>)))
  "Returns string type for a message object of type '<sermon>"
  "command_pkg/sermon")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sermon)))
  "Returns string type for a message object of type 'sermon"
  "command_pkg/sermon")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sermon>)))
  "Returns md5sum for a message object of type '<sermon>"
  "b5fad3c1c2010335da2f9cba98fcf299")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sermon)))
  "Returns md5sum for a message object of type 'sermon"
  "b5fad3c1c2010335da2f9cba98fcf299")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sermon>)))
  "Returns full string definition for message of type '<sermon>"
  (cl:format cl:nil "string advice~%int64 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sermon)))
  "Returns full string definition for message of type 'sermon"
  (cl:format cl:nil "string advice~%int64 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sermon>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'advice))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sermon>))
  "Converts a ROS message object to a list"
  (cl:list 'sermon
    (cl:cons ':advice (advice msg))
    (cl:cons ':speed (speed msg))
))
