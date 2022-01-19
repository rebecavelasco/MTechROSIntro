;; Auto-generated. Do not edit!


(when (boundp 'path_planner::RequestGoal)
  (if (not (find-package "PATH_PLANNER"))
    (make-package "PATH_PLANNER"))
  (shadow 'RequestGoal (find-package "PATH_PLANNER")))
(unless (find-package "PATH_PLANNER::REQUESTGOAL")
  (make-package "PATH_PLANNER::REQUESTGOAL"))
(unless (find-package "PATH_PLANNER::REQUESTGOALREQUEST")
  (make-package "PATH_PLANNER::REQUESTGOALREQUEST"))
(unless (find-package "PATH_PLANNER::REQUESTGOALRESPONSE")
  (make-package "PATH_PLANNER::REQUESTGOALRESPONSE"))

(in-package "ROS")





(defclass path_planner::RequestGoalRequest
  :super ros::object
  :slots (_action ))

(defmethod path_planner::RequestGoalRequest
  (:init
   (&key
    ((:action __action) "")
    )
   (send-super :init)
   (setq _action (string __action))
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:serialization-length
   ()
   (+
    ;; string _action
    4 (length _action)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action
       (write-long (length _action) s) (princ _action s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass path_planner::RequestGoalResponse
  :super ros::object
  :slots (_goal _status ))

(defmethod path_planner::RequestGoalResponse
  (:init
   (&key
    ((:goal __goal) "")
    ((:status __status) nil)
    )
   (send-super :init)
   (setq _goal (string __goal))
   (setq _status __status)
   self)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; string _goal
    4 (length _goal)
    ;; bool _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _goal
       (write-long (length _goal) s) (princ _goal s)
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _goal
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _goal (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass path_planner::RequestGoal
  :super ros::object
  :slots ())

(setf (get path_planner::RequestGoal :md5sum-) "c3bc436f69c66a775d9ac3090d41bd75")
(setf (get path_planner::RequestGoal :datatype-) "path_planner/RequestGoal")
(setf (get path_planner::RequestGoal :request) path_planner::RequestGoalRequest)
(setf (get path_planner::RequestGoal :response) path_planner::RequestGoalResponse)

(defmethod path_planner::RequestGoalRequest
  (:response () (instance path_planner::RequestGoalResponse :init)))

(setf (get path_planner::RequestGoalRequest :md5sum-) "c3bc436f69c66a775d9ac3090d41bd75")
(setf (get path_planner::RequestGoalRequest :datatype-) "path_planner/RequestGoalRequest")
(setf (get path_planner::RequestGoalRequest :definition-)
      "string action
---
string goal
bool status

")

(setf (get path_planner::RequestGoalResponse :md5sum-) "c3bc436f69c66a775d9ac3090d41bd75")
(setf (get path_planner::RequestGoalResponse :datatype-) "path_planner/RequestGoalResponse")
(setf (get path_planner::RequestGoalResponse :definition-)
      "string action
---
string goal
bool status

")



(provide :path_planner/RequestGoal "c3bc436f69c66a775d9ac3090d41bd75")


