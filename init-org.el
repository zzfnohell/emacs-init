;;; init-org.el --- ORG

;;; Commentary:
;; 

;;; Code:

(use-package org-preview-html
	:ensure t
  :defer t)

;; (use-package ob-axiom
;; 	:ensure t)

(use-package ob-ess-julia
	:ensure t
  :defer t)

(use-package ob-fsharp
	:ensure t
  :defer t)

(use-package ob-graphql
	:ensure t
  :defer t)

(use-package ob-rust
	:ensure t
  :defer t)

(use-package ob-go
	:ensure t
  :defer t)

(use-package ob-restclient
	:ensure t
  :defer t)

(use-package ob-powershell
  :ensure t
  :defer)

(use-package verb
	:ensure t
  :defer)

(use-package ein
  :ensure t
  :defer)

(use-package org
	:ensure t
  :defer t
  :custom
  (org-agenda-files '("agendas.org"))
  (org-default-notes-file "notes.org")
  (org-mobile-directory "/davs://dav.centaurs.bid/")
  (org-mobile-files '(org-agenda-files "mobile/"))
  (org-mobile-inbox-for-pull "from-mobile.org")
  :config
  (require 'org-capture)
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map)
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
   '((C . t)
     (calc . t)
     (css . t)
     (dot . t)
     (ein . t)
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
     (ocaml . t)
     (octave . t)
     (plantuml . t)
     (powershell . t)
     (python . t)
     (R . t)
     (restclient . t)
     (ruby . t)
     (scheme . t)
     (shell . t)
     (sql . t)
     (sqlite . t)
		 (verb . t)))

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

(use-package org-web-tools
  :ensure t
  :defer t)

(use-package org-brain
  :ensure t
  :defer t
  :requires org
  :after org
	:bind (:map org-mode-map
							("C-c b" . org-brain-prefix-map))
  :config
  (setq org-brain-path (concat (file-name-as-directory org-directory) "brain"))
  (require 'org-capture)
  ;; (bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
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
	:ensure t
  :defer t)

(use-package ob-cypher
  :ensure t
  :defer t
  :config
  (add-to-list 'org-babel-load-languages '(cypher . t))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  (add-to-list 'org-babel-tangle-lang-exts '("cypher" . "cypher")))

(use-package org-roam
	:ensure t
  :defer t
;;	:custom
;;	(org-roam-directory (file-truename "~/org/roam/"))
	:bind (("C-c n l" . org-roam-buffer-toggle)
				 ("C-c n f" . org-roam-node-find)
				 ("C-c n g" . org-roam-graph)
				 ("C-c n i" . org-roam-node-insert)
				 ("C-c n c" . org-roam-capture)
				 ;; Dailies
				 ("C-c n j" . org-roam-dailies-capture-today))
	:config
	(org-roam-db-autosync-mode)
	;; If using org-roam-protocol
	(require 'org-roam-protocol))

(use-package websocket
  :after org-roam
  :ensure t
  :defer t)


(use-package org-roam-ui
  :defer t
  :after org-roam
  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package deft
  :ensure t
  :defer t
  :bind ("<f8>" . deft)
	:custom
	(deft-recursive t)
	(deft-use-filename-as-title nil)
  :commands (deft)
  :config
	(setq deft-text-mode 'org-mode)
  (setq deft-extensions '("txt" "tex" "org" "md")))


(message "loading init-org done.")

(provide 'init-org)

;;; init-org.el ends here
