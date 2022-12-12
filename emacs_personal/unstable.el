;; (require 'rtags)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Setup cmake-ide
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'cmake-ide)
;; (cmake-ide-setup)
;; ;; Set cmake-ide-flags-c++ to use C++11
;; (setq cmake-ide-flags-c++ (append '("-std=c++11")))
;; ;; We want to be able to compile with a keyboard shortcut
;; (global-set-key (kbd "C-c m") 'cmake-ide-compile)

;; ;; Set rtags to enable completions and use the standard keybindings.
;; ;; A list of the keybindings can be found at:
;; ;; http://syamajala.github.io/c-ide.html
;; (setq rtags-autostart-diagnostics t)
;; (rtags-diagnostics)
;; (setq rtags-completions-enabled t)
;; (rtags-enable-standard-keybindings)
;; (cmake-ide-setup)
;; (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
;; (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

;; (use-package rtags
;;   :ensure t
;;   :hook (c++-mode . rtags-start-process-unless-running)
;;   :config (setq rtags-completions-enabled t
;; 		;; rtags-path "/home/manoj/.emacs.d/rtags/src/rtags.el"
;; 		rtags-rc-binary-name "/Users/mobvista/Soft/rtags/bin/rc"
;; 		rtags-use-helm t
;; 		rtags-rdm-binary-name "/Users/mobvista/Soft/rtags/bin/rdm")
;;   ;; :bind (("C-c E" . rtags-find-symbol)
;;   ;; 	 ("C-c e" . rtags-find-symbol-at-point)
;;   ;; 	 ("C-c O" . rtags-find-references)
;;   ;; 	 ("C-c o" . rtags-find-references-at-point)
;;   ;; 	 ("C-c s" . rtags-find-file)
;;   ;; 	 ("C-c v" . rtags-find-virtuals-at-point)
;;   ;; 	 ("C-c F" . rtags-fixit)
;;   ;; 	 ("C-c f" . rtags-location-stack-forward)
;;   ;; 	 ("C-c b" . rtags-location-stack-back)
;;   ;; 	 ("C-c n" . rtags-next-match)
;;   ;; 	 ("C-c p" . rtags-previous-match)
;;   ;; 	 ("C-c P" . rtags-preprocess-file)
;;   ;; 	 ("C-c R" . rtags-rename-symbol)
;;   ;; 	 ("C-c x" . rtags-show-rtags-buffer)
;;   ;; 	 ("C-c T" . rtags-print-symbol-info)
;;   ;; 	 ("C-c t" . rtags-symbol-type)
;;   ;; 	 ("C-c I" . rtags-include-file)
;;   ;; 	 ("C-c i" . rtags-get-include-file-for-symbol))
;;   )

;; (setq rtags-display-result-backend 'helm)


;; (use-package company-tabnine
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends #'company-tabnine)
;;   ;; Trigger completion immediately.
;;   (setq company-idle-delay 0)
;;   ;; Number the candidates (use M-1, M-2 etc to select completions).
;;   (setq company-show-numbers t)

;;   )



;; (use-package citre
;;   :defer t
;;   :init
;;   ;; This is needed in `:init' block for lazy load to work.
;;   (require 'citre-config)
;;   ;; Bind your frequently used commands.  Alternatively, you can define them
;;   ;; in `citre-mode-map' so you can only use them when `citre-mode' is enabled.
;;   (global-set-key (kbd "C-x c j") 'citre-jump)
;;   (global-set-key (kbd "C-x c J") 'citre-jump-back)
;;   (global-set-key (kbd "C-x c p") 'citre-ace-peek)
;;   (global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
;;   :config
;;   (setq
;;    ;; Set these if readtags/ctags is not in your PATH.
;;    citre-readtags-program "/path/to/readtags"
;;    citre-ctags-program "/path/to/ctags"
;;    ;; Set these if gtags/global is not in your PATH (and you want to use the
;;    ;; global backend)
;;    citre-gtags-program "/path/to/gtags"
;;    citre-global-program "/path/to/global"
;;    ;; Set this if you use project management plugin like projectile.  It's
;;    ;; used for things like displaying paths relatively, see its docstring.
;;    citre-project-root-function #'projectile-project-root
;;    ;; Set this if you want to always use one location to create a tags file.
;;    citre-default-create-tags-file-location 'global-cache
;;    ;; See the "Create tags file" section above to know these options
;;    citre-use-project-root-when-creating-tags t
;;    citre-prompt-language-for-ctags-command t
;;    ;; By default, when you open any file, and a tags file can be found for it,
;;    ;; `citre-mode' is automatically enabled.  If you only want this to work for
;;    ;; certain modes (like `prog-mode'), set it like this.
;;    citre-auto-enable-citre-mode-modes '(prog-mode)))




;; (use-package helm-gtags
;;   :after (helm)
;;   :init
;;   (add-hook 'c-mode-hook 'helm-gtags-mode)
;;   (add-hook 'c++-mode-hook 'helm-gtags-mode)
;;   (add-hook 'asm-mode-hook 'helm-gtags-mode)

;;   :config
;;   ;; customize
;;   (custom-set-variables
;;    '(helm-gtags-path-style 'relative)
;;    '(helm-gtags-ignore-case t)
;;    '(helm-gtags-auto-update t)))

;; :bind
;; (:map helm-gtags-mode-map
;;       ("M-t" . helm-gtags-find-tag)
;;       ("M-r" . helm-gtags-find-rtag)
;;       ("M-s" . helm-gtags-find-symbol)
;;       ("M-," . helm-gtags-previous-history)
;;       ("M-." . helm-gtags-next-history)))
