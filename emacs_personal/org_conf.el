;;; package --- Summary
;;; Code:
;;; Commentary:

(require 'org)
(defun my-tbl-export (name)
  "Search for table named `NAME` and export."
  (interactive "s")
  (outline-show-all)
  (let ((case-fold-search t))
    (if (search-forward-regexp (concat "#\\+NAME: +" name) nil t)
        (progn
          (next-line)
          (org-table-export (format "%s.csv" name) "orgtbl-to-csv")))))

(setq org-agenda-files (list
			"~/Github/PrivateHub/org/Org/todo/tech_todo.org"
			"~/Github/PrivateHub/org/Org/Work/Mobvista/Projects/roas.org"
			"~/Github/PrivateHub/org/Org/todo/home_todo.org"
			"/Users/mobvista/Github/PrivateHub/org/Org/Work/Mobvista/mob_todo.org"
			"~/Github/PrivateHub/org/Org/todo/program_todo.org"
			))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


(use-package htmlize
  :ensure t)
(setq org-src-fontify-natively t)

;; lianyijiang focus
;; 代码高亮
;; (use-package ox-html
;;   :ensure t
;;   :config
;;   (setq org-html-htmlize-output-type 'css)
;;   )
(require 'ox-html)
(setq org-html-htmlize-output-type 'css)

;; (require 'org-bullets)
(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
  )
(setq org-image-actual-width (list 550))


;; ORG basic
(setq org-image-actual-width nil)
(setq org-html-htmlize-output-type nil)
;; (add-hook 'org-mode-hook #'valign-mode)
;; (setq valign-fancy-bar 1)
;; ORG 插入图片
(use-package org-download
  :bind ("C-S-y" . org-download-clipboard)
  :config
  (add-hook 'dired-mode-hook 'org-download-enable)
  (setq-default org-download-heading-lvl nil)
  (setq-default org-download-image-dir "./images"))

;; (require 'org-tree-slide)

(setq org-hierarchical-todo-statistics nil)



;; 关于org的加密
(require 'org-crypt)
;;当被加密的部份要存入硬碟时，自动加密回去
(org-crypt-use-before-save-magic)
;;设定要加密的tag 标签为secret
(setq org-crypt-tag-matcher "secret")
;;避免secret 这个tag 被子项目继承造成重复加密
;; (但是子项目还是会被加密喔)
(setq org-tags-exclude-from-inheritance (quote  ("secret")))
;;用于加密的GPG 金钥
;;可以设定任何ID 或是设成nil 来使用对称式加密(symmetric encryption)
(setq org-crypt-key nil)
(require 'epa-file)
(epa-file-enable)




;; (require 'dash)
(defun todo-to-int (todo)
  (cl-first (-non-nil
             (mapcar (lambda (keywords)
                       (let ((todo-seq
                              (-map (lambda (x) (cl-first (split-string  x "(")))
                                    (cl-rest keywords))))
                         (cl-position-if (lambda (x) (string= x todo)) todo-seq)))
                     org-todo-keywords))))

(defun my/org-sort-key ()
  (let* ((todo-max (apply #'max (mapcar #'length org-todo-keywords)))
         (todo (org-entry-get (point) "TODO"))
         (todo-int (if todo (todo-to-int todo) todo-max))
         (priority (org-entry-get (point) "PRIORITY"))
         (priority-int (if priority (string-to-char priority) org-default-priority)))
    (format "%03d %03d" todo-int priority-int)
    ))

(defun my/org-sort-entries ()
  (interactive)
  (org-sort-entries nil ?f #'my/org-sort-key))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.5))


;; 字体
(setq org-hide-emphasis-markers t)


;; tommy


;; TODO: Mode this to another section
(setq-default fill-column 80)

;; Turn on indentation and auto-fill mode for Org files
(defun dw/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  (diminish org-indent-mode))

(use-package org
  :defer t
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 2
        org-hide-block-startup nil
        org-src-preserve-indentation nil
        org-startup-folded 'content
        org-cycle-separator-lines 2
        org-capture-bookmark nil)

  (setq org-modules
	'(org-crypt
          org-habit
          org-bookmark
          org-eshell
          org-irc))

  (setq org-refile-targets '((nil :maxlevel . 1)
                             (org-agenda-files :maxlevel . 1)))

  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-use-outline-path t)

  (evil-define-key '(normal insert visual) org-mode-map (kbd "C-j") 'org-next-visible-heading)
  (evil-define-key '(normal insert visual) org-mode-map (kbd "C-k") 'org-previous-visible-heading)

  (evil-define-key '(normal insert visual) org-mode-map (kbd "M-j") 'org-metadown)
  (evil-define-key '(normal insert visual) org-mode-map (kbd "M-k") 'org-metaup)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     ;; (ledger . t)
     ))

  (push '("conf-unix" . conf-unix) org-src-lang-modes)
  )
;; NOTE: Subsequent sections are still part of this use-package block!



(use-package org-superstar
  :ensure t
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Increase the size of various headings
(require 'org-faces)
(set-face-attribute 'org-document-title nil :font "Menlo-15" :weight 'bold :height 1.5)
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.06)
                (org-level-3 . 1.03)
                (org-level-4 . 1.0)
                (org-level-5 . 1.0)
                (org-level-6 . 1.0)
                (org-level-7 . 1.0)
                (org-level-8 . 1.0)))
  (set-face-attribute (car face) nil :font "Menlo-15" :weight 'medium :height (cdr face)))

;; (set-face-attribute 'org-level-1 nil
;;                         :height 1.3
;;                         :foreground "green")
;; (set-face-attribute 'org-level-2 nil
;;                         :height 1.2
;;                         :foreground "green")
;; (set-face-attribute 'org-level-3 nil
;;                         :height 1.1
;;                         :foreground "green")

;; Make sure org-indent face is available
(require 'org-indent)

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'fixed-pitch nil
                    :font "Menlo-15"
                    :weight 'light
                    :height 1.0)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil
                    ;; :font "Cantarell"
                    :font "Menlo-15"
                    :height 1.0
                    :weight 'light)

(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

;; Get rid of the background on column views
(set-face-attribute 'org-column nil :background nil)
(set-face-attribute 'org-column-title nil :background nil)

;; TODO: Others to consider
;; '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
;; '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;; '(org-property-value ((t (:inherit fixed-pitch))) t)
;; '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;; '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
;; '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
;; '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("li" . "src lisp"))
(add-to-list 'org-structure-template-alist '("sc" . "src scheme"))
(add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("go" . "src go"))
(add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
(add-to-list 'org-structure-template-alist '("json" . "src json"))

(require 'color)
(set-face-attribute 'org-block nil :background
                    (color-lighten-name
                     (face-attribute 'default :background) 50))
(set-face-attribute 'org-block-begin-line  nil :background
                    (color-lighten-name
                     (face-attribute 'default :background) 50))

(set-face-attribute 'org-block-end-line  nil :background
                    (color-lighten-name
                     (face-attribute 'default :background) 50))

;; (custom-set-faces
;;  '(org-block-begin-line
;;    ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "lightgreen" :extend t))))
;;  ;; '(org-block
;;  ;;   ((t (:background "#EFF0F1" :extend t))))
;;  '(org-block-end-line
;;    ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "green" :extend t))))
;;  )
