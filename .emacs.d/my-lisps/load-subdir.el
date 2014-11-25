;;; LzySubdir.el ---
;; Time-stamp: <Tue Oct  9 13:09:56 2012 (cst)>

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
;;   (require 'LzySubdir)

;;; Code:


(provide 'LzySubdir)


;;; required features

(defun my-add-subdirs-to-load-path (dir)
  "add all subdirs into load-path"
  (interactive)
  (let ((default-directory (concat dir "/")))
    (add-to-list 'load-path dir)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))

;; Fix bug of `normal-top-level-add-subdirs-to-load-path'
;; which can not add directory which name end with ".elc?"
;; copy from emacs23 startup.el and modify it
(defun normal-top-level-add-subdirs-to-load-path ()
  "Add all subdirectories of current directory to `load-path'.
 More precisely, this uses only the subdirectories whose names
start with letters or digits; it excludes any subdirectory named `RCS'
or `CVS', and any subdirectory that contains a file named `.nosearch'."
  (let (dirs
        attrs
        (pending (list default-directory)))
    ;; This loop does a breadth-first tree walk on DIR's subtree,
    ;; putting each subdir into DIRS as its contents are examined.
    (while pending
      (push (pop pending) dirs)
      (let* ((this-dir (car dirs))
             (contents (directory-files this-dir))
             (default-directory this-dir)
             (canonicalized (if (fboundp 'untranslated-canonical-name)
                                (untranslated-canonical-name this-dir))))
        ;; The Windows version doesn't report meaningful inode
        ;; numbers, so use the canonicalized absolute file name of the
        ;; directory instead.
        (setq attrs (or canonicalized
                        (nthcdr 10 (file-attributes this-dir))))
        (unless (member attrs normal-top-level-add-subdirs-inode-list)
          (push attrs normal-top-level-add-subdirs-inode-list)
          (dolist (file contents)
            ;; The lower-case variants of RCS and CVS are for DOS/Windows.
            (unless (member file '("." ".." "RCS" "CVS" "rcs" "cvs"))
              (when (and (string-match "\\`[[:alnum:]]" file)
                         ;; Avoid doing a `stat' when it isn't necessary
                         ;; because that can cause trouble when an NFS server
                         ;; is down.
                         (file-directory-p file))
                (let ((expanded (expand-file-name file)))
                  (unless (file-exists-p (expand-file-name ".nosearch"
                                                           expanded))
                    (setq pending (nconc pending (list expanded)))))))))))
    (if (equal window-system 'w32)
        (setq load-path (append (nreverse dirs) load-path))
      (normal-top-level-add-to-load-path (cdr (nreverse dirs))))))

;;; LzySubdir.el ends here
