;;; init-template.el --- 
;; Time-stamp: <Tue Oct  9 12:56:37 2012 (cst)>

;; Copyright (C) 2012  zhengyu li

;; Author: zhengyu li <lizhengyu419@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:


(provide 'init-template)


;; required features
(require 'ido)
(require 'template)

(defun template-settings ()
  "settings for tempalte"
  (template-initialize)       ;;; initialize template package
  (setq template-auto-insert 'query)
  (add-to-list 'template-find-file-commands 'ido-exit-minibuffer)
  (setq template-default-directories  (cons my-emacs-templates-path template-default-directories))
  (lazy-set-key
   '(("C-c C-f" . template-expand-template))))

(eval-after-load "template"
  '(template-settings))

;;; init-template.el ends here
