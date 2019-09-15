;;; init-php.el --- PHP MODE

;;; Commentary:
;; 

(use-package php-mode)

(use-package company-php
  :config
  (add-hook 'php-mode-hook
            '(lambda ()
               (require 'company-php)
               (company-mode t)
               (add-to-list 'company-backends 'company-ac-php-backend))))

(provide 'init-php)

;;; init-php.el ends here
