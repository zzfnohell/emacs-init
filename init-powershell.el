;;; init-powershell.el --- Powershell


;;; Commentary:
;;

;;; Code:
(use-package powershell
  :ensure t
  :defer t
  :commands powershell
  :config
  (setq explicit-shell-file-name "C:/Program Files/PowerShell/7/pwsh.exe")
  (setq shell-file-name "C:/Program Files/PowerShell/7/pwsh.exe"))

(provide 'init-powershell)

;;; init-powershell.el ends here
