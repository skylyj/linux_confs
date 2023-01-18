;;; package --- Summary
;;; Code:
;;; Commentary:

;; python
;(use-package elpy
;  :ensure t
;  :init
;  (elpy-enable)
;  )

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

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))

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
