;; [[file:../../tech_org/dotfiles/emacs_conf.org::*edit][edit:1]]
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

  ;; youtube
  (use-package helm-youtube
    :ensure t
    :config
    (setq helm-youtube-key "AIzaSyAQB8odOXYv46YR-x0Dk7BZbVTnWVYL4oM")
    (define-key global-map (kbd "C-c y") 'helm-youtube)
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


  ;; HIGHLIGHT 自动高亮

  (use-package key-chord
    :ensure t
    :config
    (key-chord-mode 1)
    (key-chord-define-global "hj"     'undo)
    )


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

(use-package which-key
  :config
  (which-key-mode))

(use-package embrace
  :ensure t
  :config
  (global-set-key (kbd "C-,") #'embrace-commander)
  )

;; ace-pinyin and evil-numbers 可能不兼容copilot
;; (use-package ace-pinyin
;;   :ensure t
;;   :config
;;   (setq ace-pinyin-use-avy nil)
;;   (ace-pinyin-global-mode +1)
;;   (global-set-key (kbd "s-i pj") 'ace-pinyin-jump-char)
;;   )

;; (use-package evil-numbers
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
;;   (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
;;   (global-set-key (kbd "C-c C-+") 'evil-numbers/inc-at-pt-incremental)
;;   (global-set-key (kbd "C-c C--") 'evil-numbers/dec-at-pt-incremental)
;;   )
;; edit:1 ends here
