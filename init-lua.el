;;; init-lua.el --- LUA

;;; Commentary:
;; 
(req-package lua-mode
  :defer t
  :config
  (with-eval-after-load 'lua-mode
    (setq lua-indent-level 4)))

(provide 'init-lua)

;;; init-lua.el ends here
