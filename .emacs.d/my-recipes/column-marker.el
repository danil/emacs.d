(eval-after-load 'column-marker
  '(progn
     (cond ((equal frame-background-mode 'dark)
            (set-face-background 'column-marker-1 "gray35")
            ))
     ))
(dolist (hook '(
                ;; mail-mode-hook
                ;; whitespace-mode-hook
                awk-mode-hook
                change-log-mode-hook
                coffee-mode-hook
                conf-mode-hook
                css-mode-hook
                emacs-lisp-mode-hook
                haml-mode-hook
                haskell-mode-hook
                html-mode-hook
                java-mode-hook
                js-mode-hook
                lisp-mode-hook
                lua-mode-hook
                makefile-gmake-mode-hook
                markdown-mode-hook
                nxml-mode-hook
                org-mode-hook
                perl-mode-hook
                php-mode-hook
                ruby-mode-hook
                sass-mode-hook
                sgml-mode-hook
                sh-mode-hook
                sql-mode-hook
                xml-mode-hook
                yaml-mode-hook
                ))
  (add-hook hook (lambda () (unless buffer-read-only (column-marker-1 79)))))
