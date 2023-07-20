;;; init-cc-mode.el --- CC mode
;;;; CC-mode  http://cc-mode.sourceforge.net/

;;; Commentary:
;; CC mode

;;; Code:
(defun init-cc-mode/company-c-headers-setup ()
  (let ((mode-backends (make-local-variable 'company-backends)))
    (add-to-list mode-backends 'company-c-headers)
    (add-to-list mode-backends '(company-dabbrev-code company-yasnippet))))

(defun init-cc-mode/company-semantic-setup ()
	(delete 'company-irony company-backends)
	(push '(company-semantic :with company-yasnippet) company-backends))

(defun init-cc-mode/company-rtags-setup ()
		 (delete 'compnay-semantic company-backends)
		 (setq rtags-completions-enabled t)
		 (push '(company-tags :with company-yasnippet) company-backends))

(defun init-cc-mode/cedet-enable ()
	(remove-hook 'c++-mode-hook 'init-cc-mode/company-rtags-setup)
	(remove-hook 'c-mode-hook 'init-cc-mode/company-rtags-setup)

 	(add-hook 'c++-mode-hook 'init-cc-mode/company-c-headers-setup)
	(add-hook 'c++-mode-hook 'init-cc-mode/company-semantic-setup)

	(add-hook 'c-mode-hook 'init-cc-mode/company-c-headers-setup)
	(add-hook 'c-mode-hook 'init-cc-mode/company-semantic-setup))


(defun init-cc-mode/irony-enable ()
	"Start irony mode"
	(interactive)
	(remove-hook 'c++-mode-hook 'init-cc-mode/company-c-headers-setup)
	(remove-hook 'c++-mode-hook 'init-cc-mode/company-semantic-setup)

	(remove-hook 'c-mode-hook 'init-cc-mode/company-c-headers-setup)
	(remove-hook 'c-mode-hook 'init-cc-mode/company-semantic-setup)

	(rtags-start-process-unless-running)
	(add-hook 'c-mode-hook 'init-cc-mode/company-rtags-setup)
	(add-hook 'c++-mode-hook #'init-cc-mode/company-rtags-setup))


(use-package cc-mode
  :hook ((c-mode-common-hook . init-cc-mode/c-mode-edit-hook))
  :config
  (c-set-offset 'inline-open 0)
  (c-set-offset 'friend '-)
  (c-set-offset 'substatement-open 0)
  (init-cc-mode/cedet-enable)
  (setq c-default-style
      '(('c-mode . "bsd")
        ('c++-mode . "bsd")
        ('java-mode . "java")
        ('awk-mode . "awk")
        (other . "linux"))))

;;indent strategy
(defun init-cc-mode/cpp-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command)))

(defun init-cc-mode/c-mode-edit-hook()
  (doxygen-mode t)
  (subword-mode t)
  ;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(tab)] 'init-cc-mode/cpp-indent-or-complete)
  ;;preprocessors
  (setq abbrev-mode t))

(use-package company-c-headers
  :after company
  :config
	(let ((el-file
         (expand-file-name "custom-company-c-headers.el"
                           user-emacs-directory)))
		(when (file-exists-p el-file)
      (load el-file))))


(defun init-cc-mode/company-cmake-setup ()
	(add-to-list 'company-backends 'company-cmake))

(use-package cmake-mode
  :ensure t
	:mode
  (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode))
  :hook
  ((cmake-mode-hook . init-cc-mode/company-cmake-setup)))

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
    (add-to-list 'company-backends 'company-glsl)))

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
