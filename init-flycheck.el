;;; init-flycheck.el --- Flycheck

;;; Commentary:
;; 
(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-flycheck)

;;; init-flycheck.el ends here
