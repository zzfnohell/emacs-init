;;; init-lua.el --- LUA

;;; Commentary:
;; 

(defun init-lua/lua-mode-hook-func ()
  (setq-local company-backends '(company-lua)))

(use-package company-lua)

(use-package lua-mode
  :config
  (add-hook 'lua-mode-hook #'init-lua/lua-mode-hook-func)
	(setq lua-default-application "luajit")
  (with-eval-after-load 'lua-mode
    (setq lua-indent-level 4)))


(provide 'init-lua)

;;; init-lua.el ends here
