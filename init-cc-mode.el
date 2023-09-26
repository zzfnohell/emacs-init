;;; init-cc-mode.el --- CC mode
;;;; CC-mode  http://cc-mode.sourceforge.net/

;;; Commentary:
;; CC mode

;;; Code:
(defun init-cc-mode/company-c-headers-setup ()
  (let ((mode-backends (make-local-variable 'company-backends)))
    (add-to-list mode-backends '(company-c-headers :with company-yasnippet))
    (add-to-list mode-backends '(company-dabbrev-code :with company-yasnippet))))

(defun init-cc-mode/c-mode-edit-hook()
  (subword-mode t)
  (abbrev-mode t)
  (function-args-mode))

(require 'cc-mode)
(add-hook 'c-mode-common-hook #'init-cc-mode/c-mode-edit-hook)

(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)
(setq c-default-style
      '(('c-mode . "bsd")
        ('c++-mode . "bsd")
        ('java-mode . "java")
        ('awk-mode . "awk")
        (other . "linux")))

(use-package company-c-headers
  :after company
  :config
  (add-hook 'c-mode-hook #'init-cc-mode/company-c-headers-setup)
  (add-hook 'c++mode-hook #'init-cc-mode/company-c-headers-setup)

	(let ((el-file
         (expand-file-name "custom-company-c-headers.el"
                           user-emacs-directory)))
		(when (file-exists-p el-file)
      (load el-file))))


(defun init-cc-mode/cmake-mode-hook-func ()
  (let ((backends (make-local-variable 'company-backends)))
    (add-to-list backends '(company-cmake :with company-yasnippet))))

(use-package cmake-mode
  :ensure t
	:mode
  (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode))
  :hook
  (cmake-mode . init-cc-mode/cmake-mode-hook-func))

(use-package opencl-mode
  :ensure t
  :mode
  (("\\.cl\\'" . opencl-mode)))

(use-package shader-mode
  :ensure t)

(use-package rtags
  :ensure t
	:if (and (not (eq system-type 'windows-nt)) (executable-find "rdm") (executable-find "rc"))
  :config
  (rtags-enable-standard-keybindings)
  ;; (setq rtags-autostart-diagnostics t)
  ;; (rtags-diagnostics)
  )

(use-package rtags-xref
  :ensure t
  :if (featurep 'rtags)
  :after rtags
  :config
  (add-hook 'c-mode-common-hook #'rtags-xref-enable))

(use-package cmake-ide
  :ensure t
  :if (featurep 'rtags)
  :after rtags
  :config
	(require 'rtags)
  (cmake-ide-setup))


(defun init-cc-mode/glsl-mode-hook-func ()
  "Hook glsl mode."
  (when (executable-find "glslangValidator")
    (add-to-list (make-local-variable 'company-backends) 'company-glsl)))

(use-package glsl-mode
  :ensure t
  :mode
  (("\\.glsl\\'" . glsl-mode)
   ("\\.vert\\'" . glsl-mode)
   ("\\.frag\\'" . glsl-mode)
   ("\\.geom\\'" . glsl-mode)
   ("\\.fx\\'" . hlsl-mode)
   ("\\.hlsl\\'" . hlsl-mode)))

(use-package company-glsl
  :ensure t
  :requires (glsl-mode company)
  :config
  (add-hook 'glsl-mode-hook #'init-cc-mode/glsl-mode-hook-func))

(use-package call-graph
	:ensure t
  :defer t
  :commands call-graph)

(use-package qt-pro-mode
  :ensure t
  :mode
  ("\\.pro\\'" "\\.pri\\'"))

(use-package qml-mode
	:ensure t
	:mode
  (("\\.qml\\'" . qml-mode)))

(use-package function-args
  :ensure t
  :defer t
  :config
  (fa-config-default))

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
