(add-hook
 'ediff-hook
 (lambda ()
   (cond ((equal frame-background-mode 'light)
          )
         ((equal frame-background-mode 'dark)
          (set-face-foreground 'ediff-current-diff-B nil)
          (set-face-foreground 'ediff-current-diff-A nil)
          (set-face-foreground 'ediff-current-diff-C nil)
          (set-face-background 'ediff-current-diff-A "DarkRed")
          (set-face-background 'ediff-current-diff-B "DarkGreen")
          (set-face-background 'ediff-current-diff-C "DarkOrange4")
          ))
   ))
