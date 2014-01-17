
(cond
 ((eq system-type 'gnu/linux)
  (require-package 'gtags)
  (require 'gtags)
  (autoload 'gtags-mode "gtags" "" t)
  (setq gtags-pop-delete t)
  (setq gtags-suggested-key-mapping t)
  
  ;; [Setting to make 'Gtags select mode' easy to see]
  (add-hook
   'gtags-select-mode-hook
   '(lambda ()
      (setq hl-line-face
            '((t (:bold t :foreground "blue" :weight extra-bold)
                 underline)))
      (hl-line-mode 1))))
 (t t))

(require-package 'ggtags)

(require-package 'ctags)
(require 'ctags)

(require-package 'ctags-update)
(autoload
  'turn-on-ctags-auto-update-mode
  "ctags-update"
  "turn on
 `ctags-auto-update-mode'." t)
(add-hook
 'c-mode-common-hook
 'turn-on-ctags-auto-update-mode)

(add-hook
 'emacs-lisp-mode-hook
 'turn-on-ctags-auto-update-mode)

(autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)

(provide 'init-tags)
