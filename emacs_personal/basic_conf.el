;;; package --- Summary
;;; Code:
;;; Commentary:

;; 这样mac open file的时候不会重复打开frame了，始终在一个frame里面
;; (load-theme 'wombat)
(set-cursor-color "yellow")
(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
;; (global-set-key [remap goto-line] 'goto-line-preview)
;; (setq eshell-last-dir-ring-size 500)
(add-hook 'sh-mode-hook 'flycheck-mode)

(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)
      (load-theme 'misterioso)
      )
  (progn
    (menu-bar-mode -1) 
    ;; (toggle-scroll-bar -1) 
    (tool-bar-mode -1) 
      ;(load-theme 'zenburn)
    )
  )
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\.DS_Store$" "\\|^\\..+$" "\\|__pycache__" "\\|.*\\.pyc$"))
(add-hook 'dired-mode-hook 'dired-omit-mode)
;; 这样可以使得compile window 优先是split-window-vertically
(setq split-width-threshold nil)
(setq split-height-threshold 0)

;; for mac
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper
;; 自定义的key
(global-set-key (kbd "s-i C-s") 'swiper-isearch)
(global-set-key (kbd "s-i *") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "s-i ttl") 'toggle-truncate-lines)
(global-set-key "\C-xf" 'helm-recentf)
(global-set-key "\C-xg" 'magit-status)
(global-set-key (kbd "C-x C-j") 'dired-jump)

(global-set-key "\C-z" 'set-mark-command)
(setq abbrev-file-name "~/.emacs.d/personal/.abbrev_defs") ;; 缺省的定义缩写的文件。
(setq my/savefile-dir "~/.emacs.d/personal/")
(setq bookmark-default-file (expand-file-name "bookmarks" my/savefile-dir)) ;; 缺省书签文件的路径及文件名。

;; save recent files
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" my/savefile-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 15
      recentf-auto-cleanup 'never)

(global-font-lock-mode 1)               ; 开启语法高亮。
(auto-compression-mode 1)               ; 打开压缩文件时自动解压缩。
(column-number-mode 1)                  ; 显示列号。
(blink-cursor-mode -1)                  ; 光标不要闪烁。
;; (display-time-mode 1)                   ; 显示时间。
(show-paren-mode 1)                     ; 高亮显示匹配的括号。
(icomplete-mode 1)            ; 给出用 M-x foo-bar-COMMAND 输入命令的提示。
(setq select-enable-clipboard t)  ;用来和系统共享剪贴板
(setq confirm-kill-emacs 'yes-or-no-p)

(transient-mark-mode t)
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")

;; 可以让选择的区域高亮
(line-number-mode t)
(setq-default kill-whole-line t) ;; 在行首 C-k 时，同时删除该行。
(fset 'yes-or-no-p 'y-or-n-p) ;;改变 Emacs 固执的要你回答 yes 的行为。按y或空格键表示yes,n表示no。
(setq auto-image-file-mode t)

;;hide and show
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'go-mode 'hs-minor-mode)
(add-hook 'c++-mode 'hs-minor-mode)
(global-set-key (kbd "s-i hs") 'hs-show-block)
(global-set-key (kbd "s-i hh") 'hs-hide-block)

;; 系统相关
(cond
 ((equal system-type 'gnu/linux)
       (set-frame-font "Monospace-19"))
      ((equal system-type 'darwin)
       (tool-bar-mode -1)
       (set-frame-font "Menlo-16")
       ;; (set-fontset-font
       ;;  (frame-parameter nil 'font)
       ;;  'han
       ;;  (font-spec :family "Hiragino Sans GB" ))
       ))

(setq auto-save-default nil)

(setq whitespace-style '(tabs trailing lines tab-mark))

(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(provide 'basic_conf)

;;; basic_conf.el ends here


(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

;;dired
(use-package dired-subtree
  :ensure t
  :defer t
  :bind (:map dired-mode-map
              ("TAB" . dired-subtree-cycle)))
(use-package dired-collapse
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'dired-collapse-mode)
  )

(use-package dired-rainbow
  :config
  (progn
    (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")
    ))

(use-package dired-filter
  :ensure t)

;; dired-narrow
(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map
              ("," . dired-narrow))
  )

(use-package dired-ranger
  :ensure t)

;; emacs server, client 可以在终端使用 /Applications/Emacs\ 2.app/Contents/MacOS/bin/emacsclient ifuns.el &来启动
;(when (display-graphic-p) 
;  (server-start)    
; )

;; tramp
;; (setq recentf-exclude `(,tramp-file-name-regexp
;;                         "COMMIT_EDITMSG")
;;       tramp-auto-save-directory temporary-file-directory
;;       backup-directory-alist (list (cons tramp-file-name-regexp nil)))
;; (defun my/project-remember-advice (fn pr &optional no-write)
;;   (let* ((remote? (file-remote-p (project-root pr)))
;;          (no-write (if remote? t no-write)))
;;     (funcall fn pr no-write)))

;; (advice-add 'project-remember-project :around
;;             'my/project-remember-advice)
;; ;; (setq tramp-verbose 10); 默认是 3
;; (setq tramp-default-method "ssh")
;; (setq remote-file-name-inhibit-cache nil)
;; (setq vc-ignore-dir-regexp
;;       (format "%s\\|%s"
;;                     vc-ignore-dir-regexp
;;                     tramp-file-name-regexp))
;; (setq tramp-verbose 1)
;; (use-package helm-dired-history
;;   :ensure t
;;   :config
;;   (require 'savehist)
;;   (add-to-list 'savehist-additional-variables 'helm-dired-history-variable)
;;   (savehist-mode 1)

;;   (with-eval-after-load 'dired
;;     (require 'helm-dired-history) 
;;     ;; if you are using ido,you'd better disable ido for dired
;;     ;; (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil) ;in ido-setup-hook
;;     (define-key dired-mode-map "," 'dired))  
;;   )

;; (use-package devdocs
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-h D") 'devdocs-lookup)
;;   )
(use-package devdocs-browser
  :ensure t)

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
  :ensure t)

(use-package helm-tramp
  :ensure t)
;; (use-package docker-tramp
;;   :ensure t)

(add-hook 'dired-after-readin-hook 'hl-line-mode)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(when (display-graphic-p) 
  (use-package csv-mode
    :ensure t
    :config
    (add-hook 'csv-mode-hook 'csv-align-mode))

  ;(use-package vterm
  ;  :ensure t)
  ;(use-package multi-vterm
  ;  :ensure t)
)

