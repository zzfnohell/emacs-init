;;; init-yasnippet.el --- YASnippet

;;; Commentary:
;; YASnippet

;;; Code:

(defun init-snippets/rust-ts-yas ()
  "Activate rust-mode snippets under plain `rust-ts-mode'.
No-op when `rust-mode' treesitter-derive is active (major-mode is
already `rust-mode', so rust snippets apply directly)."
  (when (and (eq major-mode 'rust-ts-mode)
             (fboundp 'yas-activate-extra-mode))
    (yas-activate-extra-mode 'rust-mode)))

(use-package gitignore-snippets
  :ensure t
  :after yasnippet
  :autoload gitignore-snippets-init
  :hook
  (gitignore-mode . gitignore-snippets-init))

(use-package yasnippet
  :ensure t
  :commands (yas-insert-snippet yas-expand)
  ;; Load and enable globally after init (package README: yas-global-mode 1).
  :hook
  ((after-init . yas-global-mode)
   (c++-ts-mode . (lambda () (yas-activate-extra-mode 'c++-mode)))
   (c-ts-mode . (lambda () (yas-activate-extra-mode 'c-mode)))
   (c-or-c++-ts-mode . (lambda () (yas-activate-extra-mode 'c-or-c++-mode)))
   (clojure-ts-mode . (lambda () (yas-activate-extra-mode 'clojure-mode)))
   (csharp-ts-mode . (lambda () (yas-activate-extra-mode 'csharp-mode)))
   (css-ts-mode . (lambda () (yas-activate-extra-mode 'css-mode)))
   (java-ts-mode . (lambda () (yas-activate-extra-mode 'java-mode)))
   (julia-ts-mode . (lambda () (yas-activate-extra-mode 'julia-mode)))
   (js-ts-mode . (lambda () (yas-activate-extra-mode 'js-mode)))
   (kotlin-ts-mode . (lambda () (yas-activate-extra-mode 'kotlin-mode)))
   (python-ts-mode . (lambda () (yas-activate-extra-mode 'python-mode)))
   ;; rust-mode uses treesitter-derive (init-rust.el), so major-mode is
   ;; rust-mode and rust snippets apply directly; keep a soft fallback for
   ;; plain rust-ts-mode when derive is disabled.
   (rust-ts-mode . init-snippets/rust-ts-yas)
   (bash-ts-mode . (lambda () (yas-activate-extra-mode 'sh-mode)))
   (tsx-ts-mode . (lambda () (yas-activate-extra-mode 'tsx-mode)))
   (yaml-ts-mode . (lambda () (yas-activate-extra-mode 'yaml-mode))))
  :config
  (let ((dirs (list
               "~/.emacs.d/snippets"
               "~/.emacs.d/snippets/yasmate/snippets")))
    (dolist (dir dirs)
      (let ((fullpath (expand-file-name dir)))
        (if (not (file-directory-p fullpath))
            (make-directory fullpath t))
        (add-to-list 'yas-snippet-dirs fullpath))))
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
  :after yasnippet
  :autoload py-snippets-initialize)

(use-package auto-yasnippet
  :ensure t
  :bind (("C-c w" . aya-create)
         ("C-c y" . aya-expand)))

(use-package haskell-snippets
  :after (haskell yasnippet)
  :ensure t
  :defer t
  :hook
  (haskell-mode . haskell-snippets-initialize))

(use-package java-snippets
  :ensure t
  :after yasnippet
  :hook
  ((java-mode . java-snippets-initialize)
   (java-ts-mode . java-snippets-initialize)))


(use-package react-snippets
  :ensure t
  :defer t
  :after yasnippet
  :hook
  ((rjsx-mode . react-snippets-initialize)
   (tsx-ts-mode . react-snippets-initialize)))

(provide 'init-snippets)

;;; init-snippets.el ends here
