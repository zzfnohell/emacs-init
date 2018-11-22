;;; init-proof.el --- Proof

;;; Commentary:
;; 

;;; Code:

(use-package proof-general
  :if (not (eq system-type 'windows-nt))
  :ensure t
)

(provide 'init-proof)

;;; init-proof.el ends here
