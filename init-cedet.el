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

  ;;;; Integration with imenu
  (add-hook 'semantic-init-hooks 'init-cedet/semantic-hook)

  ;;;; System header files
  (when (eq system-type 'windows-nt)
    (semantic-add-system-include "c:/msys64/mingw64/include/" 'c-mode)
    (semantic-add-system-include "c:/msys64/mingw64/include/" 'c++-mode))

  (require 'ede)
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
