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
  (add-hook 'ruby-mode-hook 'subword-mode)
	)

(use-package ruby-hash-syntax :ensure t)

;;; Ruby compilation
(use-package ruby-compilation :ensure t)

;;; Robe
(use-package robe
  :ensure t
  :config
  (progn
    (add-hook 'ruby-mode-hook 'robe-mode)
    (add-hook 'robe-mode-hook 'ac-robe-setup)
    )
  )

;;; ri support
(use-package yari
  :ensure t
  :config (defalias 'ri 'yari)
  )

(use-package rsense
  :ensure t
  :config
  (progn
    (setq rsense-home (expand-file-name "~/Application/rsense"))
    (if (file-accessible-directory-p rsense-home)
        (progn
          (add-to-list 'load-path (concat rsense-home "/etc"))
          (require 'rsense)
          (add-hook 'ruby-mode-hook
                    (lambda ()
                      (add-to-list 'ac-sources 'ac-source-rsense-method)
                      (add-to-list 'ac-sources 'ac-source-rsense-constant)))))
    )
  )


(provide 'init-ruby)

;;; init-ruby.el ends here
