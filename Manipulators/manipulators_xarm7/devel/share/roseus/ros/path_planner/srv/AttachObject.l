;; Auto-generated. Do not edit!


(when (boundp 'path_planner::AttachObject)
  (if (not (find-package "PATH_PLANNER"))
    (make-package "PATH_PLANNER"))
  (shadow 'AttachObject (find-package "PATH_PLANNER")))
(unless (find-package "PATH_PLANNER::ATTACHOBJECT")
  (make-package "PATH_PLANNER::ATTACHOBJECT"))
(unless (find-package "PATH_PLANNER::ATTACHOBJECTREQUEST")
  (make-package "PATH_PLANNER::ATTACHOBJECTREQUEST"))
(unless (find-package "PATH_PLANNER::ATTACHOBJECTRESPONSE")
  (make-package "PATH_PLANNER::ATTACHOBJECTRESPONSE"))

(in-package "ROS")





(defclass path_planner::AttachObjectRequest
  :super ros::object
  :slots (_action _frame ))

(defmethod path_planner::AttachObjectRequest
  (:init
   (&key
    ((:action __action) nil)
    ((:frame __frame) "")
    )
   (send-super :init)
   (setq _action __action)
   (setq _frame (string __frame))
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:frame
   (&optional __frame)
   (if __frame (setq _frame __frame)) _frame)
  (:serialization-length
   ()
   (+
    ;; bool _action
    1
    ;; string _frame
    4 (length _frame)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _action
       (if _action (write-byte -1 s) (write-byte 0 s))
     ;; string _frame
       (write-long (length _frame) s) (princ _frame s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _action
     (setq _action (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass path_planner::AttachObjectResponse
  :super ros::object
  :slots (_status ))

(defmethod path_planner::AttachObjectResponse
  (:init
   (&key
    ((:status __status) nil)
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass path_planner::AttachObject
  :super ros::object
  :slots ())

(setf (get path_planner::AttachObject :md5sum-) "1f7ad086a1f8f6cd5178c1472fed0d33")
(setf (get path_planner::AttachObject :datatype-) "path_planner/AttachObject")
(setf (get path_planner::AttachObject :request) path_planner::AttachObjectRequest)
(setf (get path_planner::AttachObject :response) path_planner::AttachObjectResponse)

(defmethod path_planner::AttachObjectRequest
  (:response () (instance path_planner::AttachObjectResponse :init)))

(setf (get path_planner::AttachObjectRequest :md5sum-) "1f7ad086a1f8f6cd5178c1472fed0d33")
(setf (get path_planner::AttachObjectRequest :datatype-) "path_planner/AttachObjectRequest")
(setf (get path_planner::AttachObjectRequest :definition-)
      "bool action
string frame
---
bool status

")

(setf (get path_planner::AttachObjectResponse :md5sum-) "1f7ad086a1f8f6cd5178c1472fed0d33")
(setf (get path_planner::AttachObjectResponse :datatype-) "path_planner/AttachObjectResponse")
(setf (get path_planner::AttachObjectResponse :definition-)
      "bool action
string frame
---
bool status

")



(provide :path_planner/AttachObject "1f7ad086a1f8f6cd5178c1472fed0d33")


