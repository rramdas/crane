(in-package :cl-user)
(defpackage :crane.types
  (:import-from :cl
                :deftype)
  (:export :int
           :bigint
           :smallint
           :numeric
           :double
           :text
           :varchar
           :timestamp
           :datetime))
(in-package :crane.types)

;; Numeric types

(deftype integer () `cl:integer)
(deftype bigint () `cl:integer)
(deftype smallint () `cl:integer)
(deftype numeric () `cl:ratio)
(deftype double () `cl:double-float)

;; Text

(deftype text () `cl:string)
(deftype varchar () `cl:string)

;; Extra

(deftype timestamp () `cl:string)
(deftype datetime () `cl:string)
