;;; init-yasnippet.el --- YASnippet

;;; Commentary:
;; YASnippet

;;; Code:
(require-package 'yasnippet)

(setq yas-minor-mode-map ;This MUST before (require 'yasnippet)
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-i") 'yas-expand)
        (define-key map "\C-c&\C-s" 'yas-new-snippet)
        map)) 

(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"
                         "~/.emacs.d/snippets/yasmate/snippets"))

;;(add-to-list 'yas/root-directory "~/.emacs.d/snippets/yasnippet-snippets")
;;(yas/initialize)

;;; use popup menu for yas-choose-value
(require 'popup)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

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
      '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))


(require-package 'angular-snippets)
(require 'angular-snippets)
(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
