;;; init-evil.el --- VIM


;;; Commentary:
;; 


;;; Code:
(require-package 'evil)
(require 'evil)

;; (setq init-evil-mode-state-list
;;       '((inferior-emacs-lisp-mode . emacs)
;;         (nrepl-mode . insert)
;;         (pylookup-mode . emacs)
;;         (comint-mode . normal)
;;         (git-commit-mode . insert)
;;         (git-rebase-mode . emacs)
;;         (term-mode . emacs)
;;         (help-mode . emacs)
;;         (helm-grep-mode . emacs)
;;         (grep-mode . emacs)
;;         (bc-menu-mode . emacs)
;;         (magit-branch-manager-mode . emacs)
;;         (rdictcc-buffer-mode . emacs)
;;         (dired-mode . emacs)
;;         (wdired-mode . normal)))

;; (loop for (mode . state) in init-evil-mode-state-list
;;       do (evil-set-initial-state mode state))

;; (evil-mode 1)

(provide 'init-evil)

;;; init-evil.el ends here
