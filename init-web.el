;;; init-web-mode.el --- Web Mode

;;; Commentary:
;;

;;; Code:

(defun init-web/web-mode/custom-web-mode-hook ()
  "Hooks for Web mode."
  ;; Indentation
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

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
              (company-mode t))))


(use-package web-mode
  :ensure t
  :mode (
         ("\\.phtml\\'" . web-mode)
         ("\\.tpl\\.php\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode)
         ("\\.as[cp]x\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode)
         ("\\.html?\\'" . web-mode))
  :config
  (setq web-mode-engines-alist
        '(("php"    . "\\.phtml\\'")
          ("blade"  . "\\.blade\\.")))
  (add-hook 'web-mode-hook  'init-web/web-mode/custom-web-mode-hook)
  )

(use-package web-beautify :ensure t)

(use-package impatient-mode :ensure t)

(use-package react-snippets :ensure t)

;; CSS
;;; Colourise CSS colour literals
(use-package rainbow-mode
  :ensure t
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
  )

(use-package scss-mode
  :ensure t
  :config (setq-default scss-compile-at-save nil))

;;; LESS
(use-package less-css-mode :ensure t)

;;; Use eldoc for syntax hints
(use-package css-eldoc
  :ensure t
  :config
  (progn
    (autoload 'turn-on-css-eldoc "css-eldoc")
    (add-hook 'css-mode-hook 'turn-on-css-eldoc)))

(use-package rjsx-mode :ensure t :mode ("\\.jsx$" . rjsx-mode))
(use-package pug-mode :ensure t)
(use-package restclient :ensure t)

(provide 'init-web)

;;; init-web.el ends here
