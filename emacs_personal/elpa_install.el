;;; Code:
;;; Commentary:
;;; package --- Summary

(use-package wgrep
  :ensure t)

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1)
  )

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
  (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 15)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			  (projects . 10))) ;; 显示多少个最近项目
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-setup-startup-hook))

(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))

;; for multiple cursor
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

;;google this
(use-package google-this
  :ensure t
  :config
  (google-this-mode 1)
  )

;; (setq projectile-project-search-path '("~/Public" ("~/Github" . 1) ("~/Gitlab" . 1)))

(use-package good-scroll
  :ensure t
  :config
  (good-scroll-mode -1)
  )

(use-package beacon
  :ensure t
  :config
  (beacon-mode -1)
  )

(use-package highlight-symbol
  :ensure t
  :config
  (global-set-key [(control f3)] 'highlight-symbol)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [(shift f3)] 'highlight-symbol-prev)
  (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
  )

(use-package smartscan
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'smartscan-mode)
  )

;; HIGHLIGHT 自动高亮
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

;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
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

(use-package ace-pinyin
  :ensure t
  :config
  (setq ace-pinyin-use-avy nil)
  (ace-pinyin-global-mode +1)
  (global-set-key (kbd "s-i pj") 'ace-pinyin-jump-char)
  )

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character))

(use-package evil-numbers
  :ensure t
  :config
  (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
  (global-set-key (kbd "C-c C-+") 'evil-numbers/inc-at-pt-incremental)
  (global-set-key (kbd "C-c C--") 'evil-numbers/dec-at-pt-incremental)
  )

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-theme 'doom-city-lights)
  )

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

;(quelpa
; '(quelpa-use-package
;   :fetcher git
;   :url "https://github.com/quelpa/quelpa-use-package.git"))
;(require 'quelpa-use-package)

;; (use-package org-sidebar
;;   :quelpa (org-sidebar :fetcher github :repo "alphapapa/org-sidebar"))

(with-eval-after-load 'sr-speedbar
  (add-hook 'speedbar-visiting-file-hook
            #'(lambda () (select-window (next-window))) t))


;; HELM
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-project-search-path '("~/Gitlab/offline/" "~/Gitlab/online/" "~/Github/" ( )))
  )

(use-package helm
  :ensure t
  :config
  (setq helm-locate-fuzzy-match nil)
  (setq helm-locate-command "mdfind -name %s %s")
  (setq locate-command "mdfind")
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  (global-set-key (kbd "M-x") 'helm-M-x)
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
  )

;; (use-package helm-config
;;   :ensure t
;;   )

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm)
)

(use-package helm-ls-git
  :ensure t
  )

(use-package helm-xref
  :ensure t
  :config
  (setq xref-show-xrefs-function 'helm-xref-show-xrefs)
  )

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


;; BM
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


         :bind (("<f2>" . bm-next)
                ("S-<f2>" . bm-previous)
                ("C-<f2>" . bm-toggle))
         )

(use-package helm-themes
  :ensure t
  )

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
         (global-set-key (kbd "s-i bs") 'bm-show-all)
         :bind (("<f2>" . bm-next)
                ("S-<f2>" . bm-previous)
                ("C-<f2>" . bm-toggle)
                )
         )
(use-package helm-bm
  :ensure t
  )

(use-package helm-ag
  :ensure t)

(defun my-helm-ag-thing-at-point ()
  "Search the symbol at point with `helm-ag'."
  (interactive)
  (let ((helm-ag-insert-at-point 'symbol))
    (helm-do-ag-project-root)))
(global-set-key (kbd "M-I") 'my-helm-ag-thing-at-point)


(use-package transpose-frame
  :ensure t
  )

(use-package neotree
  :ensure t
  )

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key [remap mark-sexp] 'easy-mark)
  )



(use-package bookmark-in-project
  :commands (bookmark-in-project-jump
             bookmark-in-project-jump-next
             bookmark-in-project-jump-previous
             bookmark-in-project-delete-all)

  ;; Example key bindings.
  :bind (("s-i pbl" . bookmark-in-project-jump)
         ("s-i pbn" . bookmark-in-project-jump-next)
         ("s-i pbp" . bookmark-in-project-jump-previous)
         ("s-i pbd" . bookmark-in-project-delete-all)
         ))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package change-inner
             :ensure t
             :config
             :bind (("s-i ci" . change-inner)
                    ("s-i co" . change-outer)
                    )
             )

;; My-Mode
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;; (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)
    (define-key map  (kbd "C-x g") 'magit-status)
    (define-key map  (kbd "C-s") 'isearch-forward)
    (define-key map (kbd "C-c SPC") 'ace-jump-mode)
    (define-key map (kbd "C-x SPC") 'rectangle-mark-mode)
    (move-text-default-bindings)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter  my-mode
  :keymap my-keys-minor-mode-map
  )

(my-mode 1)
