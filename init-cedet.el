;; cedet setting.
(require 'cedet)
(require 'cedet-cscope)
(require 'cedet-files)
(require 'cedet-global)
(require 'cedet-idutils)
(require 'ede)

(global-ede-mode t)
(ede-enable-generic-projects)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)
(require 'semantic/bovine/c)
(require 'semantic/db-global)
(require 'semantic-c nil 'noerror)
(require 'semantic-decorate-include nil 'noerror)

(semantic-mode 1)

(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-decoration-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-highlight-edits-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-mru-bookmark-mode 1)
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)


;;;; Semantic DataBase directory
(setq semanticdb-default-save-directory
     (expand-file-name "~/.emacs.d/semanticdb"))

;; not existing in build in
;; (enable-visual-studio-bookmarks)
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (global-semantic-tag-folding-mode 1)

(setq-mode-local c-mode semanticdb-find-default-throttle
				 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
				 '(project unloaded system recursive))

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))

(add-hook 'semantic-init-hooks 'my-semantic-hook)
(add-hook 'semantic-init-hooks 'cedet-semantic-hook)

;; enable support for gnu global
(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-exuberent-ctags-support))

(global-semantic-decoration-mode 1)
(semantic-toggle-decoration-style "semantic-tag-boundary" -1)

(autoload 'senator-try-expand-semantic "senator")

(setq hippie-expand-try-functions-list
      '(senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill))

(defun indent-or-complete ()
  "Complete if point is at end of a word, otherwise indent line."
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command)))

(defun indent-key-setup ()
  "Set tab as key for indent-or-complete"
  (local-set-key [(tab)] 'indent-or-complete))

(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)

(setq
 cedet-sys-include-dirs
 (list
  "/usr/include"
  "/usr/include/bits"
  "/usr/include/glib-2.0"
  "/usr/include/gnu"
  "/usr/include/gtk-2.0"
  "/usr/include/gtk-2.0/gdk-pixbuf"
  "/usr/include/gtk-2.0/gtk"
  "/usr/local/include"
  "/usr/local/include"))

(setq semantic-c-dependency-system-include-path "/usr/include/")

(let ((include-dirs *cedet-user-include-dirs*))
  (setq include-dirs (append include-dirs cedet-sys-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))


(defun recur-list-files (dir re)
  "Returns list of files in directory matching to given regex"
  (when (file-accessible-directory-p dir)
    (let ((files (directory-files dir t)) matched)
      (dolist (file files matched)
        (let ((fname (file-name-nondirectory file)))
          (cond
           ((or (string= fname ".")
                (string= fname "..")) nil)
           ((and (file-regular-p file)
                 (string-match re fname))
            (setq matched (cons file matched)) (message fname))
           ((file-directory-p file)
            (let ((tfiles (recur-list-files file re)))
              (when tfiles (setq matched (append matched tfiles)))))))))))

(defun preprocess-symbol-directory (dir)
  (when (file-accessible-directory-p dir)
    (let ((cfiles (recur-list-files dir "(\\.h|\\.hpp)")))
      (dolist (file cfiles)
        (add-to-list 'semantic-lex-c-preprocessor-symbol-file file)))))

(defun add-semantic-include-directory (dir)
  (semantic-add-system-include dir 'c++-mode)
  (semantic-add-system-include dir 'c-mode))

(mapc #'preprocess-symbol-directory *semantic-preprocessor-directories*)
(mapc #'add-semantic-include-directory *semantic-include-directories*)

;; customisation of modes
(defun cedet-semantic-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c ?" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c >" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c =" 'semantic-decoration-include-visit)
  (local-set-key "\C-c j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c q" 'semantic-ia-show-doc)
  (local-set-key "\C-c s" 'semantic-ia-show-summary)
  (local-set-key "\C-c p" 'semantic-analyze-proto-impl-toggle))

(add-hook 'lisp-mode-hook 'cedet-semantic-hook)
(add-hook 'scheme-mode-hook 'cedet-semantic-hook)
(add-hook 'emacs-lisp-mode-hook 'cedet-semantic-hook)
(add-hook 'erlang-mode-hook 'cedet-semantic-hook)

(require 'srecode)
(global-srecode-minor-mode 1)
;;;; Custom template for srecode
;;(setq srecode-map-load-path
;;      (list (srecode-map-base-template-dir)
;;	    (expand-file-name "~/.emacs.d/templates/srecode")))



(provide 'init-cedet)
