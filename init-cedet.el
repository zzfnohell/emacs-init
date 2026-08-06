;;; init-cedet.el --- CEDET -*- lexical-binding: t -*-

;;; Commentary:
;; Optional Semantic/EDE setup for C/C++/Java.
;; Disabled in init-main.el by default; enable with (require 'init-cedet).

;;; Code:

(use-package semantic
  :ensure nil
  :defer t
  :hook ((c-mode c++-mode java-mode) . semantic-mode)
  :custom
  (semantic-default-submodes
   '(global-semantic-idle-scheduler-mode
     global-semanticdb-minor-mode
     global-semantic-idle-summary-mode
     global-semantic-stickyfunc-mode
     global-semantic-idle-local-symbol-highlight-mode
     global-semantic-decoration-mode
     global-semantic-highlight-func-mode
     global-semantic-mru-bookmark-mode))
  (semanticdb-default-save-directory
   (expand-file-name "semanticdb" user-emacs-directory))
  (semantic-idle-scheduler-idle-time 5)
  :config
  (when (and (require 'cedet-global nil t)
             (require 'semantic/db-global nil t)
             (fboundp 'cedet-gnu-global-version-check)
             (fboundp 'semanticdb-enable-gnu-global-databases)
             (funcall #'cedet-gnu-global-version-check t))
    (funcall #'semanticdb-enable-gnu-global-databases 'c-mode)
    (funcall #'semanticdb-enable-gnu-global-databases 'c++-mode))
  (let ((inc-cnf-file
         (expand-file-name "semantic-system-include.el"
                           user-emacs-directory)))
    (when (file-exists-p inc-cnf-file)
      (load inc-cnf-file))))

(use-package ede
  :ensure nil
  :after semantic
  :config
  (global-ede-mode 1)
  (let ((ede-custom-file
         (expand-file-name "cedet-projects.el" user-emacs-directory)))
    (when (file-exists-p ede-custom-file)
      (load ede-custom-file))))

(provide 'init-cedet)

;;; init-cedet.el ends here
