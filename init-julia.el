;;; init-julia.el --- Julia Lang

;;; Commentary:
;;

(use-package julia-mode)

(use-package lsp-julia
  :after (:all julia-mode lsp-mode)
  :config
  (add-hook 'julia-mode-hook #'lsp-mode)
  (add-hook 'julia-mode-hook #'lsp))

(provide 'init-julia)

;;; init-julia.el ends here
