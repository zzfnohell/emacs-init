;;; init-auto-complete.el --- Auto Complete

;;; Commentary:
;; Auto Complete

;;; Code:
(require-package 'auto-complete)
(require 'auto-complete-config)

(add-to-list
 'ac-dictionary-directories
 "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

(require-package 'ac-c-headers)
(add-hook 'c-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

(require-package 'ac-etags)
(custom-set-variables
 '(ac-etags-requires 1))
(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))

;;(require-package 'auto-complete-nxml)
;;(require 'auto-complete-nxml)
;; Keystroke for popup help about something at point.
;;(setq auto-complete-nxml-popup-help-key "C-:")
;; Keystroke for toggle on/off automatic completion.
;;(setq auto-complete-nxml-toggle-automatic-key "C-c C-t")
;; If you want to start completion manually from the beginning

(defun ac-etags-c-mode-common-hook ()
  (add-to-list 'ac-sources 'ac-source-etags))
(add-hook 'c-mode-common-hook 'ac-etags-c-mode-common-hook)

(provide 'init-auto-complete)

;;; init-auto-complete.el ends here
