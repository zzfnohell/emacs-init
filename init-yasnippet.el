;;; init-yasnippet.el --- YASnippet

;;; Commentary:
;; YASnippet

;;; Code:

(setq yas-minor-mode-map ;This MUST before (require 'yasnippet)
	  (let ((map (make-sparse-keymap)))
		map)) 

(require-package 'yasnippet)
(require 'yasnippet)

(add-to-list 'yas-snippet-dirs 
			 "~/.emacs.d/snippets"
			 "~/.emacs.d/snippets/yasmate/snippets")

(yas-reload-all)
(yas-global-mode 1)

;;; use popup menu for yas-choose-value
(require 'popup)

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
		yas-no-prompt))

(require-package 'angular-snippets)
(require 'angular-snippets)

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
