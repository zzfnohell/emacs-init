;;; init-msvc.el --- MSVC

;;; Commentary:
;; 

;;; Code:
(use-package msvc
  :if window-system
  :defer t
  :config
  (progn
	(require 'msvc)
	(setq w32-pipe-read-delay 0)
	(when (msvc-initialize)
	  (msvc-flags-load-db :parsing-buffer-delete-p t)
	  (add-hook 'c-mode-common-hook 'msvc-mode-on t))))
(provide 'init-msvc)

;;; init-msvc.el ends here
