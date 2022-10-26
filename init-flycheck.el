;;; init-flycheck.el --- Flycheck

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :init
	(global-flycheck-mode)
	:config
	(message "init-flycheck/config flycheck."))

(use-package flycheck-flow
	:ensure t
  :config
	(message "init-flycheck/config flycheck flow.")
	(flycheck-add-mode 'javascript-flow 'flow-mode)
	(flycheck-add-mode 'javascript-eslint 'flow-mode)
	(flycheck-add-next-checker 'javascript-flow 'javascript-eslint))



(use-package flycheck-clang-analyzer
  :config
	(message "init-flycheck/config flycheck clang analyzer.")
  (flycheck-clang-analyzer-setup))

(use-package flycheck-plantuml
  :config
	(message "init-flycheck/config flycheck plantuml.")
	(require 'flycheck-plantuml)
	(flycheck-plantuml-setup))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
