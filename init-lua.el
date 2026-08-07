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
  :defer t
  :mode "\\.lua\\'"
  :config
  (setq lua-default-application "luajit"
        lua-indent-level 4))

(use-package company-lua
  :ensure t
  :defer t
  :hook
  (lua-mode . init-lua/company-lua-hook-func))

(message "[init] init-lua loaded")

(provide 'init-lua)

;;; init-lua.el ends here
