;;; init-kill-ring.el --- Kill Ring


;;; Commentary:
;; 

;;; Code:

(require-package 'anyins)
(require 'anyins)

(require-pacakge 'browse-kill-ring+)
(require 'browse-kill-ring+)
(require-package 'popup-kill-ring)
(require-package 'kill-ring-search)

(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))

(provide 'init-kill-ring)

;;; init-kill-ring.el ends here
