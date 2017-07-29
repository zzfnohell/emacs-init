;;; init-helm.el --- HELM

;;; Commentary:
;; 

;;; Code:

(use-package helm
  :defer t
  :config
  (progn
    (require 'helm-config)
    (helm-mode 1))
  :bind
  (("M-x" . undefined)
   ("M-x" . helm-M-x)
   ("C-x r b" . helm-filtered-bookmarks)
   ("C-x C-f" . helm-find-files)))



(use-package helm-c-yasnippet :defer t)
(use-package helm-css-scss :defer t)
(use-package helm-flycheck :defer t)
(use-package helm-git-files :defer t)
(use-package helm-git-grep :defer t)
(use-package helm-make :defer t)
(use-package helm-gtags :defer t)
(use-package ac-helm :defer t)
(use-package helm-fuzzy-find :defer t)




(provide 'init-helm)

;;; init-helm.el ends here
