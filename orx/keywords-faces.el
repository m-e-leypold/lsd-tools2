
; ATTENTION: This is still very uch work in progress + to be refined :-)

(defface orx-open-todo 
  (org-compatible-face 'org-todo
    '(
      (((class color) (min-colors 16) (background light)) (:foreground "gold1"    :bold t))
      (((class color) (min-colors 16) (background dark))  (:foreground "yellow1"  :bold t))
      (((class color) (min-colors 8)  (background light)) (:foreground "orange"   :bold t))
      (((class color) (min-colors 8)  (background dark))  (:foreground "orange"   :bold t))
      (t (:inverse-video t :bold t))))
  "Face for TODO keywords."
  :group 'orx-faces)

; Does not seem to work properly - analyze!

; TODO: orx-open-problem
; TODO: orx-open-ticket

(setq org-todo-keyword-faces 
      (append 

       '( ("TODO"         . "orange1")
          ("NOW"          . org-todo)
          ("DONE"         . org-done)

	  ("OPEN"         . "orange1")

	  ("DEPENDS"      . "orange1")
	  ("BLOCKS"       . "darkblue")
	  ("SEE-ALSO"     . "darkblue")

	  ("TASK"         . "orange1")

	  ("BACKLOG"      . "orange1")

          ("TICKET"       . "DarkTurquoise")    ; need to insert new faces here	 

	  ("REJECTED-TICKET" . "magenta2")
	  ("REJECTED-BUG"    . "magenta2")
	  ("CANCELLED"       . "magenta2")
	  ("POSTPONED"       . "black")

	  ("PROJECT"         . "firebrick")


	  ("MODEL"         . "darkgray")         
	  ("CLASS"         . "darkgray")         
	  
	  ("INCOMING"      . "darkblue")
	  ("ABOUT"         . "darkblue")
	  ("BM"            . "darkblue")        ; discuss/change?
	  ("PLANNED"       . "darkblue")

	  
	  ("LOGGING"       . "LightSlateGrey")

	  ("CLOCKING"      . "royalblue")

	  )

       '( ("WONT" . "darkblue")                 ; this is legacy stuff from .orx/AT
	  
	  ("CANCELLED"     . "darkred")
	  
	  ("NOW"           . "orange")         
	  ("BLURB-NOW"     . "orange")         
	  ("NOTES-CURRENT" . "orange") 
	  ("CLOCKING"      . "orange")
	  
	  ("MODEL"         . "darkgray")         
	  ("CLASS"         . "darkgray")         
	  
	  ("INCOMING"      . "darkblue")
	  ("ABOUT"         . "darkblue")
	  ("BM"            . "darkblue")
	  ("PLANNED"       . "darkblue")
	  
	  )
       org-todo-keyword-faces
       )
      )


;; XXX consolidating with LN orx would be a good idea
