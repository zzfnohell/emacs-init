;;; init-ecb.el --- ecb

;;; Commentary:
;; 

;;; Code:

(require-package 'ecb)
(require 'ecb)

;;(setq stack-trace-on-error t)
(ecb-byte-compile)



(defvar default-ecb-source-path
  (list
   '("~/local" "local")
   '("~/" "~/")
   '("/" "/")))

(add-hook 'ecb-basic-buffer-sync-hook
		  (lambda ()
			(when (functionp 'projectile-get-project-directories)
			  (when (projectile-project-p)
				(dolist (path-dir (projectile-get-project-directories))
				  (unless (member (list path-dir path-dir) default-ecb-source-path)
					(push (list path-dir path-dir) default-ecb-source-path)
					(customize-set-variable 'ecb-source-path default-ecb-source-path)
					))))))

(setq ecb-auto-activate nil
      ecb-tip-of-the-day nil
      inhibit-startup-message t
      ecb-auto-compatibility-check nil
      ecb-version-check t)

;; (add-hook 'ecb-history-buffer-after-create-hook 'evil-emacs-state)
;; (add-hook 'ecb-directories-buffer-after-create-hook 'evil-emacs-state)
;; (add-hook 'ecb-methods-buffer-after-create-hook 'evil-emacs-state)
;; (add-hook 'ecb-sources-buffer-after-create-hook 'evil-emacs-state)

(provide 'init-ecb)

;;; init-ecb.el ends here
