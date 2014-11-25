;; -*- coding: utf-8; -*-
;;; init-mode-line.el --- 
;; Time-stamp: <2012-11-22 22:38:26 by lambert_sun>

;; Copyright 2012 
;;
;; Author: Lambert Sun <vangoals@gmail.com>
;; Version: $Id: init-mode-line.el,v 0.0 2012/11/22 05:04:32 lambert_sun Exp $
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
;;   (require 'init-mode-line)

;;; Code:

(provide 'init-mode-line)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(defun get-lines-4-mode-line ()
  "get line numbers of current buffer"
  (let ((lines (count-lines (point-min) (point-max))))
    (propertize
     (format " %dL " lines)
     'face '(:background "maroon2" :foreground "black")
     'mouse-face 'mode-line-highlight
     'help-echo (format "%d lines" lines))))

(defun get-size-indication-format ()
  (if (and transient-mark-mode mark-active)
      (propertize (format "(%dLs,%dCs)" (count-lines (region-beginning) (region-end)) (abs (- (mark t) (point))))
                  'face '(:background "SeaGreen" :foreground "black"))
    (propertize "@%I]"
                'face '(:background "chocolate1" :foreground "black"))))

(defun set-mode-line-format ()
  ;;  "set mode-line-format"
  (setq-default mode-line-position
                `(
                  (:eval (get-lines-4-mode-line))
                  (:eval
                   (propertize
                    "[%p"
                    'face '(:background "chocolate1" :foreground "black")
                    'local-map mode-line-column-line-number-mode-map
                    'mouse-face 'mode-line-highlight
                    'help-echo "Size indication mode\n\
                               mouse-1: Display Line and Column Mode Menu"))
                  ;; when region is active, then show the number of characters, else show buffer size
                  (:eval
                   (and transient-mark-mode mark-active
                        (propertize "]"
                                    'face '(:background "chocolate1" :foreground "black"))))
                  (:eval
                   (propertize (get-size-indication-format)
                               'local-map mode-line-column-line-number-mode-map
                               'mouse-face 'mode-line-highlight
                               'help-echo "Buffer position, mouse-1: Line/col menu"))
                  (:eval
                   ;; if line number mode is active, disable line-number-mode
                   (if (not linum-mode)
                       (if column-number-mode
                           (propertize
                            "(%l,%c)"
                            'local-map mode-line-column-line-number-mode-map
                            'mouse-face 'mode-line-highlight
                            'help-echo "Line number and Column number\n\
                                        mouse-1: Display Line and Column Mode Menu")
                         (propertize
                          " L%l"
                          'local-map mode-line-column-line-number-mode-map
                          'mouse-face 'mode-line-highlight
                          'help-echo "Line Number\n\
                                      mouse-1: Display Line and Column Mode Menu"))
                     (if column-number-mode
                         (propertize
                          " C%c "
                          'face '(:background "DeepSkyblue" :foreground "black")
                          'local-map mode-line-column-line-number-mode-map
                          'mouse-face 'mode-line-highlight
                          'help-echo "Column number\n\
                                      mouse-1: Display Line and Column Mode Menu"))))))
  (setq-default mode-line-format
                '(
                  (:eval
                   (if (eql buffer-read-only t)
                       (propertize " ⚡RO⚡ " 'face
                                   '(:background "grey20" :foreground "white"))
                     (propertize " ⚡W/R⚡ " 'face
                                 '(:background "deep sky blue" :foreground "black"))
                     ))
                  (:eval
                   (propertize "$%b$" 'face
                               (if (buffer-modified-p)
                                   '(:background "light sea green" :foreground "black" :slant italic)
                                 '(:background "light sea green" :foreground "black"))))
                  (:eval (propertize (if overwrite-mode " Ovr " " Ins ")
                                     'face '(:background "yellow" :foreground "black")
                                     'help-echo (concat "Buffer is in "
                                                        (if overwrite-mode "overwrite" "insert") " mode")))
                  mode-line-position
                  " "
                  "("
                  (:eval (propertize "%m" 'face '(:foreground "yellow" :weight bold)))
                  minor-mode-alist
                  ") "
                  which-func-format
                  " "
                  (:eval (propertize (format-time-string "%H:%M")
                                     'face '(:foreground "Springgreen" :weight bold)
                                     'help-echo
                                     (concat (format-time-string "%c; ")
                                             (emacs-uptime "Uptime:%hh"))))
                  ))
  )

(defun mode-line-settings ()
  "setings for modeline"
  (set-mode-line-format)
  (column-number-mode 1))

(eval-after-load "init-mode-line"
  '(mode-line-settings))


;;; init-mode-line.el ends here
