(require 'cc-mode)
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++11")))

;; 关于semantic
;; (require 'semantic)
;; (require 'semantic/sb)
;; (require 'srecode)

;; (add-hook 'c++-mode-hook
;;           (lambda ()
;;             (semantic-mode 1)
;;             ;; (global-semanticdb-minor-mode 1)
;;             ;; (global-semantic-idle-scheduler-mode 1)
;;             ;; (global-semantic-idle-completions-mode 1)
;;             (semantic-decoration-mode 1)
;;             (semantic-highlight-func-mode 1)
;;             (semantic-stickyfunc-mode -1)
;;             ;; (global-semantic-decoration-mode 1)
;;             ;; (global-semantic-highlight-func-mode 1)
;;             ;; (global-semantic-stickyfunc-mode -1)
;;             ;; (global-semantic-idle-summary-mode 1)
;;             ;; (global-semantic-mru-bookmark-mode 1)
;;             )
;;           )



(use-package smartparens
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode)
  )
(use-package smartparens-config
  :ensure smartparens
  :config (progn (show-smartparens-global-mode t)))
(setq smartparens-strict-mode nil)


(defmacro def-pairs (pairs)
  "Define functions for pairing. PAIRS is an alist of (NAME . STRING)
conses, where NAME is the function name that will be created and
STRING is a single-character string that marks the opening character.

  (def-pairs ((paren . \"(\")
              (bracket . \"[\"))

defines the functions WRAP-WITH-PAREN and WRAP-WITH-BRACKET,
respectively."
  `(progn
     ,@(loop for (key . val) in pairs
             collect
             `(defun ,(read (concat
                             "wrap-with-"
                             (prin1-to-string key)
                             "s"))
                  (&optional arg)
                (interactive "p")
                (sp-wrap-with-pair ,val)))))

(def-pairs ((paren . "(")
            (bracket . "[")
            (brace . "{")
            (single-quote . "'")
            (double-quote . "\"")
            (back-quote . "`")))

(bind-keys
 :map smartparens-mode-map
 ;; ("C-M-a" . sp-beginning-of-sexp)
 ;; ("C-M-e" . sp-end-of-sexp)

 ("C-<down>" . sp-down-sexp)
 ("C-<up>"   . sp-up-sexp)
 ("M-<down>" . sp-backward-down-sexp)
 ("M-<up>"   . sp-backward-up-sexp)

 ("C-M-f" . sp-forward-sexp)
 ("C-M-b" . sp-backward-sexp)

 ("C-M-n" . sp-next-sexp)
 ("C-M-p" . sp-previous-sexp)

 ("C-S-f" . sp-forward-symbol)
 ("C-S-b" . sp-backward-symbol)

 ("C-<right>" . sp-forward-slurp-sexp)
 ("M-<right>" . sp-forward-barf-sexp)
 ("C-<left>"  . sp-backward-slurp-sexp)
 ("M-<left>"  . sp-backward-barf-sexp)

 ("C-M-t" . sp-transpose-sexp)
 ("C-M-k" . sp-kill-sexp)
 ("C-k"   . sp-kill-hybrid-sexp)
 ("M-k"   . sp-backward-kill-sexp)
 ("C-M-w" . sp-copy-sexp)
 ("C-M-d" . delete-sexp)

 ("M-<backspace>" . backward-kill-word)
 ("C-<backspace>" . sp-backward-kill-word)
 ([remap sp-backward-kill-word] . backward-kill-word)

 ("M-[" . sp-backward-unwrap-sexp)
 ("M-]" . sp-unwrap-sexp)

 ("C-x C-t" . sp-transpose-hybrid-sexp)

 ("C-c ("  . wrap-with-parens)
 ("C-c ["  . wrap-with-brackets)
 ("C-c {"  . wrap-with-braces)
 ("C-c '"  . wrap-with-single-quotes)
 ("C-c \"" . wrap-with-double-quotes)
 ("C-c _"  . wrap-with-underscores)
 ("C-c `"  . wrap-with-back-quotes))

(defun sp-pair-curly-down-sexp (&optional arg)
  (interactive "P")
  (sp-restrict-to-pairs "{" 'sp-down-sexp))
(defun sp-pair-curly-up-sexp (&optional arg)
  (interactive "P")
  (sp-restrict-to-pairs "}" 'sp-up-sexp))

(define-key c++-mode-map (kbd "s-i }") (sp-restrict-to-pairs-interactive "{" 'sp-down-sexp))
(define-key c++-mode-map (kbd "s-i {}") (sp-restrict-to-pairs-interactive "}" 'sp-up-sexp))
(define-key c++-mode-map (kbd "s-i u") (sp-restrict-to-pairs-interactive "{" 'sp-backward-up-sexp))

;; for cmakelist.txt
(use-package cmake-mode
  :ensure t
  :config
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))
	      )
