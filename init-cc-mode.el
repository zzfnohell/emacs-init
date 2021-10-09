;;; init-cc-mode.el --- CC mode
;;;; CC-mode  http://cc-mode.sourceforge.net/

;;; Commentary:
;; CC mode

;;; Code:

(require 'cc-mode)

(rtags-enable-standard-keybindings)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)


(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

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
	"Start cedet"
	(interactive)
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

(init-cc-mode/cedet-enable)

;;indent strategy
(defun init-cc-mode/cpp-indent-or-complete ()
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
  (define-key c-mode-base-map [(tab)] 'init-cc-mode/cpp-indent-or-complete)
  ;;preprocessors
  (setq abbrev-mode t))

(add-hook 'c-mode-common-hook 'init-cc-mode/c-mode-edit-hook)



(defun init-cc-mode/ede-object-system-include-path ()
	(when 'ede-project
		(ede-system-include-path ede-object)))

(use-package company-c-headers
  :after company
  :config
	(setq company-c-headers-path-system 'init-cc-mode/ede-object-system-include-path)

	(let ((header-custom-file (expand-file-name "cc-mode-header-custom.el" user-emacs-directory)))
		(when (file-exists-p header-custom-file)
			(load header-custom-file))))


;;opencl source file.
(add-to-list 'auto-mode-alist '("\\.h$" . c-mode))


(defun init-cc-mode/company-cmake-setup ()
	(add-to-list 'company-backends 'company-cmake))

(use-package cmake-mode
	:mode (("CMakeLists\\.txt\\'" . cmake-mode)
				 ("\\.cmake\\'" . cmake-mode))
	:config
	(add-hook 'cmake-mode-hook 'init-cc-mode/company-cmake-setup))

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

(use-package call-graph
	:after (:all anaconda-mode ivy)
	:ensure t)

(use-package qt-pro-mode
  :ensure t
  :mode ("\\.pro\\'" "\\.pri\\'"))

(use-package qml-mode
	:ensure t
	:mode (("\\.qml\\'" . qml-mode)))

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
