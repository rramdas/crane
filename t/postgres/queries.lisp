(in-package :crane-test.postgres)

(def-suite queries
  :description "Creating, saving, and destroying objects.")
(in-suite queries)

(test creating
  (finishes
   (create 'a :field-a 1)
   (create 'a :field-a 2)
   (create 'a :field-a 3)))

(test saving
  (finishes
    (let ((instance (create 'a :field-a 19)))
      (setf (field-a instance) 77)
      (save instance))))

(test deleting
  (finishes
    (let ((instance (create 'a :field-a 99)))
      (del instance))))

(test filtering
  (finishes
    (filter 'a :field-a 55))
  (is (= (length (filter 'a))
         4))
  (is (= (field-a (first (filter 'a :field-a 1)))
         1))
  (is (= (field-a (single 'a :field-a 1))))
  (is-true (exists 'a :field-a 1)))

(run! 'queries)
