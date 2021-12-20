;;; init.el --- init

;;; Commentary:
;; 

;;; Code:

;; (setq debug-on-error t)

;; (setq debug-on-message ".*ad-handle-definition.*")
;; (setq debug-on-message ".*error.*")

(add-to-list 'load-path (file-name-as-directory (expand-file-name "~/.emacs.d/init/")))

(let ((default-directory (file-name-as-directory (expand-file-name "~/.emacs.d/site-lisp/"))))
  (normal-top-level-add-subdirs-to-load-path))

(let ((custom-file (expand-file-name "~/.emacs.d/custom.el")))
	(if (file-exists-p custom-file) (load custom-file)
		(write-region "" nil custom-file)))

(let ((envs-file (expand-file-name "~/.emacs.d/envs.el")))
	(when (file-exists-p envs-file)
		(load envs-file)))

(let ((main-file (expand-file-name "~/.emacs.d/init/init-main.el")))
	(load main-file))



;;; init.el ends here
