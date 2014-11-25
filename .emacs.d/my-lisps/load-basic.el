;;; load-basic.el --- 

;; Copyright 2012 
;;
;; Author: Lambert Sun <vangoals@gmail.com>
;; Version: $Id: load-basic.el,v 0.0 2012/11/21 14:39:38 lambert_sun Exp $
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
;;   (require 'load-basic)

;;; Code:

(provide 'load-basic)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; load basic settings
(require 'basic-settings)

;; time stamp settings
(require 'init-timestamp)

;; calendar settings
(require 'init-calendar)

;;; load-basic.el ends here
