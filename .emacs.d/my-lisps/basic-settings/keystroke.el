;; set F8 to open .emacs
(global-set-key [f8] (lambda ()
                        (interactive)
                        (find-file "~/.emacs")))

;; =========== shorcut for coding ===========

(global-set-key "\M-("  ;; M-( input (), and arrow behind (
                '(lambda ()
                   (interactive)
                   (insert "()")
                   (backward-char)))

(global-set-key "\M-)"  ;; M-) input (), and arrow behind )
                (lambda ()
                  (interactive)
                  (insert "()")))

(global-set-key "\M-["  ;; M-[ input []
                '(lambda ()
                   (interactive)
                   (insert "[]")
                   (backward-char)))

(global-set-key "\M-\"" ;; M-" input ""
                (lambda ()
                  (interactive)
                  (insert "\"\"")
                  (backward-char)))

(global-set-key "\M-'" ;; M-' input ''
                (lambda ()
                  (interactive)
                  (insert "''")
                  (backward-char)))

;; delete current line
(defun delete-cur-line-in-anypos()
  "Delete current line in any position of the line."
  (interactive)
  (progn
    (move-beginning-of-line 1)
    (kill-line 1)))
;; set C-k to delete cur line
(global-set-key (kbd "C-k") 'delete-cur-line-in-anypos)

;; copy current line
(defun copy-current-line-in-anypos()
  "Copy current line in any position of the line."
  (interactive)
  (progn
    (move-beginning-of-line 1)
    (kill-line 1)
    (yank)))

(defun smart-copy()
  "if mark set, copy current region; else copy current line."
  (interactive)
  (if mark-active (call-interactively 'kill-ring-save) (call-interactively 'copy-current-line-in-anypos)))
;; set C-' to smart-copy
(global-set-key (kbd "C-'") 'smart-copy)
;; set C-; to set-mark-command
(global-set-key (kbd "C-;") 'set-mark-command)

;; set C-j to goto-line
(global-set-key (kbd "C-j") 'goto-line)

;; windows change
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

(provide 'keystroke)
