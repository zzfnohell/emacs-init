;;; init-shell.el --- SHELL

;;; Commentary:
;; 

;;; Code:
(use-package shell-switcher
  :ensure t
  :config
	(setq shell-switcher-mode t))


;; (defun make-powershell ()
;;   "Create a new `powershell'."
;;   (powershell (generate-new-buffer-name "*PowerShell*")))
;; (setq-default shell-switcher-new-shell-function 'make-powershell)


(use-package fish-mode
	:ensure t)

(use-package fish-completion
	:ensure t
  :config
  (when (and (executable-find "fish")
             (require 'fish-completion nil t))
    (global-fish-completion-mode)))


;; (defun clear-shell ()
;;   (interactive)
;;   (let ((old-max comint-buffer-maximum-size))
;;     (setq comint-buffer-maximum-size 0)
;;     (comint-truncate-buffer)
;;     (setq comint-buffer-maximum-size old-max))) 

(use-package multi-term
	:ensure t
  :config
	(setq multi-term-program "/bin/bash"))

(provide 'init-shell)

;;; init-shell.el ends here

