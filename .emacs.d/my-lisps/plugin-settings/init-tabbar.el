;;; init-tabbar.el --- 
;; Time-stamp: <Tue Oct  9 12:45:06 2012 (cst)>

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


(provide 'init-tabbar)


;; required features
(require 'tabbar-extension)

(defun tarbar-setting ()
  "setting for tabbar mode"
  (tabbar-mode 1)
  (lazy-set-key
   '(("<f10>"   . tabbar-backward)
     ("<f9>"    . tabbar-forward)
     ("C-<f10>" . tabbar-backward-group)
     ("C-<f9>"  . tabbar-forward-group))
   tabbar-mode-map))

(eval-after-load "tabbar"
  '(tarbar-setting))

;;; init-tabbar.el ends here
