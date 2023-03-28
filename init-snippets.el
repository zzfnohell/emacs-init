;;; init-yasnippet.el --- YASnippet

;;; Commentary:
;; YASnippet

;;; Code:

(use-package yasnippet
	:ensure t
  :config
  (let ((dirs (list
               "~/.emacs.d/snippets"
               "~/.emacs.d/snippets/yasmate/snippets")))
	  (dolist (dir dirs)
		  (let ((fullpath (expand-file-name dir)))
			  (if (not (file-directory-p fullpath))
            (make-directory fullpath t))
        (add-to-list 'yas-snippet-dirs fullpath))))
  ;; (yas-reload-all)
  (yas-global-mode 1)

  ;;; use popup menu for yas-choose-value
  (require 'popup)

  (define-key yas-minor-mode-map [(tab)] nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)

  (defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
    (when (featurep 'popup)
      (popup-menu*
       (mapcar (lambda (choice)
                 (popup-make-item
                  (or (and display-fn (funcall display-fn choice)) choice)
                  :value choice))
               choices)
       :prompt prompt
       ;; start isearch mode immediately
       :isearch t)))

  (setq yas-prompt-functions
        '(yas-popup-isearch-prompt
          yas-ido-prompt
          yas-no-prompt)))

(use-package yasnippet-snippets
	:ensure t)

(use-package py-snippets
  :ensure t)

(use-package auto-yasnippet
	:ensure t
	:bind (("C-c w" . aya-create)
				 ("C-c y" . aya-expand)))




(provide 'init-snippets)

;;; init-snippets.el ends here
