;;; init-maxima.el --- MAXIMA

;;; Commentary:
;; 

;;; Code:
(use-package auctex
  :ensure t)

(if (require 'maxima nil 'noerror)
    (progn
     (require 'emaxima)
     (require 'imaxima)
     (setq auto-mode-alist (cons '("\\.mac" . maxima-mode) auto-mode-alist))
     (setq auto-mode-alist (cons '("\\.wxm" . maxima-mode) auto-mode-alist))))

(provide 'init-maxima)

;;; init-maxima.el ends here
