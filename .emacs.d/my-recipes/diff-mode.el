(add-hook
 'diff-mode-hook
 (lambda ()
   (cond ((equal frame-background-mode 'light)
          )
         ((equal frame-background-mode 'dark)
          ;; Colors available to Emacs <http://raebear.net/comp/emacscolors.html>.
          (set-face-foreground 'diff-added   "brightgreen")
          (set-face-foreground 'diff-removed "brightred")
          (set-face-foreground 'diff-changed "brightblue")
          (when (not window-system)
            (set-face-background 'diff-added       "black3")
            (set-face-background 'diff-removed     "black3")
            (set-face-background 'diff-changed     "black3")
            (set-face-background 'diff-file-header "black")
            (set-face-background 'diff-hunk-header "black")
            )
          ))
   ))
