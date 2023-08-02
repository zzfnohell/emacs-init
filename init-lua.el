;;; init-lua.el --- LUA

;;; Commentary:
;;
(defun init-lua/company-lua-hook-func ()
  (let ((backends (make-local-variable 'company-backends)))
    (add-to-list backends '(company-lua :with company-yasnippet))))

(use-package lua-mode
  :ensure t
  :config
	(setq lua-default-application "luajit")
  (with-eval-after-load 'lua-mode
    (setq lua-indent-level 4)))

(use-package company-lua
	:ensure t
  :config
  (add-hook 'lua-mode-hook #'init-lua/company-lua-hook-func))

(message "loading init-lua done.")

(provide 'init-lua)

;;; init-lua.el ends here
