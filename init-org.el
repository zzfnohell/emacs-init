;;; init-org.el --- ORG

;;; Commentary:
;; 

;;; Code:
(require 'org-install)

(defvar *org-root-directory* "~/OneDrive/Notes/")
(defvar *org-publish-directory* "~/OneDrive/Note-Publishes/")

(setq org-agenda-files
      (list "~/OneDrive/Notes/agenda.org"))

(setq org-publish-project-alist
      `(
		("note-org"
		 :base-directory ,*org-root-directory*
		 :publishing-directory ,*org-publish-directory*
		 :base-extension "org"
		 :recursive t
		 :publishing-function org-publish-org-to-html
		 :auto-index t
		 :index-filename "index.org"
		 :index-title "index"
		 :link-home "index.html"
		 :section-numbers nil)
		("note-static"
		 :base-directory ,*org-root-directory*
		 :publishing-directory ,*org-publish-directory*
		 :recursive t
		 :base-extension "css//|js//|png//|jpg//|gif//|pdf//|mp3//|swf//|zip//|gz//|txt//|el"
		 :publishing-function org-publish-attachment)
		("note"
		 :components ("note-org" "note-static")
		 :author "caole82@gmail.com" )))

(provide 'init-org)

;;; init-org.el ends here
