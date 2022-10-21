;;; init-javascript.el --- JavaScript
;; Javascript

;;; Commentary:
;;

;;; Code:

(use-package js
 :ensure t
 :custom (js-indent-level 2))

(use-package json-mode :ensure t)

(use-package js-comint
	:ensure t
  :config
  (setq inferior-js-program-command "node"))

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode))
  :config
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(use-package js2-refactor
	:ensure t
  :after (:all js2-mode)
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode))

(use-package xref-js2
  :after (:all js2-mode)
  :config
  (add-hook 'js2-mode-hook
            (lambda ()
              (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(use-package rainbow-delimiters
	:ensure t)

(use-package indium
	:ensure t
  :defer t)

(message "loading init-javascript done.")

(provide 'init-javascript)

;;; init-javascript.el ends here
