;;; init-tldr.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2017 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Maintainer: Danil <danil@kutkevich.org>
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

(custom-set-variables
 '(tldr-directory-path (expand-file-name "tldr/" "~/.emacs.var"))
 '(tldr-use-word-at-point t))

(defconst myinit-tldr-face-code-background "gray10")

(add-hook 'after-init-hook 'myinit-tldr)

(defun myinit-tldr ()
  "My init."

  (if (boundp 'tldr-directory-path) (myinit-tldr--customize)
    (with-eval-after-load 'tldr (myinit-tldr--customize))))

(defun myinit-tldr--customize()
  "My init customize."

  ;; (when (equal frame-background-mode 'dark)
  ;;   (set-face-attribute 'tldr-introduction nil :background "gray10"))

  (when (equal frame-background-mode 'dark)
    (set-face-attribute 'tldr-code-block nil
                        :background myinit-tldr-face-code-background))

  (when (equal frame-background-mode 'dark)
    (set-face-attribute 'tldr-command-argument nil
                        :background myinit-tldr-face-code-background)))

;;; init-tldr.el ends here