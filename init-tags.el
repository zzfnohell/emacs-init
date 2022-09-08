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
  ;; Bind your frequently used commands.  Alternatively, you can define them
  ;; in `citre-mode-map' so you can only use them when `citre-mode' is enabled.
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
   citre-prompt-language-for-ctags-command t
   ;; By default, when you open any file, and a tags file can be found for it,
   ;; `citre-mode' is automatically enabled.  If you only want this to work for
   ;; certain modes (like `prog-mode'), set it like this.
   citre-auto-enable-citre-mode-modes '(prog-mode)))

(unless (eq system-type 'windows-nt)
  (use-package rtags-xref
	  :ensure t
	  :config
    (add-hook 'c-mode-common-hook #'rtags-xref-enable)))

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
	:config
	(cscope-setup))

(provide 'init-tags) 
;;; init-tags.el ends here
