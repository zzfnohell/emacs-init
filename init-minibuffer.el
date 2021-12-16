;;; init-minibuffer.el --- Config for minibuffer completion       -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


(defun init-minibuffer/use-orderless-in-minibuffer ()
  (setq-local completion-styles '(substring orderless)))

(use-package orderless
  :config
  (add-hook 'minibuffer-setup-hook
	    'init-minibuffer/user-orderless-in-minibuffer))

(use-package embark)

(use-package vertico
  :after (:all orderless embark)
  :config
  (add-hook 'after-init-hook 'vertico-mode)
  (require 'orderless)
  (define-key vertico-map (kbd "C-c C-o") 'embark-export)
  (define-key vertico-map (kbd "C-c C-c") 'embark-act))

(use-package affe)

(defmacro sanityinc/no-consult-preview (&rest cmds)
  `(with-eval-after-load 'consult
     (consult-customize ,@cmds :preview-key (kbd "M-P"))))

(use-package consult
  :after (:all projectile)
  :config
  (sanityinc/no-consult-preview
   consult-ripgrep
   consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-file consult--source-project-file consult--source-bookmark)

  (setq-default consult-project-root-function 'projectile-project-root)

  (when (executable-find "rg")
    (defun sanityinc/affe-grep-at-point (&optional dir initial)
      (interactive (list prefix-arg (when-let ((s (symbol-at-point)))
                                      (symbol-name s))))
      (affe-grep dir initial))
    (global-set-key (kbd "M-?") 'sanityinc/affe-grep-at-point)
    (sanityinc/no-consult-preview sanityinc/affe-grep-at-point)
    (with-eval-after-load 'affe (sanityinc/no-consult-preview affe-grep)))

  (global-set-key [remap switch-to-buffer] 'consult-buffer)
  (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
  (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
  (global-set-key [remap goto-line] 'consult-goto-line))


(use-package embark-consult
  :after (:all embark consult)
  :config
  (require 'embark-consult)
  (add-hook 'embark-collect-mode-hook 'embark-consult-preview-minor-mode))


(use-package consult-flycheck)

(use-package marginalia
  :config
  (add-hook 'after-init-hook 'marginalia-mode))


(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
