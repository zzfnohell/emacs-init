;;; init-markup-lang.el --- Markup Language

;;; Commentary:
;;

(defun init-markup-lang/append-company-backends ()
  (let ((mode-backends (make-local-variable 'company-backends)))
    (add-to-list mode-backends 'company-nxml)))

(require 'sgml-mode)
(require 'nxml-mode)

(add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xsd\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.sch\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rng\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.svg\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rss\\'" . nxml-mode))

(add-hook 'nxml-mode-hook #'init-markup-lang/append-company-backends)

(use-package ini-mode
  :ensure t
  :mode (("\\.ini\\'" . ini-mode)))

(use-package haml-mode
  :ensure t
  :after markdown-mode)

;;; YAML
(use-package yaml-mode
  :ensure t
  :mode ("\\.yml$" . yaml-mode))

(use-package markdown-mode
  :ensure t
  :mode
  (("\\.text\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)
   ("\\.md\\'" . markdown-mode)))

(use-package markdown-preview-mode
  :config
  (add-to-list
   'markdown-preview-javascript
   "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML"))

(use-package plantuml-mode
  :ensure t)

;; CSV file
(use-package csv-mode
  :ensure t
  :mode "\\.[Cc][Ss][Vv]\\'"
  :init (setq csv-separators '("," ";" "|" " ")))

(provide 'init-markup-lang)

;;; init-markup-lang.el ends here
