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


(defun init-cedet/semantic-hook ()
  "Add a TAGS entry to menu bar."
  (imenu-add-to-menubar "TAGS"))

(use-package cedet
	:after (:all company yasnippet)
  :init
  ;;;; Semantic DataBase directory
  (setq semanticdb-default-save-directory (expand-file-name "~/.emacs.d/semanticdb"))

  ;;;; Semantic's customization
  (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
  (add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
  ;;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
  (add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
  (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
  (add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
  (add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
  (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
  (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
  (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
  
  :config
  (require 'cedet-global)
  (require 'semantic)
  (semantic-mode 1)
  
  ;;;; Integration with imenu
  (add-hook 'semantic-init-hooks 'init-cedet/semantic-hook)

  ;;;; System header files
  (when (eq system-type 'windows-nt)
    (semantic-add-system-include "d:/msys64/mingw64/include/" 'c-mode)
    (semantic-add-system-include "d:/msys64/mingw64/include/" 'c++-mode))
  
  (require 'ede)
  (global-ede-mode t)

	(let ((ede-custom-file
				 (expand-file-name "cedet-projects.el" user-emacs-directory)))
		(when (file-exists-p ede-custom-file)
			(load ede-custom-file))))

(require 'srecode)
;;;; Names completion with auto-complete package
;; srecode-map-load-path
(global-srecode-minor-mode 1)

(provide 'init-cedet)

;;; init-cedet.el ends here
