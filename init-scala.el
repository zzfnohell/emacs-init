;;; init-scala.el --- SCALA

;;; Commentary:
;;


;; (setq exec-path (append exec-path (list "/home/seth/.opt/scala/bin" ))) ;;change to location of scala bin!!! necessary for comint.


(defun scala-run ()
	(interactive)
	(ensime-sbt-action "run")
	(ensime-sbt-action "~compile")
	(let ((c (current-buffer)))
		(switch-to-buffer-other-window
		 (get-buffer-create (ensime-sbt-build-buffer-name)))
		(switch-to-buffer-other-window c)))

(use-package scala-mode-auto
	:defer t
	:ensure t)

(use-package ensime
	:after scala-model-auto
	:defer t
	:ensure t
	:pin melpa-stable
	:config
	(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
	(eval-after-load "scala-mode"
		'(progn
			 (define-key scala-mode-map (kbd "<f9>") 'ensime-builder-build)
			 (define-key scala-mode-map (kbd "<f10>") 'ensime-inf-switch))
		)

	(eval-after-load "scala-mode"
			'(progn
				 (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
				 (define-key scala-mode-map (kbd "<f9>") 'scala-run)
				 (define-key scala-mode-map (kbd "RET") 'newline-and-indent)
				 )
			)
	)

;; (setq exec-path
;;         (append exec-path (list "~/.opt/scala/bin"))) ;;REPLACE THIS with the directory of your scalac executable!

(provide 'init-scala)

;;; init-scala.el ends here
