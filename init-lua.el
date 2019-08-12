;;; init-lua.el --- LUA

;;; Commentary:
;; 

(defun local-lua-mode-company-init ()
  (setq-local company-backends
							'((company-lua))))

(use-package company-lua)

(use-package lua-mode
	:init
	(add-hook 'lua-mode-hook #'local-lua-mode-company-init)
  :config
	(setq lua-default-application "luajit")
  (with-eval-after-load 'lua-mode
    (setq lua-indent-level 4)))


(provide 'init-lua)

;;; init-lua.el ends here
