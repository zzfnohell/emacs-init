;;; init-company.el --- company


;;; Commentary:
;; 

;;; Code:

(use-package company
  :demand t
  :config
  (setq company-dabbrev-downcase nil)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-coq
  :if (featurep 'proof-site)
  :after (:all company))

(use-package company-quickhelp
  :after (:all company)
  :config (company-quickhelp-mode 1))

(use-package company-math
  :after (:all company)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode))

;; (use-package company-inf-ruby
;; 	:after (:all company)
;;   :demand t
;;   :config (add-to-list 'company-backends 'company-inf-ruby))


(use-package company-shell)

(use-package company-axiom)

(use-package company-dict)

(use-package company-restclient)

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

(provide 'init-company)

;;; init-company.el ends here
