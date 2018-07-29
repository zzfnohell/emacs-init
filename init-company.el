;;; init-company.el --- company


;;; Commentary:
;; 

;;; Code:

(use-package company
	:ensure t
  :demand t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package company-lsp
	:ensure t
	:demand t
	:config (push 'company-lsp company-backends)
	)

(use-package company-jedi
	:ensure t
	:after (:all company jedi)
	:demand t
  :config (add-to-list 'company-backends 'company-jedi))

(use-package company-coq
	:ensure t
	:defer t
	:after (:all company))

(use-package company-c-headers
	:ensure t
	:demand t
	:after (:all company)
  :config (add-to-list 'company-backends 'company-c-headers))

(use-package company-tern
	:ensure t
	:after (:all company)
	:demand t
  :config
  (progn
    (add-to-list 'company-backends 'company-tern)
    (setq company-tern-property-marker "")
    (setq company-tern-meta-as-single-line t)))

(use-package company-quickhelp
	:after (:all company)
	:demand t
  :config (company-quickhelp-mode 1))

(use-package company-math
	:ensure t
	:after (:all company)
  :demand t
  :config (add-to-list 'company-backends 'company-math-symbols-unicode))

;; (use-package company-inf-ruby
;; 	:after (:all company)
;;   :demand t
;;   :config (add-to-list 'company-backends 'company-inf-ruby))


(use-package company-glsl
	:ensure t
	:after (:all company)
  :demand t
  :config
  (when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl)))

(use-package company-flow
	:ensure t
	:config
	(eval-after-load 'company
    '(add-to-list 'company-backends 'company-flow)))


(use-package company-web
	:ensure t
	:demand t
	:config
	(add-to-list 'company-backends 'company-web-html)
	(add-to-list 'company-backends 'company-web-jade)
	(add-to-list 'company-backends 'company-web-slim)
	)

(use-package company-shell
	:demand t
	:ensure t)

(use-package company-cmake
	:demand t
	:ensure t)

(use-package company-axiom
	:demand t
	:ensure t)

(use-package company-dict
	:demand t
	:ensure t)

(use-package company-restclient
	:ensure t
	:demand t)

(provide 'init-company)

;;; init-company.el ends here
