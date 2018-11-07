;;; init-gotest.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-gotest)
(defun myinit-gotest ()
  "My init."
  (if (boundp 'dired-mode-map) (myinit-gotest--customize-keys dired-mode-map)
    (with-eval-after-load 'dired (myinit-gotest--customize-keys dired-mode-map)))
  (if (boundp 'shell-mode-map) (myinit-gotest--customize-keys shell-mode-map)
    (with-eval-after-load 'shell (myinit-gotest--customize-keys shell-mode-map)))
  (if (boundp 'go-mode-map) (myinit-gotest--customize-keys go-mode-map)
    (with-eval-after-load 'go-mode (myinit-gotest--customize-keys go-mode-map)))
  (add-hook 'go-test-mode-hook 'myinit-gotest--setup)
  (add-hook 'compilation-finish-functions 'myinit-gotest--teardown))

(defun myinit-gotest--customize-keys (key-map)
  (define-key key-map (kbd "C-c , v") 'go-test-current-file)
  (define-key key-map (kbd "C-c , s") 'go-test-current-test)
  (define-key key-map (kbd "C-c , a") 'go-test-current-project)
  (define-key key-map (kbd "C-c , b") 'go-test-current-benchmark)
  (define-key key-map (kbd "C-c , x") 'go-run))

(defun myinit-gotest--setup ()
  ;; Set environment variables
  ;; Go runtime database driver (for example
  ;; PostgreSQL db driver: `TZ=UTC go test -run='TestYourFunction' .`)
  ;; should be in same timezone with database (for example
  ;; PostgreSQL: `SHOW timezone; SET TIME ZONE 'UTC';`)
  ;; <https://groups.google.com/forum/#!topic/Golang-nuts/4xSYtsLN39g>
  (setenv "TZ" "UTC"))

(defun myinit-gotest--teardown (buffer desc)
  ;; Unset environment variables
  (when (equal major-mode 'go-test-mode)
    (setenv "TZ" nil)))

;;; init-gotest.el ends here
