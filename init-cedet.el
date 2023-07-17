;;; init-cedet.el --- CEDET
;; cedet setting.

;;; Commentary:
;; 

;;; Code:
;; From http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html
;; (setq cedet-root-path (concat  *user-site-lisp-path* "cedet/"))

;; (if (file-exists-p cedet-root-path)
;;     (load-file (concat cedet-root-path "cedet-devel-load.el"))
;; 	(load-file (concat cedet-root-path "contrib/cedet-contrib-load.el")))

(use-package cedet
  :ensure t
  :custom
  (semantic-default-submodes
   '(global-semantic-highlight-func-mode
     global-semantic-decoration-mode
     global-semantic-stickyfunc-mode
     global-semantic-idle-completions-mode
     global-semantic-idle-scheduler-mode
     global-semanticdb-minor-mode
     global-semantic-idle-summary-mode
     global-semantic-mru-bookmark-mode
     global-semantic-idle-local-symbol-highlight-mode
     global-semantic-highlight-edits-mode
     global-semantic-show-unmatched-syntax-mode
     global-semantic-show-parser-state-mode))
  (semanticdb-default-save-directory "~/.emacs.d/semanticdb")
  (semantic-idle-scheduler-idle-time 5)
  (semantic-symref-tool 'global)
  :init
  (message "init cedet")
  :config
  (require 'cedet-global)
  (require 'semantic)
  (semantic-mode 1)


  ;;;; System header files
  (let ((inc-cnf-file
         (expand-file-name "semantic-system-include.el"
                           user-emacs-directory)))
	  (when (file-exists-p inc-cnf-file)
		  (load inc-cnf-file)))

  (require 'ede)
  (ede-enable-generic-projects)
  (global-ede-mode t)
  
	(let ((ede-custom-file
				 (expand-file-name "cedet-projects.el" user-emacs-directory)))
		(when (file-exists-p ede-custom-file)
			(load ede-custom-file)))

  (require 'srecode)
  ;; Names completion with auto-complete package
  ;; srecode-map-load-path
  (global-srecode-minor-mode 1))


(provide 'init-cedet)

;;; init-cedet.el ends here
