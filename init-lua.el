;;; init-lua.el --- LUA

;;; Commentary:
;;

(defun init-lua/company-lua-hook-func ()
  "Setup company backends for lua mode."
  (setq-local company-backends
              (append '((company-lua :with company-yasnippet))
                      company-backends)))

(use-package lua-mode
  :ensure t
  :config
	(setq lua-default-application "luajit")
  (with-eval-after-load 'lua-mode
    (setq lua-indent-level 4)))

(use-package company-lua
	:ensure t
  :hook
  (lua-mode . init-lua/company-lua-hook-func))

(message "loading init-lua done.")

(provide 'init-lua)

;;; init-lua.el ends here
