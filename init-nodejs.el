;;; init-nodejs.el --- NODEJS



;;; Commentary:
;; 

;;; Code:

(require-package 'nodejs-repl)
(require 'nodejs-repl)

(require-package 'sws-mode)
(require 'sws-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))

(require-package 'jade-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(provide 'init-nodejs)

;;; init-nodejs.el ends here
