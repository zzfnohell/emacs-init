;;; init-org.el --- ORG

;;; Commentary:
;; 

;;; Code:


(use-package org-preview-html)
(use-package ob-axiom)

(defvar *org-root-directory* "~/notes/")
(defvar *org-publish-directory* "~/notes-public/")

(unless (file-directory-p *org-root-directory*)
  (make-directory *org-root-directory* t))

(unless (file-directory-p *org-root-directory*)
  (make-directory *org-publish-directory* t))

(setq org-directory *org-root-directory*)

(use-package org
  :after (:all ob-axiom)
  :config
  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((axiom . t)
     (C . t)
     (dot .t )
     (emacs-lisp . t)
     (haskell . t)
     (java . t)
     (latex . t)
     (lisp . t)
     (lua . t)
     (ocaml . t)
     (octave . t)
     (python . t)
     (R . t)
     (ruby . t)
     (scheme . t)))
  
  (setq org-agenda-files (list "~/notes/agenda.org"))
  (setq org-default-notes-file "~/notes/default.org")

  (setq org-publish-project-alist
      `(("blog-notes"
         :base-directory ,*org-root-directory*
         :recursive t
         :publishing-directory ,*org-publish-directory*
         :publishing-function org-html-publish-to-html)
        ("blog-static"
         :base-directory ,*org-root-directory*
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory ,*org-publish-directory*
         :recursive 
         :publishing-function org-publish-attachment)
        ("blog" :components ("blog-notes" "blog-static")))))

(provide 'init-org)

;;; init-org.el ends here
