
(cl:in-package :asdf)

(defsystem "command_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "sermon" :depends-on ("_package_sermon"))
    (:file "_package_sermon" :depends-on ("_package"))
  ))