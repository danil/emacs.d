;;; init-coffee-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(add-hook 'coffee-mode-hook 'turn-off-auto-fill) ;get rid of annoying auto-fill-mode in coffee-mode

(add-hook 'after-init-hook 'noxrcp-coffee-mode)
(defun noxrcp-coffee-mode ()
  "No X recipe init."
  (noxrcp-removeme-add-mode-to-patterns 'coffee-mode "\\.coffee\\'" "/Cakefile\\'")

  (if (boundp 'coffee-mode-map) (init-ielm-xxxxxxxxxx)
    (with-eval-after-load 'coffee-mode (init-ielm-xxxxxxxxxx))))

(defun init-coffee-mode-xxxxxxxxxx ()
  (setq coffee-js-mode ;coffee mode defaults to js2-mode, which is not present in Emacs by default
        (if (fboundp 'js2-mode) 'js2-mode 'javascript-mode)))

(defun init-coffee-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'coffee-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-js2-mode--rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override
          '(font-lock-variable-name-face))

    (init-rainbow-identifiers--lazy-setup)))

;;; init-coffee-mode.el ends here
