;;; init-shell.el --- SHELL

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


(require-package 'bash-completion)
(require 'bash-completion)
;;(bash-completion-setup)

(require-package 'shell-command)
(shell-command-completion-mode)

(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max))) 

(provide 'init-shell)

;;; init-shell.el ends here
