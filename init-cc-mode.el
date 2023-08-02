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
  (doxygen-mode t)
  (subword-mode t)
  ;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(tab)] 'init-cc-mode/cpp-indent-or-complete)
  ;;preprocessors
  (setq abbrev-mode t))

(use-package cc-mode
  :hook
  (c-mode-common . init-cc-mode/c-mode-edit-hook)
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
  :after company
  :hook
  (c-mode . #'init-cc-mode/company-c-headers-setup)
  (c++mode . #'init-cc-mode/company-c-headers-setup)
  :config
	(let ((el-file
         (expand-file-name "custom-company-c-headers.el"
                           user-emacs-directory)))
		(when (file-exists-p el-file)
      (load el-file))))

(use-package cmake-mode
  :ensure t
	:mode
  (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode))
  :hook
  (cmake-mode-hook . (lambda ()
                        (let ((backends (make-local-variable 'company-backends)))
                          (add-to-list backends '(company-cmake :with company-yasnippet))))))

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
  :init
  (add-hook 'c-mode-common-hook #'rtags-xref-enable))

(use-package cmake-ide
  :ensure t
  :if (featurep 'rtags)
  :after rtags
  :config
	(require 'rtags)
  (cmake-ide-setup))

(use-package company-glsl
  :ensure t
  :requires company)

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
   ("\\.hlsl\\'" . hlsl-mode))
  :hook
  ((glsl-mode-hook . init-cc-mode/glsl-mode-hook-func)
   (glsl-mode-hook . company-glsl)))

(use-package call-graph
	:ensure t)

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
  :config
  (fa-config-default))

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
