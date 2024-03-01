;;; init-vc.el --- Version Control

;;; Commentary:
;; 

;;; Code:

(use-package ahg
  :ensure t
  :defer t)

;; (require 'diff-mode)
;; (require 'easymenu)
;; (require 'log-edit)
;; (require 'ewoc)
;; (require 'vc-annotate)

(use-package magit
  :ensure t
  :commands magit
  :custom
  (magit-auto-revert-mode nil)
  (magit-diff-arguments (quote ("--no-ext-diff" "-M" "-C")))
  (magit-diff-refine-hunk t)
  (magit-expand-staged-on-commit (quote full))
  (magit-fetch-arguments (quote ("--prune")))
  (magit-log-auto-more t)
  (magit-log-cutoff-length 20)
  (magit-no-confirm (quote (stage-all-changes unstage-all-changes)))
  (magit-process-connection-type nil)
  (magit-push-always-verify nil)
  (magit-push-arguments (quote ("--set-upstream")))
  (magit-refresh-file-buffer-hook nil)
  (magit-save-some-buffers nil)
  (magit-set-upstream-on-push (quote askifnotset))
  (magit-stage-all-confirm nil)
  (magit-status-verbose-untracked nil)
  (magit-unstage-all-confirm nil)
  (magithub-message-confirm-cancellation nil)
  (magithub-use-ssl t)
  :config
  (delete 'Git vc-handled-backends)
  (when (eq system-type 'windows-nt)
    (setq magit-refresh-status-buffer nil)))

(use-package vc-fossil
	:ensure t
	:init
	(add-to-list 'vc-handled-backends 'Fossil t))

(use-package git-modes
	:ensure t)

(use-package git-timemachine
  :ensure t
  :bind
  (("s-t" . git-timemachine-toggle)))

(provide 'init-vc)
;;; init-vc.el ends here
