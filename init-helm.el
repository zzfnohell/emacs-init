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

(require-package 'ac-helm)
(require 'ac-helm)

(require-package 'helm-fuzzy-find)
(require 'helm-fuzzy-find)

(global-set-key (kbd "M-x") 'undefined)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(helm-mode 1)

(provide 'init-helm)

;;; init-helm.el ends here
