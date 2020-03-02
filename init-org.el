;;; init-org.el --- ORG

;;; Commentary:
;; 

;;; Code:

(use-package org-preview-html)

(defvar *org-root-directory* "~/notes/")
(defvar *org-publish-directory* "~/notes-public/")

(unless (file-directory-p *org-root-directory*)
  (make-directory *org-root-directory* t))

(unless (file-directory-p *org-root-directory*)
  (make-directory *org-publish-directory* t))

(setq org-directory *org-root-directory*)

(setq org-agenda-files (list "~/notes/agenda.org"))
(setq org-default-notes-file "~/notes/default.org")

(setq org-publish-project-alist
      `(("blog-notes"
         :base-directory *org-root-directory*
         :recursive t
         :publishing-directory *org-publish-directory*
         :publishing-function org-html-publish-to-html)
        ("blog-static"
         :base-directory *org-root-directory*
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory *org-publish-directory*
         :recursive 
         :publishing-function org-publish-attachment)
        ("blog" :components ("blog-notes" "blog-static"))))

(provide 'init-org)

;;; init-org.el ends here
