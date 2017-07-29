;;; init-sl.el --- SHADER LANGUAGE

;;; Commentary:
;; 

;;; Code:

(use-package glsl-mode
  :config
  (progn
	(autoload 'glsl-mode "glsl-mode" nil t)
	(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
	(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
	(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
	(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
	)
  )

;; (autoload 'hlsl-mode "hlsl-mode" nil t)
(if (require 'hlsl-mode nil 'noerror)
	(progn
	  (add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
	  (add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))))

(provide 'init-sl)

;;; init-sl.el ends here
