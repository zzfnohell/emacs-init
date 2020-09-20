;;; init-ruby.el --- Ruby
;;; Basic ruby setup

;;; Commentary:
;; 

;;; Code:

(use-package ruby-mode
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
  (add-hook 'ruby-mode-hook 'subword-mode)
	)

(use-package ruby-hash-syntax)

;;; Ruby compilation
(use-package ruby-compilation)

;;; Robe
(use-package robe
  :config
  (progn
    (add-hook 'ruby-mode-hook 'robe-mode)
    (add-hook 'robe-mode-hook 'ac-robe-setup)))

;;; ri support
(use-package yari
  :config (defalias 'ri 'yari))



(provide 'init-ruby)

;;; init-ruby.el ends here
