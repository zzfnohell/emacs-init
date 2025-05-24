;;; init-dap.el --- Emacs Debug Adapter Protocol

;;; Commentary:
;; Emacs Debug Adapter Protocol

;;; Code:

(use-package realgud
  :ensure t
  :defer t
  :init
  (setq gdb-many-windows t))

(message "loading init-dap done.")

(provide 'init-dap)

;;; init-dap.el ends here
