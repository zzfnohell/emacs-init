;;; init-markup-lang.el --- Markup Language

;;; Commentary:
;;

(defun init-markup-lang/append-company-backends ()
  (let ((mode-backends (make-local-variable 'company-backends)))
    (add-to-list mode-backends 'company-nxml)))

(use-package nxml-mode
  :ensure nil
  :hook
  ((nxml-mode-hook . init-markup-lang/append-company-backends))
  :mode
  (("\\.xml\\'" . nxml-mode)
   ("\\.xsd\\'" . nxml-mode)
   ("\\.sch\\'" . nxml-mode)
   ("\\.rng\\'" . nxml-mode)
   ("\\.xslt\\'" . nxml-mode)
   ("\\.svg\\'" . nxml-mode)
   ("\\.rss\\'" . nxml-mode)))

(use-package ini-mode
  :ensure t
  :mode
  (("\\.ini\\'" . ini-mode)))

(use-package haml-mode
  :ensure t)

;;; YAML
(use-package yaml-mode
  :ensure t
  :mode
  ("\\.yml$" . yaml-mode))

(use-package markdown-mode
  :ensure t
  :mode
  (("\\.text\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)
   ("\\.md\\'" . markdown-mode)))

(use-package markdown-preview-mode
  :ensure t
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
