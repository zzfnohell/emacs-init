;;; init-ecb.el --- ecb

;;; Commentary:
;; 

;;; Code:

(use-package ecb
	:ensure t
  :config
  ;;(setq stack-trace-on-error t)
  (ecb-byte-compile)
  (setq ecb-auto-activate nil)
)



(provide 'init-ecb)

;;; init-ecb.el ends here
