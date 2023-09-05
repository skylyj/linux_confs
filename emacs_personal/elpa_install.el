;;; package --- Summary
;;; Code:
;;; Commentary:
;; straight
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; HELM
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


(when (display-graphic-p) 
  ;; Do any keybindings and theme setup here
  (use-package gnuplot
    :ensure t)
  (use-package gnuplot-mode
    :ensure t)
  (use-package helm-chrome
    :ensure t)

  (use-package dash-at-point
    :ensure t
    :config
    (global-set-key (kbd "s-i dp") 'dash-at-point)
    (global-set-key (kbd "s-i dw") 'dash-at-point-with-docset)
    )
  (use-package diminish
    :ensure t)


  (use-package visual-regexp
    :ensure t)
  (use-package visual-regexp-steroids
    :ensure t
    :config
    (define-key global-map (kbd "C-c q") 'vr/query-replace)
    )
  ;; for forge
					;(setq auth-sources '("~/.authinfo"))
					;(use-package forge
					;  :ensure t
					;  )
					;(with-eval-after-load 'magit
					;  (require 'forge))
					;(with-eval-after-load 'forge
					;  (add-to-list 'forge-alist
					;               '("gitlab.mobvista.com"
					;                 "gitlab.mobvista.com/api/v4"
					;                 "gitlab.mobvista.com"
					;                 forge-gitlab-repository)))

  ;;google this
  (use-package google-this
    :ensure t
    :config
    (google-this-mode 1)
    (global-set-key (kbd "C-c g") 'google-this-mode-submap)
    )


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

  ;; (use-package highlight-symbol
  ;;   :ensure t
  ;;   :config
  ;;   (global-set-key [(control f3)] 'highlight-symbol)
  ;;   (global-set-key [f3] 'highlight-symbol-next)
  ;;   (global-set-key [(shift f3)] 'highlight-symbol-prev)
  ;;   (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
  ;;   )


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

  (use-package highlight-indent-guides
    :ensure t
    :config
    (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
    (setq highlight-indent-guides-method 'character))
  )
;; (use-package counsel-projectile
;;   :ensure t
;;   :config
;;   (counsel-projectile-mode 1)
;;   )

;; (use-package marginalia
;;   :ensure t
;;   :init (marginalia-mode)
;;   :bind (:map minibuffer-local-map
;; 	      ("M-A" . marginalia-cycle)))

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


)					;(quelpa

					; '(quelpa-use-package
					;   :fetcher git
					;   :url "https://github.com/quelpa/quelpa-use-package.git"))
					;(require 'quelpa-use-package)

;; (use-package org-sidebar
;;   :quelpa (org-sidebar :fetcher github :repo "alphapapa/org-sidebar"))



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

(use-package s
  :ensure t)

(use-package dash
  :ensure t)

(use-package editorconfig
  :ensure t)


;;copilot
;; (add-to-list 'load-path
;; 	     (expand-file-name (concat user-emacs-directory "copilot.el")))
;; (require 'copilot)
;; copilot automatically provide completions
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
;; 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


;; (use-package codeium
;;     ;; if you use straight
;;     :straight '(:type git :host github :repo "Exafunction/codeium.el")
;;     ;; otherwise, make sure that the codeium.el file is on load-path

;;     :init
;;     ;; use globally
;;     (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
;;     ;; or on a hook
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

;;     ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local completion-at-point-functions
;;     ;;             (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
;;     ;; an async company-backend is coming soon!

;;     ;; codeium-completion-at-point is autoloaded, but you can
;;     ;; optionally set a timer, which might speed up things as the
;;     ;; codeium local language server takes ~0.2s to start up
;;     ;; (add-hook 'emacs-startup-hook
;;     ;;  (lambda () (run-with-timer 0.1 nil #'codeium-init)))

;;     ;; :defer t ;; lazy loading, if you want
;;     :config
;;     (setq use-dialog-box nil) ;; do not use popup boxes

;;     ;; if you don't want to use customize to save the api-key
;;     ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

;;     ;; get codeium status in the modeline
;;     (setq codeium-mode-line-enable
;;         (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
;;     (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
;;     ;; alternatively for a more extensive mode-line
;;     ;; (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

;;     ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
;;     (setq codeium-api-enabled
;;         (lambda (api)
;;             (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
;;     ;; you can also set a config for a single buffer like this:
;;     ;; (add-hook 'python-mode-hook
;;     ;;     (lambda ()
;;     ;;         (setq-local codeium/editor_options/tab_size 4)))

;;     ;; You can overwrite all the codeium configs!
;;     ;; for example, we recommend limiting the string sent to codeium for better performance
;;     (defun my-codeium/document/text ()
;;         (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
;;     ;; if you change the text, you should also change the cursor_offset
;;     ;; warning: this is measured by UTF-8 encoded bytes
;;     (defun my-codeium/document/cursor_offset ()
;;         (codeium-utf8-byte-length
;;             (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
;;     (setq codeium/document/text 'my-codeium/document/text)
;;     (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))
