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
  :config
	(message "init-flycheck/config flycheck flow.")
	(flycheck-add-mode 'javascript-flow 'flow-mode)
	(flycheck-add-mode 'javascript-eslint 'flow-mode)
	(flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(use-package flycheck-gometalinter
  :ensure t
  :defer t
  :hook ((go-mode-hook . flycheck-gometalinter)))

(use-package flycheck-clang-analyzer
  :ensure t
  :defer t
  :hook ((c-mode-common-hook . flycheck-clang-analyzer))
  :config
	(message "init-flycheck/config flycheck clang analyzer.")
  (flycheck-clang-analyzer-setup))

(use-package flycheck-plantuml
  :config
	(message "init-flycheck/config flycheck plantuml.")
	(require 'flycheck-plantuml)
	(flycheck-plantuml-setup))

(provide 'init-lint)

;;; init-lint.el ends here
