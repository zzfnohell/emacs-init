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
  (set (make-local-variable 'company-backends)
       '(company-web-html company-files)))

(use-package company-web :after company)

(use-package emmet-mode
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode))

(use-package web-mode
  :mode (("\\.phtml\\'" . web-mode)
         ("\\.tpl\\.php\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode)
         ("\\.as[cp]x\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.cshtml?\\'" . web-mode))
  :config
  (add-hook 'web-mode-hook #'init-web/web-mode/custom-web-mode-hook)
  (setq web-mode-engines-alist
        '(("php"    . "\\.phtml\\'")
          ("blade"  . "\\.blade\\."))))

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
(use-package sass-mode :after markdown-mode)

(use-package scss-mode
  :config (setq-default scss-compile-at-save nil))

;;; LESS
(use-package less-css-mode)

;;; Use eldoc for syntax hints
(use-package css-eldoc
  :config
  (progn
    (autoload 'turn-on-css-eldoc "css-eldoc")
    (add-hook 'css-mode-hook 'turn-on-css-eldoc)))

(use-package rjsx-mode :mode ("\\.jsx$" . rjsx-mode))
(use-package pug-mode)
(use-package restclient)

(require 'css-mode)
(add-hook 'css-mode-hook
          (lambda ()
            (let ((mode-backends (make-local-variable 'company-backends)))
              (add-to-list mode-backends 'company-css))))

(use-package httprepl
  :ensure t)

(message "loading init-web done.")
(provide 'init-web)

;;; init-web.el ends here
