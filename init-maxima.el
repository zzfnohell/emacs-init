;;; init-maxima.el --- MAXIMA

;;; Commentary:
;; 

;;; Code:
(use-package tex
  :ensure auctex
  :defer t)

(when (require 'maxima nil 'noerror)
  (setq auto-mode-alist (cons '("\\.mac" . maxima-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.wxm" . maxima-mode) auto-mode-alist)))

(defun init-maxima/load ()
  (interactive)
  (require 'emaxima)
  (require 'imaxima))

(provide 'init-maxima)

;;; init-maxima.el ends here
