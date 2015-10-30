(my-after-init
  (global-set-key (my-kbd "x d") 'my-deft)

  (my-eval-after-load 'deft
    (setq deft-directory "~/Dropbox/notes") ;<http://jblevins.org/projects/deft>
    (setq deft-text-mode 'markdown-mode)
    (setq deft-extension "md")))

(defun my-deft (&optional arg)
  (interactive "P")
  (if arg (deft-new-file) (deft)))