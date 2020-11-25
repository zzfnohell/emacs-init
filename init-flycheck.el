;;; init-flycheck.el --- Flycheck

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :init (global-flycheck-mode))

(use-package flycheck-clang-analyzer
  :config
  (flycheck-clang-analyzer-setup))

(use-package flycheck-julia
  :after (:all flycheck julia-mode)
  :config
  (flycheck-julia-setup)
  (add-to-list 'flycheck-global-modes 'julia-mode)
  (add-to-list 'flycheck-global-modes 'ess-julia-mode))

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
