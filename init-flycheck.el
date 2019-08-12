;;; init-flycheck.el --- Flycheck

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :config (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-clang-analyzer
  :config
  (progn
    (with-eval-after-load 'flycheck
      (require 'flycheck-clang-analyzer)
      (flycheck-clang-analyzer-setup))
    )
  )


(provide 'init-flycheck)

;;; init-flycheck.el ends here
