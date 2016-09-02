;;; init-ruby-tools.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
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

(add-hook 'after-init-hook 'myinit-ruby-tools)

(defun myinit-ruby-tools ()
  "My init."

  ;; (add-hook 'text-mode-hook 'auto-fill-mode)

  ;;    haml-mode
  ;;    rhtml-mode
  ;;    ruby-mode
  ;;    slim-mode

  ;; (myinit-add-mode-to-hooks 'ruby-tools-mode myinit-ruby-tools-modes-hooks)

  (myinit-after-load 'ruby-tools
    ;; Remove keys from a minor-mode keymap
    ;; <http://stackoverflow.com/questions/7598433/how-to-remove-a-key-from-a-minor-mode-keymap-in-emacs#7598754>.
    (define-key ruby-tools-mode-map (kbd "C-'")  nil)
    (define-key ruby-tools-mode-map (kbd "C-\"") nil)
    (define-key ruby-tools-mode-map (kbd "C-:")  nil)
    (define-key ruby-tools-mode-map (kbd "C-;")  nil)
    (define-key ruby-tools-mode-map (kbd "#")    nil)

    (define-key ruby-tools-mode-map (my-kbd "m r :")
      'ruby-tools-to-symbol)))

;;; init-ruby-tools.el ends here
