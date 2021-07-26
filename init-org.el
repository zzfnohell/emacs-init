;;; init-org.el --- ORG

;;; Commentary:
;; 

;;; Code:

(use-package org-preview-html
	:ensure t)

(use-package ob-axiom
	:ensure t)

(use-package ob-ess-julia
	:ensure t)

(use-package ob-fsharp
	:ensure t)

(use-package ob-graphql
	:ensure t)

(use-package ob-rust
	:ensure t)

(use-package ob-go
	:ensure t)

(use-package ob-restclient
	:ensure t)

(use-package org
  :after (:all ob-axiom)
  :custom
;;  (org-directory "~/org")
  (org-agenda-files '("agendas.org"))
  (org-default-notes-file "notes.org")
  (org-mobile-directory "/davs://dav.centaurs.bid/")
  (org-mobile-files '(org-agenda-files "mobile/"))
  (org-mobile-inbox-for-pull "from-mobile.org")
  :config
  (require 'org-capture)
  (let ((gtd-file-path (expand-file-name "gtd.org" org-directory))
        (journal-file-path (expand-file-name "journal.org" org-directory)))
    (setq org-capture-templates
          (list
           `("t" "Todo" entry (file+headline ,gtd-file-path "Tasks")
             "* TODO %?\n  %i\n  %a")
           `("j" "Journal" entry (file+datetree ,journal-file-path)
             "* %?\nEntered on %U\n  %i\n  %a"))))
    
  (cond ((equal system-type 'windows-nt)
         (setq org-mobile-directory "/plink:zzfnohell@pluto.centaurs.bid:/var/local/dav/"))
        (t
         (setq org-mobile-directory "/ssh:zzfnohell@pluto.centaurs.bid:/var/local/dav/")))
	
  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((axiom . t)
     (C . t)
     (calc . t)
     (css . t)
     (dot . t)
     (emacs-lisp . t)
		 (eshell . t)
     (gnuplot . t)
     (haskell . t)
     (go . t)
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
     (restclient . t)
     (ruby . t)
     (scheme . t)
     (shell . t)
     (sql . t)
     (sqlite . t)))

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

(use-package org-web-tools :ensure t)

(use-package org-brain
  :ensure t
  :init
  (setq org-brain-path (concat (file-name-as-directory org-directory) "brain"))
  :config
  (require 'org-capture)
  (bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
  (setq org-brain-include-file-entries nil
        org-brain-file-entries-use-title nil))

(use-package org-onenote
	:ensure t)

(use-package ob-cypher
  :ensure t
  :config
  (add-to-list 'org-babel-load-languages '(cypher . t))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  (add-to-list 'org-babel-tangle-lang-exts '("cypher" . "cypher")))

(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory (concat (file-name-as-directory org-directory) "roam"))
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

;; (use-package org-roam-server
;;   :ensure t
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 9090
;;         org-roam-server-authenticate nil
;;         org-roam-server-export-inline-images t
;;         org-roam-server-serve-files nil
;;         org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
;;         org-roam-server-network-poll t
;;         org-roam-server-network-arrows nil
;;         org-roam-server-network-label-truncate t
;;         org-roam-server-network-label-truncate-length 60
;;         org-roam-server-network-label-wrap-length 20))

(use-package deft
  :after org
  :ensure t
  :demand t
  :bind ("<f8>" . deft)
  :commands (deft)
  :config
  (setq deft-recursive t)
	(setq deft-directory (file-name-as-directory org-directory))
	(setq deft-text-mode 'org-mode)
	(setq deft-use-filename-as-title t)
  (setq deft-extensions '("txt" "tex" "org" "md")))


(message "loading init-org done.")

(provide 'init-org)

;;; init-org.el ends here
