(load "~/.emacs.d/config/config.el")
(load-config "parameters")

;; cedet setting.
(require 'cedet)
(require 'semantic)

(global-ede-mode t)

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


(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)

;; gcc setup
(require 'semantic-c nil 'noerror)
(let ((include-dirs *cedet-user-include-dirs*))
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

(mapcar #'preprocess-symbol-directory *semantic-preprocessor-directories*)
(mapcar #'add-semantic-include-directory *semantic-include-directories*)

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
