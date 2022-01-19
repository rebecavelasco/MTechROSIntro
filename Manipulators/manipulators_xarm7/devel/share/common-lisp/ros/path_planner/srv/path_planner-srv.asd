
(cl:in-package :asdf)

(defsystem "path_planner-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AttachObject" :depends-on ("_package_AttachObject"))
    (:file "_package_AttachObject" :depends-on ("_package"))
    (:file "RequestGoal" :depends-on ("_package_RequestGoal"))
    (:file "_package_RequestGoal" :depends-on ("_package"))
  ))