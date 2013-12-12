(add-hook
 'magit-mode-hook
 (lambda ()
   ;; Colors - diff and more
   ;; <http://readystate4.com/2011/02/22/emacs-changing-magits-default-diff-colors>.
   (cond ((equal frame-background-mode 'light)
          (when (not window-system)
            (set-face-attribute 'magit-diff-add
                                nil
                                :foreground "darkgreen")
            (set-face-attribute 'magit-diff-del
                                nil
                                :foreground "red")
            ;; (set-face-attribute 'magit-item-highlight
            ;;                     nil
            ;;                     :inherit 'my-default)
            (set-face-attribute 'magit-log-head-label-bisect-bad
                                nil
                                :foreground "red"
                                :background nil)
            (set-face-attribute 'magit-log-head-label-bisect-good
                                nil
                                :foreground "darkgreen"
                                :background nil)
            (set-face-attribute 'magit-log-head-label-default
                                nil
                                :background nil)
            (set-face-attribute 'magit-log-head-label-local
                                nil
                                :foreground "darkgreen"
                                :background nil)
            (set-face-attribute 'magit-log-head-label-patches
                                nil
                                :foreground "brown4"
                                :background nil)
            (set-face-attribute 'magit-log-head-label-remote
                                nil
                                :foreground "darkgreen"
                                :background nil)
            (set-face-attribute 'magit-log-head-label-tags
                                nil
                                :foreground "goldenrod4"
                                :background nil)
            ))
         ((equal frame-background-mode 'dark)
          (when (not window-system)
            (set-face-foreground 'magit-diff-add "green1")
            (set-face-foreground 'magit-diff-del "red1")
            (set-face-background 'magit-item-highlight "brightblack")
            (set-face-background 'magit-diff-add "brightblack")
            (set-face-background 'magit-diff-del "brightblack")
            ;; (set-face-background 'magit-item-mark "brightblack")
            )))
   ))