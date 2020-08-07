(ql:quickload '(:cl-who :reader :parenscript) :silent t)

(reader:enable-reader-syntax 'lambda)

(use-package :cl-who)

(defmacro who (&body body)
  `(with-html-output-to-string (s nil :indent t)
     (htm ,@body)))

(defmacro b (string)
  `(htm (:span :class "bold" ,string)))

(defmacro include-css (filename)
  `(htm (:link :rel "stylesheet" :href ,filename)))


(with-open-file (f "index.html" :direction :output
                   :if-exists :supersede
                   :if-does-not-exist :create)
  (with-html-output (s f :indent t)
    (declare #+sbcl(sb-ext:muffle-conditions ))
    (:head
     (:meta :charset "utf-8")
     (:meta :name "viewport"
            :content "width=device-width, initial-scale=1.0, shrink-to-fit=no")
     (include-css "index.css")
     (:title "Shubhamkar B. Ayare (digikar)")
     (:script :type "text/javascript"
              (str
               (ps:ps
                 (setf window.onload
                       (lambda (e)
                         (defvar vw (/ document.document-element.client-width 100))
                         (console.log "fired!")
                         (defvar header
                           (aref (document.get-elements-by-class-name "defining-pic") 0))
                         (defvar sticky (* vw 35))
                         (console.log sticky)
                         (setf window.onscroll
                               (lambda (e)
                                 (console.log "scroll")
                                 (if (> window.page-y-offset sticky)
                                     (header.class-list.add "sticky")
                                     (header.class-list.remove "sticky")))))))))
     (:body
      (:div :class "defining-pic" (:img :id "defining-pic-img" :src "defining-pic.jpg"))
      (:main
       (:h1 "Shubhamkar B. Ayare (digikar)")
       (:div :id "note"
             "[This page is intended to introduce me in a formal setting. "
             "For an informal introduction, please see my "
             (:a :href "https://www.quora.com/profile/Shubhamkar-Ayare" "Quora profile")
             ". My resume can be found " (:a :href "resume.pdf" "here") "."
             (b "The below information is older than the resume.") "]")
       (:div :id "contents"
             (:h2 "Education")
             (:p "Formally, I completed my Secondary School Education from Rosary High School (Pune) in 2015, and Higher Secondary Education (equivalent to K12) from Anglo Urdu Boys' High School (along with FIITJEE), also from Pune, in 2017. I have had the opportunity (thanks to affirmative action!) to pursue a four year B. Tech. with a focus in Computer Science and Engineering. I am currently in third year and will graduate in 2021.")
             (:p "Informally, I have invested a significant amount of time in recent years in Common Lisp and Emacs - I hope these skills will last me for the next 40 years :). I also indulge in Psychology to understand people, Cognitive Science to supplement my knowledge of Computers for putting together an AGI, as well as Philosophy and Economics (albeit limited to the courses we were offered at IIT Bombay - they are interesting none-the-less and I'd like to pursue them when I'm free of the other tasks.")
             (:div :id "profile-pic" (:img :src "profile-pic.jpg"))
             (:hr)

             (:h2 "Technical Work")

             (:p "I regard my most prominent experience to be with Common Lisp; but for"
                 " reasons, this can be found towards the bottom.")

             (:h3 "Android")
             (:p (:span :class "bold" "bVNC:")
                 " Added a tablet mode to "
                 (:a :href "https://github.com/iiordanov/remote-desktop-clients/pull/176"
                     "bVNC viewer")
                 " (apk available to download from "
                 (:a :href "https://drive.google.com/open?id=1oqPsbTOVeqbPsKe8tSiQUuNdrDPmz2vM"
                     "here")
                 ") using onTouchEvent method to provide support for single finger scroll,"
                 " long tap and drag for text selection, and long tap to right click.")
             (:p (:span :class "bold" "Hacker's Keyboard:")
                 " Added Del key and unicode symbols to "
                 (:a :href "https://drive.google.com/open?id=17RYpMec2_3g88Ewa4E3pnN_UWzMX62NF"
                     "Hacker's Keyboard")
                 ". However, in this case, I have made a bunch of unstructured changes "
                 " and therefore, haven't taken the time to issue a pull request.")
             (:p (:span :class "bold" "Tinkering with android devices:")
                 " In the era when smartphones weren't as powerful today, I have worked"
                 " towards extending the longevity of android devices using custom ROMs"
                 " and rooting. In the process, I also discovered "
                 (:a :href "https://www.reddit.com/r/Android/comments/bfegnw/ram_manager_for_magisk_a_fix_for_aggressive_app/" "RAM Manager for Magisk")
                 " in some corner of the internet, that fixes aggressive app killing on"
                 " several (probably older than 2019) android devices.")

             (:h3 "Machine Learning")
             (:p "As less serious works, I have implemented "
                 (b "Word Embedding Models") " for"
                 " predicting movie review sentiments, and a "
                 (b "Sequence to Sequence Neural Machine Translator")
                 " for translating between english and hindi (both following tutorials!).")
             (:p "As more serious works, I have had a chance to work in a team during a"
                 " course project at IITB, wherein we implemented (not the big deal!)"
                 " and analyzed (this the big deal! very thanks to my team members!) "
                 (b "Satellite to non-Satellite Image Conversion using conditional GANs"))

             (:h3 "Web Development")
             (:p (b "alterschoolindia:") " Currently, I have the website implemented using"
                 " a Static Site Generator. This aids maintainability as well as eliminates"
                 " the need for special hosting.")
             (:p (b (:a :href "https://knowtnet.com" "KnowTNet:"))
                 " Starting from just some basic knowledge that dynamic websites employ"
                 " URL routing, I was able to implement the system with support for user"
                 " authentication, persistent sessions and ORM databases, using hunchentoot"
                 " in about 80-100 hours of work.")
             (:p (b (:a :href "https://github.com/digikar99/knowtnet-react"
                        "KnowTNet React"))
                 " In order to get my hands on GUI programming, as well as trying out"
                 " JAMStack, I reimplemented the UI part of the website using React."
                 " JAMStack allowed for all things but limited to the single user device,"
                 " allowing me to avoid any special hosting for the site - it just works"
                 " even with Github Pages!")

             (:h3 "Common Lisp")
             (:h4 (:a :href "https://digikar99.github.io/py4cl2/" "py4cl2"))
             (:p "Towards the end of 2019, I discovered py4cl that employed stream"
                 " based interprocess communication to allow for the usage of python"
                 " libraries from Common Lisp. I have had a chance to contribute to it,"
                 " and am still a active maintainer of py4cl2. In the process, I also got"
                 " a chance to hone my git skills :).")
             (:h4 "reader and uniform-utilities")
             (:p "I have also contributed Common Lisp libraries for "
                 (:a :href "https://github.com/digikar99/reader" "providing syntax")
                 " for lambdas, hash-tables, accessors, maps and sets using reader macros,"
                 " as well as another "
                 (:a :href "https://github.com/digikar99/uniform-utilities"
                     "library")
                 " for implementing zero-cost abstraction to various accessors using "
                 " compiler macros.")
             (:h4 "iterate-docs")
             (:p  "I have also studied and (re)documented "
                  (:a :href "https://digikar99.github.io/cl-iterate-docs/" "iterate")
                  " - a library dedicated to iteration, as well as "
                  (:a :href "https://github.com/LispCookbook/cl-cookbook/pull/259"
                      "contributed to a few")
                  " sections to a page on The Common Lisp Cookbook.")
             (:hr)
             
             (:h2 "Non Technical Work")
             (:h4 (:a :href "http://alterschoolindia.com" "alterschoolindia"))
             (:p "During 2017-18, I spent quite some time to put together a 6-month long curriculum for middle-schoolers, as a solution to the complaints about school education. It has grown quite exhaustive but is in no way complete: contributions are welcome to the associated " (:a :href "https://github.com/digikar99/alterschoolindia" "github repository") ".")
             (:h4 (:a :href "https://digikar99.github.io/knowtnet" "KnowTNet"))
             (:p "In the latter half of 2019, I implemented the idea of a Knowledge Transfer Network in order to address the problem of repetitive useful/insightful content on the internet - you'd have noticed this if you'd have spent any significant time on the internet.")
             (:h4 (:a :href "https://human9being9.wordpress.com/28-2/" "Myopia"))
             (:p "I have suffered from high myopia that poses a risk for retinal detachment."
                 " In addition, myopia has been a prevalent issue in modern (Asian) societies."
                 " To that effect, in 2017, I also spent quite some time studying myopia.")

             (:hr)

             (:p "You can reach me at "
                 (:a :href "mailto:shubhamayare@yahoo.co.in"
                     "shubhamayare@yahoo.co.in")
                 ".")
             (:br)
             (:br))
       (:footer "Made with lisp."))))))

