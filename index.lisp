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
  (with-html-output (s f)
    (declare #+sbcl (sb-ext:muffle-conditions))
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
       (:div :id "contents"
             (:h2 "Who am I?")
             (:p "Uhm, well, I have elaborated it "
                 (:a :href "https://human9being9.wordpress.com/2020/05/03/me/" "here")
                 ".")
             (:p ".")
             (:p "Go, have a read!")
             (:p ".")
             (:p "Waiting for you")
             (:p ".")
             (:p "Okay, on a serious note: as of August 2020, I'm a fourth year undergraduate at IIT Bombay majoring in Computer Science.")
             (:div :id "profile-pic" (:img :src "profile-pic.jpg"))
             (:p "I have spent a considerable amount of time in recent years in Common Lisp and Emacs. I've also spent a non-trivial amount of time on"
                 (:ul
                  (:li (:a :href "https://teachyourselfcs.com/" "Computer Science"))
                  (:li "Python and Django, while working on "
                       (:a :href "https://bodhitree.cse.iitb.ac.in/" "BodhiTree")
                       " at IIT Bombay under the guidance of Prof. Kameswari Chebrolu, with help from "
                       (:a :href "https://www.cse.iitb.ac.in/~surajkumar/" "Suraj Kumar")
                       ".")
                  (:li "C++, while interning at Sony Corporation (Japan) [work from home]")))
             (:p "I also dabble into Psychology, to understand people and myself. I also have picked up some possibly-half ideas from Cognitive Science, First Language Acquisition in particular. This year, I'm trying to focus myself onto Machine Learning.")

             (:h2 "Resume")
             (:p (:a :href "resume.pdf" "Here you go") "!")
             (:h2 "Other Things")
             (:ul
              (:li "I have been on "
                   (:a :href "https://www.quora.com/profile/Shubhamkar-Ayare" "Quora")
                   " since at least 2014, and possibly before. A number of my answers self-deemed to be interesting have been collected "
                   (:a :href "https://human9being9.wordpress.com/my-quora/" "here"))
              (:li "I have been deeply influenced by "
                   (:a :href "https://human9being9.wordpress.com/digimon/the-depths-of-adventures/" "Digimon Adventures")
                   " so much so that a partial philosophy of my life can be found "
                   (:a :href "https://www.quora.com/What-is-your-favourite-line-from-any-anime/answer/Shubhamkar-Ayare"
                       "here")
                   ". You might even like quite a few of the songs "
                   (:a :href "https://www.youtube.com/channel/UCmYexngUtirkfht9EgRK3Eg/playlists?view_as=subscriber"
                       "there"))
              (:li "Some of the books I've read or in my to-read list listed "
                   (:a :href "https://human9being9.wordpress.com/books/" "here")
                   " include"
                   (:ul (:li "Sapiens: A brief History of Humankind")
                        (:li "Ender’s Game and its sequel Speaker for the Dead")
                        (:li "Godel, Escher and Bach: An eternal golden braid")
                        (:li "Linear Algebra Done Right")
                        (:li "The Language Instinct: How the Mind creates language")))
              (:li "Active on " (:a :href "https://github.com/digikar99" "Github"))
              (:li "I also sometimes write on "
                   (:a :href "http://human9being9.wordpress.com/" "wordpress")
                   ". Some articles of general interest include: "
                   (:ul
                    (:li (:a :href "https://human9being9.wordpress.com/10-things-you-must-know/" "10 Things You Must Know"))
                    (:li (:a :href "https://human9being9.wordpress.com/2020/02/15/dealing-with-loneliness/" "Dealing with Loneliness"))
                    (:li (:a :href "https://human9being9.wordpress.com/2020/02/06/evolving-perspectives-on-actions-and-desires/" "Evolving Perspectives on Actions and Desires"))
                    (:li (:a :href "https://human9being9.wordpress.com/2019/12/01/my-work-on-agi-so-far-2018-19/" "My work on AGI so far (2018-19)")))
                   (:li (:a :href "https://human9being9.wordpress.com/28-2/" "Myopia"))
                   (:li "Developing supplementary resources for "
                        (:a :href "https://alterschoolindia.com/" "middle school education")
                        ". There are some resources on "
                        (:a :href "https://alterschoolindia.com/intermediate.html" "Career Tasting")
                        " (yes, that's T-A-S-T) as well")
                   ))
             (:p "I'm on the lookout for a few more brains. I mean I do have one; but would appreciate if I had more. The amount of things I wish to do have swelled a lot. Seemingly independent areas include")
             (:ul
              (:li "Cognitive Science and Artificial General Intelligence")
              (:li "Socioeconomics, Government Systems and Utopia")
              (:li "Common Lisp (or any programming language that qualifies as a superset of Common Lisp)")
              (:li "Education from the POV of learners")
              (:li "Education from the POV of academia, research and open science; Open Science itself"))
             (:p "I'd love to get in touch with you if you possess the ability or inclination towards one or more of these. Agreeably, these are very vague topics in and of themselves; as such, I'd also love to get in touch with the more experienced folks, so long as they could fit their work in the bigger scheme of things.")

             (:h2 "Contact")
             (:p "You can write an email to shubhamayare[at]yahoo[dot]co[dot]in. Feel free to ping me more than once, lest it gets lost in other emails.")
             (:p "You can also get in touch on "
                 (:a :href "https://www.quora.com/profile/Shubhamkar-Ayare" "Quora") ", "
                 (:a :href "https://www.facebook.com/shubhamkar.ayare" "Facebook") ", "
                 (:a :href "https://reddit.com/u/digikar" "Reddit") ", "
                 " or "
                 (:a :href "" "LinkedIn") "."))
                    
       (:footer (:h2 "Have a nice day!")
                (:i (:p "Made with lisp."))))))))

