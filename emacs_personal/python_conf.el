;;; package --- Summary
;;; Code:
;;; Commentary:

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
            ;; (setq flycheck-pylintrc "~/.pylintrc")
            ;; (setq flycheck-flake8rc "~/.config/flake8")
            )
          )

;; 关于anaconda，先安装conda，使用conda-activate可以切换conda环境
(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home (expand-file-name "~/miniforge3/"))
  (setq conda-env-home-directory (expand-file-name "~/miniforge3"))
  (setq-default mode-line-format (cons mode-line-format '(:exec conda-env-current-name)))
  (conda-env-activate "tf26")
  )

;; anaconda-mode定义了很多跳转功能，比如 anaconda-mode-find-definitions M.,M=
;; (use-package anaconda-mode
;;   :ensure t
;;   :bind (("C-c C-x" . next-error))
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;   )

;; (use-package company-anaconda
;;   :ensure t
;;   :config
;;   (eval-after-load "company"
;;     '(add-to-list 'company-backends '(company-anaconda))))

;; (use-package company-shell
;;   :ensure t
;;   :config
;;   (eval-after-load "company"
;;     '(add-to-list 'company-backends '(company-shell company-shell-env))))

					;(use-package company-jedi
					;  :ensure t
					;  )

					;(use-package company-irony
					;  :ensure t
					;  :config
					;  (eval-after-load "company"
					;    '(add-to-list 'company-backends '(company-irony))))

;; PYTHON CONFIG END
;; 可以让imenu 平铺起来flat
(defun python-imenu-use-flat-index
    ()
  (setq imenu-create-index-function
        #'python-imenu-create-flat-index))

(add-hook 'python-mode-hook
          #'python-imenu-use-flat-index)

(use-package py-autopep8
  :hook ((python-mode) . py-autopep8-mode))


(use-package dap-mode
  :ensure t
  :config
  (dap-mode 1)
  ;; The modes below are optional
  (dap-ui-mode 1)
  ;; enables mouse hover support
  (dap-tooltip-mode 1)
  ;; use tooltips for mouse hover
  ;; if it is not enabled `dap-mode' will use the minibuffer.
  (tooltip-mode 1)
  ;; displays floating panel with debug buttons
  ;; requies emacs 26+
  (dap-ui-controls-mode 1)
  (require 'dap-python)
  ;; if you installed debugpy, you need to set this
  ;; https://github.com/emacs-lsp/dap-mode/issues/306
  (setq dap-python-debugger 'debugpy)
  )


(use-package realgud
  :ensure t)

;; run-python 使用ipython
(setq python-shell-completion-native-enable nil)
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

(use-package ein
  :ensure t)

(use-package python-pytest)





;; c++
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


;; (require 'lsp-docker)
;; (defvar lsp-docker-client-packages
;;     '(lsp-css lsp-clients lsp-bash lsp-go lsp-pylsp lsp-html lsp-typescript
;;       lsp-terraform lsp-clangd))

;; (setq lsp-docker-client-configs
;;     '((:server-id bash-ls :docker-server-id bashls-docker :server-command "bash-language-server start")
;;       (:server-id clangd :docker-server-id clangd-docker :server-command "clangd")
;;       (:server-id css-ls :docker-server-id cssls-docker :server-command "css-languageserver --stdio")
;;       (:server-id dockerfile-ls :docker-server-id dockerfilels-docker :server-command "docker-langserver --stdio")
;;       (:server-id gopls :docker-server-id gopls-docker :server-command "gopls")
;;       (:server-id html-ls :docker-server-id htmls-docker :server-command "html-languageserver --stdio")
;;       (:server-id pylsp :docker-server-id pyls-docker :server-command "pylsp")
;;       (:server-id ts-ls :docker-server-id tsls-docker :server-command "typescript-language-server --stdio")))

;; (lsp-docker-init-clients
;;   :path-mappings '(("~/Gitlab/offline/ltv_model" . "/projects"))
;;   :client-packages lsp-docker-client-packages
;;   :client-configs lsp-docker-client-configs)
