;;; init-org-mode.el --- 
;; Time-stamp: <2012-12-05 10:00:55 by lambert_sun>

;; Copyright 2012 
;;
;; Author: Lambert Sun <vangoals@gmail.com>
;; Version: $Id: init-org-mode.el,v 0.0 2012/11/23 12:11:15 lambert_sun Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-org-mode)

;;; Code:

(provide 'init-org-mode)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; required features
(require 'iimage)

(setq org-directory  my-emacs-org-doc-path)
(setq org-tasks-file (concat org-directory "misc/agenda.org"))
(setq org-routines-file (concat org-directory "misc/routines.org"))
(setq org-notes-file (concat org-directory "misc/notes.org"))
(setq org-tricks-file (concat org-directory "misc/trick-notes.org"))
(setq org-weather-file (concat org-directory "/misc/weather.org"))
(setq diary-file (concat org-directory "misc/diary.org"))
(setq org-log-done 'note)                  ;log type
(setq diary-file diary-file)               ;diary file
(setq org-clock-idle-time 10)              ;ilde time to resolve
(setq org-enable-table-editor 1)           ;use built-in table editor
(setq org-agenda-include-diary t)          ;integrate diary
(setq org-clock-persist 'history)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-agenda-exporter-settings
      '((ps-bumber-of-columns 2)
        (ps-landscape-mode t)
        (org-agenda-add-entry-text-maxlines 5)
        (htmlize-output-type 'css)))
(setq org-capture-templates
      `(("t" "Todo" entry (file+headline ,org-tasks-file "Tasks")
         "* TODO %?\n %i\n %a")
        ("r" "Routines" entry (file+headline ,org-routines-file "Routines")
         "* TODO %?\n %i\n %a")
        ("n" "Notes" entry (file+headline ,org-notes-file "Notes")
         "* %^{Title}\n %i\n %a")
        ("T" "TrickNotes" entry (file+headline ,org-tricks-file "Tricks")
         "* %^{Title}\n %i\n %a")))
(setq org-agenda-files
      (list org-routines-file
            org-tasks-file
            org-notes-file
            org-tricks-file
            org-weather-file
            diary-file))
(setq org-todo-keywords
      '((sequence "|" "CANCELED")
        (sequence "TODO" "|" "DONE")))

(org-clock-persistence-insinuate)
(org-remember-insinuate)                   ;Org-remeber initialization
(org-babel-do-load-languages 'org-babel-load-languages '((C . t)
                                                         (sh . t)
                                                         (ditaa . t)
                                                         (python . t)
                                                         (emacs-lisp . t)))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'iimage-mode-image-regex-alist
             (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
                           "\\)\\]")  1))
(add-hook 'message-mode-hook 'turn-on-orgtbl) ;enable orgtbl in Text and Mail mode
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
 (add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t)
            ;;(org-toggle-iimage-in-org)
            ))

;; global key bindings
(lazy-set-key
 '(("C-c o l" . org-store-link)
   ("C-c o c" . org-capture)
   ("C-c o a" . org-agenda)
   ("C-c o b" . org-iswitchb)))

;; local key bindings
;;(lazy-set-key
;; '(("M-n" . outline-next-visible-heading)
;;   ("M-p" . outline-previous-visible-heading)
;;   ("C-M-p" . org-backward-same-level)
;;   ("C-M-n" . org-forward-same-level)
;;   ("C-M-g" . org-plot/gnuplot))
;; org-mode-map)

(lazy-set-key
 '(("m" . org-agenda-month-view))
 org-agenda-mode-map)

;;; init-org-mode.el ends here
