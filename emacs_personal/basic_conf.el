;; 打开输入法晃屏幕的问题
;;https://emacs-china.org/t/topic/186/25
;(setq redisplay-dont-pause nil)
                                        ; config for new frames

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
(global-set-key (kbd "s-i gf") 'find-file-at-point)
(global-set-key (kbd "s-i is") 'isearch-forward-symbol-at-point)
(global-set-key "\C-xf" 'crux-recentf-find-file)
(global-set-key "\C-xg" 'magit-status)

(global-set-key "\C-z" 'set-mark-command)
(global-set-key "\M-sr" 'query-replace-regexp)
(global-set-key "\M-slt" 'toggle-truncate-lines)
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

;; org basic

(setq org-image-actual-width nil)
(setq org-html-htmlize-output-type nil)

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
(global-set-key (kbd "s-i C-s") 'hs-show-block)
(global-set-key (kbd "s-i C-d") 'hs-hide-block)



;; terminal

;;; Terminal
(use-package vterm
  :when (memq window-system '(mac ns x pgtk))
  :bind (:map vterm-mode-map
              ("C-y" . vterm-yank)
              ("M-y" . vterm-yank-pop)
              ("C-k" . vterm-send-C-k-and-kill))
  :init
  (setq vterm-shell "zsh")
  :config
  (setq vterm-always-compile-module t)
  (defun vterm-send-C-k-and-kill ()
    "Send `C-k' to libvterm, and put content in kill-ring."
    (interactive)
    (kill-ring-save (point) (vterm-end-of-line))
    (vterm-send-key "k" nil nil t)))

(use-package vterm-toggle
  :when (memq window-system '(mac ns x pgtk))
  :bind (([f8] . vterm-toggle)
         ([f9] . vterm-compile)
         :map vterm-mode-map
         ([f8] . vterm-toggle)
         ([(control return)] . vterm-toggle-insert-cd))
  :config
  (setq vterm-toggle-cd-auto-create-buffer nil)
  (defvar vterm-compile-buffer nil)
  (defun vterm-compile ()
    "Compile the program including the current buffer in `vterm'."
    (interactive)
    (setq compile-command (compilation-read-command compile-command))
    (let ((vterm-toggle-use-dedicated-buffer t)
          (vterm-toggle--vterm-dedicated-buffer (if (vterm-toggle--get-window)
                                                    (vterm-toggle-hide)
                                                  vterm-compile-buffer)))
      (with-current-buffer (vterm-toggle-cd)
        (setq vterm-compile-buffer (current-buffer))
        (rename-buffer "*vterm compilation*")
        (compilation-shell-minor-mode 1)
        (vterm-send-M-w)
        (vterm-send-string compile-command t)
        (vterm-send-return)))))
;;
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



(add-to-list 'load-path (concat user-emacs-directory "/icollect/highlight-global/" ))

(load "highlight-global")
(setq-default smartparens-strict-mode nil)
;; PYTHON
;; 关于anaconda，先安装conda，使用conda-activate可以切换conda环境
(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home (expand-file-name "~/miniforge3/"))
  (setq conda-env-home-directory (expand-file-name "~/miniforge3")))


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
            (setq flycheck-pylintrc "~/.pylintrc")))
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

;; 最后的键盘设置
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;; (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)
    (define-key map  (kbd "C-x g") 'magit-status)
    (define-key map (kbd "C-c SPC") 'ace-jump-mode)
    (define-key map (kbd "C-x SPC") 'rectangle-mark-mode)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-mode"
  :keymap my-keys-minor-mode-map
  )

(my-mode 1)

;; 这样可以使得compile window 优先是split-window-vertically
(setq split-width-threshold nil)
(setq split-height-threshold 0)

;; (add-to-list 'load-path "~/Github/PrivateHub/linux_confs/emacs-jedi-direx/")
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
;(load "jedi-direx")
;(eval-after-load "python"
;  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
;(add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; ESHELL
(use-package eshell-bookmark
  :after eshell
  :config
  (add-hook 'eshell-mode-hook #'eshell-bookmark-setup))

(eval-after-load 'eshell
  '(require 'eshell-autojump nil t))

(setq eshell-last-dir-ring-size 500)

;; ORG
(use-package org-download
  :bind ("C-S-y" . org-download-clipboard)
  :config
  (add-hook 'dired-mode-hook 'org-download-enable)
  (setq-default org-download-heading-lvl nil)
  (setq-default org-download-image-dir "./images"))

(require 'org-tree-slide)

(setq org-hierarchical-todo-statistics nil)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)





;; cedet and ecb
;; (load-file "~/.emacs.d/icollect/cedet-1.1/common/cedet.el")
;; (semantic-load-enable-code-helpers)
;; (require 'cedet)
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (global-srecode-minor-mode 1)     ;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu


;; (require 'semantic-ia)
;; (require 'semantic-gcc)


;; ;; Enable template insertion menu
;; (global-srecode-minor-mode 1)

;; (setq-mode-local c-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))

;; (defun my-semantic-hook ()
;;   (imenu-add-to-menubar "TAGS"))

;; (add-hook 'semantic-init-hooks 'my-semantic-hook)

;; (require 'semanticdb)

;; (global-semanticdb-minor-mode 1)

;; (defun my-cedet-hook ()
;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;   (local-set-key "/C-c?" 'semantic-ia-complete-symbol-menu)
;;   (local-set-key "/C-c>" 'semantic-complete-analyze-inline)
;;   (local-set-key "/C-cp" 'semantic-analyze-proto-impl-toggle))
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)

;; (defun my-c-mode-cedet-hook ()
;;   (local-set-key "." 'semantic-complete-self-insert)
;;   (local-set-key ">" 'semantic-complete-self-insert))
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)





;; (require 'ecb)
;; (require 'ecb-autoloads)
;; (require 'cc-mode)
;; (require 'semantic)

;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)

;; (semantic-mode 1)


;; (add-to-list 'load-path "~/.emacs.d/icollect/ecb-snap/")
;; (require 'ecb)

;; (setq stack-trace-on-error t)

;; (require 'cedet)
;; (global-ede-mode t)
;; (setq global-semantic-tag-folding-mode t)

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
