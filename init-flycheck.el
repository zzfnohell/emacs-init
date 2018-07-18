;;; init-flycheck.el --- Flycheck

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :defer t
  :config (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-clang-analyzer
  :defer t
  :config
  (progn
	(with-eval-after-load 'flycheck
	  (require 'flycheck-clang-analyzer)
	  (flycheck-clang-analyzer-setup))
	)
  )


(req-package flycheck-flow
	:demand
	:config
	(add-hook 'javascript-mode-hook 'flycheck-mode)
)

(provide 'init-flycheck)

;;; init-flycheck.el ends here
