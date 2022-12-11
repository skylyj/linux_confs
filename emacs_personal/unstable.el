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




;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Set up helm
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Load helm and set M-x to helm, buffer to helm, and find files to herm
(require 'helm-config)
(require 'helm)
(require 'helm-ls-git)
(require 'helm-ctest)
;; Use C-c h for helm instead of C-x c
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-c t") 'helm-ctest)

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
(require 'helm-flycheck) ;; Not necessary if using ELPA package
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))
