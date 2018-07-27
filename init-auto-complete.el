;;; init-auto-complete.el --- Auto Complete

;;; Commentary:
;; Auto Complete

;;; Code:
;; (use-package auto-complete
;; 	:demand t
;;   :config
;;   (progn
;;     (require 'auto-complete-config)
;;     (setq ac-auto-start 1)
;;     (setq ac-ignore-case nil)
;;     (add-to-list
;;      'ac-dictionary-directories
;;      "~/.emacs.d/auto-complete/ac-dict")
;;     (ac-config-default)
;;     ))

;; (use-package auto-complete-clang
;; 	:after (:all auto-complete)
;; 	:demand t
;; )

;; (use-package ac-c-headers
;; 	:after (:all auto-complete)
;; 	:demand t
;;   :config
;;   (add-hook 'c-mode-hook
;;           (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-c-headers)
;;             (add-to-list 'ac-sources 'ac-source-c-header-symbols t))))

;; (use-package ac-etags
;; 	:after (:all auto-complete)
;; 	:demand t
;;   :config
;;   (progn
;;     (custom-set-variables '(ac-etags-requires 1))
;;     (eval-after-load "etags" '(progn (ac-etags-setup)))
;;     (defun ac-etags-c-mode-common-hook ()
;;       (add-to-list 'ac-sources 'ac-source-etags))
;;     (add-hook 'c-mode-common-hook 'ac-etags-c-mode-common-hook)))

;; (use-package auto-complete-nxml
;; 	:after (:all auto-complete)
;; 	:demand t
;;   :config
;;   (progn
;;     ;; Keystroke for popup help about something at point.
;;     (setq auto-complete-nxml-popup-help-key "C-:")

;;     ;; Keystroke for toggle on/off automatic completion.
;;     (setq auto-complete-nxml-toggle-automatic-key "C-c C-t")

;;     ;; If you want to start completion manually from the beginning
;;     (setq auto-complete-nxml-automatic-p nil)
;;     )
;;   )

;; (use-package auto-complete-c-headers
;; 	:after (:all auto-complete)
;; 	:demand t
;;   :config (add-to-list 'ac-sources 'ac-source-c-headers))

;; (use-package auto-complete-exuberant-ctags
;; 	:after (:all auto-complete)
;; 	:demand t
;;   :config (ac-exuberant-ctags-setup))

;; Inferior ruby
;; (use-package inf-ruby
;; 	:after (:all auto-complete)
;; 	:demand t
;;   :config
;;   (progn
;;     (after-load 'auto-complete
;;       (add-to-list 'ac-modes 'inf-ruby-mode))))

;; (use-package ac-inf-ruby
;; 	:demand t
;;   :config
;;   (progn
;;     (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
;;     (after-load 'inf-ruby
;;       (define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))
;;     )
;;   )

(provide 'init-auto-complete)

;;; init-auto-complete.el ends here
