;;; init-php-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

;; (defcustom noxrcp-not-php-mode-patterns '()
;;   "Regexp patterns NOT associated with `php-mode'."
;;   :group 'noxinit)
;; (custom-set-variables '(noxrcp-not-php-mode-patterns
;;                         '('("\\.php[s345t]?\\'" . php-mode)
;;                           '("\\.phtml\\'" . php-mode)
;;                           '( "/Amkfile\\'" . php-mode)
;;                           '( "\\.amk\\'" . php-mode))))

(add-hook 'after-init-hook 'noxrcp-php-mode)

(defun noxrcp-php-mode ()
  "No X recipe init."

  )

(defun init-php-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'php-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-rainbow-identifiers-face-overridable)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override
          '(default font-lock-variable-name-face))

    (init-rainbow-identifiers--lazy-setup)))

;;; init-php-mode.el ends here
