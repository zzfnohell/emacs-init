;;add session function
(require-package 'session)
(require 'session)

(add-hook 'after-init-hook 'session-initialize)
(provide 'init-session)
