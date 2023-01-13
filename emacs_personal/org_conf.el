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
(add-hook 'org-mode-hook #'valign-mode)
(setq valign-fancy-bar 1)
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
