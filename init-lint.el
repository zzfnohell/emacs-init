;;; init-lint.el --- Static Syntax Analysis

;;; Commentary:
;; 

;;; Code:

(use-package flycheck
  :hook ((after-init-hook . global-flycheck-mode))
  :config
	(message "init-flycheck/config flycheck."))

(use-package flycheck-flow
	:ensure t
  :defer t
  :hook ((javascript-flow . flow-mode)
         (javascript-eslint . flow-mode))
  :config
	(flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(use-package flycheck-gometalinter
  :ensure t
  :defer t
  :hook ((go-mode-hook . flycheck-gometalinter))
  :config
  (flycheck-gometalinter-setup))

(use-package flycheck-clang-analyzer
  :ensure t
  :defer t
  :hook ((c-mode-common-hook . flycheck-clang-analyzer))
  :config
  (flycheck-clang-analyzer-setup))

(use-package flycheck-plantuml
  :config
  :defer t
  :hook ((plantuml-mode-hook . flycheck-plantuml))
  :config
	(flycheck-plantuml-setup))

(use-package flymake-shellcheck
  :ensure t
  :defer t
  :config
  (add-hook 'sh-mode-hook 'flymake-shellcheck-load))

(provide 'init-lint)

;;; init-lint.el ends here
