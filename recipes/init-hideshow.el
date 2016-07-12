;;; init-hideshow.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; Hide Show minor mode (a-la folding)
;; <http://www.emacswiki.org/emacs/HideShow>.
(my-init--hook
  ;; (my-init--add-mode-to-hooks 'hs-minor-mode '(ruby-mode-hook))

  (my-init--after-load 'hs-minor-mode
    ;; (define-key hs-minor-mode-map (kbd \"TAB\") 'hs-toggle-hiding)

    ;; Folding Ruby code (hide show minor mode).
    (add-to-list 'hs-special-modes-alist
                 '(ruby-mode
                   "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
                   (lambda (arg) (ruby-end-of-block)) nil))))

;;; init-hideshow.el ends here
