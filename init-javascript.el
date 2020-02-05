;;; init-javascript.el --- JavaScript
;; Javascript

;;; Commentary:
;;

;;; Code:

(use-package js :custom (js-indent-level 2))

(use-package json-mode)

(use-package js-comint
  :config
  (setq inferior-js-program-command "node"))

(use-package js2-mode
  :mode (("\\.js\\'" . js2-mode))
  :config
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(use-package js2-refactor
  :after (:all js2-mode)
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode))

(use-package xref-js2
  :after (:all js2-mode)
  :config
  (add-hook 'js2-mode-hook
            (lambda ()
              (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(use-package rainbow-delimiters)

(use-package indium)

(use-package flycheck-flow
  :after (:all flycheck)
  :config
  (add-hook 'javascript-mode-hook 'flycheck-mode))

(provide 'init-javascript)

;;; init-javascript.el ends here
