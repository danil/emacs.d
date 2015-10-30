(autoload 'kill-ring-ido "kill-ring-ido" nil t)

(my-after-init
  ;; (global-set-key (kbd "M-y") 'my-yank-pop-with-ido)

  (my-eval-after-load 'kill-ring-ido
    (setq kill-ring-ido-shortage-length 1000)))

(defun my-yank-pop-with-ido (&optional arg)
  (interactive "P")

  (if arg
      (call-interactively 'yank-pop)
    (call-interactively 'kill-ring-ido)))