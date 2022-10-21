;;; init-dap.el --- Emacs Debug Adapter Protocol

;;; Commentary:
;; Emacs Debug Adapter Protocol

;;; Code:

(use-package dap-mode
  :ensure t
  :defer t
  :after (:all lsp-mode lsp-java)
  :config
	(dap-auto-configure-mode)
	    
  (require 'dap-gdb-lldb)
  (dap-gdb-lldb-setup)
  (require 'dap-go)
  (require 'dap-chrome)
  (require 'dap-python)
  (require 'dap-java)
  (require 'dap-pwsh)
  (require 'dap-node))

(use-package realgud
  :ensure t
  :defer t
  :init (setq gdb-many-windows t))

(message "loading init-dap done.")

(provide 'init-dap)

;;; init-dap.el ends here
