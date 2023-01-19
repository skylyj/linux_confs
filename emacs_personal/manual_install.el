;; 自己手动安装的一些包
;; (set-face-attribute 'fringe nil :background "grey")
(add-to-list 'load-path (concat user-emacs-directory "/icollect/hideshowvis/" ))
(require 'hideshowvis)

(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)


(dolist (hook (list 'emacs-lisp-mode-hook
                    'python-mode-hook
                    'c++-mode-hook))
  (add-hook hook 'hideshowvis-enable))
(hideshowvis-symbols)

;; (add-to-list 'load-path (concat user-emacs-directory "/icollect/highlight-global/" ))
;; (load "highlight-global")

;; (add-to-list 'load-path "~/Github/PrivateHub/linux_confs/emacs-jedi-direx/")
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
                                        ;(load "jedi-direx")
                                        ;(eval-after-load "python"
                                        ;  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
                                        ;(add-hook 'jedi-mode-hook 'jedi-direx:setup)

(add-to-list 'load-path (concat user-emacs-directory "/icollect/ammonite-term-repl" ))
(load "ammonite-term-repl")
(add-hook 'scala-mode-hook
          (lambda ()
            (ammonite-term-repl-minor-mode t)))


;; (add-to-list 'load-path (concat user-emacs-directory "/icollect/dired_plus/" ))
;; (load "dired+")


;; quelpa
;; (quelpa '(dired+ :fetcher wiki
;;                  :files
;;                  ("dired+.el")))
;; (require 'dired+)

;; (quelpa '(hl-line+ :fetcher wiki
;;                    :files
;;                    ("hl-line+.el")))
;; (require 'hl-line+)

;; (quelpa '(col-highlight :fetcher wiki
;;                         :files
;;                         ("col-highlight.el")))
;; (require 'col-highlight)

;; (quelpa '(crosshairs :fetcher wiki
;;                      :files
;;                      ("crosshairs.el")))
;; (require 'crosshairs)

;; (quelpa '(bookmark+ :fetcher wiki
;;                     :files
;;                     ("bookmark+.el"
;;                      "bookmark+-mac.el"
;;                      "bookmark+-bmu.el"
;;                      "bookmark+-1.el"
;;                      "bookmark+-key.el"
;;                      "bookmark+-lit.el"
;;                      "bookmark+-doc.el"
;;                      "bookmark+-chg.el")))
;; (require 'bookmark+)
