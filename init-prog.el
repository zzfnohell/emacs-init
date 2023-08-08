;;; init-prog.el --- Prog Mode



;;; Commentary:
;; 

;;; Code:
(use-package julia-ts-mode
  :ensure t)

(use-package kotlin-ts-mode
  :ensure t)

(require 'treesit)
(setq major-mode-remap-alist
      '((c++-mode . c++-ts-mode)
        (c-mode . c-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (clojure-mode . clojure-ts-mode)
        (cmake-mode . cmake-ts-mode)
        (csharp-mode . csharp-ts-mode)
        (css-mode . css-ts-mode)
        (java-mode . java-ts-mode)
        (julia-mode . julia-ts-mode)
        (js-mode . js-ts-mode)
        (kotlin-mode . kotlin-ts-mode)
        (python-mode . python-ts-mode)
        (rust-mode . rust-ts-mode)
        (sh-mode . bash-ts-mode)
        (tsx-mode . tsx-ts-mode)
        (yaml-mode . yaml-ts-mode)))

(use-package treesit-auto
  :ensure t
  :demand t
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))



(use-package paren
  :config (show-paren-mode)
  :custom (show-paren-style 'expression))

(use-package rainbow-delimiters
	:ensure t
	:hook
	(prog-mode . rainbow-delimiters-mode))

(use-package hideshow
  :ensure t
  :hook
  (prog-mode . hs-minor-mode)
  (nxml-mode . hs-minor-mode)
  :config
	;; Fix XML folding
	(add-to-list 'hs-special-modes-alist
							 (list 'nxml-mode
										 "<!--\\|<[^/>]*[^/]>"
										 "-->\\|</[^/>]*[^/]>"
										 "<!--"
										 'nxml-forward-element
										 nil))

	;; Fix HTML folding
	(dolist (mode '(sgml-mode
									html-mode
									html-erb-mode))
		(add-to-list 'hs-special-modes-alist
								 (list mode
											 "<!--\\|<[^/>]*[^/]>"
											 "-->\\|</[^/>]*[^/]>"
											 "<!--"
											 'sgml-skip-tag-forward
											 nil))))

(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

(use-package emr
  :ensure t
  :config
  (autoload 'emr-show-refactor-menu "emr")
  (define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
  (eval-after-load "emr" '(emr-initialize)))

(use-package srefactor
  :ensure t
  :config
  (progn
    (require 'srefactor)
    (require 'srefactor-lisp)

    ;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++. 
    ;; (semantic-mode 1) ;; -> this is optional for Lisp
    (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
    (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
    (global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
    (global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
    (global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
    (global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)))

(require 'display-fill-column-indicator)
(setq display-fill-column-indicator-column 120)

(defun init-prog/enable-display-fill-column ()
  (message "display fill column indicator")
	(display-fill-column-indicator-mode))

(add-hook 'prog-mode-hook #'init-prog/enable-display-fill-column)

(use-package bison-mode
  :ensure t
  :mode
  (("\\.lex\\'" . bison-mode)
   ("\\.yy\\'" . bison-mode)
   ("\\.y\\'" . bison-mode)))

(use-package lex
  :ensure t)

(use-package peg
  :ensure t)

(use-package auto-complete
	:ensure t
  :config
	(let ((x "~/.emacs.d/auto-complete/ac-dict"))
		(if (not (file-directory-p x))
				(make-directory x t))
		(add-to-list 'ac-dictionary-directories x))
  ;; (ac-config-default)
  )

;; https://www.emacswiki.org/emacs/CompanyMode
  ;; From here. Dated 2015, tested 2023. Based on PR accepted into spacemacs
;; https://stackoverflow.com/a/28510968.
;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backends)
  (if (or (not company-mode/enable-yas)
          (and (listp backends) (member 'company-yasnippet backends)))
	    backends
    (append (if (consp backends) backends (list backends))
            '(:with company-yasnippet))))

;; From here. Dated 2015, tested 2023. API use confirmed by author of yasnippet
;; https://stackoverflow.com/a/28510968
;; Try yas-expand and on failure to company-completion
(defun company-yasnippet-or-completion ()
  (interactive)
  (let ((yas-fallback-behavior nil))
    (unless (yas-expand)
	    (call-interactively #'company-complete-common))))

(defun init-prog/elisp-mode-hook-func ()
  (add-to-list
   (make-local-variable 'company-backends)
   '(company-elisp :with company-yasnippet)))

(use-package company
	:ensure t
  :custom
  (company-dabbrev-downcase nil)
  (company-show-numbers t)
  :hook
  (emacs-lisp-mode . init-prog/elisp-mode-hook-func)
  :config
  (global-company-mode t)
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  (setq-default company-idle-delay 0.1
                company-require-match nil
                company-tooltip-align-annotations t
                company-minimum-prefix-length 0
                company-frontends
                '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
                  company-preview-frontend
                  company-echo-metadata-frontend))
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

(use-package company-dict
  :ensure t)

(use-package company-restclient
  :ensure t)


(defun init-prog/flow-mode-hook-func ()
(add-to-list (make-local-variable 'company-backends) '(company-flow :with company-yasnippet)))

(use-package company-flow
	:ensure t
  :hook
  (flow-mode . init-prog/flow-mode-hook-func))

(use-package company-ctags
	:ensure t
	:after company
	:config
	(with-eval-after-load 'company
		(company-ctags-auto-setup)))

(defun init-prog/company-maxima-hook-func ()
    (let ((backends (make-local-variable 'company-backends)))
    (add-to-list backends '(company-maxima-libraries :with company-yasnippet))
    (add-to-list backends '(company-maxima-symbols :with company-yasnippet))))

(use-package company-maxima
	:ensure t
	:after (:all maxima)
  :hook
  (maxima-mode . init-prog/company-maxima-hook-func))

(require 'codeium)
(add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
(setq use-dialog-box nil) ;; do not use popup boxes
    (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
(add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)

(setq codeium-api-enabled
      (lambda (api)
        (memq api '(GetCompletions
                    Heartbeat
                    CancelRequest
                    GetAuthToken RegisterUser
                    auth-redirect AcceptCompletion))))
;; You can overwrite all the codeium configs!
;; for example, we recommend limiting the string sent to codeium for better performance
(defun my-codeium/document/text ()
  (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
;; if you change the text, you should also change the cursor_offset
;; warning: this is measured by UTF-8 encoded bytes
(defun my-codeium/document/cursor_offset ()
  (codeium-utf8-byte-length
   (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
(setq codeium/document/text 'my-codeium/document/text)
(setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset)

(message "loading init-prog done.")

(provide 'init-prog)

;;; init-prog.el ends here
