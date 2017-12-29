;;; init-flymake.el --- Flymake

;;; Commentary:
;; 

;;; Code:
(req-package flymake-lua 
  :defer t
	:init (add-hook 'lua-mode-hook 'flymake-lua-load))

(provide 'init-flymake)

;;; init-flymake.el ends here
