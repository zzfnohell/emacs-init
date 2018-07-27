;;; init-web-mode.el --- Web Mode

;;; Commentary:
;; 

;;; Code:

(use-package web-mode
  :config
  (progn
    (setq web-mode-enable-current-element-highlight nil)
    (setq web-mode-enable-current-column-highlight nil)

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
            ("blade"  . "\\.blade\\.")))

    (add-to-list 'auto-mode-alist '("\\.api\\'" . web-mode))

    (defun init-web/custom-web-mode-hook ()
      "Hooks for Web mode."
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
      (setq web-mode-style-padding 1)
      (setq web-mode-script-padding 1)
      (setq web-mode-block-padding 0)
      (setq web-mode-comment-style 2)
      (setq web-mode-extra-auto-pairs
            '(("erb"  . (("beg" "end")))
              ("php"  . (("beg" "end")
                         ("beg" "end")))))
      (setq web-mode-enable-auto-pairing t)
      (setq web-mode-enable-css-colorization t)
      (setq web-mode-enable-block-face t)
      (setq web-mode-enable-part-face t)
      (setq web-mode-enable-comment-keywords t)
      (setq web-mode-enable-heredoc-fontification t)

			;; company-web
			(define-key web-mode-map (kbd "C-'") 'company-web-html)
			(add-hook 'web-mode-hook
								(lambda ()
									(set (make-local-variable 'company-backends)
											 '(company-web-html company-files))
									(company-mode t)))
			)

    (add-hook 'web-mode-hook  'init-web/custom-web-mode-hook)
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
    )
  )

(use-package ac-html-bootstrap)
(use-package ac-html-csswatcher :config (ac-html-csswatcher-setup))
(use-package web-beautify)
(use-package impatient-mode)
(use-package react-snippets)

;; CSS 
;;; Colourise CSS colour literals
(use-package rainbow-mode
  :config
  (progn
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode))
    )
  )


;;; SASS and SCSS
(use-package sass-mode)
(use-package scss-mode :config (setq-default scss-compile-at-save nil))


;;; LESS
(use-package less-css-mode)
(use-package skewer-less)

;;; Auto-complete CSS keywords
(after-load 'auto-complete
  (dolist (hook '(css-mode-hook sass-mode-hook scss-mode-hook))
    (add-hook hook 'ac-css-mode-setup)))

;;; Use eldoc for syntax hints
(use-package css-eldoc
  :config
  (progn
    (autoload 'turn-on-css-eldoc "css-eldoc")
    (add-hook 'css-mode-hook 'turn-on-css-eldoc)
    )
  )

(provide 'init-web)

;;; init-web.el ends here
