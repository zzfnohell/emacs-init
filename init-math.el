;;; init-math.el --- Math

;;; Commentary:
;; 

(when (require 'maxima nil 'noerror)
  (setq auto-mode-alist (cons '("\\.mac" . maxima-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.wxm" . maxima-mode) auto-mode-alist)))

(defun init-maxima/load ()
  (interactive)
  (require 'emaxima)
  (require 'imaxima))


(use-package frimacs
  :ensure t
  :defer t)

(use-package ob-fricas
  :ensure t
  :defer t
  :requires org)

(use-package proof-general
	:ensure t
  :defer t)

(provide 'init-math)

;;; init-math.el ends here
