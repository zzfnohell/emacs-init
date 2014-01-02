;;; init-prolog.el --- Prolog


;;; Commentary:
;; Prolog

;;; Code:
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)  ; optional, the system you are using;
                           ; see `prolog-system' below for possible values
(setq auto-mode-alist
      (append '(("\\.pl$" . prolog-mode)
                ("\\.m$" . mercury-mode))
              auto-mode-alist))

(provide 'init-prolog)

;;; init-prolog.el ends here
