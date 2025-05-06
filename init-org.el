;;; init-org.el --- ORG

;;; Commentary:
;;

;;; Code:

(use-package org-preview-html
  :ensure t
  :defer t)

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
  :defer t
  :config
  (setq org-babel-powerhsell-command "C:/Program Files/PowerShell/7/pwsh.exe"))

(use-package ob-fricas
  :ensure t
  :defer t)

(use-package verb
  :ensure t
  :defer t)

(use-package ein
  :ensure t
  :defer t)

(use-package poly-org
  :ensure t
  :defer t)

(use-package org
  :ensure t
  :mode
  ("\\.org$" . org-mode)
  :bind
  (:map org-mode-map ("C-c C-r" . verb-command-map))
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
        (t (setq org-mobile-directory "/ssh:zzfnohell@pluto.centaurs.bid:/var/local/dav/")))

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
     (fsharp . t)
     (gnuplot . t)
     (haskell . t)
     (go . t)
     (java . t)
     (js . t)
     (latex . t)
     (lisp . t)
     (lua . t)
     (maxima . t)
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
  :requires org
  :defer t)

(use-package org-brain
  :ensure t
  :requires org
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
  :requires org
  :defer t)

(use-package ob-cypher
  :ensure t
  :defer t
  :requires org
  :config
  (add-to-list 'org-babel-load-languages '(cypher . t))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  (add-to-list 'org-babel-tangle-lang-exts '("cypher" . "cypher")))


(use-package deft
  :ensure t
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
