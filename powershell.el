(cond 
 ((windows-p) 
  (require 'powershell) 
  (require 'powershell-mode)))

(setq auto-mode-alist (cons '("\\.ps1" . powershell-mode) auto-mode-alist))
