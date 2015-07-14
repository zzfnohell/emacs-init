;;; init-shell.el --- SHELL

;;; Commentary:
;; 

;;; Code:

(require-package 'bash-completion)
(require 'bash-completion)
;;(bash-completion-setup)

(require-package 'shell-command)
(shell-command-completion-mode)

(provide 'init-shell)

;;; init-shell.el ends here
