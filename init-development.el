;;; init-development.el --- Development Tools

;;; Commentary:
;;;

(use-package emr
  
  :config
  (progn
    (autoload 'emr-show-refactor-menu "emr")
    (define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
    (eval-after-load "emr" '(emr-initialize))
    )
  )

(use-package srefactor
  
  :config
  (progn
    (require 'srefactor)
    (require 'srefactor-lisp)
    
    ;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++. 
    (semantic-mode 1) ;; -> this is optional for Lisp

    (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
    (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
    (global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
    (global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
    (global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
    (global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)
    )
  )


(provide 'init-development)

;;; init-development.el ends here
