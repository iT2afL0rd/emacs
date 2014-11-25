;; Setting English Font
(set-face-attribute
 'default nil :font "Consolas 12" :height 110) 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Microsoft Yahei" :size 13)))

(add-to-list 'load-path (concat my-emacs-plugins-path "color-theme-6.6.0/"))
;; set up color-theme for emacs
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-gray30)))

(provide 'font-color)
