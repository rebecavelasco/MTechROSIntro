; Auto-generated. Do not edit!


(cl:in-package listener-msg)


;//! \htmlinclude time_msg.msg.html

(cl:defclass <time_msg> (roslisp-msg-protocol:ros-message)
  ((date
    :reader date
    :initarg :date
    :type cl:string
    :initform "")
   (hour
    :reader hour
    :initarg :hour
    :type cl:string
    :initform ""))
)

(cl:defclass time_msg (<time_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <time_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'time_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name listener-msg:<time_msg> is deprecated: use listener-msg:time_msg instead.")))

(cl:ensure-generic-function 'date-val :lambda-list '(m))
(cl:defmethod date-val ((m <time_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader listener-msg:date-val is deprecated.  Use listener-msg:date instead.")
  (date m))

(cl:ensure-generic-function 'hour-val :lambda-list '(m))
(cl:defmethod hour-val ((m <time_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader listener-msg:hour-val is deprecated.  Use listener-msg:hour instead.")
  (hour m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <time_msg>) ostream)
  "Serializes a message object of type '<time_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'date))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'date))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hour))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hour))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <time_msg>) istream)
  "Deserializes a message object of type '<time_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'date) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'date) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hour) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hour) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<time_msg>)))
  "Returns string type for a message object of type '<time_msg>"
  "listener/time_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'time_msg)))
  "Returns string type for a message object of type 'time_msg"
  "listener/time_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<time_msg>)))
  "Returns md5sum for a message object of type '<time_msg>"
  "772088bac049cb52a3d81e9740f95fb0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'time_msg)))
  "Returns md5sum for a message object of type 'time_msg"
  "772088bac049cb52a3d81e9740f95fb0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<time_msg>)))
  "Returns full string definition for message of type '<time_msg>"
  (cl:format cl:nil "string date~%string hour~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'time_msg)))
  "Returns full string definition for message of type 'time_msg"
  (cl:format cl:nil "string date~%string hour~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <time_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'date))
     4 (cl:length (cl:slot-value msg 'hour))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <time_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'time_msg
    (cl:cons ':date (date msg))
    (cl:cons ':hour (hour msg))
))
