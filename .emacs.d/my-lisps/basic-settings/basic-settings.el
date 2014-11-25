;; =================== basic settings ====================
(setq frame-title-format  ;; set title 
      '((:eval (if (buffer-file-name)
                   (file-truename (buffer-file-name))
                 (buffer-name)))" @ lambert's Emacs"))
(setq column-number-mode t)  ;; show line number
(setq line-number-mode t)  ;; show column number
(setq x-select-enable-clipboard t)  ;; paste from outer supported

(require 'linum)  ;; line number in left
(eval-after-load "linum"
  '(progn
     (global-linum-mode)))
;; Always reserve 3-digit-width when line number is less than 100.
(setq linum-format "%3d")

;; hide tool bar, scroll bar
(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (tool-bar-lines . 0)
                            (fullscreen . 0)))

;; insert spaces instead of tabs
(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(setq show-paren-style 'parentheses)

(setq default-major-mode 'text-mode)  ;; set text-mode as default
(setq default-tab-width 4)  ;; set tab as 4 space
(fset 'yes-or-no-p 'y-or-n-p)  ;; ask with y/n, not yes/no

(setq kill-ring-max 200)  ;; set kill ring as 200

;; start time setting
(display-time-mode 1) 
(setq display-time-24hr-format t) ;; use 24 hours
(setq display-time-day-and-date t) ;; show date and time
(setq display-time-interval 60)

(setq inhibit-startup-message t)

(global-font-lock-mode t)  ;; highlight

(provide 'basic-settings)
