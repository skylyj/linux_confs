;;; package --- Summary
;;; Code:
;;; Commentary:
;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
;;   (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
;;   (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
;;   (setq dashboard-items '((recents  . 15)   ;; 显示多少个最近文件
;; 			  (bookmarks . 5)  ;; 显示多少个最近书签
;; 			  (projects . 5)
;; 			  (agenda . 5)
;;                           (registers . 5)
;; 			  )) ;; 显示多少个最近项目
;;   (setq dashboard-set-heading-icons t)
;;   (setq dashboard-set-file-icons t)
;;   (dashboard-setup-startup-hook))
;; 这个版本的不大兼容和emacs29




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


  (use-package openwith
    :ensure t
    :config
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
    )


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
    (global-set-key (kbd "s-i bl") 'bm-show-all)
    )


  (use-package ace-pinyin
    :ensure t
    :config
    (setq ace-pinyin-use-avy nil)
    (ace-pinyin-global-mode +1)
    (global-set-key (kbd "s-i pj") 'ace-pinyin-jump-char)
    )

  (use-package evil-numbers
    :ensure t
    :config
    (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
    (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
    (global-set-key (kbd "C-c C-+") 'evil-numbers/inc-at-pt-incremental)
    (global-set-key (kbd "C-c C--") 'evil-numbers/dec-at-pt-incremental)
    )
  (use-package helm-ls-git
    :ensure t
    )

  ;; (use-package helm-xref
  ;;   :ensure t
  ;;   :config
  ;;   (setq xref-show-xrefs-function 'helm-xref-show-xrefs)
  ;;   )

  (use-package helm-ctest
    :ensure t
    )


  (use-package helm-flycheck
    :ensure t
    :config
    (eval-after-load 'flycheck
      '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))
    )
  ;; (require 'swiper-helm)

  (use-package helm-themes
    :ensure t
    )

  (use-package helm-bm
    :ensure t
    )


  (use-package key-chord
    :ensure t
    :config
    (key-chord-mode 1)
    (key-chord-define-global "hj"     'undo)
    )


  ;; My-Mode
  (defvar my-keys-minor-mode-map
    (let ((map (make-sparse-keymap)))
      ;; (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)
      (define-key map  (kbd "C-x g") 'magit-status)
      (define-key map  (kbd "C-s") 'isearch-forward)
      (define-key map (kbd "C-c SPC") 'ace-jump-mode)
      (define-key map (kbd "C-x SPC") 'rectangle-mark-mode)
      (global-set-key (kbd "C-c g") 'google-this-mode-submap)
      ;; (move-text-default-bindings)
      map)
    "my-keys-minor-mode keymap.")

  (define-minor-mode my-mode
    "A minor mode so that my key settings override annoying major modes."
    :init-value t
    :lighter  my-mode
    :keymap my-keys-minor-mode-map
    )

  (my-mode 1)

  (use-package which-key
    :ensure t
    :config
    (which-key-mode)
    )

  (use-package zop-to-char
    :ensure t
    :config
    (global-set-key (kbd "M-z") 'zop-up-to-char)
    (global-set-key (kbd "M-Z") 'zop-to-char)
    )

  (setq package-check-signature nil)
  (use-package undo-tree
    :ensure t
    :config
    (undo-tree-mode)
    (setq undo-tree-history-directory-alist
	  `((".*" . ,temporary-file-directory)))
    (setq undo-tree-auto-save-history t)
    (global-undo-tree-mode)

    )


  (use-package crux
    :ensure t)

  (use-package anzu
    :ensure t
    :config
    (global-anzu-mode)
    (global-set-key (kbd "M-%") 'anzu-query-replace)
    (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
    )

  (use-package zenburn-theme
    :ensure t
    ;; :config
    ;; (load-theme 'zenburn t)
    )

  ;; (use-package neotree
  ;;   :ensure t
  ;;   )
)



(use-package browse-kill-ring
  :disabled
  :ensure t
  :config
  (browse-kill-ring-default-keybindings)
  (global-set-key (kbd "s-y") 'browse-kill-ring)
  ;; 有了helm-show-kill-ring 就够用了
  )

(use-package transpose-frame
  :ensure t
  )
(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key [remap mark-sexp] 'easy-mark)
  )


(use-package bookmark-in-project
  :ensure t
  :commands (bookmark-in-project-jump
             bookmark-in-project-jump-next
             bookmark-in-project-jump-previous
             bookmark-in-project-delete-all)
  :bind (
         ;; ("s-i pbl" . bookmark-in-project-jump)
         ("s-i pbn" . bookmark-in-project-jump-next)
         ("s-i pbp" . bookmark-in-project-jump-previous)
         ("s-i pbd" . bookmark-in-project-delete-all)
         ))
(load-library "bookmark-in-project")
(defun my/bookmark-in-project-jump ()
  "Jump to a bookmark in the current project."
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-in-project--jump-impl #'bookmark-jump))

(global-set-key (kbd "s-i pbl") 'my/bookmark-in-project-jump)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package change-inner
  :ensure t
  :config
  :bind (("s-i ci" . change-inner)
         ("s-i co" . change-outer)
         )
  )
(use-package nlinum
  :config
  (global-nlinum-mode t)
  )

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))

(use-package embrace
  :ensure t
  :config
  (global-set-key (kbd "C-,") #'embrace-commander)
  )
