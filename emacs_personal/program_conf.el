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
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "M-<") 'company-select-first)
  (define-key company-active-map (kbd "M->") 'company-select-last)
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

(use-package eglot
  :pin melpa-stable
  ;; (optional) Automatically start metals for Scala files.
  :hook (scala-mode . eglot-ensure)
  :config
  (setq eldoc-echo-area-use-multiline-p nil)
  ;; (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
  )

;;需要安装metals-emacs
;; sudo coursier bootstrap \
;;   --java-opt -XX:+UseG1GC \
;;   --java-opt -XX:+UseStringDeduplication  \
;;   --java-opt -Xss4m \
;;   --java-opt -Xms100m \
;;   org.scalameta:metals_2.13:0.11.10 \
;;   -o /usr/local/bin/metals-emacs -f

;; yasnippet使用
