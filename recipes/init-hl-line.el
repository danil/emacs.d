;;; init-hl-line.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
;; Keywords: convenience
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

(my-init--hook
  ;; (global-hl-line-mode)
  ;; (make-variable-buffer-local 'global-hl-line-mode)

  (my-init--after-load 'hl-line
    (set-face-background 'highlight nil)
    (set-face-attribute hl-line-face nil :inverse-video t))

  ;; (add-hook 'change-major-mode-hook (lambda ()
  ;;                                     (interactive)
  ;;                                     (make-local-variable 'global-hl-line-mode)
  ;;                                     (setq global-hl-line-mode -1)))

  ;; (if global-hl-line-mode
  ;;     (dolist (hook '(ediff-mode-hook term-mode-hook))
  ;;       ;; <http://emacsblog.org/2007/04/09/highlight-the-current-line/#comment-284>.
  ;;       (add-hook hook (lambda ()
  ;;                        (interactive)
  ;;                        (make-local-variable 'global-hl-line-mode)
  ;;                        (setq global-hl-line-mode)))))

  )

;;; init-hl-line.el ends here
