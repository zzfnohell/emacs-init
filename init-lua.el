;;; init-lua.el --- LUA

;;; Commentary:
;; 


(use-package company-lua)
(use-package lua-mode
  :ensure t
  :config
	(setq lua-default-application "luajit")
  (with-eval-after-load 'lua-mode
    (setq lua-indent-level 4)))


(provide 'init-lua)

;;; init-lua.el ends here
