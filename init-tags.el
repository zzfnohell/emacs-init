;;; init-tags.el --- TAGS

;;; Commentary:
;; 

;;; Code:

(use-package ggtags
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
  )

(use-package ctags-update
  :config
  (ctags-global-auto-update-mode)
  (setq ctags-update-prompt-create-tags nil)
  (autoload 'turn-on-ctags-auto-update-mode
    "ctags-update" "turn on `ctags-auto-update-mode'." t)
  (add-hook 'c-mode-common-hook 'turn-on-ctags-auto-update-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-ctags-auto-update-mode)
  (autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
  )

(use-package citre
  :defer t
  :init
  ;; This is needed in `:init' block for lazy load to work.
  (require 'citre-config)
  ;; Bind your frequently used commands.
  (global-set-key (kbd "C-x c j") 'citre-jump)
  (global-set-key (kbd "C-x c J") 'citre-jump-back)
  (global-set-key (kbd "C-x c p") 'citre-ace-peek)
  (global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
  :config
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
   citre-prompt-language-for-ctags-command t))

(use-package rtags-xref
	:ensure t
	:config
  (add-hook 'c-mode-common-hook #'rtags-xref-enable))

(use-package global-tags
	:ensure t
	:config
	;; to use GNU Global automagically, regardless of Emacs default configuration
	(add-hook 'ruby-mode-hook #'global-tags-exclusive-backend-mode)
	;; to use GNU Global automagically, respecting other backends
	(add-hook 'ruby-mode-hook #'global-tags-shared-backend-mode)

	;; xref (finding definitions, references)
	(add-to-list 'xref-backend-functions 'global-tags-xref-backend)
	;; project.el (finding files)
	(add-to-list 'project-find-functions 'global-tags-try-project-root)
	;; configure Imenu
	(add-hook 'ruby-mode-hook #'global-tags-imenu-mode)
	;; to update database after save
	(add-hook 'c++-mode-hook (lambda ()
														 (add-hook 'after-save-hook
																			 #'global-tags-update-database-with-buffer
																			 nil
																			 t))))

(use-package xcscope
	:config
	(cscope-setup))

(provide 'init-tags) 
;;; init-tags.el ends here
