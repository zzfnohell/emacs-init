;;; init.el --- init

;;; Commentary:
;; 

;;; Code:


(add-to-list 'load-path (directory-file-name (expand-file-name "~/.emacs.d/init")))

(let* ((site-lisp-dir (directory-file-name (expand-file-name "~/.emacs.d/site-lisp")))
       (dirlist (directory-files site-lisp-dir t)))
  (dolist (subdir dirlist)
    (let ((name (file-name-base subdir)))
      (unless (or (not (file-directory-p subdir))
                  (equal name ".")
                  (equal name ".."))
        (message (format "add to load path: %s" subdir))
        (add-to-list 'load-path (directory-file-name subdir))))))


(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))

(let ((envs-file (expand-file-name "~/.emacs.d/envs.el")))
	(when (file-exists-p envs-file)
		(load envs-file)))

(let ((main-file (expand-file-name "~/.emacs.d/init/init-main.el")))
	(load main-file))

;;; init.el ends here


