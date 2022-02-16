;;; init-auto-complete.el --- Auto Complete

;;; Commentary:
;; Auto Complete

;;; Code:

(use-package auto-complete
	:ensure t
  :config
	(let ((x "~/.emacs.d/auto-complete/ac-dict"))
		(if (not (file-directory-p x))
				(make-directory x t))
		(add-to-list 'ac-dictionary-directories x))
  ;; (ac-config-default)
  )

(defun company-yasnippet-or-completion ()
  "Solve company yasnippet conflicts."
  (interactive)
  (let ((yas-fallback-behavior
         (apply 'company-complete-common nil)))
    (yas-expand)))

(use-package company
	:ensure t
  :custom
  (company-dabbrev-downcase nil)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'company-mode-hook
            (lambda ()
              (substitute-key-definition
               'company-complete-common
               'company-yasnippet-or-completion
               company-active-map))))


(use-package company-coq
  :ensure t
	:if (featurep 'proof-site)
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

(use-package company-flow
	:ensure t
	:config
	(message "init-auto-complete/config company flow")
	(add-to-list 'company-backends 'company-flow))

(use-package company-ctags
	:ensure t
	:after company
	:config
	(with-eval-after-load 'company
		(company-ctags-auto-setup)))

(use-package company-maxima
	:ensure t
	:after (:all maxima))

(use-package company-lean
	:ensure t
	:after (:all lean-mode))

(provide 'init-auto-complete)

;;; init-auto-complete.el ends here
