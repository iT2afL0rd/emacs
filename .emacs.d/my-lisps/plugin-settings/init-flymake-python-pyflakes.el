;;; init-flymake-python-pyflakes.el --- 
;; Time-stamp: <2013-04-19 14:29:18 by lambert_sun>

;; Copyright 2013 
;;
;; Author: Lambert Sun <vangoals@gmail.com>
;; Version: $Id: init-flymake-python-pyflakes.el,v 0.0 2013/04/19 06:20:47 lambert_sun Exp $
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
;;   (require 'init-flymake-python-pyflakes)

;;; Code:

(provide 'init-flymake-python-pyflakes)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")



;;; init-flymake-python-pyflakes.el ends here
