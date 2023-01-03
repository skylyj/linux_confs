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

(defun my-helm-ag-thing-at-point ()
  "Search the symbol at point with `helm-ag'."
  (interactive)
  (let ((helm-ag-insert-at-point 'symbol))
    (helm-do-ag-project-root)))

(global-set-key (kbd "M-I") 'my-helm-ag-thing-at-point)
