;;; init-flymake.el --- Flymake

;;; Commentary:
;; 

;;; Code:
(use-package flymake-lua
	:ensure t
	:init (add-hook 'lua-mode-hook 'flymake-lua-load))

(provide 'init-flymake)

;;; init-flymake.el ends here
