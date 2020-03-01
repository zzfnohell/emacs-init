;;; init-org.el --- ORG

;;; Commentary:
;; 

;;; Code:
(require 'org-install)

(defvar *org-root-directory* "~/OneDrive/Notes/")
(defvar *org-publish-directory* "~/OneDrive/Note-Publishes/")

(unless (file-directory-p *org-root-directory*)
  (make-directory *org-root-directory* t))

(unless (file-directory-p *org-root-directory*)
  (make-directory *org-publish-directory* t))

(setq org-directory *org-root-directory*)
(setq org-default-notes-file "~/OneDrive/Notes/default.org")

;; capturing
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+headline "inbox.org" "Tasks")
         "* TODO %?\n  %i\n  %u\n  %a")
        ("n" "Note/Data" entry (file+headline "inbox.org" "Notes/Data")
         "* %?   \n  %i\n  %u\n  %a")
        ("j" "Journal" entry (file+datetree "~/OneDrive/Notes/journal.org")
         "* %?\nEntered on %U\n %i\n %a")
        ))
(setq org-irc-link-to-logs t)


;; link uuid
(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive)

;; time
(setq org-log-done 'time)

;; agenda
(setq org-agenda-files (list "~/OneDrive/Notes/agenda.org"))

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
		     :author "zzfnohell@gmail.com" )))

(use-package org-preview-html)


(provide 'init-org)

;;; init-org.el ends here
