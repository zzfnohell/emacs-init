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
  :defer t
  :commands
  (magit-status magit-log)
  :init
  (with-eval-after-load 'magit
    (setq
     magit-auto-revert-mode nil
     magit-diff-arguments '("--no-ext-diff" "-M" "-C")
     magit-diff-refine-hunk t
     magit-expand-staged-on-commit 'full
     magit-fetch-arguments '("--prune")
     magit-log-auto-more t
     magit-log-cutoff-length 20
     magit-no-confirm '(stage-all-changes unstage-all-changes)
     magit-process-connection-type nil
     magit-push-always-verify nil
     magit-push-arguments '("--set-upstream")
     magit-refresh-file-buffer-hook nil
     magit-save-some-buffers nil
     magit-set-upstream-on-push 'askifnotset
     magit-stage-all-confirm nil
     magit-status-verbose-untracked nil
     magit-unstage-all-confirm nil
     magithub-message-confirm-cancellation nil
     magithub-use-ssl t))
  :config
  (delete 'Git vc-handled-backends)
  (when (eq system-type 'windows-nt)
    (setq magit-refresh-status-buffer nil)))

(use-package vc-fossil
	:ensure t
  :defer t
	:init
	(add-to-list 'vc-handled-backends 'Fossil t))

(use-package git-modes
	:ensure t
  :defer t
  :mode
  (("\\.gitignore\\'" . gitignore-mode)
   ("\\.gitattributes\\'" . gitattributes-mode)
   ("\\.gitconfig\\'" . gitconfig-mode)))

(use-package git-timemachine
  :ensure t
  :defer t
  :bind
  (("s-t" . git-timemachine-toggle)))

(use-package difftastic
  :demand t
  :defer t
  :bind (:map magit-blame-read-only-mode-map
              ("D" . difftastic-magit-show)
              ("S" . difftastic-magit-show))
  :config
  (eval-after-load 'magit-diff
    '(transient-append-suffix 'magit-diff '(-1 -1)
       [("D" "Difftastic diff (dwim)" difftastic-magit-diff)
        ("S" "Difftastic show" difftastic-magit-show)])))

(provide 'init-vc)
;;; init-vc.el ends here
