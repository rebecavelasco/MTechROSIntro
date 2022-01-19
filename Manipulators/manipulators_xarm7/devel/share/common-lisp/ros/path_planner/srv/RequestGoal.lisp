; Auto-generated. Do not edit!


(cl:in-package path_planner-srv)


;//! \htmlinclude RequestGoal-request.msg.html

(cl:defclass <RequestGoal-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:string
    :initform ""))
)

(cl:defclass RequestGoal-request (<RequestGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RequestGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RequestGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<RequestGoal-request> is deprecated: use path_planner-srv:RequestGoal-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <RequestGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:action-val is deprecated.  Use path_planner-srv:action instead.")
  (action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RequestGoal-request>) ostream)
  "Serializes a message object of type '<RequestGoal-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RequestGoal-request>) istream)
  "Deserializes a message object of type '<RequestGoal-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RequestGoal-request>)))
  "Returns string type for a service object of type '<RequestGoal-request>"
  "path_planner/RequestGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RequestGoal-request)))
  "Returns string type for a service object of type 'RequestGoal-request"
  "path_planner/RequestGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RequestGoal-request>)))
  "Returns md5sum for a message object of type '<RequestGoal-request>"
  "c3bc436f69c66a775d9ac3090d41bd75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RequestGoal-request)))
  "Returns md5sum for a message object of type 'RequestGoal-request"
  "c3bc436f69c66a775d9ac3090d41bd75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RequestGoal-request>)))
  "Returns full string definition for message of type '<RequestGoal-request>"
  (cl:format cl:nil "string action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RequestGoal-request)))
  "Returns full string definition for message of type 'RequestGoal-request"
  (cl:format cl:nil "string action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RequestGoal-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RequestGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RequestGoal-request
    (cl:cons ':action (action msg))
))
;//! \htmlinclude RequestGoal-response.msg.html

(cl:defclass <RequestGoal-response> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type cl:string
    :initform "")
   (status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RequestGoal-response (<RequestGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RequestGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RequestGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<RequestGoal-response> is deprecated: use path_planner-srv:RequestGoal-response instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <RequestGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:goal-val is deprecated.  Use path_planner-srv:goal instead.")
  (goal m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <RequestGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:status-val is deprecated.  Use path_planner-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RequestGoal-response>) ostream)
  "Serializes a message object of type '<RequestGoal-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'goal))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RequestGoal-response>) istream)
  "Deserializes a message object of type '<RequestGoal-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'goal) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RequestGoal-response>)))
  "Returns string type for a service object of type '<RequestGoal-response>"
  "path_planner/RequestGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RequestGoal-response)))
  "Returns string type for a service object of type 'RequestGoal-response"
  "path_planner/RequestGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RequestGoal-response>)))
  "Returns md5sum for a message object of type '<RequestGoal-response>"
  "c3bc436f69c66a775d9ac3090d41bd75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RequestGoal-response)))
  "Returns md5sum for a message object of type 'RequestGoal-response"
  "c3bc436f69c66a775d9ac3090d41bd75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RequestGoal-response>)))
  "Returns full string definition for message of type '<RequestGoal-response>"
  (cl:format cl:nil "string goal~%bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RequestGoal-response)))
  "Returns full string definition for message of type 'RequestGoal-response"
  (cl:format cl:nil "string goal~%bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RequestGoal-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'goal))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RequestGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RequestGoal-response
    (cl:cons ':goal (goal msg))
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RequestGoal)))
  'RequestGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RequestGoal)))
  'RequestGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RequestGoal)))
  "Returns string type for a service object of type '<RequestGoal>"
  "path_planner/RequestGoal")