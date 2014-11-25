(add-to-list 'load-path (concat my-emacs-plugins-path "auto-complete-1.3.1/"))
;; set up auto-complete
(require 'python)
(require 'auto-complete)
(global-auto-complete-mode t)

(add-to-list 'load-path (concat my-emacs-plugins-path "yasnippet/"))

;; setting up yasnippet
(require 'yasnippet)

(defun yasnippet-unbind-trigger-key ()
  "Unbind 'yas/trigger-key'."
  (let ((key yas/trigger-key))
    (setq yas/trigger-key nil)
    (yas/trigger-key-reload key)))

(defun yasnippet-reload-after-save ()
  (let* ((bfn (expand-file-name (buffer-file-name)))
         (root (expand-file-name yas/root-directory)))
    (when (string-match (concat "^" root) bfn)
      (yas/load-snippet-buffer))))

(defun yasnippet-settings ()
  "settings for yasnippet"
  (setq yas/root-directory (concat my-emacs-plugins-path "yasnippet/snippets"))
  (setq yas/snippet-dirs yas/root-directory)
  (yas/load-directory yas/root-directory)
  (yasnippet-unbind-trigger-key)
  (add-hook 'after-save-hook 'yasnippet-reload-after-save)
  (yas/global-mode 1))

(eval-after-load "yasnippet"
  '(yasnippet-settings))

(provide 'init-python)
