;;; init-docker.el --- Docker



;;; Commentary:
;; 

;;; Code:


(use-package docker
  :ensure t
  :commands docker
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
  :ensure t
  :commands dockerfile-mode)

(provide 'init-docker)

;;; init-docker.el ends here
