;;; <https://groups.google.com/g/golang-nuts/c/03hDZVLeUIw>,
;;; <https://gist.github.com/anonymous/1654113>.

(defgroup init-go-template-mode nil
  "init-go-template-mode"
  :group  'editing
  :tag    "init-go-template-mode"
  :prefix "init-go-template-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-go-template-mode-lighter " init-go-template-mode" "init-go-template-mode" :group 'init-go-template-mode)

(defvar init-go-template-mode-map (make-sparse-keymap)
  "Keymap for `init-go-template-mode'. Populated when mode is enabled.
See `init-go-template-map-bindings'.")

(defcustom init-go-template-map-bindings '()
  "Keybindings enabled in for example `go-templatefile-ggo-template-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `highlight-symbol'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-go-template-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-go-template-mode "init-go-template-mode" nil init-go-template-mode-lighter init-go-template-mode-map
  (init-go-template-mode-setup))

(define-globalized-minor-mode init-global-go-template-mode init-go-template-mode
  (lambda () (init-global-go-template-mode-setup) )
  (unless init-global-go-template-mode (init-global-go-template-mode-teardown)))

(defcustom init-go-template-mode-patterns '()
  "Regexp patterns associated with `go-template-mode'."
  :group 'init-go-template-mode)

(defun init-go-template-mode-setup ())

(defun init-global-go-template-mode-on () (init-global-go-template-mode +1))

(defun init-global-go-template-mode-setup ()
  (dolist (pattern init-go-template-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'go-template-mode))))

(defun init-global-go-template-mode-teardown ())

(defun init-go-template-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'go-template-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-go-template-mode-rainbow-identifiers-filter)
    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-go-template-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      ;; (eq face-cur nil)
      (eq face-cur 'font-lock-variable-name-face)))))

(provide 'init-go-template-mode)
