;;; package --- Summary
;;; Code:
;;; Commentary:
;; Add melpa-stable to your packages repositories

;; flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;; AI related
(use-package company
  :ensure t
  :hook (scala-mode . company-mode)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "M-<") 'company-select-first)
  (define-key company-active-map (kbd "M->") 'company-select-last)
  (setq lsp-completion-provider :capf)
  :custom
  (company-minimum-prefix-length 3)
  (company-idle-delay 0.0))

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)
(add-hook 'prog-mode-hook 'copilot-mode)
(with-eval-after-load 'company
  (delq 'company-preview-if-just-one-frontend company-frontends))
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

;; org-ai

(use-package org-ai
  :ensure t
  :commands (org-ai-mode
             org-ai-global-mode)
  :init
  (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
  (org-ai-global-mode) ; installs global keybindings on C-c M-a
  :config
  (setq org-ai-default-chat-model "gpt-4") ; if you are on the gpt-4 beta:
  (org-ai-install-yasnippets)) ; if you are using yasnippet and want `ai` snippets

(setq org-ai-openai-api-token "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")





;; Enable scala-mode and sbt-mode
(use-package scala-mode
  :interpreter ("scala" . scala-mode))

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
  ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
  (setq sbt:program-options '("-Dsbt.supershell=false")))


;; eglot metal 的配置
;; (use-package eglot
;;   :pin melpa-stable
;;   ;; (optional) Automatically start metals for Scala files.
;;   ;; :hook (scala-mode . eglot-ensure)
;;   :config
;;   (setq eldoc-echo-area-use-multiline-p nil)
;;   ;; (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
;;   )

;;需要安装metals-emacs
;; sudo coursier bootstrap \
;;   --java-opt -XX:+UseG1GC \
;;   --java-opt -XX:+UseStringDeduplication  \
;;   --java-opt -Xss4m \
;;   --java-opt -Xms100m \
;;   org.scalameta:metals_2.13:0.11.10 \
;;   -o /usr/local/bin/metals-emacs -f

;; lsp related
(use-package lsp-mode
  :ensure t
  :hook
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  (python-mode . lsp)
  (sh-mode . lsp)
  (yaml-mode . lsp)
  :config
  ;; Uncomment following section if you would like to tune lsp-mode performance according to
  ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
  ;; (setq gc-cons-threshold 100000000) ;; 100mb
  ;; (setq read-process-output-max (* 1024 1024)) ;; 1mb
  ;; (setq lsp-idle-delay 0.500)
  ;; (setq lsp-log-io nil)
  ;; (setq lsp-completion-provider :capf)
  (setq lsp-prefer-flymake nil)
  ;; Makes LSP shutdown the metals server when all buffers in the project are closed.
  ;; https://emacs-lsp.github.io/lsp-mode/page/settings/mode/#lsp-keep-workspace-alive
  (setq lsp-keep-workspace-alive nil))

(when (display-graphic-p) 
  ;; Do any keybindings and theme setup here
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode)
  (use-package posframe
    :ensure t)

  (use-package dap-mode
    :ensure t
    :hook
    (lsp-mode . dap-mode)
    (lsp-mode . dap-ui-mode))
  (use-package helm-lsp
    :ensure t
    :config
    (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
    )

  (use-package lsp-treemacs
    :ensure t)

  (use-package treemacs
    :ensure t)
  )

(setq lsp-pyls-plugins-pycodestyle-enabled nil)


;; Add metals backend for lsp-mode
(use-package lsp-metals
  :ensure t)


(use-package protobuf-mode
  :ensure t
  )


(use-package go-mode
  :ensure t
  :config
  (autoload 'go-mode "go-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  )

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-project-search-path '("~/Gitlab/offline/" "~/Gitlab/online/" "~/Github/PrivateHub"))
  (projectile-register-project-type 'java '("pom.xml")
                                    :compile "mvn compile"
                                    :test "mvn test"
                                    :run "mvn package"
                                    :test-suffix "Test")
  )

;; helm
(use-package helm
  :ensure t
  :config
  (setq helm-locate-fuzzy-match nil)
  (setq helm-locate-command "mdfind -name %s %s")
  (setq locate-command "mdfind")
  ;; (setq helm-follow-mode-persistent t)
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
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
  (setq helm-buffer-max-length nil)
  )

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  )

(use-package helm-swoop
  :ensure t
  :config
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
  )

(use-package helm-ag
  :ensure t)

(defun my-helm-ag-thing-at-point ()
  "Search the symbol at point with `helm-ag'."
  (interactive)
  (let ((helm-ag-insert-at-point 'symbol))
    (helm-projectile-ag)
    ;; (helm-do-ag-project-root)
    ))
(global-set-key (kbd "M-I") 'my-helm-ag-thing-at-point)


;; other important
(use-package magit
  :ensure t
  )
(use-package wgrep
  :ensure t)

(use-package multiple-cursors
  :ensure t
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

(use-package smartscan
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'smartscan-mode)
  (add-hook 'org-mode-hook 'smartscan-mode)
  (add-hook 'dired-mode-hook 'smartscan-mode)
  )

;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  )
(use-package yasnippet-snippets
  :ensure t
  )

;; enable a more powerful jump back function from ace jump mode
(use-package ace-jump-mode
  :ensure t
  :config
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  (autoload
    'ace-jump-mode-pop-mark
    "ace-jump-mode"
    "Ace jump back:-)"
    t)
  (eval-after-load "ace-jump-mode"
    '(ace-jump-mode-enable-mark-sync))
  )



;; (use-package helm-config
;;   :ensure t
;;   )

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))  
  )


(when (display-graphic-p) 
  (use-package auto-highlight-symbol
    :ensure t
    :config
    (global-auto-highlight-symbol-mode t)
    )


  (use-package projectile-rails
    :ensure t
    :config
    (projectile-rails-global-mode)
    )

  (use-package highlight-indent-guides
    :ensure t
    :config
    (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
    (setq highlight-indent-guides-method 'character))

  )
