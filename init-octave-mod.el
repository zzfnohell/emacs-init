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

(provide 'init-octave-mod)

;;; init-octave-mod.el ends here
