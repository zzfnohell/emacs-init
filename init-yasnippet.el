;;; init-yasnippet.el --- YASnippet

;;; Commentary:
;; YASnippet

;;; Code:


(use-package yasnippet
  :config
  (progn
    ;;; use popup menu for yas-choose-value
    (require 'popup)
    (add-to-list 'yas-snippet-dirs 
                 "~/.emacs.d/snippets"
                 "~/.emacs.d/snippets/yasmate/snippets")

    (define-key yas-minor-mode-map [(tab)] nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)

    (yas-reload-all)
    (yas-global-mode 1)

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
            yas-no-prompt))))

(use-package auto-yasnippet)
(req-package yasnippet-snippets
	:require yasnippet
	:demand )
(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
