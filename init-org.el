;;; init-org.el --- ORG

;;; Commentary:
;; 

;;; Code:


(use-package org-preview-html)
(use-package ob-axiom)

(use-package org
  :after (:all ob-axiom)
  :config
  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((axiom . t)
     (C . t)
     (calc . t)
     (css . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . t)
     (java . t)
     (js . t)
     (latex . t)
     (lisp . t)
     (lua . t)
     (mscgen . t)
     (ocaml . t)
     (octave . t)
     (plantuml . t)
     (python . t)
     (R . t)
     (ruby . t)
     (scheme . t)
     (shell . t)))

  (setq org-publish-project-alist
      `(("private-notes"
         :base-directory ,org-directory
         :recursive t
         :publishing-directory "~/notes-public"
         :publishing-function org-html-publish-to-html)
        ("private-static"
         :base-directory ,org-directory
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/notes-public"
         :recursive t
         :publishing-function org-publish-attachment)
        ("private" :components ("private-notes" "private-static")))))

(provide 'init-org)

;;; init-org.el ends here
