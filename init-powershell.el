(require-package 'powershell)
(require-package 'powershell-mode)

(require 'powershell) 
(require 'powershell-mode)

(setq auto-mode-alist (cons '("\\.ps1" . powershell-mode) auto-mode-alist))

(provide 'init-powershell)
