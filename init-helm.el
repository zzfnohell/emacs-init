;;; init-helm.el --- HELM

;;; Commentary:
;; 

;;; Code:

(req-package helm
  :config
  (require 'helm-config)
  (helm-mode 1)
  :bind
  (("M-x" . undefined)
   ("M-x" . helm-M-x)
   ("C-x r b" . helm-filtered-bookmarks)
   ("C-x C-f" . helm-find-files)))



(req-package helm-c-yasnippet
	:require helm yasnippet)

(req-package helm-css-scss
	:require helm)

(req-package helm-flycheck
	:require dash flycheck helm)
(req-package helm-git-files
	:require helm git)
(req-package helm-git-grep
	:require helm)
(req-package helm-make
	:require helm projectile)

(req-package helm-gtags :require helm)
(req-package helm-fuzzy-find :require helm)


(provide 'init-helm)

;;; init-helm.el ends here
