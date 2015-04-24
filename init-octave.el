;;; init-octave-mod.el --- Octave


;;; Code:

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook
 'octave-mode-hook
 (lambda ()
   (abbrev-mode 1)
   (auto-fill-mode 1)
   (if (eq window-system 'x)
       (font-lock-mode 1))))

;;; Commentary:
;; require ac-octave
(require-package 'ac-octave)
(require 'ac-octave) 
(defun ac-octave-mode-setup () 
  (setq ac-sources '(ac-source-octave))) 
(add-hook 'octave-mode-hook 
		  '(lambda () (ac-octave-mode-setup))) 

(provide 'init-octave)

;;; init-octave.el ends here
