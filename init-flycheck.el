;;; init-flycheck.el --- Flycheck

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :init (global-flycheck-mode))

(use-package flycheck-clang-analyzer
  :config
  (flycheck-clang-analyzer-setup))

(use-package flycheck-plantuml
  :after (:all flycheck plantuml-mode)
  :config
  (with-eval-after-load 'flycheck
    (require 'flycheck-plantuml)
    (flycheck-plantuml-setup)))

(use-package flycheck-posframe
  :after (:all flycheck posframe)
  :config
  (with-eval-after-load 'flycheck
    (require 'flycheck-posframe)
    (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
