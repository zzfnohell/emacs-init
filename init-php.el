;;; init-php.el --- PHP MODE

;;; Commentary:
;; 
(require-package 'php-mode)
(require 'php-mode)
(require-package 'ac-php)
(add-hook 'php-mode-hook '(lambda ()
                           (auto-complete-mode t)
                           (require 'ac-php)
                           (setq ac-sources  '(ac-source-php ) )
                           (yas-global-mode 1)))

(provide 'init-php)

;;; init-php.el ends here
