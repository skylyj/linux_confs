;; 打开输入法晃屏幕的问题
;;https://emacs-china.org/t/topic/186/25
;(setq redisplay-dont-pause nil)
                                        ; config for new frames

;; proxy
;; (setq url-proxy-services '(("no_proxy" . "work\\.com")
;;                            ("http" . "127.0.0.1:7890")
;;                            ("https" . "127.0.0.1:7890")
;;                            )
;;       )

;; (require 'socks)
;; (setq erc-server-connect-function 'socks-open-network-stream)
;; (setq socks-server '("My Proxy" "127.0.0.1" 7890 5))

(scroll-bar-mode -1)
(defun new-frame-config ()
  (interactive)
  (set-frame-font "Menlo-18")
  (toggle-frame-maximized)
  )

(add-hook 'after-make-frame-functions 'new-frame-config)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper


;; (global-set-key (kbd "H-b") 'backward-word) ; H is for hyper
;; (global-set-key (kbd "s-b") 'backward-word) ; lower case “s” is for super

(global-set-key (kbd "s-i nf") 'new-frame-config)
(global-set-key (kbd "s-i C-s") 'swiper-isearch)
(global-set-key (kbd "s-i pj") 'ace-pinyin-jump-char)
(global-set-key (kbd "s-i *") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "s-i ttl") 'toggle-truncate-lines)
(global-set-key "\C-xf" 'helm-recentf)
(global-set-key "\C-xg" 'magit-status)

(global-set-key "\C-z" 'set-mark-command)
;(global-set-key "\M-slhh" 'hs-hide-all)
;(global-set-key "\M-slhs" 'hs-show-all)
;(global-set-key [(meta ?/)] 'hippie-expand)
(setq abbrev-file-name "~/.emacs.d/personal/.abbrev_defs") ;; 缺省的定义缩写的文件。
(setq bookmark-default-file "~/.emacs.d/personal/bookmarks") ;; 缺省书签文件的路径及文件名。



(global-font-lock-mode 1)               ; 开启语法高亮。
(auto-compression-mode 1)               ; 打开压缩文件时自动解压缩。
(column-number-mode 1)                  ; 显示列号。
(blink-cursor-mode -1)                  ; 光标不要闪烁。
(display-time-mode 1)                   ; 显示时间。
(show-paren-mode 1)                     ; 高亮显示匹配的括号。
(icomplete-mode 1)            ; 给出用 M-x foo-bar-COMMAND 输入命令的提示。
(setq x-select-enable-clipboard t)  ;用来和系统共享剪贴板
(setq confirm-kill-emacs 'yes-or-no-p)
(transient-mark-mode t)
(line-number-mode t)
(setq-default kill-whole-line t) ;; 在行首 C-k 时，同时删除该行。
(fset 'yes-or-no-p 'y-or-n-p) ;;改变 Emacs 固执的要你回答 yes 的行为。按y或空格键表示yes,n表示no。
(setq auto-image-file-mode t)

;; (set-default-font "Menlo Regular-21")

(cond ((equal system-type 'gnu/linux)
       (set-default-font "Monospace-19"))
      ((equal system-type 'darwin)
       (tool-bar-mode -1)
       (set-frame-font "Menlo-18")
       (set-fontset-font
        (frame-parameter nil 'font)
        'han
        (font-spec :family "Hiragino Sans GB" ))))

;; (set-face-attribute 'mode-line nil :box nil :height 195)
;; (set-face-attribute 'default (selected-frame) :font "Menlo-20" :height 210 :weight 'medium)

;(set-foreground-color "Wheat")
;(set-background-color "DarkSlateGray")
;(set-cursor-color "Orchid")
;(set-mouse-color "Orchid")

;(setq mouse-yank-at-point t) ;;鼠标中键黏贴的时候使用光标定位
;(setq inhibit-startup-message t) ;; 不显示 Emacs 的开始画面。
;(setq default-major-mode 'text-mode) ;; 任意的打开一个新文件时，缺省使用 text-mode。
;(setq next-line-add-newlines nil) ;; Emacs 21 中已经是缺省设置。按 C-n 或向下键时不添加新行。
;(setq require-final-newline t) ;; 存盘的时候，要求最后一个字符时换行符。
;(setq suggest-key-bindings 1) ;; 当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键。
;(setq line-number-display-limit 1000000) ;; 当行数超过一定数值，不再显示行号。
;(setq kill-ring-max 200) ;; kill-ring 最多的记录个数。
;(setq ring-bell-function 'ignore) ;; 彻底的消除 ring-bell 的效果。
;(setq track-eol t) ;; 当光标在行尾上下移动的时候，始终保持在行尾。
;(setq bookmark-save-flag 1) ;; 每当设置书签的时候都保存书签文件，否则只在你退出 Emacs 时保存。
;(setq mark-even-if-inactive t)
;(setq make-backup-files nil) ; stop creating those backup~ files
;(setq auto-save-default nil) ; stop creating those #auto-save# files
;(setq max-mini-window-height 0.0001)

;;; for balin terminal
;;; color theme setting, customize-themes
;;(if (equal window-system nil)
;;    (progn (load-theme 'wombat t)
;;           (menu-bar-mode -1))
;;  nil)
;(add-hook 'term-setup-hook
;  '(lambda ()
;     (define-key function-key-map "\e[1;9A" [M-up])
;     (define-key function-key-map "\e[1;9B" [M-down])
;     (define-key function-key-map "\e[1;9C" [M-right])
;     (define-key function-key-map "\e[1;9D" [M-left])))
;;;for ruby script
;(setenv "LANG" "en_US.UTF-8")
;(setenv "LC_ALL" "en_US.UTF-8")
;(setq hippie-expand-try-functions-list
;      '(try-complete-file-name
;        try-complete-file-name-partially
;        try-expand-dabbrev
;        try-expand-dabbrev-visible
;        try-expand-dabbrev-all-buffers
;        try-expand-dabbrev-from-kill
;        try-expand-all-abbrevs
;        try-expand-list
;        try-expand-line
;        try-complete-lisp-symbol-partially
;        try-complete-lisp-symbol))


;(cond
; ((string-equal system-type "windows-nt") ; Microsoft Windows
;  (progn
;    (message "Microsoft Windows") )
;  )
; ((string-equal system-type "darwin")   ; Mac OS X
;  (progn
;    (message "Mac OS X")
;    (setq url-using-proxy t)
;    ;; (setq url-proxy-services '(("http" . "theironislands.f.getqujing.net:42765")))
;    )
;  )
; ((string-equal system-type "gnu/linux") ; linux
;  (progn
;    (message "Linux") )
;  )
; )
;;; history
;(savehist-mode 1)
;(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
;(setq savehist-file "~/.emacs.d/savehist")

;;;server
;(require 'server)
;(unless (server-running-p) (server-start))


;;;AUCTeX
;;(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH")))
;;(setq exec-path (append '("/usr/texbin" "/usr/local/bin") exec-path))
;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
;(setq redisplay-dont-pause nil)
;(setq-default ispell-program-name "aspell")


;; new
(defun ns-unput-working-text ()
  (interactive)
  (cond
   ((and (overlayp ns-working-overlay)
         ;; Still alive?
         (overlay-buffer ns-working-overlay))
    (with-current-buffer (overlay-buffer ns-working-overlay)
      (let ((text (buffer-substring-no-properties
                   (overlay-start ns-working-overlay)
                   (overlay-end ns-working-overlay))))
        (when (equal text ns-working-text)
          (delete-region (overlay-start ns-working-overlay)
                         (overlay-end ns-working-overlay))
          (delete-overlay ns-working-overlay)
          (setq ns-working-overlay nil)))))
   ((integerp ns-working-overlay)
    (let* ((msg (current-message))
           (text (substring msg (- (length msg) ns-working-overlay)))
           message-log-max)
      (when (equal text ns-working-text)
        (setq msg (substring msg 0 (- (length msg) ns-working-overlay)))
        (message "%s" msg)
        (setq ns-working-overlay nil))))))

;; wgrep
(require 'wgrep)
(require 'counsel-projectile)
(counsel-projectile-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(require 'neotree)
;; 这样mac open file的时候不会重复打开frame了，始终在一个frame里面
(setq ns-pop-up-frames nil)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
  (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 15)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			  (projects . 10))) ;; 显示多少个最近项目
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)



  (dashboard-setup-startup-hook))

(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))



;; for multiple cursor
;; Expand region. (Also from Magnar Sveen)
(use-package multiple-cursors
  :bind (("C->"           . mc/mark-next-like-this)
         ("C-<"           . mc/mark-previous-like-this)
         ("C-M->"         . mc/skip-to-next-like-this)
         ("C-M-<"         . mc/skip-to-previous-like-this)
         ("C-c C-<"       . mc/mark-all-like-this)
         ("C-S-c C-S-c"   . mc/edit-lines)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)
         :map mc/keymap
         ("C-|" . mc/vertical-align-with-space))
  :config
  (setq mc/insert-numbers-default 1))

;;google this
(google-this-mode 1)

;; (setq projectile-project-search-path '("~/Public" ("~/Github" . 1) ("~/Gitlab" . 1)))

;;hide and show
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'go-mode 'hs-minor-mode)
(add-hook 'c++-mode 'hs-minor-mode)
(global-set-key (kbd "s-i C-s") 'hs-show-block)
(global-set-key (kbd "s-i C-d") 'hs-hide-block)

(good-scroll-mode -1)
(beacon-mode 1)

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)


(setq path-to-ctags "/opt/homebrew/bin/ctags")
;; smartscan
(require 'smartscan)
(add-hook 'prog-mode-hook 'smartscan-mode)
;; 注意只要在程序状态下启动smartscan就行了
;; (smartscan-mode 1)
;; (global-smartscan-mode t)

;; HIGHLIGHT 自动高亮
(global-auto-highlight-symbol-mode t)


;; (global-set-key (kbd "C-*")
;;                 (lambda ()
;;                   (interactive)
;;                   (re-search-forward (format "\\b%s\\b" (thing-at-point 'word)))))


(projectile-rails-global-mode)


(require 'org)

(defun my-tbl-export (name)
  "Search for table named `NAME` and export."
  (interactive "s")
  (outline-show-all)
  (let ((case-fold-search t))
    (if (search-forward-regexp (concat "#\\+NAME: +" name) nil t)
        (progn
          (next-line)
          (org-table-export (format "%s.csv" name) "orgtbl-to-csv")))))



;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;;
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; (define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)



(setq-default smartparens-strict-mode nil)
;; PYTHON
;; 关于anaconda，先安装conda，使用conda-activate可以切换conda环境
(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home (expand-file-name "~/miniforge3/"))
  (setq conda-env-home-directory (expand-file-name "~/miniforge3"))
  (setq-default mode-line-format (cons mode-line-format '(:exec conda-env-current-name)))
  (conda-env-activate "tf26")
  )


(use-package anaconda-mode
  :ensure t
  :bind (("C-c C-x" . next-error))
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  )

(use-package company-anaconda
  :ensure t
  :config
  (eval-after-load "company"
    '(add-to-list 'company-backends '(company-anaconda))))


(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent-offset 4)))
(add-hook 'python-mode-hook
          (lambda ()
            ;; (setq flycheck-python-pylint-executable "/Users/mobvista/miniforge3/envs/tf26/bin/pylint")
            (setq flycheck-pylintrc "~/.pylintrc")
            (setq flycheck-flake8rc "~/.config/flake8")
            )
          )
;; (defun python-reinstate-current-directory ()
;;   "When running Python, add the current directory ('') to the head of sys.path.
;; For reasons unexplained, run-python passes arguments to the
;; interpreter that explicitly remove '' from sys.path. This means
;; that, for example, using `python-send-buffer' in a buffer
;; visiting a module's code will fail to find other modules in the
;; same directory.

;; Adding this function to `inferior-python-mode-hook' reinstates
;; the current directory in Python's search path."
;;   (python-send-string "sys.path[0:0] = ['']"))

;; (add-hook 'inferior-python-mode-hook 'python-reinstate-current-directory)
(setq python-remove-cwd-from-path nil)

;; PYTHON CONFIG END
;; 可以让imenu 平铺起来flat
(defun python-imenu-use-flat-index
    ()
  (setq imenu-create-index-function
        #'python-imenu-create-flat-index))

(add-hook 'python-mode-hook
          #'python-imenu-use-flat-index)

;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (add-hook 'python-mode-hook '(lambda ()
;;                                (setq python-indent 4)))

;; 有问题的话，用这个
;; python-shell-interpreter-args "--colors=Linux --profile=default --simple-prompt"

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors=Linux --profile=default"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;; (eval-after-load "company"
;;   '(add-to-list 'company-backends 'company-anaconda))
;;evil-numbers
(require 'evil-numbers)
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
(global-set-key (kbd "C-c C-+") 'evil-numbers/inc-at-pt-incremental)
(global-set-key (kbd "C-c C--") 'evil-numbers/dec-at-pt-incremental)

;; 这样可以使得compile window 优先是split-window-vertically
(setq split-width-threshold nil)
(setq split-height-threshold 0)


;; ESHELL
(use-package eshell-bookmark
  :after eshell
  :config
  (add-hook 'eshell-mode-hook #'eshell-bookmark-setup))

(eval-after-load 'eshell
  '(require 'eshell-autojump nil t))

(setq eshell-last-dir-ring-size 500)

;; ORG basic
(setq org-image-actual-width nil)
(setq org-html-htmlize-output-type nil)
(add-hook 'org-mode-hook #'valign-mode)
(setq valign-fancy-bar 1)
;; ORG 插入图片
(use-package org-download
  :bind ("C-S-y" . org-download-clipboard)
  :config
  (add-hook 'dired-mode-hook 'org-download-enable)
  (setq-default org-download-heading-lvl nil)
  (setq-default org-download-image-dir "./images"))

(require 'org-tree-slide)

(setq org-hierarchical-todo-statistics nil)

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;               (ggtags-mode 1))))

;; (require 'ggtags)
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;;               (ggtags-mode 1))))

;; (setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(require 'helm-xref)
(setq xref-show-xrefs-function 'helm-xref-show-xrefs)
;; flycheck
(require 'flycheck)
;; Force flycheck to always use c++11 support. We use
;; the clang language backend so this is set to clang
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++11")))
;; Turn flycheck on everywhere
(global-flycheck-mode)

(require 'cc-mode)
(require 'semantic)
(require 'semantic/sb)
(require 'srecode)

(add-hook 'c++-mode-hook
          (lambda ()
            (semantic-mode 1)
            ;; (global-semanticdb-minor-mode 1)
            ;; (global-semantic-idle-scheduler-mode 1)
            ;; (global-semantic-idle-completions-mode 1)
            (semantic-decoration-mode 1)
            (semantic-highlight-func-mode 1)
            (semantic-stickyfunc-mode -1)
            ;; (global-semantic-decoration-mode 1)
            ;; (global-semantic-highlight-func-mode 1)
            ;; (global-semantic-stickyfunc-mode -1)
            ;; (global-semantic-idle-summary-mode 1)
            ;; (global-semantic-mru-bookmark-mode 1)
            )
          )


;; from https://github.com/abo-abo/swiper/issues/1068
(defun my-ivy-with-thing-at-point (cmd &optional dir)
  "Wrap a call to CMD with setting "
  (let ((ivy-initial-inputs-alist
         (list
          (cons cmd (thing-at-point 'symbol)))))
    (funcall cmd nil dir)))

(use-package counsel
  :config (setq counsel-ag-base-command "ag --vimgrep -a %s"))

(defun my-counsel-ag-from-here (&optional dir)
  "Start ag but from the directory the file is in (otherwise I would
be using git-grep)."
  (interactive "D")
  (my-ivy-with-thing-at-point
   'counsel-ag
   (or dir (file-name-directory (buffer-file-name)))))

(defun my-counsel-git-grep ()
  (interactive)
  (my-ivy-with-thing-at-point
   'counsel-git-grep))


(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons
  :ensure t)

(setq doom-theme 'doom-city-lights)

(all-the-icons-ivy-rich-mode 1)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;(quelpa
; '(quelpa-use-package
;   :fetcher git
;   :url "https://github.com/quelpa/quelpa-use-package.git"))
;(require 'quelpa-use-package)

;; (use-package org-sidebar
;;   :quelpa (org-sidebar :fetcher github :repo "alphapapa/org-sidebar"))

(with-eval-after-load 'sr-speedbar
  (add-hook 'speedbar-visiting-file-hook
            #'(lambda () (select-window (next-window))) t))


(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))


(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; (require 'origami)



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Set up HELM
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Load helm and set M-x to helm, buffer to helm, and find files to herm
(require 'helm-config)
(require 'helm)
(require 'helm-ls-git)
(require 'helm-ctest)
;; Use C-c h for helm instead of C-x c
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(set-face-attribute 'helm-selection nil
                    :background "lime green"
                    :foreground "black")

(setq
 helm-split-window-in-side-p           t
   ; open helm buffer inside current window,
   ; not occupy whole other window
 helm-move-to-line-cycle-in-source     t
   ; move to end or beginning of source when
   ; reaching top or bottom of source.
 helm-ff-search-library-in-sexp        t
   ; search for library in `require' and `declare-function' sexp.
 helm-scroll-amount                    8
   ; scroll 8 lines other window using M-<next>/M-<prior>
 helm-ff-file-name-history-use-recentf t
 ;; Allow fuzzy matches in helm semantic
 helm-semantic-fuzzy-match t
 helm-imenu-fuzzy-match    t)
;; Have helm automaticaly resize the window
(helm-autoresize-mode 1)
(setq rtags-use-helm t)
(require 'helm-flycheck) ;; Not necessary if using ELPA package
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(require 'swiper-helm)

(require 'helm-swoop)
;;helm-swoop
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; When doing evil-search, hand the word over to helm-swoop
;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
(define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

;; Move up and down like isearch
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; MY-MODE
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;; (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)
    (define-key map  (kbd "C-x g") 'magit-status)
    (define-key map  (kbd "C-s") 'isearch-forward)
    (define-key map (kbd "C-c SPC") 'ace-jump-mode)
    (define-key map (kbd "C-x SPC") 'rectangle-mark-mode)
    (move-text-default-bindings)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter  my-mode
  :keymap my-keys-minor-mode-map
  )

(my-mode 1)

(global-set-key [remap goto-line] 'goto-line-preview)

;; BM
(use-package bm
         :ensure t
         :demand t

         :init
         ;; restore on load (even before you require bm)
         (setq bm-restore-repository-on-load t)


         :config
         ;; Allow cross-buffer 'next'
         (setq bm-cycle-all-buffers t)

         ;; where to store persistant files
         (setq bm-repository-file "~/.emacs.d/bm-repository")

         ;; save bookmarks
         (setq-default bm-buffer-persistence t)

         ;; Loading the repository from file when on start up.
         (add-hook 'after-init-hook 'bm-repository-load)

         ;; Saving bookmarks
         (add-hook 'kill-buffer-hook #'bm-buffer-save)

         ;; Saving the repository to file when on exit.
         ;; kill-buffer-hook is not called when Emacs is killed, so we
         ;; must save all bookmarks first.
         (add-hook 'kill-emacs-hook #'(lambda nil
                                          (bm-buffer-save-all)
                                          (bm-repository-save)))

         ;; The `after-save-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state.
         (add-hook 'after-save-hook #'bm-buffer-save)

         ;; Restoring bookmarks
         (add-hook 'find-file-hooks   #'bm-buffer-restore)
         (add-hook 'after-revert-hook #'bm-buffer-restore)

         ;; The `after-revert-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state. This hook might cause trouble when using packages
         ;; that automatically reverts the buffer (like vc after a check-in).
         ;; This can easily be avoided if the package provides a hook that is
         ;; called before the buffer is reverted (like `vc-before-checkin-hook').
         ;; Then new bookmarks can be saved before the buffer is reverted.
         ;; Make sure bookmarks is saved before check-in (and revert-buffer)
         (add-hook 'vc-before-checkin-hook #'bm-buffer-save)


         :bind (("<f2>" . bm-next)
                ("S-<f2>" . bm-previous)
                ("C-<f2>" . bm-toggle))
         )
;; (require 'rbenv)
;; (global-rbenv-mode)

;; (unless (require 'exec-path-from-shell nil 'noerror)
(exec-path-from-shell-initialize)
(add-hook 'sh-mode-hook 'flycheck-mode)

(require 'ace-pinyin)
(setq ace-pinyin-use-avy nil)
(ace-pinyin-global-mode +1)


(require 'helm-config)
(require 'helm-themes)


 (when (require 'openwith nil 'noerror)
      (setq openwith-associations
            (list
             (list (openwith-make-extension-regexp
                    '("doc" "docx" "xls" "ppt" "pptx" "docx" "pdf"))
                   "open"
                   '(file))
             (list (openwith-make-extension-regexp
                    '("pdf" "ps" "ps.gz" "dvi"))
                   "open"
                   '(file))
             ))
      (openwith-mode 1))

;; (require 'openwith)
;; (setq openwith-associations '(("\\.pdf\\'" "open" (file))
;;                               ("\\.pptx\\'" "open" (file))
;;                               ("\\.docx\\'" "open" (file))
;;                               ))
;; (openwith-mode t)

;; (add-hook 'dired-mode-hook 'dired-git-mode)


;; (use-package bookmark+
;;   :quelpa (bookmark+ :fetcher wiki
;;                      :files
;;                      ("bookmark+.el"
;;                       "bookmark+-mac.el"
;;                       "bookmark+-bmu.el"
;;                       "bookmark+-1.el"
;;                       "bookmark+-key.el"
;;                       "bookmark+-lit.el"
;;                       "bookmark+-doc.el"
;;                       "bookmark+-chg.el"))
;;   :defer 2)

(quelpa '(dired+ :fetcher wiki
                 :files
                 ("dired+.el")))
(require 'dired+)

(quelpa '(hl-line+ :fetcher wiki
                     :files
                     ("hl-line+.el")))
(require 'hl-line+)

(quelpa '(col-highlight :fetcher wiki
                   :files
                   ("col-highlight.el")))
(require 'col-highlight)

(quelpa '(crosshairs :fetcher wiki
                 :files
                 ("crosshairs.el")))
(require 'crosshairs)




(quelpa '(bookmark+ :fetcher wiki
                    :files
                    ("bookmark+.el"
                     "bookmark+-mac.el"
                     "bookmark+-bmu.el"
                     "bookmark+-1.el"
                     "bookmark+-key.el"
                     "bookmark+-lit.el"
                     "bookmark+-doc.el"
                     "bookmark+-chg.el")))
(require 'bookmark+)

(use-package bm
         :ensure t
         :demand t

         :init
         ;; restore on load (even before you require bm)
         (setq bm-restore-repository-on-load t)


         :config
         ;; Allow cross-buffer 'next'
         (setq bm-cycle-all-buffers t)

         ;; where to store persistant files
         (setq bm-repository-file "~/.emacs.d/bm-repository")

         ;; save bookmarks
         (setq-default bm-buffer-persistence t)

         ;; Loading the repository from file when on start up.
         (add-hook 'after-init-hook 'bm-repository-load)

         ;; Saving bookmarks
         (add-hook 'kill-buffer-hook #'bm-buffer-save)

         ;; Saving the repository to file when on exit.
         ;; kill-buffer-hook is not called when Emacs is killed, so we
         ;; must save all bookmarks first.
         (add-hook 'kill-emacs-hook #'(lambda nil
                                          (bm-buffer-save-all)
                                          (bm-repository-save)))

         ;; The `after-save-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state.
         (add-hook 'after-save-hook #'bm-buffer-save)

         ;; Restoring bookmarks
         (add-hook 'find-file-hooks   #'bm-buffer-restore)
         (add-hook 'after-revert-hook #'bm-buffer-restore)

         ;; The `after-revert-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state. This hook might cause trouble when using packages
         ;; that automatically reverts the buffer (like vc after a check-in).
         ;; This can easily be avoided if the package provides a hook that is
         ;; called before the buffer is reverted (like `vc-before-checkin-hook').
         ;; Then new bookmarks can be saved before the buffer is reverted.
         ;; Make sure bookmarks is saved before check-in (and revert-buffer)
         (add-hook 'vc-before-checkin-hook #'bm-buffer-save)

         (setq bm-marker 'bm-marker-right)
         (global-set-key (kbd "<left-fringe> <M-mouse-1>") 'bm-toggle-mouse)
         (global-set-key (kbd "s-i bn") 'bm-next)
         (global-set-key (kbd "s-i bp") 'bm-previous)
         (global-set-key (kbd "s-i bt") 'bm-toggle)
         (global-set-key (kbd "s-i bs") 'bm-show-all)
         :bind (("<f2>" . bm-next)
                ("S-<f2>" . bm-previous)
                ("C-<f2>" . bm-toggle)
                )
         )
(require 'helm-bm)
(add-hook 'dired-mode-hook 'dired-omit-mode)

(setq helm-locate-fuzzy-match nil)
(setq helm-locate-command "mdfind -name %s %s")
;; 使用locate
(setq locate-command "mdfind")

;; 使用register
(require 'register-channel)
(register-channel-mode 1)
