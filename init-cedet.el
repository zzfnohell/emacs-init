;;; init-cedet.el --- CEDET
;; cedet setting.

;;; Commentary:
;; 

;;; Code:

;; (setq cedet-root-path (concat  *user-site-lisp-path* "cedet/"))

;; (if (file-exists-p cedet-root-path)
;;     (load-file (concat cedet-root-path "cedet-devel-load.el"))
;; 	(load-file (concat cedet-root-path "contrib/cedet-contrib-load.el")))

(require 'cedet)
(require 'eieio)
(require 'eieio-speedbar)
(require 'eieio-opt)
(require 'eieio-base)
(require 'ede/source)
(require 'ede/base)
(require 'ede/auto)
(require 'ede/proj)
(require 'ede/proj-archive)
(require 'ede/proj-aux)
(require 'ede/proj-comp)
(require 'ede/proj-elisp)
(require 'ede/proj-info)
(require 'ede/proj-misc)
(require 'ede/proj-obj)
(require 'ede/proj-prog)
(require 'ede/proj-scheme)
(require 'ede/proj-shared)

(setq semantic-ectag-program "ctags")

;;;; Semantic DataBase directory
(setq semanticdb-default-save-directory
      (expand-file-name "~/.emacs.d/semanticdb"))

;;;; Semantic's customization
(semantic-mode 1)
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


(require 'semantic/ia)
(require 'semantic/bovine/gcc)
(require 'semantic/bovine/c)

(require 'semantic/db)
(require 'semantic/c nil 'noerror)
(require 'semantic/decorate/include nil 'noerror)




;;;; System header files
;; (semantic-add-system-include "~/exp/include/boost_1_37" 'c++-mode)

;;;; Semantic's work optimization
(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
				 '(project unloaded system recursive))

;;;; Integration with imenu
(defun init-cedet/semantic-hook ()
  (imenu-add-to-menubar "TAGS"))

(add-hook 'semantic-init-hooks 'init-cedet/semantic-hook)

;;;; Customization of Semanticdb
;; enable support for gnu global
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
;; if you want to enable support for gnu global
(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))
;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;; (when (cedet-ectag-version-check t)
;;   (semantic-load-enable-primary-exuberent-ctags-support))


;;;; EDE's customization
(require 'ede)
(global-ede-mode t)
(ede-enable-generic-projects)


;;;; Using EDE for C & C++ projects
;; To define a project, you need to add following code:
;; (ede-cpp-root-project "Test"
;;                       :name "Test Project"
;;                       :file "~/work/project/CMakeLists.txt"
;;                       :include-path '("/"
;;                                       "/Common"
;;                                       "/Interfaces"
;;                                       "/Libs"
;;                                       )
;;                       :system-include-path '("~/exp/include")
;;                       :spp-table '(("isUnix" . "")
;;                                    ("BOOST_TEST_DYN_LINK" . "")))


;;;; Preprocessing of source code
;; (setq qt4-base-dir "/usr/include/qt4")
;; (semantic-add-system-include qt4-base-dir 'c++-mode)
;; (add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-dist.h"))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qglobal.h"))


;;;; Using EDE for Java projects
;; (require 'semantic/db-javap)
;; (ede-java-root-project "TestProject"
;;                        :file "~/work/TestProject/build.xml"
;;                        :srcroot '("src" "test")
;;                        :localclasspath '("/relative/path.jar")
;;                        :classpath '("/absolute/path.jar"))


;;;; Work with Semantic
;; customisation of modes
(defun init-cedet/cedet-semantic-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c ?" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c >" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c =" 'semantic-decoration-include-visit)
  (local-set-key "\C-c j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c q" 'semantic-ia-show-doc)
  (local-set-key "\C-c s" 'semantic-ia-show-summary)
  (local-set-key "\C-c p" 'semantic-analyze-proto-impl-toggle))

(add-hook 'semantic-init-hooks 'init-cedet/cedet-semantic-hook)

(add-hook 'lisp-mode-hook 'init-cedet/cedet-semantic-hook)
(add-hook 'scheme-mode-hook 'init-cedet/cedet-semantic-hook)
(add-hook 'emacs-lisp-mode-hook 'init-cedet/cedet-semantic-hook)
(add-hook 'erlang-mode-hook 'init-cedet/cedet-semantic-hook)


;;;; Names completion
(defun init-cedet/c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'init-cedet/c-mode-cedet-hook)


;;;; Names completion with auto-complete package
(defun init-cedet/c-mode-cedet-hook ()
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'init-cedet/c-mode-cedet-hook)


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

(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)

(setq cedet-sys-include-dirs
      (list
       "/usr/include"
       "/usr/local/include"))

(setq semantic-c-dependency-system-include-path "/usr/include/")

(let ((include-dirs *cedet-user-include-dirs*))
  (setq include-dirs (append include-dirs cedet-sys-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))


(defun init-cedet/recur-list-files (dir re)
  "Returns list of files in directory matching to given regex."
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
            (let ((tfiles (init-cedet/recur-list-files file re)))
              (when tfiles (setq matched (append matched tfiles)))))))))))

(defun init-cedet/preprocess-symbol-directory (dir)
  (when (file-accessible-directory-p dir)
    (let ((cfiles (init-cedet/recur-list-files dir "(\\.h|\\.hpp)")))
      (dolist (file cfiles)
        (add-to-list 'semantic-lex-c-preprocessor-symbol-file file)))))

(defun init-cedet/add-semantic-include-directory (dir)
  (semantic-add-system-include dir 'c++-mode)
  (semantic-add-system-include dir 'c-mode))

(mapc #'init-cedet/preprocess-symbol-directory
      *semantic-preprocessor-directories*)
(mapc #'init-cedet/add-semantic-include-directory
      *semantic-include-directories*)


(require 'srecode)
(global-srecode-minor-mode 1)

(provide 'init-cedet)

;;; init-cedet.el ends here
