;; -*- Emacs-Lisp -*-
;;; dired-image.el ---
;; Time-stamp: <Tue Oct  9 10:44:30 2012 (cst)>

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
;;   (require 'dired-image)

;;; Code:


(provide 'dired-image)


;;; require features:
(require 'image-dired)

(defun image-dired-display-thumbs-new (&optional arg append do-not-pop)
  "redefinition of image-dired-display-thumbs"
  (interactive "P")
  (let ((buf (image-dired-create-thumbnail-buffer))
        thumb-name files dired-buf)
    (if arg
        (setq files (list (dired-get-filename)))
      (setq files (dired-get-marked-files))
      (dired-unmark-all-marks))
    (setq dired-buf (current-buffer))
    (with-current-buffer buf
      (let ((inhibit-read-only t))
        (if (not append)
            (erase-buffer)
          (goto-char (point-max)))
        (mapc
         (lambda (curr-file)
           (setq thumb-name (image-dired-thumb-name curr-file))
           (if (and (not (file-exists-p thumb-name))
                    (not (= 0 (image-dired-create-thumb curr-file thumb-name))))
               (message "Thumb could not be created for file %s" curr-file)
             (image-dired-insert-thumbnail thumb-name curr-file dired-buf)))
         files))
      (cond ((eq 'dynamic image-dired-line-up-method)
             (image-dired-line-up-dynamic))
            ((eq 'fixed image-dired-line-up-method)
             (image-dired-line-up))
            ((eq 'interactive image-dired-line-up-method)
             (image-dired-line-up-interactive))
            ((eq 'none image-dired-line-up-method)
             nil)
            (t
             (image-dired-line-up-dynamic))))
    (if do-not-pop
        (display-buffer image-dired-thumbnail-buffer)
      (pop-to-buffer image-dired-thumbnail-buffer))))

(defun view-image-dired ()
  "Make a preview buffer for all images in DIR and display it"
  ;;  (interactive "DDir: ")
  ;;  (dired dir)
  (interactive)
  (dired-mark-files-regexp (image-file-name-regexp))
  (let ((files (dired-get-marked-files)))
    (if (or (<= (length files) image-dired-show-all-from-dir-max-files)
            (and (> (length files) image-dired-show-all-from-dir-max-files)
                 (y-or-n-p
                  (format
                   "Directory contains more than %d image files.  Proceed? "
                   image-dired-show-all-from-dir-max-files))))
        (progn
          (image-dired-display-thumbs-new)
          (delete-other-windows))
      (message "Cancelled."))))

(defun image-dired-thumbnail-display ()
  "Display original image for thumbnail at point using feh."
  (interactive)
  (let ((dir (file-name-directory
              (image-dired-original-file-name)))
        (file (image-dired-original-file-name)))
    (if (not (image-dired-image-at-point-p))
        (message "No thumbnail at point")
      (if (not dir)
          (message "No original dir name found")
        (call-process shell-file-name nil nil nil shell-command-switch
                      (format "feh -g 1024x768 -B black -Y \"%s\" --start-at \"%s\"" dir file))))))

(defun display-image-with-feh ()
  "Display image in current dir with feh"
  (interactive)
  (let ((dir (file-name-directory
              (dired-get-file-for-visit)))
        (file (dired-get-file-for-visit)))
    (call-process shell-file-name nil nil nil shell-command-switch
                  (format "feh -r -g 1024x768 -B black -Y \"%s\" --start-at \"%s\"" dir file))))

(add-hook 'dired-mode-hook
          (function
           (lambda ()
             (setq image-dired-show-all-from-dir-max-files 500)
             (define-key image-dired-thumbnail-mode-map "n" 'image-dired-forward-image)
             (define-key image-dired-thumbnail-mode-map "f" 'image-dired-forward-image)
             (define-key image-dired-thumbnail-mode-map "p" 'image-dired-backward-image)
             (define-key image-dired-thumbnail-mode-map "b" 'image-dired-backward-image)
             (define-key image-dired-thumbnail-mode-map "N" 'image-dired-next-line)
             (define-key image-dired-thumbnail-mode-map "P" 'image-dired-previous-line)
             (define-key image-dired-thumbnail-mode-map [return] 'image-dired-thumbnail-display))))

;;; dired-image.el ends here
