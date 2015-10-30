;;; Session Management <http://www.emacswiki.org/emacs/SaveHist>,
;;; <http://emacswiki.org/SessionManagement>.
(my-after-init
  (savehist-mode t)

  (my-eval-after-load 'savehist
    (setq savehist-additional-variables '(compile-command
                                          kill-ring
                                          regexp-search-ring
                                          search-ring))))