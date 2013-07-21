

(cond
 ((cygwin-p) (defconst *workspace* "~/workspace"))
 ((linux-p) (defconst *workspace* "~/workspace"))
 ((windows-p) (defconst *workspace* "C:/Users/zzfnohell/Documents/workspace")))

(defvar *org-root-directory* (concat *workspace* "/language/org/src"))
(defvar *org-publish-directory* (concat *workspace* "/language/org/publish"))
(defvar *semantic-include-directories* nil)
(defvar *semantic-preprocessor-directories* nil)
(defvar *cedet-user-include-dirs* nil)
(defvar *cygwin-root* "c:/cygwin")
(defvar *cygwin-bin* "c:/cygwin/bin")


(defun add-subdirs-to-load-path 
  (dir)
  (let ((default-directory (concat dir "/")))
    (setq load-path (cons dir load-path))
    (normal-top-level-add-subdirs-to-load-path)))

(add-subdirs-to-load-path  "~/.emacs.d/site-lisp")

(if (cygwin-p) (setq exec-path (cons *cygwin-bin* exec-path)))

(setq default-fill-column 80)
