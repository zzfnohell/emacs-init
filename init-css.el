;;; Colourise CSS colour literals
(when (eval-when-compile (>= emacs-major-version 24))
  ;; rainbow-mode needs color.el, bundled with Emacs >= 24.
  (require-package 'rainbow-mode)
  (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
    (add-hook hook 'rainbow-mode)))

;;; SASS and SCSS
(require-package 'sass-mode)
(require-package 'scss-mode)
(setq-default scss-compile-at-save nil)

;;; LESS
(require-package 'less-css-mode)
(require-package 'skewer-less)


;;; Auto-complete CSS keywords
(after-load 'auto-complete
  (dolist (hook '(css-mode-hook sass-mode-hook scss-mode-hook))
    (add-hook hook 'ac-css-mode-setup)))

;;; Use eldoc for syntax hints
(require-package 'css-eldoc)
(autoload 'turn-on-css-eldoc "css-eldoc")
(add-hook 'css-mode-hook 'turn-on-css-eldoc)


(provide 'init-css)
