;; (require 'rtags)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Setup cmake-ide
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'cmake-ide)
;; (cmake-ide-setup)
;; ;; Set cmake-ide-flags-c++ to use C++11
;; (setq cmake-ide-flags-c++ (append '("-std=c++11")))
;; ;; We want to be able to compile with a keyboard shortcut
;; (global-set-key (kbd "C-c m") 'cmake-ide-compile)

;; ;; Set rtags to enable completions and use the standard keybindings.
;; ;; A list of the keybindings can be found at:
;; ;; http://syamajala.github.io/c-ide.html
;; (setq rtags-autostart-diagnostics t)
;; (rtags-diagnostics)
;; (setq rtags-completions-enabled t)
;; (rtags-enable-standard-keybindings)
;; (cmake-ide-setup)
;; (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
;; (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

;; (use-package rtags
;;   :ensure t
;;   :hook (c++-mode . rtags-start-process-unless-running)
;;   :config (setq rtags-completions-enabled t
;; 		;; rtags-path "/home/manoj/.emacs.d/rtags/src/rtags.el"
;; 		rtags-rc-binary-name "/Users/mobvista/Soft/rtags/bin/rc"
;; 		rtags-use-helm t
;; 		rtags-rdm-binary-name "/Users/mobvista/Soft/rtags/bin/rdm")
;;   ;; :bind (("C-c E" . rtags-find-symbol)
;;   ;; 	 ("C-c e" . rtags-find-symbol-at-point)
;;   ;; 	 ("C-c O" . rtags-find-references)
;;   ;; 	 ("C-c o" . rtags-find-references-at-point)
;;   ;; 	 ("C-c s" . rtags-find-file)
;;   ;; 	 ("C-c v" . rtags-find-virtuals-at-point)
;;   ;; 	 ("C-c F" . rtags-fixit)
;;   ;; 	 ("C-c f" . rtags-location-stack-forward)
;;   ;; 	 ("C-c b" . rtags-location-stack-back)
;;   ;; 	 ("C-c n" . rtags-next-match)
;;   ;; 	 ("C-c p" . rtags-previous-match)
;;   ;; 	 ("C-c P" . rtags-preprocess-file)
;;   ;; 	 ("C-c R" . rtags-rename-symbol)
;;   ;; 	 ("C-c x" . rtags-show-rtags-buffer)
;;   ;; 	 ("C-c T" . rtags-print-symbol-info)
;;   ;; 	 ("C-c t" . rtags-symbol-type)
;;   ;; 	 ("C-c I" . rtags-include-file)
;;   ;; 	 ("C-c i" . rtags-get-include-file-for-symbol))
;;   )

;; (setq rtags-display-result-backend 'helm)


;; (use-package company-tabnine
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine)
;;   ;; Trigger completion immediately.
;;   (setq company-idle-delay 0)
;;   ;; Number the candidates (use M-1, M-2 etc to select completions).
;;   (setq company-show-numbers t)

;;   )



;; (use-package citre
;;   :defer t
;;   :init
;;   ;; This is needed in `:init' block for lazy load to work.
;;   (require 'citre-config)
;;   ;; Bind your frequently used commands.  Alternatively, you can define them
;;   ;; in `citre-mode-map' so you can only use them when `citre-mode' is enabled.
;;   (global-set-key (kbd "C-x c j") 'citre-jump)
;;   (global-set-key (kbd "C-x c J") 'citre-jump-back)
;;   (global-set-key (kbd "C-x c p") 'citre-ace-peek)
;;   (global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
;;   :config
;;   (setq
;;    ;; Set these if readtags/ctags is not in your PATH.
;;    citre-readtags-program "/path/to/readtags"
;;    citre-ctags-program "/path/to/ctags"
;;    ;; Set these if gtags/global is not in your PATH (and you want to use the
;;    ;; global backend)
;;    citre-gtags-program "/path/to/gtags"
;;    citre-global-program "/path/to/global"
;;    ;; Set this if you use project management plugin like projectile.  It's
;;    ;; used for things like displaying paths relatively, see its docstring.
;;    citre-project-root-function #'projectile-project-root
;;    ;; Set this if you want to always use one location to create a tags file.
;;    citre-default-create-tags-file-location 'global-cache
;;    ;; See the "Create tags file" section above to know these options
;;    citre-use-project-root-when-creating-tags t
;;    citre-prompt-language-for-ctags-command t
;;    ;; By default, when you open any file, and a tags file can be found for it,
;;    ;; `citre-mode' is automatically enabled.  If you only want this to work for
;;    ;; certain modes (like `prog-mode'), set it like this.
;;    citre-auto-enable-citre-mode-modes '(prog-mode)))




;; (use-package helm-gtags
;;   :after (helm)
;;   :init
;;   (add-hook 'c-mode-hook 'helm-gtags-mode)
;;   (add-hook 'c++-mode-hook 'helm-gtags-mode)
;;   (add-hook 'asm-mode-hook 'helm-gtags-mode)

;;   :config
;;   ;; customize
;;   (custom-set-variables
;;    '(helm-gtags-path-style 'relative)
;;    '(helm-gtags-ignore-case t)
;;    '(helm-gtags-auto-update t)))

;; :bind
;; (:map helm-gtags-mode-map
;;       ("M-t" . helm-gtags-find-tag)
;;       ("M-r" . helm-gtags-find-rtag)
;;       ("M-s" . helm-gtags-find-symbol)
;;       ("M-," . helm-gtags-previous-history)
;;       ("M-." . helm-gtags-next-history)))


;; (use-package citre
;;   :defer t
;;   :init
;;   ;; This is needed in `:init' block for lazy load to work.
;;   (require 'citre-config)
;;   ;; Bind your frequently used commands.  Alternatively, you can define them
;;   ;; in `citre-mode-map' so you can only use them when `citre-mode' is enabled.
;;   (global-set-key (kbd "C-x c j") 'citre-jump)
;;   (global-set-key (kbd "C-x c J") 'citre-jump-back)
;;   (global-set-key (kbd "C-x c p") 'citre-ace-peek)
;;   (global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
;;   :config
;;   (setq
;;    ;; Set these if readtags/ctags is not in your PATH.
;;    citre-readtags-program "/path/to/readtags"
;;    citre-ctags-program "/path/to/ctags"
;;    ;; Set these if gtags/global is not in your PATH (and you want to use the
;;    ;; global backend)
;;    citre-gtags-program "/path/to/gtags"
;;    citre-global-program "/path/to/global"
;;    ;; Set this if you use project management plugin like projectile.  It's
;;    ;; used for things like displaying paths relatively, see its docstring.
;;    citre-project-root-function #'projectile-project-root
;;    ;; Set this if you want to always use one location to create a tags file.
;;    citre-default-create-tags-file-location 'global-cache
;;    ;; See the "Create tags file" section above to know these options
;;    citre-use-project-root-when-creating-tags t
;;    citre-prompt-language-for-ctags-command t
;;    ;; By default, when you open any file, and a tags file can be found for it,
;;    ;; `citre-mode' is automatically enabled.  If you only want this to work for
;;    ;; certain modes (like `prog-mode'), set it like this.
;;    citre-auto-enable-citre-mode-modes '(prog-mode)))

;; 基于AI的补全
;; (use-package company-tabnine
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine)
;;   ;; Trigger completion immediately.
;;   (setq company-idle-delay 0)
;;   ;; Number the candidates (use M-1, M-2 etc to select completions).
;;   (setq company-show-numbers t)
;;   )



;;; Terminal
;; (use-package vterm
;;   :when (memq window-system '(mac ns x pgtk))
;;   :bind (:map vterm-mode-map
;;               ("C-y" . vterm-yank)
;;               ("M-y" . vterm-yank-pop)
;;               ("C-k" . vterm-send-C-k-and-kill))
;;   :init
;;   (setq vterm-shell "zsh")
;;   :config
;;   (setq vterm-always-compile-module t)
;;   (defun vterm-send-C-k-and-kill ()
;;     "Send `C-k' to libvterm, and put content in kill-ring."
;;     (interactive)
;;     (kill-ring-save (point) (vterm-end-of-line))
;;     (vterm-send-key "k" nil nil t)))
;;
;; (use-package vterm-toggle
;;   :when (memq window-system '(mac ns x pgtk))
;;   :bind (([f8] . vterm-toggle)
;;          ([f9] . vterm-compile)
;;          :map vterm-mode-map
;;          ([f8] . vterm-toggle)
;;          ([(control return)] . vterm-toggle-insert-cd))
;;   :config
;;   (setq vterm-toggle-cd-auto-create-buffer nil)
;;   (defvar vterm-compile-buffer nil)
;;   (defun vterm-compile ()
;;     "Compile the program including the current buffer in `vterm'."
;;     (interactive)
;;     (setq compile-command (compilation-read-command compile-command))
;;     (let ((vterm-toggle-use-dedicated-buffer t)
;;           (vterm-toggle--vterm-dedicated-buffer (if (vterm-toggle--get-window)
;;                                                     (vterm-toggle-hide)
;;                                                   vterm-compile-buffer)))
;;       (with-current-buffer (vterm-toggle-cd)
;;         (setq vterm-compile-buffer (current-buffer))
;;         (rename-buffer "*vterm compilation*")
;;         (compilation-shell-minor-mode 1)
;;         (vterm-send-M-w)
;;         (vterm-send-string compile-command t)
;;         (vterm-send-return)))))
;;



;; tab 管理
;; (use-package centaur-tabs
;;   :demand
;;   :config
;;   (centaur-tabs-mode nil)
;;   (centaur-tabs-group-by-projectile-project)
;;   (setq centaur-tabs-set-icons t)
;;   (setq centaur-tabs-style "rounded")
;;   (global-set-key (kbd "C-c <C-left>") 'centaur-tabs-backward)
;;   (global-set-key (kbd "C-c <C-right>") 'centaur-tabs-forward)
;;   (global-set-key (kbd "C-c <C-up>") 'centaur-tabs-backward-group)
;;   (global-set-key (kbd "C-c <C-down>") 'centaur-tabs-forward-group)
;;   (setq centaur-tabs-set-bar 'under)
;;   (setq x-underline-at-descent-line t)
;;   (setq centaur-tabs-enable-key-bindings t)
;;   (setq centaur-tabs-gray-out-icons 'buffer)
;;   )


;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (package-initialize)

;; (setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
;;     projectile hydra flycheck company avy which-key helm-xref dap-mode))

;; (when (cl-find-if-not #'package-installed-p package-selected-packages)
;;   (package-refresh-contents)
;;   (mapc #'package-install package-selected-packages))

;; ;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
;; (helm-mode)
;; (require 'helm-xref)
;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)

;; (which-key-mode)

;; (add-hook 'c-mode-hook 'lsp)
;; (add-hook 'c++-mode-hook 'lsp)

;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       treemacs-space-between-root-nodes nil
;;       company-idle-delay 0.0
;;       company-minimum-prefix-length 1
;;       lsp-idle-delay 0.1)  ;; clangd is fast

;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;   (require 'dap-cpptools)
;;   (yas-global-mode))


;; ;; for python
;; (use-package lsp-mode
;;   :config
;;   (add-hook 'python-mode-hook
;;             (lambda ()
;;               (lsp-python-enable)))
;;   ;; 调用 pyls 既上边安装的 Python Language Server
;;   ;; 不需要安装 lsp-python, 以下几行提供与 lsp-python 相同的功能
;;   (lsp-define-stdio-client lsp-python "python"
;;                            (lsp-make-traverser #'(lambda (dir)
;;                                                    (directory-files
;;                                                     dir
;;                                                     nil
;;                                                     "\\(__init__\\|setup\\)\\.py\\|Pipfile")))
;;                            '("pyls")))

;; ;; (use-package lsp-imenu
;; ;;   :init
;; ;;   ;; 启用 lsp-imenu 集成
;; ;;   (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))

;; ;; (use-package lsp-ui
;; ;;   :init
;; ;;   ;; 启用 lsp-ui
;; ;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; ;;   ;; 启用 flycheck
;; ;;   (add-hook 'python-mode-hook 'flycheck-mode))

;; ;; (use-package company-lsp
;; ;;   :config
;; ;;   ;; 设置 company-lsp 为后端
;; ;;   (push 'company-lsp company-backends))
;; (add-to-list 'load-path (concat user-emacs-directory "/icollect/company-lsp/" ))
;; (load "company-lsp")
;; (push 'company-lsp company-backends)


;; (lsp-treemacs-sync-mode 1)
;; lsp scala 配置
;; (require 'package)

;; ;; Add melpa to your packages repositories
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; (package-initialize)

;; ;; Install use-package if not already installed
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (require 'use-package)

;; ;; Enable defer and ensure by default for use-package
;; ;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
;; (setq use-package-always-defer t
;;       use-package-always-ensure t
;;       backup-directory-alist `((".*" . ,temporary-file-directory))
;;       auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; ;; Enable scala-mode for highlighting, indentation and motion commands
;; (use-package scala-mode
;;   :interpreter ("scala" . scala-mode))

;; ;; Enable sbt mode for executing sbt commands
;; (use-package sbt-mode
;;   :commands sbt-start sbt-command
;;   :config
;;   ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
;;   ;; allows using SPACE when in the minibuffer
;;   (substitute-key-definition
;;    'minibuffer-complete-word
;;    'self-insert-command
;;    minibuffer-local-completion-map)
;;    ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
;;    (setq sbt:program-options '("-Dsbt.supershell=false")))

;; ;; Enable nice rendering of diagnostics like compile errors.
;; (use-package flycheck
;;   :init (global-flycheck-mode))

;; (use-package lsp-mode
;;   ;; Optional - enable lsp-mode automatically in scala files
;;   ;; You could also swap out lsp for lsp-deffered in order to defer loading
;;   :hook  (scala-mode . lsp)
;;          (lsp-mode . lsp-lens-mode)
;;   :config
;;   ;; Uncomment following section if you would like to tune lsp-mode performance according to
;;   ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
;;   ;; (setq gc-cons-threshold 100000000) ;; 100mb
;;   ;; (setq read-process-output-max (* 1024 1024)) ;; 1mb
;;   ;; (setq lsp-idle-delay 0.500)
;;   ;; (setq lsp-log-io nil)
;;   ;; (setq lsp-completion-provider :capf)
;;   (setq lsp-prefer-flymake nil)
;;   ;; Makes LSP shutdown the metals server when all buffers in the project are closed.
;;   ;; https://emacs-lsp.github.io/lsp-mode/page/settings/mode/#lsp-keep-workspace-alive
;;   (setq lsp-keep-workspace-alive nil))

;; ;; Add metals backend for lsp-mode
;; (use-package lsp-metals)

;; ;; Enable nice rendering of documentation on hover
;; ;;   Warning: on some systems this package can reduce your emacs responsiveness significally.
;; ;;   (See: https://emacs-lsp.github.io/lsp-mode/page/performance/)
;; ;;   In that case you have to not only disable this but also remove from the packages since
;; ;;   lsp-mode can activate it automatically.
;; (use-package lsp-ui)

;; ;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; ;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;; ;; to avoid odd behavior with snippets and indentation
;; (use-package yasnippet)

;; ;; Use company-capf as a completion provider.
;; ;;
;; ;; To Company-lsp users:
;; ;;   Company-lsp is no longer maintained and has been removed from MELPA.
;; ;;   Please migrate to company-capf.
;; (use-package company
;;   :hook (scala-mode . company-mode)
;;   :config
;;   (setq lsp-completion-provider :capf))

;; ;; Posframe is a pop-up tool that must be manually installed for dap-mode
;; (use-package posframe)

;; ;; Use the Debug Adapter Protocol for running tests and debugging
;; (use-package dap-mode
;;   :hook
;;   (lsp-mode . dap-mode)
;;   (lsp-mode . dap-ui-mode))
