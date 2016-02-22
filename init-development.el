;;; init-development.el --- Development Tools

;;; Commentary:
;; 
(require-package 'emr)
(autoload 'emr-show-refactor-menu "emr")
(define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
(eval-after-load "emr" '(emr-initialize))

(provide 'init-development)

;;; init-development.el ends here
