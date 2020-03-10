;;; custom-template.el ---

;;; Commentary:
;; 

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(skeletor-user-directory "~/.emacs.d/init/init-skeletor-projects")
 ;; '(custom-enabled-themes (quote (light-blue)))
 '(projectile-enable-caching t)
 '(projectile-completion-system 'ivy)
 '(semantic-idle-scheduler-idle-time 5)
 '(httpd-host "0.0.0.0")
 '(httpd-port 2020)
 '(minimap-window-location (quote right))
 '(session-use-package t nil (session))
 '(speedbar-show-unknown-files t)
 '(size-indication-mode t)
 '(indent-tabs-mode nil)
 '(visual-line-mode nil t)
 '(dart-sdk-path "/Applications/flutter/bin/cache/dart-sdk/")
 '(flutter-sdk-path "/Applications/flutter/")
 '(org-agenda-files (quote ("agenda.org")))
 '(org-directory "E:/OneDrive/org"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'custom-template)

;;; custom-template.el ends here
