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

;;; XTERM
(xterm-mouse-mode 1)

; ;;; https://www.reddit.com/r/emacs/comments/oh36yi/company_and_companyshell_super_slow_over_tramp/
; (defun shell-mode-hook-setup ()
;   "Set up `shell-mode'."

;   (setq-local company-backends '((company-files company-native-complete)))
;   ;; `company-native-complete' is better than `completion-at-point'
;   (local-set-key (kbd "TAB") 'company-complete)

;   ;; @see https://github.com/redguardtoo/emacs.d/issues/882
;   (setq-local company-idle-delay 1))

; (add-hook 'shell-mode-hook 'shell-mode-hook-setup)

(message "loading init-shell done.")
(provide 'init-shell)

;;; init-shell.el ends here

