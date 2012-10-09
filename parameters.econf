

(cond
 ((cygwin-p) (defconst *workspace* "~/workspace"))
 ((linux-p) (defconst *workspace* "~/workspace"))
 ((windows-p) (defconst *workspace* "C:/Users/Public/Documents/workspace")))

(defvar *org-root-directory* (concat *workspace* "/language/org/src"))
(defvar *org-publish-directory* (concat *workspace* "/language/org/publish"))
(defvar *semantic-include-directories* nil)
(defvar *semantic-preprocessor-directories* nil)
(defvar *cedet-user-include-dirs* nil)
(defvar *cygwin-root* "c:/cygwin")
(defvar *cygwin-bin* "c:/cygwin/bin")

(if (cygwin-p) (setq exec-path (cons *cygwin-bin* exec-path)))

(setq default-fill-column 80)
