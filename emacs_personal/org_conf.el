;;; package --- Summary
;;; Code:
;;; Commentary:

;; (require 'org)
;; (prelude-require-packages '(org-ac))
;; (org-ac/config-default)

;; (setq org-default-notes-file "~/.notes")
;; (setq org-remember-templates
;;       '(("TODO" ?t "* TODO %?\n %x\n %T" "~/Documents/Org/home.org" "Tasks")
;; 	("IDEA" ?i "* IDEA %?\n %i\n %T\n%a" "~/Documents/Org/home.org" "Idea")
;; 	))

;; (setq org-directory "~/Documents/Org/")
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)
;; (define-key global-map "\C-cr" 'org-remember)
;; ;(define-key global-map "\C-cl" 'org-store-link)
;; ;(define-key global-map "\C-ca" 'org-agenda)

;; ;; (setq org-agenda-files (list "~/idropbox/Documents/Org/Work/Baidu/baidu.org"
;; ;;                              "~/idropbox/Documents/Org/Life/jia_config.org"))

;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (setq org-hide-leading-stars t)
;; (setq org-log-done t)
;; (setq org-publish-project-alist
;;       '(("note-org"
;;          :base-directory "~/Org/"
;;          :publishing-directory "/var/www/"
;;          :base-extension "org"
;;          :recursive t
;;          :publishing-function org-publish-org-to-html
;;          :auto-index t
;; 	 :auto-sitemap t
;;          :index-filename "index.org"
;;          :index-title "index"
;;          :link-home "index.html"
;; 	 :author-info "lianyijiang"
;; 	 :email-info "sky_yjl@163.com"
;;        	 :author "连义江"
;; 	 :email "sky_yjl@163.com"
;; 	 :TeX-macros nil
;; 	 :LaTeX-fragments nil
;; 	 :latex-listings nil
;; 	 :sub-superscript nil
;; 	 :section-numbers nil
;;          :style "<link rel=\"stylesheet\"
;;     href=\"/css/core.css\"
;;     type=\"text/css\"/>")
;;         ("note-static"
;;          :base-directory "~/Org/"
;;          :publishing-directory "/var/www/"
;;          :recursive t
;;          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
;;          :publishing-function org-publish-attachment)
;;         ("note"
;;          :components ("note-org" "note-static")
;;          :author "sky_yjl@163.com")))

;; ;; reveal-mode
;; ;; (prelude-require-packages '(ox-reveal))
;; ;; (require 'ox-reveal)
;; ;; (setq org-reveal-root "file:///Users/lianyijiang/OpenSource/reveal.js")

;; (defun my-org-screenshot ()
;;   "Take a screenshot into a time stamped unique-named file in the
;; same directory as the org-buffer and insert a link to this file."
;;   (interactive)
;;   (org-display-inline-images)
;;   (setq filename
;;         (concat
;;          (make-temp-name
;;           (concat (file-name-nondirectory (buffer-file-name))
;;                   "_imgs/"
;;                   (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
;;   (unless (file-exists-p (file-name-directory filename))
;;     (make-directory (file-name-directory filename)))
;;                                         ; take screenshot
;;   (if (eq system-type 'darwin)
;;       (call-process "screencapture" nil nil nil "-i" filename))
;;   (if (eq system-type 'gnu/linux)
;;       (call-process "import" nil nil nil filename))
;;                                         ; insert into file if correctly taken
;;   (if (file-exists-p filename)
;;       (insert (concat "[[file:" filename "]]"))))





;; (require 'htmlize)
;; (setq org-src-fontify-natively t)

;; lianyijiang focus
;; 代码高亮
;; (use-package ox-html
;;   :ensure t
;;   :config
;;   (setq org-html-htmlize-output-type 'css)
;;   )
;; ;;Org Tempo expands snippets to structures defined in org-structure-template-alist and org-tempo-keywords-alist. For example, < s TAB creates a code block.
;; (require 'org-tempo)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((python . t)
;;    (C . t)
;;    (go . t)
;;    (emacs-lisp . t)
;;    (shell . t)))


;; (require 'package) (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

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




(require 'dash)
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

;; Replace list hyphen with dot
;; (font-lock-add-keywords 'org-mode
;;                         '(("^ *\\([-]\\) "
;;                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Increase the size of various headings
  (require 'org-faces)
  (set-face-attribute 'org-document-title nil :font "Menlo-15" :weight 'bold :height 1.6)
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.05)
                (org-level-3 . 1.0)
                (org-level-4 . 0.9)
                (org-level-5 . 0.9)
                (org-level-6 . 0.9)
                (org-level-7 . 0.9)
                (org-level-8 . 0.9)))
  (set-face-attribute (car face) nil :font "Menlo-15" :weight 'medium :height (cdr face)))

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
