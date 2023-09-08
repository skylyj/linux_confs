
(use-package doom-themes
  :ensure t)


(when (display-graphic-p) 
  ;; Do any keybindings and theme setup here
  (setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home")

  (use-package all-the-icons
    :ensure t)

  (use-package all-the-icons-ivy-rich
    :ensure t
    :config
    (all-the-icons-ivy-rich-mode 1)
    )

  (use-package all-the-icons-dired
    :ensure t
    :config
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
    )
  (use-package doom-modeline
    :ensure t
    :hook (after-init . doom-modeline-mode)
    :config
    (setq doom-theme 'doom-city-lights)
    (setq doom-modeline-env-version t)
    (setq doom-modeline-env-enable-python t)
    (setq doom-modeline-env-enable-ruby t)
    (setq doom-modeline-env-enable-perl t)
    (setq doom-modeline-env-enable-go t)
    (setq doom-modeline-env-enable-elixir t)
    (setq doom-modeline-env-enable-rust t)
    (setq doom-modeline-buffer-encoding t)
    (setq doom-modeline-workspace-name t)
    (setq doom-modeline-buffer-file-name-style 'buffer-name)
    :custom-face
    (mode-line ((t (:height 1.0))))
    (mode-line-inactive ((t (:height 1.0))))
    :custom
    (doom-modeline-height 18)
    (doom-modeline-bar-width 10)
    (doom-modeline-lsp t)
    (doom-modeline-github t)
    (doom-modeline-mu4e nil)
    (doom-modeline-irc t)
    (doom-modeline-buffer-encoding t)
    (doom-modeline-battery t)
    
    ;; (doom-modeline-minor-modes t)
    ;; (doom-modeline-persp-name nil)
    (doom-modeline-major-mode-icon t)  
    )

  (with-eval-after-load 'sr-speedbar
    (add-hook 'speedbar-visiting-file-hook
              #'(lambda () (select-window (next-window))) t))




  ;; (use-package neotree
  ;;   :ensure t
  ;;   )
)

