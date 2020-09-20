;;; init-docker.el --- Docker



;;; Commentary:
;; 

;;; Code:

(use-package docker-compose-mode
  :ensure t)

(use-package docker
  :ensure t
  :after docker-compose-mode)
(use-package docker-cli)
(use-package dockerfile-mode)
(use-package docker-tramp)

(provide 'init-docker)

;;; init-docker.el ends here
