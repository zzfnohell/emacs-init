;;; init-eshell.el --- ESHELL


;;; Commentary:
;; 

;;; Code:

(require-package 'shell-switcher)
(require 'shell-switcher)
(setq shell-switcher-mode t)

;; (defun make-powershell ()
;;   "Create a new `powershell'."
;;   (powershell (generate-new-buffer-name "*PowerShell*")))
;; (setq-default shell-switcher-new-shell-function 'make-powershell)

(provide 'init-eshell)

;;; init-eshell.el ends here
