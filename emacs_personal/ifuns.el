;; ctags 使用的方法
(setq path-to-ctags "/opt/homebrew/opt/ctags/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "/opt/homebrew/opt/ctags/bin/ctags -f %s/TAGS -e -R %s" (directory-file-name dir-name) (directory-file-name dir-name))
   )
  )
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
;;
