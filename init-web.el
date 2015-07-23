;;; init-web-mode.el --- Web Mode



;;; Commentary:
;; 

;;; Code:

(setq web-mode-enable-current-element-highlight nil)
(setq web-mode-enable-current-column-highlight nil)

(require-package 'web-mode)
(require 'web-mode)

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
(add-to-list 'auto-mode-alist '("/some/react/path/*\\.js[x]?\\'" . web-mode))

(defun custom-web-mode-hook ()
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
  (setq web-mode-enable-heredoc-fontification t))

(add-hook 'web-mode-hook  'custom-web-mode-hook)
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

(add-to-list  'web-mode-ac-sources-alist
			  '("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets)))

(add-to-list 'web-mode-ac-sources-alist
			 '("css" . (ac-source-css-property
						ac-source-emmet-css-snippets)))

(add-to-list 'web-mode-ac-sources-alist
             '("html" . (
                         ;; attribute-value better to be first
						 ;; ac-source-words-in-buffer
						 ;; ac-source-abbrev
						 ;; ac-source-emmet-html-aliases
						 ;; ac-source-emmet-html-snippets
                         ac-source-html-attribute-value
                         ac-source-html-tag
                         ac-source-html-attribute)))

(require-package 'ac-html)
(add-hook 'html-mode-hook 'ac-html-enable)

(add-hook 'haml-mode-hook 'ac-haml-enable)
(add-hook 'jade-mode-hook 'ac-jade-enable)
(add-hook 'slim-mode-hook 'ac-slim-enable)

(require-package 'ac-html-bootstrap)
(require-package 'ac-html-csswatcher)
(require 'ac-html-csswatcher)
(ac-html-csswatcher-setup)

(require-package 'web-beautify)

(require-package 'kite)
(require 'kite)

(require-package 'impatient-mode)
(require 'impatient-mode)

(provide 'init-web)

;;; init-web.el ends here
