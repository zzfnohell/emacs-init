;;; init-flycheck.el --- Flycheck

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-clang-analyzer
  :config
  (flycheck-clang-analyzer-setup))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
