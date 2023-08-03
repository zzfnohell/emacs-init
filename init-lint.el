;;; init-lint.el --- Static Syntax Analysis

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package flycheck-flow
	:ensure t
  :after flycheck
  :config
  (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
  (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
	(flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(use-package flycheck-plantuml
  :ensure t
  :config
	(flycheck-plantuml-setup))


(provide 'init-lint)

;;; init-lint.el ends here
