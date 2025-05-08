;;; init-web-mode.el --- Web Mode -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:
(use-package js
  :ensure t
  :defer t
  :custom
  (js-indent-level 2))

(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)))

(use-package js-comint
	:ensure t
  :commands js-comint-repl
  :config
  (setq inferior-js-program-command "node"))

(use-package xref-js2
  :ensure t
  :defer t
  :autoload xref-js2-xref-backend)

(use-package js2-refactor
	:ensure t
  :defer t
  :commands js2-refactor-mode)

(use-package tide
  :ensure t
  :after (company flycheck)
  :hook ((typescript-ts-mode . tide-setup)
         (tsx-ts-mode . tide-setup)
         (typescript-ts-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save))
  :config
  ;; configure jsx-tide checker to run after your default jsx checker
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
  ;; configure javascript-tide checker to run after your default javascript checker
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append))

(use-package js2-mode
  :after tide
  :ensure t
  :mode (("\\.js\\'" . js2-mode))
  :hook
  (js2-mode . js2-imenu-extras-mode)
  (js2-mode . js2-refactor-mode)
  (js2-mode . setup-tide-mode)
  (js2-mode . (lambda ()
                (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(use-package flow-minor-mode
  :ensure t
  :defer t
  :hook
  (js2-mode . flow-minor-enable-automatically))

(use-package indium
	:ensure t
  :defer t)

(use-package mmm-mode
  :ensure t
  :defer t
  :init
  (setq mmm-global-mode 'buffers-with-submode-classes)
  :config
  (require 'mmm-auto)
  (mmm-mode 1))

(defun init-web/custom-web-mode-hook-func ()
  "Hooks for Web mode."
  ;; Indentation
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  ;; Syntax Higlighting
  ;; Auto-pairs
  (setq web-mode-extra-auto-pairs
        '(("erb"  . (("beg" "end")))
          ("php"  . (("beg" "end")
                     ("beg" "end")))))

  ;; Enable / disable Features
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-part-face t)
  (setq web-mode-enable-comment-keywords t)
  (setq web-mode-enable-heredoc-fontification t)

  ;; Current element / column highlight
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)

  ;; Context-aware auto-completion
  (setq web-mode-ac-sources-alist
        '(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
          ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
          ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

  (add-hook 'web-mode-before-auto-complete-hooks
            (lambda ()
              (let ((web-mode-cur-language
                     (web-mode-language-at-pos)))
                (if (string= web-mode-cur-language "php")
                    (yas-activate-extra-mode 'php-mode)
                  (yas-deactivate-extra-mode 'php-mode))
                (if (string= web-mode-cur-language "css")
                    (setq emmet-use-css-transform t)
                  (setq emmet-use-css-transform nil)))))

  ;; company-web
  (define-key web-mode-map (kbd "C-'") 'company-web-html)
  (when (string-equal "jsx" (file-name-extension buffer-file-name))
    (setup-tide-mode)))

(defun init-web/web-mode-hook-func ()
  "Set up company backends for web mode."
  (setq-local company-backends
              (append '((company-web-html :with company-yasnippet)
                        (company-files :with company-yasnippet))
                      company-backends)))

(use-package company-web
  :ensure t
  :after (:all company)
  :config
  (add-hook 'web-mode-hook #'init-web/web-mode-hook-func))


(use-package emmet-mode
  :ensure t
  :hook
  (sgml-mode . emmet-mode)
  (html-mode . emmet-mode)
  (css-mode .  emmet-mode))

(use-package web-mode
  :ensure t
  :mode
  ("\\.phtml\\'" . web-mode)
  ("\\.tpl\\.php\\'" . web-mode)
  ("\\.[agj]sp\\'" . web-mode)
  ("\\.as[cp]x\\'" . web-mode)
  ("\\.erb\\'" . web-mode)
  ("\\.mustache\\'" . web-mode)
  ("\\.djhtml\\'" . web-mode)
  ("\\.html?\\'" . web-mode)
  ("\\.cshtml?\\'" . web-mode)
  ("\\.jsx\\'" . web-mode)
  :hook
  (web-mode . init-web/custom-web-mode-hook-func)
  :config
  (setq web-mode-engines-alist
        '(("php"    . "\\.phtml\\'")
          ("blade"  . "\\.blade\\."))))

(use-package web-beautify
  :ensure t
  :defer t
  :commands (web-beautify-js web-beautify-html web-beautify-css))

(use-package impatient-mode
  :ensure t
  :defer t
  :commands (impatient-mode))


;; CSS
(use-package colorful-mode
  ;; :diminish
  ;; :ensure t ; Optional
  :custom
  (colorful-use-prefix t)
  (colorful-only-strings 'only-prog)
  (css-fontify-colors nil)
  :config
  (global-colorful-mode t)
  (add-to-list 'global-colorful-modes 'helpful-mode))

;;; SASS and SCSS
(use-package sass-mode
  :ensure t
  :mode
  ("\\.sass$" . sass-mode))

(use-package scss-mode
  :ensure t
  :defer t
  :mode
  ("\\.scss$" . scss-mode)
  :config
  (setq-default scss-compile-at-save nil))

;;; LESS
(use-package less-css-mode
  :ensure t
  :mode
  ("\\.less$" . less-css-mode))

;;; Use eldoc for syntax hints
(use-package css-eldoc
  :ensure t
  :defer t
  :commands (turn-on-css-eldoc)
  :hook (css-mode . turn-on-css-eldoc))

(use-package rjsx-mode
  :ensure t
  :mode ("\\.jsx$" . rjsx-mode)
  :hook
  (rjsx-mode . react-snippets))

(use-package pug-mode
  :ensure t
  :mode
  ("\\.pug$" . rjsx-mode))

(use-package restclient
  :ensure t
  :defer t)

(use-package impostman
  :ensure t
  :defer t)

(defun init-web/css-mode-hook-func ()
  "Set up company backends for CSS mode."
  (setq-local company-backends
              (append '(company-css)
                      company-backends)))

(add-hook 'css-mode-hook #'init-web/css-mode-hook-func)

(message "loading init-web done.")
(provide 'init-web)

;;; init-web.el ends here
