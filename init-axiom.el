;;; init-axiom.el --- Axiom

;;; Commentary:
;; Axiom

;;; Code:

(require-package 'axiom-environment)

;; (custom-set-variables
;;  '(axiom-process-program "axiom -noht"))

;; (cond 
;;  ((eq system-type 'gnu/linux)
;;   (server-start)
;;   (setq load-path 
;; 	(cons (quote "/usr/local/lib/fricas/emacs")
;; 	      load-path))
;;   (setq auto-mode-alist
;; 	(cons (quote ("\\.fri$" . fricas-mode))
;; 	      auto-mode-alist))
;;   (require 'fricas))
;;  (t t))


(provide 'init-axiom)
;;; init-axiom.el ends here
