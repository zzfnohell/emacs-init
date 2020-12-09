;;; init-dap.el --- Emacs Debug Adapter Protocol

;;; Commentary:
;; Emacs Debug Adapter Protocol

;;; Code:


;; Use the Debug Adapter Protocol for running tests and debugging
;; Posframe is a pop-up tool that must be manually installed for dap-mode
(use-package posframe)

(use-package dap-mode
  :after (:all lsp-mode lsp-java)
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  ;; enables mouse hover support
  (dap-tooltip-mode 1)
  ;; use tooltips for mouse hover
  ;; if it is not enabled `dap-mode' will use the minibuffer.
  (tooltip-mode 1)
  
  (require 'dap-gdb-lldb)
  (dap-gdb-lldb-setup)
  (require 'dap-go)
  (require 'dap-chrome)
  (require 'dap-python)
  (require 'dap-java)
  (require 'dap-pwsh)
  (require 'dap-node))

(use-package realgud
  :init (setq gdb-many-windows t))

(provide 'init-dap)

;;; init-dap.el ends here
