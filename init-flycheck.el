;;; init-flycheck.el --- Flycheck

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :defer t
  :config (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
