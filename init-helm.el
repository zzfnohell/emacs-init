;;; init-helm.el --- HELM

;;; Commentary:
;; 

;;; Code:

(require-package 'helm)

(require 'helm)
(require 'helm-config)

(require-package 'helm-c-yasnippet)
(require 'helm-c-yasnippet)

(require-package 'helm-css-scss)
(require 'helm-css-scss)

(require-package 'helm-R)
(require 'helm-R)

(require-package 'helm-flycheck)
(require 'helm-flycheck)

(require-package 'helm-git-files)
(require 'helm-git-files)

(require-package 'helm-git-grep)
(require 'helm-git-grep)

(require-package 'helm-make)
(require 'helm-make)

(require-package 'helm-gtags)
(require 'helm-gtags)

(helm-mode 1)

(provide 'init-helm)

;;; init-helm.el ends here
