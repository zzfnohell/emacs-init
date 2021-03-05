;;; init-auto-complete.el --- Auto Complete

;;; Commentary:
;; Auto Complete

;;; Code:

(use-package auto-complete
	:demand t
  :config
	(let ((x "~/.emacs.d/auto-complete/ac-dict"))
		(if (not (file-directory-p x))
				(make-directory x t))
		(add-to-list 'ac-dictionary-directories x))
  ;; (ac-config-default)
  )

(use-package company
  :demand t
  :ensure t
  :custom
  (company-dabbrev-downcase nil)
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; (use-package company-posframe
;;   :after company
;;   :ensure t
;;   :hook
;; 	(company-mode . company-posframe-mode))

(use-package company-coq
  :if (featurep 'proof-site)
  :ensure t
  :after (:all company))

(use-package company-quickhelp
  :ensure t
  :after (:all company)
  :config
  (company-quickhelp-mode 1))

(use-package company-math
  :ensure t
  :after (:all company)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode))

(use-package company-shell
  :ensure t)

(use-package company-axiom
  :ensure t)

(use-package company-dict
  :ensure t)

(use-package company-restclient
  :ensure t)

(provide 'init-auto-complete)

;;; init-auto-complete.el ends here
