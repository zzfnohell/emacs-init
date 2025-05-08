;;; init-cc-mode.el --- CC mode
;;;; CC-mode  http://cc-mode.sourceforge.net/

;;; Commentary:
;; CC mode

;;; Code:

(defun init-cc-mode/company-c-headers-setup ()
  (setq-local company-backends
              (append '((company-c-headers :with company-yasnippet)
                        (company-dabbrev-code :with company-yasnippet))
                      company-backends)))

(defun init-cc-mode/c-mode-edit-hook()
  (subword-mode t)
  (abbrev-mode t)
  (function-args-mode))

(use-package cc-mode
  :defer t
  :hook (c-mode-common . init-cc-mode/c-mode-edit-hook)
  :config
  (c-set-offset 'inline-open 0)
  (c-set-offset 'friend '-)
  (c-set-offset 'substatement-open 0)
  (setq c-default-style
        '(('c-mode . "bsd")
          ('c++-mode . "bsd")
          ('java-mode . "java")
          ('awk-mode . "awk")
          (other . "linux"))))



(use-package company-c-headers
  :ensure t
  :defer t
  :after company
  :hook
  ((c-mode . init-cc-mode/company-c-headers-setup)
   (c++-mode . init-cc-mode/company-c-headers-setup))
  :config
	(let ((el-file
         (expand-file-name "custom-company-c-headers.el"
                           user-emacs-directory)))
		(when (file-exists-p el-file)
      (load el-file))))

(defun init-cc-mode/cmake-mode-hook-func ()
  (setq-local company-backends
              (append '((company-cmake :with company-yasnippet))
                      company-backends)))

(use-package cmake-mode
  :ensure t
  :defer t
	:mode
  (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode))
  :hook
  (cmake-mode . init-cc-mode/cmake-mode-hook-func))

(use-package meson-mode
  :ensure t
  :defer t
  :mode ("\\.meson\\'" . meson-mode)
  :hook
  (meson-mode . company-mode))

(use-package cuda-mode
  :ensure t
  :defer t
  :mode ("\\.cu\\'" . cuda-mode))

(use-package opencl-c-mode
  :ensure t
  :defer t
  :mode
  (("\\.cl\\'" . opencl-mode)))

(use-package shader-mode
  :ensure t
  :defer t
  :mode ("\\.glsl\\'" . shader-mode))

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
    (setq-local company-backends
                (append '((company-glsl))
                        company-backends))))

(use-package glsl-mode
  :ensure t
  :defer t
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
  :defer t
  :mode
  ("\\.pro\\'" "\\.pri\\'"))

(use-package qml-mode
	:ensure t
  :defer t
	:mode
  (("\\.qml\\'" . qml-mode)))

(use-package function-args
  :ensure t
  :defer t
  :hook
  ((c-mode . function-args-mode)
   (c++-mode . function-args-mode)
   (c-ts-mode . function-args-mode)
   (c++-ts-mode . function-args-mode))
  :config
  (fa-config-default))

(when (featurep 'doxymacs)
  (require 'doxymacs)
  (add-hook 'c-mode-common-hook 'doxymacs-mode))

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
