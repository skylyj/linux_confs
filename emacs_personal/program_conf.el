;;; package --- Summary
;;; Code:
;;; Commentary:

;; flycheck
(use-package flycheck
  :init (global-flycheck-mode))
;; Force flycheck to always use c++11 support. We use
;; the clang language backend so this is set to clang
;; Turn flycheck on everywhere

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

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(company-tooltip ((t (:background "blue" :foreground "#fff")))))

;; (require 'package)

;; Add melpa-stable to your packages repositories
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (package-initialize)

;; Enable defer and ensure by default for use-package
;; (setq use-package-always-defer t
;;       use-package-always-ensure t)

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

;; lsp mode

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

