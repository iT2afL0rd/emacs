;; -*- Emacs-Lisp -*-
;;; wuxch-dired-extension.el ---
;; Time-stamp: <Mon Oct  8 10:50:18 2012 (cst)>

;; Copyright (C) 2012 zhengyu li
;;
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

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'wuxch-dired-modified)

;; ChangeLog Sat Sep 29 2012
;; Based on wuxch-dired.el and add some other features

;;; Code:


(provide 'wuxch-dired-extension)


;;; require features:

(require 'cl)
(require 'dired+)
(require 'wdired)
(require 'ls-lisp+)
(require 'dired-aux)
(require 'find-dired+)
(require 'dired-isearch)
(require 'dired-details+)

(defface wuxch-dired-doc-face
  '((t (:foreground "red2"))) "doc files")
(defface wuxch-dired-elisp-face
  '((t (:foreground "DeepPink1"))) "elisp files")
(defface wuxch-dired-exe-face
  '((t (:foreground "Orange1"))) "exe files")
(defface wuxch-dired-media-face
  '((t (:foreground "cyan1"))) "avi files")

(defvar dired-quickview-buffer nil)
(defvar static-wuxch-first-line-of-buffer)
(defvar static-wuxch-max-line-of-buffer)
(defconst wuxch-dired-add-addtional-line 1)

(defun wuxch-dired-move-beginning-of-line (arg)
  ""
  (interactive "p")
  (move-beginning-of-line arg)
  (dired-move-to-filename))

(defun wuxch-dired-move-end-of-line (arg)
  ""
  (interactive "p")
  (move-end-of-line arg)
  ;; (dired-move-to-filename)
  )

(defun wuxch-dired-load-hook ()
  "settings for dired mode"
  (setq hl-line-sticky-flag nil)
  (hl-line-mode))

(defun wuxch-dired-mode-hook-fun ()
  ""
  (wuxch-dired-set-doc-face)
  (wuxch-dired-set-elisp-face)
  (wuxch-dired-set-exe-face)
  (wuxch-dired-set-media-face))

(defun wuxch-dired-set-doc-face ()
  "wuxch-dired-set-doc-face:"
  (font-lock-add-keywords
   nil '(("^  .*\\.\\(tex\\|doc\\|xls\\|txt\\|org\\|ppt\\|html\\)$"
          (".+"
           (dired-move-to-filename)
           nil
           (0 'wuxch-dired-doc-face)))))
  )

(defun wuxch-dired-set-elisp-face ()
  "wuxch-dired-set-elisp-face:"
  (font-lock-add-keywords
   nil '(("^  .*\\.\\(el\\)$"
          (".+"
           (dired-move-to-filename)
           nil
           (0 'wuxch-dired-elisp-face)))))
  )

(defun wuxch-dired-set-exe-face ()
  "wuxch-dired-set-exe-face:"
  (font-lock-add-keywords
   nil '(("^  .*\\.\\(\\(exe\\)\\|\\(EXE\\)\\)$"
          (".+"
           (dired-move-to-filename)
           nil
           (0 'wuxch-dired-exe-face)))))
  )

(defun wuxch-dired-set-media-face ()
  "wuxch-dired-set-media-face:"
  (font-lock-add-keywords
   nil '(("^  .*\\.\\(pdf\\|avi\\|mkv\\|rmvb\\|rm\\|mp4\\|mp3\\|MP3\\|wmv\\|wma\\|m4v\\|mov\\)$"
          (".+"
           (dired-move-to-filename)
           nil
           (0 'wuxch-dired-media-face)))))
  )

(defun do-wuxch-get-file-name (with-full-path only-path)
  ""
  (let ((clipboard))
    (if only-path
        (if (equal 'windows-nt system-type)
            (setq clipboard (dired-replace-in-string "/" "\\" (dired-current-directory)))
          (setq clipboard (dired-current-directory)))
      (let ((file (dired-get-file-for-visit)))
        (if with-full-path
            (progn
              (if (file-directory-p file)
                  (setq file (concat file "/")))
              (if(equal 'windows-nt system-type)
                  (setq clipboard (dired-replace-in-string "/" "\\" file))
                (setq clipboard file)))
          (if (file-directory-p file)
              (setq clipboard (file-name-nondirectory file))
            (setq clipboard (file-name-nondirectory file))))))

    (kill-new clipboard)
    (message "copy string \"%s\" to clipboard" clipboard)))

(defun wuxch-get-file-name-with-path ()
  ""
  (interactive)
  (do-wuxch-get-file-name t nil)
  )

(defun wuxch-get-file-name-without-path ()
  ""
  (interactive)
  (do-wuxch-get-file-name nil nil)
  )

(defun wuxch-get-file-name-only-path ()
  ""
  (interactive)
  (do-wuxch-get-file-name t t)
  )

(defun wuxch-dired-tab-process ()
  "open a new dired window same as the current one"
  (interactive)
  (let ((buf (current-buffer)))
    (if (one-window-p)
        (progn
          (split-window-horizontally)
          (other-window 1)
          (set-window-buffer (selected-window) buf))
      (other-window 1))))

(defun wuxch-get-first-line-of-dired ()
  ""
  (if (local-variable-p 'static-wuxch-first-line-of-buffer)
      (progn)
    (progn
      (setq-default static-wuxch-first-line-of-buffer
                    (wuxch-get-first-line-of-dired-by-search-double-dot))
      (make-local-variable 'static-wuxch-first-line-of-buffer)))
  static-wuxch-first-line-of-buffer)

(defun update-dired-static-variables ()
  ""
  (save-excursion
    (if (local-variable-p 'static-wuxch-first-line-of-buffer)
        (kill-local-variable 'static-wuxch-first-line-of-buffer))
    (if (local-variable-p 'static-wuxch-max-line-of-buffer)
        (kill-local-variable 'static-wuxch-max-line-of-buffer))
    (setq-default static-wuxch-first-line-of-buffer
                  (wuxch-get-first-line-of-dired-by-search-double-dot))
    (make-local-variable 'static-wuxch-first-line-of-buffer)
    (setq-default static-wuxch-max-line-of-buffer (wuxch-dired-max-line-by-count))
    (make-local-variable 'static-wuxch-max-line-of-buffer)))

(defun wuxch-dired-revert ()
  ""
  (interactive)
  (revert-buffer)
  (update-dired-static-variables)
  ;;  (goto-line (wuxch-get-first-line-of-dired))
  (dired-move-to-filename))

(defun wuxch-dired-max-line ()
  ""
  (if (local-variable-p 'static-wuxch-max-line-of-buffer)
      (progn)
    (progn
      (setq-default static-wuxch-max-line-of-buffer (wuxch-dired-max-line-by-count))
      (make-local-variable 'static-wuxch-max-line-of-buffer)))
  (+ static-wuxch-max-line-of-buffer 0))

(defun wuxch-dired-max-line-by-count ()
  ""
  (+ (count-lines (point-min) (point-max)) wuxch-dired-add-addtional-line))

(defun wuxch-get-first-line-of-dired-by-search-double-dot ()
  ""
  (goto-char (point-min))
  (if (search-forward ".." nil t)
      (+ (line-number-at-pos) 1)
    (+ (line-number-at-pos) 1)))

(defun wuxch-dired-goto-first-line ()
  "moving to the last line"
  (interactive)
  (goto-line (wuxch-get-first-line-of-dired))
  (dired-move-to-filename))

(defun wuxch-dired-goto-last-line ()
  "moving to the last line"
  (interactive)
  (goto-line (- (wuxch-dired-max-line) 1))
  (dired-move-to-filename))

(defun wuxch-dired-previous-line (arg)
  "moving to the previous line with wrapping"
  (interactive "p")
  (dired-previous-line arg)
  (let ((temp-current-line (line-number-at-pos))
        (temp-max-line (wuxch-dired-max-line))
        (temp-first-line-of-dried (wuxch-get-first-line-of-dired)))
    (goto-line temp-current-line)
    (dired-move-to-filename)
    (if (eq temp-current-line (- temp-first-line-of-dried 1))
        (progn
          (goto-line (- temp-max-line 1))
          (dired-move-to-filename)))))

(defun wuxch-dired-next-line (arg)
  "moving to the next line with wrapping"
  (interactive "p")
  (dired-next-line arg)
  (let ((temp-current-line (line-number-at-pos))
        (temp-max-line (wuxch-dired-max-line)))
    (if (eq temp-current-line temp-max-line)
        (progn
          (goto-line (wuxch-get-first-line-of-dired))
          (dired-move-to-filename)))
    )
  )

(defun wuxch-dired-create-directory (directory)
  "Create a directory called DIRECTORY, with current date as suffix"
  (interactive
   (list (read-file-name "Create directory(with Date as suffix)): "
                         (dired-current-directory))))
  (let ((expanded (directory-file-name
                   (expand-file-name
                    (concat directory (format-time-string "%Y%m%d"))))))
    (make-directory expanded)
    (dired-add-file expanded)
    (dired-move-to-filename)))

(defun his-dired-sort ()
  "show directories first in dired mode"
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))

(defun dired-sort-by-size ()
  "sort by Size"
  (interactive)
  (dired-sort-other (concat dired-listing-switches "S")))

(defun dired-sort-by-extension ()
  "sort by eXtension"
  (interactive)
  (dired-sort-other (concat dired-listing-switches "X")))

(defun dired-sort-by-time ()
  "sort by Time"
  (interactive)
  (dired-sort-other (concat dired-listing-switches "t")))

(defun dired-sort-by-name ()
  "sort by Name"
  (interactive)
  (dired-sort-other dired-listing-switches))

(defun dired-scroll-half-page-backward ()
  "Scroll backward a \"half page\" lines in dired-mode.
See also `dired-scroll-half-page-forward'."
  (interactive)
  (call-interactively 'View-scroll-half-page-backward)
  (dired-move-to-filename))

(defun dired-scroll-half-page-forward ()
  "Scroll forward a \"half page\" lines in dired-mode.
See also `dired-scroll-half-page-backward'."
  (interactive)
  (call-interactively 'View-scroll-half-page-forward)
  (dired-move-to-filename))

(defun dired-scroll-up ()
  "Scroll up in dired-mode.
See also `dired-scroll-down'."
  (interactive)
  (call-interactively 'scroll-up)
  (dired-move-to-filename))

(defun dired-scroll-down ()
  "Scroll down in dired-mode.
See also `dired-scroll-down'."
  (interactive)
  (call-interactively 'scroll-down)
  (dired-move-to-filename))

(defun dired-filter-regexp (regexp &optional arg)
  "dired mode中只显示后缀名符合正则表达式的文件和目录"
  (interactive
   (list (dired-read-regexp
          (concat (if current-prefix-arg "只显示不" "只显示") "匹配的后缀名(regexp): "))
         current-prefix-arg))
  (dired-mark-files-regexp regexp)
  (or arg (if (fboundp 'dired-do-toggle) (dired-do-toggle) (dired-toggle-marks)))
  (dired-do-kill-lines))

(defun dired-filter-extension (extension &optional arg)
  "dired mode中只显示后缀名为EXTENSION的文件和目录"
  (interactive
   (list (read-from-minibuffer
          (concat "只显示后缀名为" (if current-prefix-arg "" "") ": "))
         current-prefix-arg))
  (dired-filter-regexp (concat "\\." extension "\\'") arg))

(defun dired-quickview ()
  "类似TC的一个命令,可以使用同一个buffer浏览多个文件，每次打开新文件就把前一个buffer关了"
  (interactive)
  (if (buffer-live-p dired-quickview-buffer)
      (kill-buffer dired-quickview-buffer))
  (setq dired-quickview-buffer
        (find-file-noselect (dired-get-file-for-visit)))
  (display-buffer dired-quickview-buffer))

(defun dired-up-directory-same-buffer ()
  "Goto parent directory in the smae buffer."
  (interactive)
  (let* ((dir (dired-current-directory))
         (dir-file-name (directory-file-name dir)))
    (unless (string= dir dir-file-name)
      (find-alternate-file "..")
      (dired-goto-file dir-file-name))))

;;; wuxch-dired-extension.el ends here
