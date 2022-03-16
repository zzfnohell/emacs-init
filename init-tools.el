;;; init-tools.el --- tools

;;; Commentary:
;; 

;;; Code:
(use-package rfc-mode
  :ensure t)

(use-package mqtt-mode
  :ensure t)

(use-package rg
  :ensure t
  :ensure-system-package
  (rg . ripgrep)
  :config
  (rg-enable-menu))

(use-package tldr
	:ensure t)

;; git config --global github.user <your-github-user-name>
;; git config --global github.oauth-token <your-personal-access-token-with-gist-scope>
(use-package gist
	:ensure t)

(use-package httprepl
  :ensure t)

(message "loading init-tools done.")
(provide 'init-tools)

;;; init-tools.el ends here
