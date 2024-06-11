;;; init-benchmarking.el --- Measure startup and require times -*- lexical-binding: t -*-
;;; Commentary:
;; 

;;; Code:

(use-package esup
  :ensure t
  ;; To use MELPA Stable use ":pin melpa-stable",
  :pin melpa)

(use-package benchmark-init
  :ensure t
  :config
  (benchmark-init/activate)

  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))


(message "loading init-benchmarking done.")

(provide 'init-benchmarking)

;;; init-benchmarking.el ends here
