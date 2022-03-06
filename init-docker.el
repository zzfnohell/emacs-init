;;; init-docker.el --- Docker



;;; Commentary:
;; 

;;; Code:


(use-package docker
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package docker-tramp
  :ensure t)

(provide 'init-docker)

;;; init-docker.el ends here
