;; Auto-generated. Do not edit!


(when (boundp 'listener::time_msg)
  (if (not (find-package "LISTENER"))
    (make-package "LISTENER"))
  (shadow 'time_msg (find-package "LISTENER")))
(unless (find-package "LISTENER::TIME_MSG")
  (make-package "LISTENER::TIME_MSG"))

(in-package "ROS")
;;//! \htmlinclude time_msg.msg.html


(defclass listener::time_msg
  :super ros::object
  :slots (_date _hour ))

(defmethod listener::time_msg
  (:init
   (&key
    ((:date __date) "")
    ((:hour __hour) "")
    )
   (send-super :init)
   (setq _date (string __date))
   (setq _hour (string __hour))
   self)
  (:date
   (&optional __date)
   (if __date (setq _date __date)) _date)
  (:hour
   (&optional __hour)
   (if __hour (setq _hour __hour)) _hour)
  (:serialization-length
   ()
   (+
    ;; string _date
    4 (length _date)
    ;; string _hour
    4 (length _hour)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _date
       (write-long (length _date) s) (princ _date s)
     ;; string _hour
       (write-long (length _hour) s) (princ _hour s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _date
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _date (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _hour
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hour (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get listener::time_msg :md5sum-) "772088bac049cb52a3d81e9740f95fb0")
(setf (get listener::time_msg :datatype-) "listener/time_msg")
(setf (get listener::time_msg :definition-)
      "string date
string hour

")



(provide :listener/time_msg "772088bac049cb52a3d81e9740f95fb0")


