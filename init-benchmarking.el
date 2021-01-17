;;; init-benchmarking.el --- BENCHMARKING

;;; Commentary:
;; 

;;; Code:

(use-package esup
	:ensure t)

(use-package benchmark-init
	:ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(provide 'init-benchmarking)

;;; init-benchmarking.el ends here
