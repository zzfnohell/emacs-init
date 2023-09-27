;;; init-ruby.el --- Ruby
;;; Basic ruby setup

;;; Commentary:
;; 

;;; Code:

(use-package ruby-mode
  :ensure t
  :mode ("Rakefile\\'"
         "\\.rake\\'"
         "\\.rxml\\'"
         "\\.rjs\\'"
         "\\.irbrc\\'"
         "\\.pryrc\\'"
         "\\.builder\\'"
         "\\.ru\\'"
         "\\.gemspec\\'"
         "Gemfile\\'"
         "Kirkfile\\'")
	:config
  (setq ruby-use-encoding-map nil)
  (add-hook 'ruby-mode-hook 'subword-mode))

(use-package ruby-hash-syntax
  :ensure t)

;;; Ruby compilation
(use-package ruby-compilation
  :ensure t
  :hook
  (ruby-mode . ruby-compilation-mode))

;;; Robe
(use-package robe
  :ensure t
  :hook
  (ruby-mode . robe-mode)
  (robe-mode . ac-robe-setup))

;;; ri support
(use-package yari
  :ensure t
  :config (defalias 'ri 'yari))

(provide 'init-ruby)

;;; init-ruby.el ends here
