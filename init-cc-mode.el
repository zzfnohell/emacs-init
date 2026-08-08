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

(defun init-cc-mode/c-mode-edit-hook ()
  (subword-mode 1)
  (abbrev-mode 1))

(use-package cc-mode
  :defer t
  :hook ((c-mode-common . init-cc-mode/c-mode-edit-hook)
         (c-ts-mode . init-cc-mode/c-mode-edit-hook)
         (c++-ts-mode . init-cc-mode/c-mode-edit-hook)
         (c-or-c++-ts-mode . init-cc-mode/c-mode-edit-hook))
  :config
  (c-set-offset 'inline-open 0)
  (c-set-offset 'friend '-)
  (c-set-offset 'substatement-open 0)
  (setq c-default-style
        '((c-mode . "bsd")
          (c++-mode . "bsd")
          (java-mode . "java")
          (awk-mode . "awk")
          (other . "linux"))))

(use-package company-c-headers
  :ensure t
  :defer t
  :after company
  :hook
  ((c-mode . init-cc-mode/company-c-headers-setup)
   (c++-mode . init-cc-mode/company-c-headers-setup)
   (c-ts-mode . init-cc-mode/company-c-headers-setup)
   (c++-ts-mode . init-cc-mode/company-c-headers-setup)
   (c-or-c++-ts-mode . init-cc-mode/company-c-headers-setup))
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
  ((cmake-mode . init-cc-mode/cmake-mode-hook-func)
   (cmake-ts-mode . init-cc-mode/cmake-mode-hook-func)))

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
  :mode ("\\.cl\\'" . opencl-c-mode))

(use-package shader-mode
  :ensure t
  :defer t
  :mode ("\\.shader\\'" . shader-mode))

(use-package rtags
  :ensure t
  :if (and (not (eq system-type 'windows-nt))
           (executable-find "rdm")
           (executable-find "rc"))
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
  (dolist (hook '(c-mode-common-hook
                  c-ts-mode-hook
                  c++-ts-mode-hook
                  c-or-c++-ts-mode-hook))
    (add-hook hook #'rtags-xref-enable)))

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
   ("\\.geom\\'" . glsl-mode)))

(use-package company-glsl
  :ensure t
  :after (glsl-mode company)
  :hook (glsl-mode . init-cc-mode/glsl-mode-hook-func))

;; Package-Requires ivy (ivy-read only). Minibuffer UI stays vertico —
;; do not enable ivy-mode. See note.org "Package conflicts".
(use-package call-graph
  :ensure t
  :defer t
  :commands call-graph)

(use-package qt-pro-mode
  :ensure t
  :defer t
  :mode ("\\.pro\\'" "\\.pri\\'"))

(use-package qml-mode
  :ensure t
  :defer t
  :mode ("\\.qml\\'" . qml-mode))

;; Package-Requires ivy; uses ivy-read / moo-select-method 'ivy.
;; Compatible with vertico as long as ivy-mode stays off.
(use-package function-args
  :ensure t
  :defer t
  :hook
  ((c-mode . function-args-mode)
   (c++-mode . function-args-mode)
   (c-ts-mode . function-args-mode)
   (c++-ts-mode . function-args-mode)
   (c-or-c++-ts-mode . function-args-mode))
  :config
  (fa-config-default)
  (when (bound-and-true-p ivy-mode)
    (ivy-mode -1)))

(use-package disaster
  :ensure t
  :defer t
  :commands disaster
  :config
  ;; Prefer clang when available; fall back to gcc, then cc.
  (setq disaster-compiler
        (cond ((executable-find "clang") "clang")
              ((executable-find "gcc") "gcc")
              ((executable-find "cc") "cc")
              (t disaster-compiler))))

(use-package clang-format
  :ensure t
  :defer t
  :after (cc-mode)
  :bind (:map c-mode-base-map
              ("C-c f" . clang-format-buffer)))

(when (featurep 'doxymacs)
  (require 'doxymacs)
  (dolist (hook '(c-mode-common-hook
                  c-ts-mode-hook
                  c++-ts-mode-hook
                  c-or-c++-ts-mode-hook))
    (add-hook hook #'doxymacs-mode)))

(message "[init] init-cc-mode loaded")

(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
