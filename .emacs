;; -*- Emacs-Lisp -*-
;;; .emacs ---
;; Time-stamp: <2013-02-01 10:27:50 by lambert_sun>

(defconst my-emacs-path  "~/.emacs.d/" "My Emacs config files")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "Configs wrote by myself.")
(defconst my-emacs-plugins-path     (concat my-emacs-path "plugins/") "Downloaded plugins.")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates.")
;; path for org files
(defconst my-emacs-org-doc-path "~/org-doc/" "My Emacs org doc file path.")

;; Add 'my-emacs-plugins-path' subdir to 'load-path'
(load (concat my-emacs-my-lisps-path "load-subdir"))
(my-add-subdirs-to-load-path my-emacs-plugins-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)

;; load my own lisps
(add-to-list 'load-path my-emacs-my-lisps-path)
;; load functions to load config
(require 'load-functions)
;; load basic settings
(require 'load-basic)
;; load font and color settings
(require 'load-font-color)
;; load plugins
(require 'load-plugins)
;; init python development environment
(require 'init-python)
;; set key mapping
(require 'keystroke)
