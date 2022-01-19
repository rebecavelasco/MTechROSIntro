; Auto-generated. Do not edit!


(cl:in-package path_planner-srv)


;//! \htmlinclude AttachObject-request.msg.html

(cl:defclass <AttachObject-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:boolean
    :initform cl:nil)
   (frame
    :reader frame
    :initarg :frame
    :type cl:string
    :initform ""))
)

(cl:defclass AttachObject-request (<AttachObject-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AttachObject-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AttachObject-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<AttachObject-request> is deprecated: use path_planner-srv:AttachObject-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <AttachObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:action-val is deprecated.  Use path_planner-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <AttachObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:frame-val is deprecated.  Use path_planner-srv:frame instead.")
  (frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AttachObject-request>) ostream)
  "Serializes a message object of type '<AttachObject-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'action) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AttachObject-request>) istream)
  "Deserializes a message object of type '<AttachObject-request>"
    (cl:setf (cl:slot-value msg 'action) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AttachObject-request>)))
  "Returns string type for a service object of type '<AttachObject-request>"
  "path_planner/AttachObjectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AttachObject-request)))
  "Returns string type for a service object of type 'AttachObject-request"
  "path_planner/AttachObjectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AttachObject-request>)))
  "Returns md5sum for a message object of type '<AttachObject-request>"
  "1f7ad086a1f8f6cd5178c1472fed0d33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AttachObject-request)))
  "Returns md5sum for a message object of type 'AttachObject-request"
  "1f7ad086a1f8f6cd5178c1472fed0d33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AttachObject-request>)))
  "Returns full string definition for message of type '<AttachObject-request>"
  (cl:format cl:nil "bool action~%string frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AttachObject-request)))
  "Returns full string definition for message of type 'AttachObject-request"
  (cl:format cl:nil "bool action~%string frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AttachObject-request>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'frame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AttachObject-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AttachObject-request
    (cl:cons ':action (action msg))
    (cl:cons ':frame (frame msg))
))
;//! \htmlinclude AttachObject-response.msg.html

(cl:defclass <AttachObject-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass AttachObject-response (<AttachObject-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AttachObject-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AttachObject-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<AttachObject-response> is deprecated: use path_planner-srv:AttachObject-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <AttachObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:status-val is deprecated.  Use path_planner-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AttachObject-response>) ostream)
  "Serializes a message object of type '<AttachObject-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AttachObject-response>) istream)
  "Deserializes a message object of type '<AttachObject-response>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AttachObject-response>)))
  "Returns string type for a service object of type '<AttachObject-response>"
  "path_planner/AttachObjectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AttachObject-response)))
  "Returns string type for a service object of type 'AttachObject-response"
  "path_planner/AttachObjectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AttachObject-response>)))
  "Returns md5sum for a message object of type '<AttachObject-response>"
  "1f7ad086a1f8f6cd5178c1472fed0d33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AttachObject-response)))
  "Returns md5sum for a message object of type 'AttachObject-response"
  "1f7ad086a1f8f6cd5178c1472fed0d33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AttachObject-response>)))
  "Returns full string definition for message of type '<AttachObject-response>"
  (cl:format cl:nil "bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AttachObject-response)))
  "Returns full string definition for message of type 'AttachObject-response"
  (cl:format cl:nil "bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AttachObject-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AttachObject-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AttachObject-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AttachObject)))
  'AttachObject-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AttachObject)))
  'AttachObject-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AttachObject)))
  "Returns string type for a service object of type '<AttachObject>"
  "path_planner/AttachObject")