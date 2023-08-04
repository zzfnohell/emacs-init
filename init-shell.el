;;; init-shell.el --- shell/term -*- lexical-binding: t -*-

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

(defun init-prog/add-shell-company-backends ()
  "Add shell company backends."
  (let ((backends (make-local-variable 'company-backends)))
    (add-to-list backends 'company-files)
    (add-to-list backends 'company-shell)))


(use-package company-shell
  :after (:all company)
  :ensure t
  :hook
  (shell-mode . init-prog/add-shell-company-backends)
  (sh-mode . init-prog/add-shell-company-backends)
  (fish-mode . init-prog/add-shell-company-backends)
  (eshell-mode . init-prog/add-shell-company-backends))


(use-package multi-term
	:ensure t
  :config
	(setq multi-term-program "/bin/bash"))

;;; XTERM
(xterm-mouse-mode 1)

(message "loading init-shell done.")

(provide 'init-shell)

;;; init-shell.el ends here

