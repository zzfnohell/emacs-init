;;; init-php.el --- PHP MODE

;;; Commentary:
;; 

(use-package php-mode
  :ensure t
	:defer t)

(use-package company-php
  :ensure t
  :defer t
  :config
  (add-hook 'php-mode-hook
            '(lambda ()
               (require 'company-php)
               (company-mode t)
               (add-to-list 'company-backends 'company-ac-php-backend)))
  )

(use-package lsp-php
	:ensure t
  :defer t
	:config
	(add-hook 'php-mode-hook #'lsp-php-enable)
	)

(provide 'init-php)

;;; init-php.el ends here
