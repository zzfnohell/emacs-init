;;; init-docker.el --- Docker



;;; Commentary:
;; 

;;; Code:


(use-package docker
  :ensure t
  :defer t)

(use-package dockerfile-mode
  :ensure t
  :defer t)

(use-package docker-tramp
  :ensure t
  :defer t)

(provide 'init-docker)

;;; init-docker.el ends here
