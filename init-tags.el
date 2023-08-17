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

(use-package citre
  :ensure t
  :init
  ;; This is needed in `:init' block for lazy load to work.
  (require 'citre-config)
  ;; Bind your frequently used commands.  Alternatively, you can define them
  ;; in `citre-mode-map' so you can only use them when `citre-mode' is enabled.
  (global-set-key (kbd "C-x c j") 'citre-jump)
  (global-set-key (kbd "C-x c J") 'citre-jump-back)
  (global-set-key (kbd "C-x c p") 'citre-ace-peek)
  (global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
  :config
  (require 'projectile)
  (setq
   ;; Set these if readtags/ctags is not in your path.
   ;;;; citre-readtags-program "/path/to/readtags"
   ;;;; citre-ctags-program "/path/to/ctags"
   ;; Set this if you use project management plugin like projectile.  It's
   ;; used for things like displaying paths relatively, see its docstring.
   citre-project-root-function #'projectile-project-root
   ;; Set this if you want to always use one location to create a tags file.
   citre-default-create-tags-file-location 'global-cache
   ;; See the "Create tags file" section above to know these options
   citre-use-project-root-when-creating-tags t
   citre-prompt-language-for-ctags-command t
   ;; By default, when you open any file, and a tags file can be found for it,
   ;; `citre-mode' is automatically enabled.  If you only want this to work for
   ;; certain modes (like `prog-mode'), set it like this.
   citre-auto-enable-citre-mode-modes '(prog-mode)))

(require 'clue)
(add-hook 'find-file-hook #'clue-auto-enable-clue-mode)
(setq
 ;; Set this if you use project management plugin like projectile.
 clue-project-root-function #'projectile-project-root
 ;; Set like this if you only want auto-enabling citre-mode to work
 ;; for markdown files.  You can also set it to nil, then the
 ;; auto-enabling works for all files.  By default, it works for all
 ;; text-modes.
 ;; clue-auto-enable-modes '(markdown-mode)
 clue-auto-enable-modes nil)

;; (use-package clue
;;  :ensure t
;;  ;; :init
;;  ;; (add-hook 'find-file-hook #'clue-auto-enable-clue-mode)
;;  :config
;;  (setq
;;   ;; Set this if you use project management plugin like projectile.
;;   clue-project-root-function #'projectile-project-root
;;   ;; Set like this if you only want auto-enabling citre-mode to work
;;   ;; for markdown files.  You can also set it to nil, then the
;;   ;; auto-enabling works for all files.  By default, it works for all
;;   ;; text-modes.
;;   ;; clue-auto-enable-modes '(markdown-mode)
;;   clue-auto-enable-modes nil))


(use-package xcscope
  :ensure t
	:config
	(cscope-setup))

(provide 'init-tags)
;;; init-tags.el ends here
