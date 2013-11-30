
(require 'gtags)
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-pop-delete t)
(setq gtags-suggested-key-mapping t)

;; [Setting to make 'Gtags select mode' easy to see]
(add-hook 'gtags-select-mode-hook
          '(lambda ()
             (setq hl-line-face
                   '((t (:bold t :foreground "blue" :weight extra-bold)
                        underline)))
             (hl-line-mode 1)))

(require-package 'ctags)
(require 'ctags)
(require-package 'ctags-update)
(autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)

(provide 'init-tags)
