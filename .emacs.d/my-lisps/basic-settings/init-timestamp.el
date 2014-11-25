;;; init-timestamp.el --- 

;; Copyright 2012 
;;
;; Author: lambert_sun@NJ-LAMBERT-SUN <vangoals@gmail.com>
;; Version: $Id: init-timestamp.el,v 0.0 2012/11/21 14:26:43 lambert_sun Exp $
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
;;   (require 'init-timestamp)

;;; Code:

(provide 'init-timestamp)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require 'time-stamp)

(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S by %u"
      time-stamp-active t
      time-stamp-warn-inactive t)
(add-hook 'write-file-hooks 'time-stamp)

;;; init-timestamp.el ends here
