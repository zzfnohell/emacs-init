;;; init-markup-lang.el --- Markup Language

;;; Commentary:
;;

(defun init-markup-lang/append-company-backends ()
  (let ((mode-backends (make-local-variable 'company-backends)))
    (add-to-list mode-backends 'company-nxml)))

(use-package nxml-mode
  :ensure nil
  :mode (("\\.xml\\'" . nxml-mode)
         ("\\.xsd\\'" . nxml-mode)
         ("\\.sch\\'" . nxml-mode)
         ("\\.rng\\'" . nxml-mode)
         ("\\.xslt\\'" . nxml-mode)
         ("\\.svg\\'" . nxml-mode)
         ("\\.rss\\'" . nxml-mode))
  :config
  (add-hook 'nxml-mode-hook #'init-markup-lang/append-company-backends))

(use-package ini-mode
  :mode (("\\.ini\\'" . ini-mode)))

(use-package haml-mode :after markdown-mode)

;;; YAML
(use-package yaml-mode
  :mode ("\\.yml$" . yaml-mode))

(use-package markdown-mode
  :mode
  (("\\.text\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)
   ("\\.md\\'" . markdown-mode)))

(use-package markdown-preview-mode
  :config
  (add-to-list
   'markdown-preview-javascript
   "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML"))

(provide 'init-markup-lang)

;;; init-markup-lang.el ends here
