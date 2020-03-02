;;; init-maxima.el --- MAXIMA

;;; Commentary:
;; 

;;; Code:
(use-package auctex)

(when (require 'maxima nil 'noerror)
  (require 'emaxima)
  (require 'imaxima)
  (setq auto-mode-alist (cons '("\\.mac" . maxima-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.wxm" . maxima-mode) auto-mode-alist)))

(provide 'init-maxima)

;;; init-maxima.el ends here
