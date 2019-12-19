(ql:quickload '(:cl-markup :reader) :silent t)

(reader:enable-reader-syntax 'lambda)

;; (load "my-markup.lisp")

(in-package :cl-user)

(setf (macro-function '$) (macro-function 'cl-markup:markup))

(defmacro with-tidy-xml (file-name string)
  (let ((file-name-sym (gensym)))
    `(let ((,file-name-sym ,file-name))
       (with-open-file (f ,file-name-sym
                          :direction :output
                          :if-exists :supersede
                          :if-does-not-exist :create)
         (write-string ,string f))
       (uiop:run-program (concatenate 'string "tidy -m -xml -i " ,file-name-sym)
                         :ignore-error-status t))))

(defun include-css (filename)
  ($ `(:link :rel "stylesheet" :href ,filename)))

(defparameter *about-text*
  (cl-markup:html5
    (:head
     (:meta :charset "utf-8")
     (:meta :name "viewport" :content "width=device-width, initial-scale=1, shrink-to-fit=no")
     (include-css "index.css")
     (:title "Shubhamkar B. Ayare (digikar)"))
    (:body
     (:div :id "defining-pic" (:img :src "defining-pic"))
     (:div :id "profile-pic" (:img :src "profile-pic"))
     (:div :id "note"
           "[This page introduces me in a formal setting. "
           "For an informal introduction, please visit "
           (:a :href "" "this site ")
           ".]"))))

(with-tidy-xml "index.html" *about-text*)
