;;; init-web-mode.el --- Web Mode

;;; Commentary:
;; 

;;; Code:

(defun init-web/web-mode/custom-web-mode-hook ()
  "Hooks for Web mode."
	;; Syntax Higlighting
	(set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")

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
						'(lambda ()
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
	(add-hook 'web-mode-hook
						(lambda ()
							(set (make-local-variable 'company-backends)
									 '(company-web-html company-files))
							(company-mode t)))
	)


(use-package web-mode
	:ensure t
	:defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

	(setq web-mode-engines-alist
				'(("php"    . "\\.phtml\\'")
					("blade"  . "\\.blade\\."))
				)
	
  (add-hook 'web-mode-hook  'init-web/web-mode/custom-web-mode-hook)
  )

(use-package web-beautify
	:ensure t
	:defer t)

(use-package impatient-mode
	:ensure t
	:defer t)

(use-package react-snippets
	:ensure t
	:defer t)

;; CSS 
;;; Colourise CSS colour literals
(use-package rainbow-mode
	:ensure t
	:defer t
  :config
  (progn
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode))
    )
  )


;;; SASS and SCSS
(use-package sass-mode
	:after markdown-mode
	:ensure t
	:defer t)

(use-package scss-mode
	:ensure t
	:defer t
	:config (setq-default scss-compile-at-save nil))


;;; LESS
(use-package less-css-mode
	:ensure t
	:defer t)

(use-package skewer-less
	:ensure t
	:defer t)

;;; Use eldoc for syntax hints
(use-package css-eldoc
	:ensure t
	:defer t
  :config
  (progn
    (autoload 'turn-on-css-eldoc "css-eldoc")
    (add-hook 'css-mode-hook 'turn-on-css-eldoc)
    )
  )

(use-package restclient
	:ensure t
	:defer t)

(provide 'init-web)

;;; init-web.el ends here
