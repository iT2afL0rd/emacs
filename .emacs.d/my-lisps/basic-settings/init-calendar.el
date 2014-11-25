;;; init-calendar.el --- 
;; Time-stamp: <2012-11-22 22:42:34 by lambert_sun>

;; Copyright 2012 
;;
;; Author: Lambert Sun <vangoals@gmail.com>
;; Version: $Id: init-calendar.el,v 0.0 2012/11/22 14:38:55 lambert_sun Exp $
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
;;   (require 'init-calendar)

;;; Code:

(provide 'init-calendar)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require 'cal-china-x)

(defun calendar-settings()
  (setq mark-holidays-in-calendar t)
  (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
  (setq calendar-holidays (append cal-china-x-important-holidays calendar-holidays)))

(eval-after-load "calendar"
  '(calendar-settings))

;;; init-calendar.el ends here
