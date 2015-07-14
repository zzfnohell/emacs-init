;;; init-company.el --- company


;;; Commentary:
;; 

;;; Code:
(require-package 'company)
(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)

(require-package 'company-jedi)

(require-package 'company-coq)
(require 'company-coq)

(require-package 'company-c-headers)

(require-package 'company-tern)
(setq company-tern-property-marker "")
(setq company-tern-meta-as-single-line t)

(setq company-tooltip-align-annotations t)

(require-package 'company-quickhelp)
(company-quickhelp-mode 1)

(require-package 'company-math)

(require-package 'company-inf-ruby)

(defun add-to-company-backend-list ()
  (progn
    (add-to-list 'company-backends 'company-ess-backend)
    (add-to-list 'company-backends 'company-inf-ruby)
    (add-to-list 'company-backends 'company-math-symbols-unicode)
    (add-to-list 'company-backends 'company-tern)
    (add-to-list 'company-backends 'company-c-headers)
    (add-to-list 'company-backends 'company-jedi)))

(eval-after-load 'company '(add-to-company-backend-list))

(provide 'init-company)

;;; init-company.el ends here
