(setq frame-title-format  ;; set title 
      '((:eval (if (buffer-file-name)
                   (file-truename (buffer-file-name))
                 (buffer-name)))" @ lambert's Emacs"))
