;;; Basic ruby setup
(require-package 'ruby-mode)
(require 'ruby-mode)

(require-package 'ruby-hash-syntax)
(require 'ruby-hash-syntax)

(add-auto-mode 'ruby-mode
               "Rakefile\\'" 
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

(setq ruby-use-encoding-map nil)

(after-load 'ruby-mode
  ;; Stupidly the non-bundled ruby-mode isn't a derived mode of
  ;; prog-mode: we run the latter's hooks anyway in that case.
  (add-hook 'ruby-mode-hook
            (lambda ()
              (unless (derived-mode-p 'prog-mode)
                (run-hooks 'prog-mode-hook)))))

(add-hook 'ruby-mode-hook 'subword-mode)


;;; Inferior ruby
(require-package 'inf-ruby)
(require 'inf-ruby)
(require-package 'ac-inf-ruby)
(require 'ac-inf-ruby)

(after-load 'auto-complete
  (add-to-list 'ac-modes 'inf-ruby-mode))

(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)

(after-load 'inf-ruby
  (define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))

;;; Ruby compilation
(require-package 'ruby-compilation)
(require 'ruby-compilation)

;;; Robe
(require-package 'robe)
(require 'robe)

(after-load 'ruby-mode
  (add-hook 'ruby-mode-hook 'robe-mode))
(after-load 'robe
  (add-hook 'robe-mode-hook
            (lambda ()
              (add-to-list 'ac-sources 'ac-source-robe)
              (set-auto-complete-as-completion-at-point-function))))

;;; ri support
(require-package 'yari)
(defalias 'ri 'yari)

(require-package 'rsense)
(require 'rsense)
(setq rsense-home "~/Application/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))

;;; YAML
(require-package 'yaml-mode)
(require 'yaml-mode)

(provide 'init-ruby)
