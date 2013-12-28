(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

(require-package 'ac-c-headers)
(add-hook 'c-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

(require-package 'ac-etags)
(custom-set-variables
 '(ac-etags-requires 1))
(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))

(defun ac-etags-c-mode-common-hook ()
  (add-to-list 'ac-sources 'ac-source-etags))
(add-hook 'c-mode-common-hook 'ac-etags-c-mode-common-hook)

(provide 'init-auto-complete)
