;;; init-cc-mode.el --- CC mode
;;;; CC-mode  http://cc-mode.sourceforge.net/

;;; Commentary:
;; CC mode

;;; Code:

(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)


;;indent strategy
(defun cpp-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command)))

(setq c-default-style 
      '(('c-mode . "bsd")
        ('c++-mode . "bsd")
        ('java-mode . "java")
        ('awk-mode . "awk")
        (other . "linux")))

(setq-default c-basic-offset 2
              tab-width 2
              indent-tabs-mode t)

(defun init-cc-mode/c-mode-edit-hook()
  ;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(tab)] 'cpp-indent-or-complete)
  ;;preprocessors
  (setq hs-minor-mode t)
  (setq abbrev-mode t))

(add-hook 'c-mode-common-hook 'init-cc-mode/c-mode-edit-hook)

(defun init-cc-mode/append-company-backends ()
  "Append custom company backends."
  (let ((mode-backends (make-local-variable 'company-backends)))
    (add-to-list mode-backends 'company-c-headers)
    (add-to-list mode-backends '(company-dabbrev-code company-yasnippet))))

(use-package company-c-headers
  :after company
  :config
  (add-hook 'c-mode-hook #'init-cc-mode/append-company-backends)
  (add-hook 'c++-mode-hook #'init-cc-mode/append-company-backends))

;;opencl source file.
(add-to-list 'auto-mode-alist '("\\.h$" . c-mode))

(use-package cmake-mode)

(use-package opencl-mode
  :mode (("\\.cl\\'" . opencl-mode)))

(use-package shader-mode)

(use-package rtags
	:if (and (executable-find "rdm") (executable-find "rc")))

(use-package cmake-ide
	:if (featurep 'rtags)
  :config
	(require 'rtags)
  (cmake-ide-setup))

(use-package company-glsl
 :after (:all company))

(defun init-cc-mode/glsl-mode-hook-func ()
  "Hook glsl mode."
  (when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl)))

(use-package glsl-mode
  :after company
  :mode (("\\.glsl\\'" . glsl-mode)
         ("\\.vert\\'" . glsl-mode)
         ("\\.frag\\'" . glsl-mode)
         ("\\.geom\\'" . glsl-mode)
         ("\\.fx\\'" . hlsl-mode)
         ("\\.hlsl\\'" . hlsl-mode))
  :config
  (add-hook 'glsl-mode-hook #'init-cc-mode/glsl-mode-hook-func))

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
