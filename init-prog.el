;;; init-prog.el --- Prog Mode



;;; Commentary:
;;

;;; Code:
(use-package julia-ts-mode
  :ensure t
  :defer t)

(use-package kotlin-ts-mode
  :ensure t
  :defer t)

(use-package markdown-ts-mode
  :ensure t
  :defer t)


(use-package treesit
  :ensure nil
  :mode (("\\.tsx\\'" . tsx-ts-mode)
         ("\\.ts\\'"  . typescript-ts-mode)
         ("\\.js\\'"  . typescript-ts-mode)
         ("\\.jsx\\'" . tsx-ts-mode))
  :config
  (message "config treesit")
  (setq major-mode-remap-alist
        '((bash-mode . bash-ts-mode)
          (c++-mode . c++-ts-mode)
          (c-mode . c-ts-mode)
          (c-or-c++-mode . c-or-c++-ts-mode)
          (clojure-mode . clojure-ts-mode)
          (cmake-mode . cmake-ts-mode)
          (conf-toml-mode . toml-ts-mode)
          (csharp-mode . csharp-ts-mode)
          (css-mode . css-ts-mode)
          (go-mode . go-ts-mode)
          (java-mode . java-ts-mode)
          (julia-mode . julia-ts-mode)
          (js-json-mode . json-ts-mode)
          (js-mode . js-ts-mode)
          (js2-mode . js-ts-mode)
          (json-mode . json-ts-mode)
          (kotlin-mode . kotlin-ts-mode)
          (markdown-mode . markdown-ts-mode)
          (python-mode . python-ts-mode)
          (rust-mode . rust-ts-mode)
          (sh-mode . bash-ts-mode)
          (tsx-mode . tsx-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (yaml-mode . yaml-ts-mode))))

(use-package tree-sitter-langs
  :ensure t
  :defer t
  :commands tree-sitter-langs-install-grammars)

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
  :commands emr-show-refactor-menu
  :bind
  (:map prog-mode-map
        ("M-RET" . emr-show-refactor-menu))
  :config
  (emr-initialize))

(use-package srefactor
  :ensure t
  :bind
  (("M-RET o" . srefactor-lisp-one-line)
   ("M-RET m"  . srefactor-lisp-format-sexp)
   ("M-RET d" . srefactor-lisp-format-defun)
   ("M-RET b" . srefactor-lisp-format-buffer)
   :map c-mode-map
   ("M-RET" . srefactor-refactor-at-point)
   :map c++-mode-map
   ("M-RET" . srefactor-refactor-at-point))
  :config
  (require 'srefactor)
  (require 'srefactor-lisp)

  ;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++.
  ;; (semantic-mode 1) ;; -> this is optional for Lisp
  ;; (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
  ;; (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
  ;; (global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
  ;; (global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
  ;; (global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
  ;; (global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)
  )

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
  :ensure t
  :defer t)

(use-package peg
  :ensure t
  :defer t)

(use-package auto-complete
  :ensure t
  :disabled t
  :config
  (let ((x "~/.emacs.d/auto-complete/ac-dict"))
    (if (not (file-directory-p x))
        (make-directory x t))
    (add-to-list 'ac-dictionary-directories x))
  (ac-config-default)
  )

;; https://www.emacswiki.org/emacs/CompanyMode
;; From here. Dated 2015, tested 2023. Based on PR accepted into spacemacs
;; https://stackoverflow.com/a/28510968.
;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backends)
  "Add yas backends."
  (unless (or (not company-mode/enable-yas)
              (and (listp backends) (member 'company-yasnippet backends)))
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

(use-package company-coq
  :ensure t
  :defer t
  :commands company-coq-mode
  :if (featurep 'proof-site)
  :hook (coq-mode . company-coq-mode))

(use-package company-dict
  :ensure t
  :defer t
  :after company)

(use-package company-quickhelp
  :ensure t
  :defer t
  :after company
  :config
  (company-quickhelp-mode))

(use-package company-math
  :ensure t
  :defer t
  :after company
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode))

(use-package company-ctags
  :ensure t
  :defer t
  :after company
  :hook (company-mode . company-ctags-auto-setup)
  :config
  (message "config company ctags"))

(use-package company
  :ensure t
  :defer t
  :custom
  (company-dabbrev-downcase nil)
  (company-show-numbers t)
  :config
  (global-company-mode t)
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  (setq-default company-idle-delay nil
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

(use-package company-prescient
  :ensure t
  :defer t
  :after company
  :config
  (company-prescient-mode))

(use-package company-restclient
  :ensure t
  :defer t
  :hook
  (restclient-mode . company-restclient))


(defun init-prog/flow-mode-hook-func ()
  (setq-local company-backends
              (append '((company-flow :with company-yasnippet))
                      company-backends)))

(use-package company-flow
  :ensure t
  :defer t
  :hook
  (flow-mode . init-prog/flow-mode-hook-func))

(defun init-prog/company-maxima-hook-func ()
  "Set up company backends for Maxima mode."
  (setq-local company-backends
              (append '((company-maxima-libraries :with company-yasnippet)
                        (company-maxima-symbols :with company-yasnippet))
                      company-backends)))

(use-package company-maxima
  :ensure t
  :defer t
  :after (:all maxima company)
  :hook
  (maxima-mode . init-prog/company-maxima-hook-func))

(use-package imenu-list
  :ensure t
  :bind ("C-." . imenu-list-minor-mode)
  :config
  (setq imenu-list-focus-after-activation t))

;; Configure Tempel
(use-package tempel
  :ensure t
  :disabled t
  ;; Require trigger prefix before template name when completing.
  ;; :custom
  ;; (tempel-trigger-prefix "<")

  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))

  :init
  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
  )

;; Optional: Add tempel-collection.
;; The package is young and doesn't have comprehensive coverage.
(use-package tempel-collection
  :ensure t
  :disabled t)

(use-package corfu
  :ensure t
  :disabled t
  ;; Optional customizations
  :custom
  (corfu-cycle t) ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)  ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

(use-package corfu-prescient
  :ensure t
  :disabled t
  :config
  (corfu-prescient-mode))

(use-package corfu-terminal
  :ensure t
  :disabled t
  :config
  (corfu-terminal-mode))

(use-package cape
  :ensure t
  :disabled t
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-tex)
  (add-to-list 'completion-at-point-functions #'cape-sgml)
  (add-to-list 'completion-at-point-functions #'cape-rfc1345)
  (add-to-list 'completion-at-point-functions #'cape-abbrev)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-symbol)
  (add-to-list 'completion-at-point-functions #'cape-line))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function. As an alternative,
  ;; try `cape-dict'.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

(message "loading init-prog done.")

(provide 'init-prog)

;;; init-prog.el ends here
