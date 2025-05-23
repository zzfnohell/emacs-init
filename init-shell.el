;;; init-shell.el --- shell/term -*- lexical-binding: t -*-

;;; Commentary:
;; 

;;; Code:
(use-package shell-switcher
  :ensure t
  :defer t
  :commands (shell-switcher-new-shell
             shell-switcher-switch-buffer
             shell-switcher-select-shell)
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
  :defer t
  :hook
  (fish-mode . fish-completion-mode))


(defun init-prog/add-shell-company-backends ()
  "Add shell company backends."
  (setq-local company-backends
              (append '((company-files)
                        (company-shell))
                      company-backends)))

(use-package company-shell
  :after (:all company)
  :ensure t
  :defer t
  :hook
  (shell-mode . init-prog/add-shell-company-backends)
  (sh-mode . init-prog/add-shell-company-backends)
  (fish-mode . init-prog/add-shell-company-backends)
  (eshell-mode . init-prog/add-shell-company-backends))


(use-package multi-term
	:ensure t
  :defer t
  :commands multi-term
  :config
	(setq multi-term-program "/bin/bash"))

;;; XTERM
(xterm-mouse-mode 1)

(message "loading init-shell done.")

(provide 'init-shell)

;;; init-shell.el ends here

