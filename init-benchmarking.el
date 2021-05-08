;;; init-benchmarking.el --- BENCHMARKING

;;; Commentary:
;; 

;;; Code:

(use-package benchmark-init
  :ensure t
  :init
  (benchmark-init/activate)
  :hook
  (after-init . benchmark-init/deactivate))
  
(message "loading init-benchmarking done.")

(provide 'init-benchmarking)

;;; init-benchmarking.el ends here
