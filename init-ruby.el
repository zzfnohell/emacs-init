;;; init-ruby.el --- Ruby
;;; Basic ruby setup

;;; Commentary:
;; 

;;; Code:

(use-package ruby-mode
  :ensure t
  :defer t
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
  :ensure t
  :defer t)

;;; Ruby compilation
(use-package ruby-compilation
  :ensure t
  :defer t)

;;; Robe
(use-package robe
  :ensure t
  :defer t
  :init
  (add-hook 'ruby-mode-hook 'robe-mode)
  (add-hook 'robe-mode-hook 'ac-robe-setup))

;;; ri support
(use-package yari
  :ensure t
  :defer t
  :config (defalias 'ri 'yari))



(provide 'init-ruby)

;;; init-ruby.el ends here
