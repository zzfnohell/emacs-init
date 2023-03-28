;;; init-lua.el --- LUA

;;; Commentary:
;; 


(use-package company-lua
	:ensure t
  )

(use-package lua-mode
  :ensure t
  :hook ((lua-mode-hook . company-lua))
  :config
	(setq lua-default-application "luajit")
  (with-eval-after-load 'lua-mode
    (setq lua-indent-level 4)))

(message "loading init-lua done.")

(provide 'init-lua)

;;; init-lua.el ends here
