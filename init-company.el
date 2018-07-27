;;; init-company.el --- company


;;; Commentary:
;; 

;;; Code:
(req-package company
  :demand t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )

(req-package company-lsp
	:demand t
	:config (push 'company-lsp company-backends)
	)

(use-package company-jedi
	:after (:all company jedi)
	:demand t
  :config (add-to-list 'company-backends 'company-jedi))

(use-package company-coq
	:defer t
	:after (:all company))

(use-package company-c-headers
	:demand t
	:after (:all company)
  :config (add-to-list 'company-backends 'company-c-headers))

(use-package company-tern
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
	:after (:all company)
  :demand t
  :config (add-to-list 'company-backends 'company-math-symbols-unicode))

;; (use-package company-inf-ruby
;; 	:after (:all company)
;;   :demand t
;;   :config (add-to-list 'company-backends 'company-inf-ruby))


(use-package company-glsl
	:after (:all company)
  :demand t
  :config
  (when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl)))

(req-package company-flow
	:require company
	:config
	(eval-after-load 'company
    '(add-to-list 'company-backends 'company-flow)))


(req-package company-web
	:demand t
	:config
	(add-to-list 'company-backends 'company-web-html)
	(add-to-list 'company-backends 'company-web-jade)
	(add-to-list 'company-backends 'company-web-slim)
	)

(req-package company-shell :demand t)
(req-package company-cmake :demand t)
(req-package company-axiom :demand t)
(req-package company-dict :demand t)

(provide 'init-company)

;;; init-company.el ends here
