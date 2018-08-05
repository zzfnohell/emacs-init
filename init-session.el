;;; init-session.el --- Session
;;add session function

;;; Commentary:
;; 

;;; Code:

(use-package session
  
  :config (add-hook 'after-init-hook 'session-initialize))

(provide 'init-session)

;;; init-session.el ends here
