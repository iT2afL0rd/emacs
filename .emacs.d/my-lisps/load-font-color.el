;;; load-font-color.el --- 
;; Time-stamp: <2012-11-22 13:23:09 by lambert_sun>

;; Copyright 2012 
;;
;; Author: Lambert Sun <vangoals@gmail.com>
;; Version: $Id: load-font-color.el,v 0.0 2012/11/22 05:20:28 lambert_sun Exp $
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
;;   (require 'load-font-color)

;;; Code:

(provide 'load-font-color)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; load font and color themm settings
(if (eq system-type 'windows-nt)
    (require 'font-color))
(if (eq system-type 'windows-nt)
    (require 'lambert-putty))
(if (eq system-type 'windows-nt)
    (require 'init-mode-line))


;;; load-font-color.el ends here
