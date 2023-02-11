;;; package --- Summary
;;; Code:
;;; Commentary:

;; ctags 使用的方法
(setq path-to-ctags "/opt/homebrew/opt/ctags/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (let ((icmd (format "/opt/homebrew/opt/ctags/bin/ctags -f %s/TAGS -e -R %s" (directory-file-name dir-name) (directory-file-name dir-name))))
    (message (format "I am creating tags for %s" dir-name))
    (message icmd)
    (shell-command icmd)
    ))

;; (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))

(defun load-buffer ()
  "load current elisp buffer"
  (interactive)
  (load-file (buffer-file-name))
  )

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
                             "python -mjson.tool" (current-buffer) t)))

(defun eshell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

;; https://gitlab.mobvista.com/ad_algo/ltv_model/-/blob/main/setup.py    
;; git@gitlab.mobvista.com:ad_algo/ltv_model.git


(defun clipboard/set (astring)
  "Copy a string to clipboard"
   (with-temp-buffer
    (insert astring)
    (clipboard-kill-region (point-min) (point-max))))

(defun my/share-git ()
  "share a git url for current buffer."
  (interactive)
  (progn
    (setq relative-file-name (file-relative-name buffer-file-name (projectile-project-root)))
    (setq icmd (format "python ~/bin/share_git.py %s" relative-file-name))
    (setq fin-path (substring 
		    (shell-command-to-string icmd) 
		    0 -1))
    (clipboard/set fin-path)
    (message (format "sharing-path is %s" fin-path))
    (browse-url fin-path)
    )
  )

