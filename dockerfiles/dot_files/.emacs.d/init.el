;;; package --- Summary
;;; Code:
;;; Commentary:
(load "~/Github/PrivateHub/linux_confs/emacs_personal/basic_conf.el")
(load "~/Github/PrivateHub/linux_confs/emacs_personal/elpa_install.el")
(load "~/Github/PrivateHub/linux_confs/emacs_personal/program_conf.el")
(load "~/Github/PrivateHub/linux_confs/emacs_personal/python_conf.el")
(when (display-graphic-p) 
  (load "~/Github/PrivateHub/linux_confs/emacs_personal/c_config.el")
  (load "~/Github/PrivateHub/linux_confs/emacs_personal/org_conf.el")
  (load "~/Github/PrivateHub/linux_confs/emacs_personal/ifuns.el")
  ;; (load "~/Github/PrivateHub/linux_confs/emacs_personal/manual_install.el")
  )
(load "~/Github/PrivateHub/linux_confs/emacs_personal/keybindings.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "2dc03dfb67fbcb7d9c487522c29b7582da20766c9998aaad5e5b63b5c27eec3f" default))
 '(elpy-modules
   '(elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-readtheorg\\.setup\\'" "\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-bigblow\\.setup\\'"))
 '(package-selected-packages
   '(htmlize treemacs-tab-bar treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile lsp-docker lsp-metals csv-mode elpy dash-at-point python-pytest visual-regexp-steroids visual-regexp yaml-mode ein helm-chrome docker-tramp helm-tramp dockerfile-mode multi-vterm vterm docker yasnippet-snippets devdocs-browser devdocs helm-dash helm-dired-history cmake-mode dired-ranger dired-list dired-filter dired-rainbow dired-collapse dired-sidebar ox-html diminish gnuplot-mode gnuplot browse-kill-ring embrace realgud py-autopep8 doom-themes doom-theme move-text sbt-mode company-lsp dap-mode lsp-treemacs lsp-ivy helm-lsp lsp-ui lsp-mode go-mode protobuf-mode nlinum zenburn-theme zenburn anzu zop-to-char undo-tree which-key crux exec-path-from-shell forge magit scala-mode anaconda-mode conda yasnippet wgrep use-package transpose-frame smartscan smartparens projectile-rails openwith neotree multiple-cursors key-chord highlight-symbol highlight-indent-guides helm-xref helm-themes helm-swoop helm-projectile helm-ls-git helm-flycheck helm-ctest helm-bm helm-ag google-this good-scroll evil-numbers easy-kill doom-modeline dired-narrow dashboard change-inner bookmark-in-project beacon auto-highlight-symbol all-the-icons-ivy-rich all-the-icons-dired ace-pinyin ace-jump-mode))
 '(safe-local-variable-values
   '((eval setq flycheck-clang-include-path
	   (list
	    (expand-file-name "/opt/homebrew/Cellar/boost/1.80.0/include")
	    (expand-file-name "/opt/homebrew/Cellar/thrift/0.17.0/include/")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/include")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/include/consul")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/features")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/../common/include")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/build/gen/flatbuffers/cpp/")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/build/gen/thrift/cpp/enum")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/build/gen/thrift/cpp/rs")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/build/gen/protobuf/cpp")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/build/gen/flatbuffers/cpp/saas")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/build/gen/model")
	    (expand-file-name "/Users/mobvista/Gitlab/saas_dsp/build/abtest"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:background "blue" :foreground "#fff")))))
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
