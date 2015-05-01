;;; init-web-mode.el --- Web Mode



;;; Commentary:
;; 

;;; Code:
(require-package 'web-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
)

(require-package 'ac-html)
(add-hook 'html-mode-hook 'ac-html-enable)

(add-to-list 'web-mode-ac-sources-alist
             '("html" . (
                         ;; attribute-value better to be first
                         ac-source-html-attribute-value
                         ac-source-html-tag
                         ac-source-html-attribute)))

(require-package 'ac-html-bootstrap)
(require-package 'ac-html-csswatcher)
(require 'ac-html-csswatcher)
(ac-html-csswatcher-setup)

(require-package 'web-beautify)

(provide 'init-web)

;;; init-web.el ends here
