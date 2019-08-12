;;; init-tags.el --- TAGS

;;; Commentary:
;; 

;;; Code:

(use-package ggtags
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
  )

(use-package ctags-update
  :config
  (ctags-global-auto-update-mode)
  (setq ctags-update-prompt-create-tags nil)
  (autoload 'turn-on-ctags-auto-update-mode
    "ctags-update" "turn on `ctags-auto-update-mode'." t)
  (add-hook 'c-mode-common-hook 'turn-on-ctags-auto-update-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-ctags-auto-update-mode)
  (autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
  )

(provide 'init-tags)

;;; init-tags.el ends here
