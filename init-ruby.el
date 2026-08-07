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
  :ensure t
  :defer t
  :after ruby-mode
  :commands (ruby-toggle-hash-syntax))

;;; Ruby compilation
;; `ruby-compilation-mode' is a `compilation-mode' derivative, not a minor
;; mode, so it must not be hung on `ruby-mode-hook' (that would turn every
;; Ruby buffer into a compilation buffer).  Expose its commands instead.
(use-package ruby-compilation
  :ensure t
  :defer t
  :commands (ruby-compilation-this-buffer
             ruby-compilation-run
             ruby-compilation-this-test))

;;; Robe
(use-package robe
  :ensure t
  :hook
  (ruby-mode . robe-mode)
  :config
  ;; Wire robe's completion backend into company once it is available
  ;; (was `ac-robe-setup', an auto-complete function that is no longer used).
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-robe)))

;;; ri support
(use-package yari
  :ensure t
  :defer t
  :commands (yari yari-helm)
  :config (defalias 'ri 'yari))

(provide 'init-ruby)

;;; init-ruby.el ends here
