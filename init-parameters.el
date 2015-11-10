;;; init-parameters.el --- Variables

;;; Commentary:
;; 

;;; Code:

(defconst *workspace* "~")
(defvar *org-root-directory* (concat *workspace* "/language/org/src"))
(defvar *org-publish-directory* (concat *workspace* "/language/org/publish"))
(defvar *semantic-include-directories* nil)
(defvar *semantic-preprocessor-directories* nil)
(defvar *cedet-user-include-dirs* nil)
(defvar *cygwin-root* "c:/local/cygwin64")
(defvar *cygwin-bin* "c:/local/cygwin64/bin")
(defvar *rfc-directory* (concat *workspace* "/rfc"))

(defun add-subdirs-to-load-path
  (dir)
  (let ((default-directory (concat dir "/")))
    (setq load-path (cons dir load-path))
    (normal-top-level-add-subdirs-to-load-path)))

(setq fill-column 80)


(provide 'init-parameters)

;;; init-parameters.el ends here
