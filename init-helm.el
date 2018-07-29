;;; init-helm.el --- HELM

;;; Commentary:
;; 

;;; Code:

(use-package helm
	:ensure t
	:defer t
  :config
  (require 'helm-config)
  (helm-mode 1)
  :bind
  (("M-x" . undefined)
   ("M-x" . helm-M-x)
   ("C-x r b" . helm-filtered-bookmarks)
   ("C-x C-f" . helm-find-files)))

(use-package helm-css-scss
  :ensure t
  :defer t)

(use-package helm-make
  :ensure t
  :defer t)

(use-package helm-fuzzy-find
  :ensure t
  :defer t)

(use-package restclient-helm
  :ensure t
  :defer t)

(provide 'init-helm)

;;; init-helm.el ends here
