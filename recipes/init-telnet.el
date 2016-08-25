;;; init-telnet.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;;; Comint mode (which shell mode and sql mode based on)
;;; <http://www.emacswiki.org/emacs/ComintMode#toc3>.

(add-hook 'after-init-hook 'init-telnet)

(defun init-telnet ()
  "Init."

  (add-hook 'comint-mode-hook 'init-telnet--turn-on-history))

(defun init-telnet--turn-on-history ()
  "Set Telnet history file path and assign hook on sentinel event."

  (when (string-match "^*telnet" (buffer-name))
    (let ((process (get-buffer-process (current-buffer))))
      (when process
        (setq comint-input-ring-file-name "~/.emacs.var/inferior-telnet-history")
        (comint-read-input-ring)
        (set-process-sentinel process #'init-comint--write-history)))))

;;; init-telnet.el ends here