;;; init-yasnippet.el --- YASnippet

;;; Commentary:
;; YASnippet

;;; Code:

(use-package gitignore-snippets
	:ensure t
  :requires yasnippet
  :autoload gitignore-snippets-init
  :hook
  (gitignore-mode . gitignore-snippets-init))

(use-package yasnippet
	:ensure t
  :defer t
  :hook
  (c++-ts . (lambda () (yas-active-extra-mode 'c++-mode)))
  (c-ts . (lambda () (yas-active-extra-mode 'c-mode)))
  (c-or-c++-ts . (lambda () (yas-active-extra-mode 'c-or-c++-mode)))
  (clojure-ts . (lambda () (yas-active-extra-mode 'clojure-mode)))
  (csharp-ts . (lambda () (yas-active-extra-mode 'csharp-mode)))
  (css-ts . (lambda () (yas-active-extra-mode 'css-mode)))
  (java-ts . (lambda () (yas-active-extra-mode 'java-mode)))
  (julia-ts .  (lambda () (yas-active-extra-mode 'julia-mode)))
  (js-ts . (lambda () (yas-active-extra-mode 'js-mode)))
  (kotlin-ts . (lambda () (yas-active-extra-mode 'kotlin-mode)))
  (python-ts . (lambda () (yas-active-extra-mode 'python-mode)))
  (rust-ts . (lambda () (yas-active-extra-mode 'rust-mode)))
  (sh-ts . (lambda () (yas-active-extra-mode 'sh-mode)))
  (tsx-ts . (lambda () (yas-active-extra-mode 'tsx-mode)))
  (yaml-ts . (lambda () (yas-active-extra-mode 'yaml-mode)))
  :config
  (let ((dirs (list
               "~/.emacs.d/snippets"
               "~/.emacs.d/snippets/yasmate/snippets")))
	  (dolist (dir dirs)
		  (let ((fullpath (expand-file-name dir)))
			  (if (not (file-directory-p fullpath))
            (make-directory fullpath t))
        (add-to-list 'yas-snippet-dirs fullpath))))
  ;; (yas-reload-all)
  (yas-global-mode 1)

  ;;; use popup menu for yas-choose-value
  (require 'popup)

  (define-key yas-minor-mode-map [(tab)] nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)

  (defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
    (when (featurep 'popup)
      (popup-menu*
       (mapcar (lambda (choice)
                 (popup-make-item
                  (or (and display-fn (funcall display-fn choice)) choice)
                  :value choice))
               choices)
       :prompt prompt
       ;; start isearch mode immediately
       :isearch t)))

  (setq yas-prompt-functions
        '(yas-popup-isearch-prompt
          yas-ido-prompt
          yas-no-prompt))

  (use-package yasnippet-snippets
	  :ensure t))


(use-package py-snippets
  :ensure t
  :requires yasnippet
  :autoload py-snippets-initialize
  :hook
  (python-mode . py-snippets-initialize))

(use-package auto-yasnippet
	:ensure t
	:bind (("C-c w" . aya-create)
				 ("C-c y" . aya-expand)))

(use-package haskell-snippets
  :after (haskell yasnippet)
  :ensure t
  :defer t)



(provide 'init-snippets)

;;; init-snippets.el ends here
