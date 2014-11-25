(provide 'init-anything)

(require 'anything-match-plugin)
(require 'anything-config)

(setq anything-idle-delay 1.0)                        ;; set 
(setq anything-quick-update t)                        ;����ʾ��ʾ������ı���, �ӿ�ˢ���ٶ�
(setq anything-candidate-number-limit 10000)          ;��ѡ��������
(setq anything-c-yas-display-key-on-candidate t)      ;��ȫ YAsnippet ʱ��ʾ YAsnippet ������
(setq anything-etags-enable-tag-file-dir-cache t)     ;ʹ�û����tag�ļ�
(setq anything-etags-cache-tag-file-dir "~/.emacs.d/plugins/anything/") ;tag�����ļ���Ŀ¼

(setq anything-sources                  ;Anything Դ�б�
      (list
       anything-c-source-ffap-guesser             ;��괦���ļ�
       anything-c-source-buffers                  ;Buffer
       anything-c-source-recentf                  ;����򿪵��ļ��б�
       ;;anything-c-source-yasnippet                ;���벹ȫ����
       anything-c-source-file-name-history        ;�ļ�����ʷ
       anything-c-source-locate                   ;�����ļ�
       anything-c-source-files-in-current-dir+    ;��ǰĿ¼���ļ�
       anything-c-source-extended-command-history ;Emacs������ʷ
       ;; anything-c-source-info-elisp               ;Info Elisp
       ;; anything-c-source-info-cl                  ;Info Common-Lisp
       ;; anything-c-source-info-pages               ;Info Pages
       anything-c-source-fixme                    ;FIX ME
       anything-c-source-semantic                 ;Sematic Tag
       anything-c-source-etags-select             ;etags
       ;;anything-c-source-gtags-select             ;Gtags
       anything-c-source-emacs-commands           ;Emacs ������ص�
       anything-c-source-complex-command-history  ;����������ʷ
       ;;anything-c-source-complete-shell-history   ;Shell��ʷ
       anything-c-source-occur                    ;occur ����, (����һ��, ��������)
       ;;anything-c-source-man-pages                ;man
       anything-c-source-emacs-process            ;����
       anything-c-source-call-source              ;call source
       ;;anything-c-source-customize-face           ;�Զ�����ɫ
       anything-c-source-bbdb                     ;bbdb
       ;;anything-c-source-colors                   ;��ɫ
       anything-c-source-buffer-not-found         ;����buffer
       anything-c-source-tracker-search           ;Tracker��������
       anything-c-source-calculation-result       ;������
       anything-c-source-evaluation-result        ;ִ�б��ʽ���
       anything-c-source-kill-ring                ;Kill ring
       ))
