;;; init-ecb.el --- ecb

;;; Commentary:
;; 

;;; Code:

(use-package ecb
	:ensure t
  :defer t
	:custom
	(ecb-windows-width 30)
  (ecb-source-path '(("~"  "home")))
  :config
  ;;(setq stack-trace-on-error t)
  (ecb-byte-compile)
  (setq ecb-auto-activate nil)
)



(provide 'init-ecb)

;;; init-ecb.el ends here
