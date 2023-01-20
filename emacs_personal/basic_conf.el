;;; package --- Summary
;;; Code:
;;; Commentary:

;; 这样mac open file的时候不会重复打开frame了，始终在一个frame里面
;; (load-theme 'wombat)
(load-theme 'misterioso)
(set-cursor-color "yellow")
(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
;; (global-set-key [remap goto-line] 'goto-line-preview)
;; (setq eshell-last-dir-ring-size 500)
(add-hook 'sh-mode-hook 'flycheck-mode)

(scroll-bar-mode -1)
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
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
(cond ((equal system-type 'gnu/linux)
       (set-default-font "Monospace-19"))
      ((equal system-type 'darwin)
       (tool-bar-mode -1)
       (set-frame-font "Menlo-16")
       (set-fontset-font
        (frame-parameter nil 'font)
        'han
        (font-spec :family "Hiragino Sans GB" ))))

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
