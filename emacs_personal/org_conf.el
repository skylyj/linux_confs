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
;; 代码高亮
(require 'ox-html)
(setq org-html-htmlize-output-type 'css)
;;Org Tempo expands snippets to structures defined in org-structure-template-alist and org-tempo-keywords-alist. For example, < s TAB creates a code block.
(require 'org-tempo)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (C . t)
   (go . t)
   (emacs-lisp . t)
   (shell . t)))


(require 'package) (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; (require 'org-bullets)
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(setq org-image-actual-width (list 550))
