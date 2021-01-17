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

(provide 'init-benchmarking)

;;; init-benchmarking.el ends here
