(provide 'init-anything)

(require 'anything-match-plugin)
(require 'anything-config)

(setq anything-idle-delay 1.0)                        ;; set 
(setq anything-quick-update t)                        ;不显示提示窗口外的变量, 加快刷新速度
(setq anything-candidate-number-limit 10000)          ;候选数量限制
(setq anything-c-yas-display-key-on-candidate t)      ;补全 YAsnippet 时显示 YAsnippet 的名称
(setq anything-etags-enable-tag-file-dir-cache t)     ;使用缓存的tag文件
(setq anything-etags-cache-tag-file-dir "~/.emacs.d/plugins/anything/") ;tag缓存文件的目录

(setq anything-sources                  ;Anything 源列表
      (list
       anything-c-source-ffap-guesser             ;光标处的文件
       anything-c-source-buffers                  ;Buffer
       anything-c-source-recentf                  ;最近打开的文件列表
       ;;anything-c-source-yasnippet                ;代码补全别名
       anything-c-source-file-name-history        ;文件名历史
       anything-c-source-locate                   ;本地文件
       anything-c-source-files-in-current-dir+    ;当前目录的文件
       anything-c-source-extended-command-history ;Emacs命令历史
       ;; anything-c-source-info-elisp               ;Info Elisp
       ;; anything-c-source-info-cl                  ;Info Common-Lisp
       ;; anything-c-source-info-pages               ;Info Pages
       anything-c-source-fixme                    ;FIX ME
       anything-c-source-semantic                 ;Sematic Tag
       anything-c-source-etags-select             ;etags
       ;;anything-c-source-gtags-select             ;Gtags
       anything-c-source-emacs-commands           ;Emacs 命令相关的
       anything-c-source-complex-command-history  ;复杂命令历史
       ;;anything-c-source-complete-shell-history   ;Shell历史
       anything-c-source-occur                    ;occur 搜索, (后面一点, 增加性能)
       ;;anything-c-source-man-pages                ;man
       anything-c-source-emacs-process            ;进程
       anything-c-source-call-source              ;call source
       ;;anything-c-source-customize-face           ;自定义颜色
       anything-c-source-bbdb                     ;bbdb
       ;;anything-c-source-colors                   ;颜色
       anything-c-source-buffer-not-found         ;创建buffer
       anything-c-source-tracker-search           ;Tracker桌面搜索
       anything-c-source-calculation-result       ;计算结果
       anything-c-source-evaluation-result        ;执行表达式结果
       anything-c-source-kill-ring                ;Kill ring
       ))
