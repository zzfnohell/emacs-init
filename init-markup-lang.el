;;; init-markup-lang.el --- Markup Language

;;; Commentary:
;;

(defun init-markup-lang/append-company-backends ()
  "Append company-backends for markup languages."
  (setq-local company-backends
              (append '((company-nxml :with company-yasnippet))
                      company-backends)))

(use-package nxml-mode
  :ensure nil
  :defer t
  :mode
  ("\\.xml\\'" . nxml-mode)
  ("\\.xsd\\'" . nxml-mode)
  ("\\.sch\\'" . nxml-mode)
  ("\\.rng\\'" . nxml-mode)
  ("\\.xslt\\'" . nxml-mode)
  ("\\.svg\\'" . nxml-mode)
  ("\\.rss\\'" . nxml-mode)
  :config
  (add-hook 'nxml-mode-hook #'init-markup-lang/append-company-backends))

(use-package ini-mode
  :ensure t
  :defer t
  :mode
  (("\\.ini\\'" . ini-mode)))

(use-package haml-mode
  :ensure t
  :defer t
  :mode ("\\.haml\\'" . haml-mode))

;;; YAML
(use-package yaml-mode
  :ensure t
  :defer t
  :mode
  ("\\.yml$" . yaml-mode))

(use-package markdown-mode
  :ensure t
  :defer t
  :mode
  (("\\.text\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)
   ("\\.md\\'" . markdown-mode)))

(use-package markdown-preview-mode
  :ensure t
  :defer t
  :commands markdown-preview
  :config
  (add-to-list
   'markdown-preview-javascript
   "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML"))

(use-package poly-markdown
  :ensure t
  :defer t
  :hook
  ((markdown-mode . poly-markdown-mode)))

(use-package plantuml-mode
  :ensure t
  :defer t)

;; CSV file
(use-package csv-mode
  :ensure t
  :mode "\\.[Cc][Ss][Vv]\\'"
  :init (setq csv-separators '("," ";" "|" " ")))

(provide 'init-markup-lang)

;;; init-markup-lang.el ends here
