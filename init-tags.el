;;; init-tags.el --- TAGS

;;; Commentary:
;; 

;;; Code:

(defun init-tags/enable-ggtags ()
  "Enable ggtags in cc derived modes."
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
  (setq-local hippie-expand-try-functions-list
              (cons 'ggtags-try-complete-tag hippie-expand-try-functions-list))
  (ggtags-mode 1))

(use-package ggtags
  :ensure t
  :custom
  (ggtags-use-idutils t)
  :hook
  (c-mode . init-tags/enable-ggtags)
  (c-ts-mode . init-tags/enable-ggtags)
  (c++-mode . init-tags/enable-ggtags)
  (c++-ts-mode . init-tags/enable-ggtags)
  (c-or-c++-mode . init-tags/enable-ggtags)
  (c-or-c++-ts-mode . init-tags/enable-ggtags)
  (csharp-mode . init-tags/enable-ggtags)
  (csharp-ts-mode . init-tags/enable-ggtags)
  (java-mode . init-tags/enable-ggtags)
  (java-ts-mode . init-tags/enable-ggtags))

(use-package xcscope
  :ensure t
	:config
	(cscope-setup))

(provide 'init-tags)
;;; init-tags.el ends here
