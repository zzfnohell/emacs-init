;;; init-prog.el --- Prog Mode



;;; Commentary:
;; 

;;; Code:

(use-package rainbow-delimiters
	:ensure t
	:config
	(add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package hideshow
  :ensure t
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
											 nil)))
	(add-hook 'nxml-mode-hook 'hs-minor-mode)
  (add-hook 'prog-mode-hook 'hs-minor-mode))

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
(defun init-ui/enable-display-fill-column ()
	(display-fill-column-indicator-mode))

(add-hook 'prog-mode-hook #'init-ui/enable-display-fill-column)

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

  (company-show-numbers t)
  :config
  (global-company-mode t)
  (setq-default company-idle-delay 0.1
                company-require-match nil
                company-minimum-prefix-length 0
                company-frontends '(company-preview-frontend))
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


(use-package codeium
    ;; if you use straight
    ;; :straight '(:type git :host github :repo "Exafunction/codeium.el")
    ;; otherwise, make sure that the codeium.el file is on load-path
    :init
    ;; use globally
    (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
    ;; or on a hook
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

    ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions
    ;;             (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
    ;; an async company-backend is coming soon!

    ;; codeium-completion-at-point is autoloaded, but you can
    ;; optionally set a timer, which might speed up things as the
    ;; codeium local language server takes ~0.2s to start up
    ;; (add-hook 'emacs-startup-hook
    ;;  (lambda () (run-with-timer 0.1 nil #'codeium-init)))

    ;; :defer t ;; lazy loading, if you want
    :config
    (setq use-dialog-box nil) ;; do not use popup boxes

    ;; if you don't want to use customize to save the api-key
    ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

    ;; get codeium status in the modeline
    (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
    (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
    ;; alternatively for a more extensive mode-line
    ;; (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

    ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
    (setq codeium-api-enabled
        (lambda (api)
          (memq api '(GetCompletions
                      Heartbeat
                      CancelRequest
                      GetAuthToken RegisterUser
                      auth-redirect AcceptCompletion))))
    ;; you can also set a config for a single buffer like this:
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local codeium/editor_options/tab_size 4)))

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
    (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))


(message "loading init-prog done.")

(provide 'init-prog)

;;; init-prog.el ends here
