;;; init-sql-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
;; URL: https://github.com/danil/init.el

;;; Commentary:

;; Please see README.md for documentation.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defcustom noxrcp-sql-mode-patterns '()
  "Regexp patterns associated with `sql-mode'."
  :group 'noxinit)

(custom-set-variables '(noxrcp-sql-mode-patterns '("/\\.?psqlrc\\'")))

(add-hook 'after-init-hook 'noxrcp-sql-mode)
(defun noxrcp-sql-mode ()
  "No X recipe init."
  (dolist (pattern noxrcp-sql-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'sql-mode)))
  (if (boundp 'sql-mode-map) (noxrcp-sql-mode--setup)
    (with-eval-after-load 'sql (noxrcp-sql-mode--setup))))

(defun noxrcp-sql-mode--setup ()
  (define-key sql-mode-map (kbd "C-c C-p") 'sql-set-product))

(defun init-sql-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'sql-mode)
    (noxrcp-sql--rainbow-identifiers-init)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-sql-mode--rainbow-identifiers-filter)
    (when (<= (count-lines (point-min) (point-max)) 200) ;number of lines in current buffer
      (init-rainbow-identifiers--lazy-setup))))

(defun init-sql-interactive-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'sql-interactive-mode)
    (noxrcp-sql--rainbow-identifiers-init)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-sql-mode--rainbow-identifiers-filter)
    (when (<= (count-lines (point-min) (point-max)) 200) ;number of lines in current buffer
      (init-rainbow-identifiers--lazy-setup))))

(defun noxrcp-sql--rainbow-identifiers-init ()
  (make-local-variable 'rainbow-identifiers-filter-functions)
  (add-hook 'rainbow-identifiers-filter-functions
            'rainbow-identifiers-face-overridable)
  (make-local-variable 'rainbow-identifiers-faces-to-override)
  (setq rainbow-identifiers-faces-to-override '()))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-sql-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((ch-cur (char-after beg))
        (str-cur (downcase (buffer-substring-no-properties beg end))))
    (and
     (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9)))
     (not (member str-cur '(
                                       "affected"
                                       "auto_increment"
                                       "autocommit"
                                       "change"
                                       "charset"
                                       "comment"
                                       "databases"
                                       "duplicates"
                                       "engine"
                                       "enum"
                                       "extra"
                                       "innodb"
                                       "lock"
                                       "mul"
                                       "mysql"
                                       "ok"
                                       "oracle"
                                       "pri"
                                       "query"
                                       "records"
                                       "sec"
                                       "tables"
                                       "unlock"
                                       "unsigned"
                                       "utf8"
                                       "warnings"
                                       "yes"
                                       ))))))

;;; init-sql-mode.el ends here
