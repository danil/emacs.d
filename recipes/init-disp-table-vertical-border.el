;; Set whitespace as vertical separator character symbol
;; <http://stackoverflow.com/questions/18210631/how-to-change-the-character-composing-the-emacs-vertical-border#18211568>.
(unless standard-display-table
  (setq standard-display-table (make-display-table)))

(set-display-table-slot standard-display-table
                        'vertical-border (make-glyph-code 32)) ;?|))