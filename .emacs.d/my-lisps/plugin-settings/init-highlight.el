(provide 'init-highlight)


;; required features
(require 'highlight-tail)

(defun highlight-tail-settings()
  "settings for highlight tail"
  (setq highlight-tail-colors
          '(("gold" . 0)
            ("red" . 35)))
  (highlight-tail-mode t))

(eval-after-load "init-highlight"
  '(highlight-tail-settings))
