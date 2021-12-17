;;; init-session.el --- session -*- lexical-binding: t -*-


;;; Commentary:
;; 

;;; Code:

(use-package session
  :config (add-hook 'after-init-hook 'session-initialize))
  
(message "loading init-session done.")
(provide 'init-session)

;;; init-session.el ends here
