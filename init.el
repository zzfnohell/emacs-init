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

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))

(when (file-exists-p custom-file)
  (load custom-file))

(load (expand-file-name "~/.emacs.d/init/init-main.el"))


;;; init.el ends here
