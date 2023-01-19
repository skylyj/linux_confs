(global-set-key (kbd "C-x m") 'eshell)

    ;; (define-key map (kbd "C-a") 'crux-move-beginning-of-line)
(defun my/find-ssh-custom-file ()
  "Edit the `ssh/custom-file', in another window."
  (interactive)
  (let ((ssh-custom-file "~/.ssh/config"))
    (find-file-other-window ssh-custom-file)
    (message (format "opening %s" ssh-custom-file))
    )
  )

(defun my/find-zshell-custom-file ()
  "Edit the `ssh/custom-file', in another window."
  (interactive)
  (let ((zshell-custom-file "~/.zshrc"))
    (find-file-other-window zshell-custom-file)
    (message (format "opening %s" zshell-custom-file))
    )
  )


(global-set-key (kbd "s-i fs") 'my/find-ssh-custom-file)
(global-set-key (kbd "s-i fz") 'my/find-zshell-custom-file)


(use-package crux
  :ensure t
  :config
    (global-set-key [(shift return)] 'crux-smart-open-line)
    (global-set-key (kbd "M-o") 'crux-smart-open-line)
    (global-set-key [(control shift return)] 'crux-smart-open-line-above)
    (global-set-key (kbd "C-c n") 'crux-cleanup-buffer-or-region)
    (global-set-key (kbd "C-c f")  'crux-recentf-find-file)
    (global-set-key (kbd "C-M-z") 'crux-indent-defun)
    (global-set-key (kbd "C-c u") 'crux-view-url)
    (global-set-key (kbd "C-c e") 'crux-eval-and-replace)
    (global-set-key (kbd "C-c s") 'crux-swap-windows)
    (global-set-key (kbd "C-c D") 'crux-delete-file-and-buffer)
    (global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
    (global-set-key (kbd "C-c M-d") 'crux-duplicate-and-comment-current-line-or-region)
    (global-set-key (kbd "C-c r") 'crux-rename-buffer-and-file)
    (global-set-key (kbd "C-c t") 'crux-visit-term-buffer)
    (global-set-key (kbd "C-c k") 'crux-kill-other-buffers)
    (global-set-key (kbd "C-c TAB") 'crux-indent-rigidly-and-copy-to-clipboard)
    (global-set-key (kbd "s-i fi") 'crux-find-user-init-file)
    (global-set-key (kbd "C-c i") 'imenu-anywhere)
    )

    ;; (define-key map [(control shift up)]  'move-text-up)
    ;; (define-key map [(control shift down)]  'move-text-down)
    ;; (define-key map [(meta shift up)]  'move-text-up)
    ;; (define-key map [(meta shift down)]  'move-text-down)