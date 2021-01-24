;;; init-php.el --- PHP MODE

;;; Commentary:
;; 

(use-package php-mode :ensure t)

(defun init-php/php-mode-hook-func ()
  (require 'company-php)
  (setq-local company-backends '(company-ac-php-backend)))

(use-package company-php
  :ensure t
  :config
  (add-hook 'php-mode-hook #'init-php/php-mode-hook-func))

(message "loading init-php done.")

(provide 'init-php)

;;; init-php.el ends here
