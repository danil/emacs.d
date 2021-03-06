;;; init-gitignore-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-gitignore-mode-patterns '()
  "Regexp patterns associated with `logview'."
  :group 'noxinit)

(custom-set-variables '(noxrcp-gitignore-mode-patterns
                        '(
                          "/\\.agignore\\'"
                          "/\\.dockerignore\\'"
                          "/\\.gitignore_global\\'"
                          "/\\.stglobalignore\\'"
                          "/\\.stignore\\'"
                          "/\\.stignore_global\\'"
                          "/\\.stignoreglobal\\'"
                          )))

(add-hook 'after-init-hook 'noxrcp-gitignore-mode)

(defun noxrcp-gitignore-mode ()
  "No X recipe init."

  ;; Git modes <https://github.com/magit/git-modes>.
  (dolist (pattern noxrcp-gitignore-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'gitignore-mode))))

;;; init-gitignore-mode.el ends here
