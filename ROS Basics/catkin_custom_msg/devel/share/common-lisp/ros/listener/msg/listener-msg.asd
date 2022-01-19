
(cl:in-package :asdf)

(defsystem "listener-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "time_msg" :depends-on ("_package_time_msg"))
    (:file "_package_time_msg" :depends-on ("_package"))
  ))