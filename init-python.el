;;; init-python.el --- python

;;; Commentary:
;;

;;; Code:

;; The package is "python" but the mode is "python-mode":
(use-package python
  :mode
  ("\\.py\\'" . python-mode)
  :interpreter
  ("python" . python-mode)
  :hook
  ((python-mode-hook . py-snippets))
  :custom
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "--pylab --pdb --nosep --simple-prompt"))

(use-package yapfify
	:ensure t
  :hook
  ((python-mode-hook . yapf-mode)))

(use-package python-cell
  :after python-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook #'python-cell-mode 1))

(use-package highlight-indentation
	:ensure t
  :config
	(set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

(use-package pyvenv
	:ensure t
  :config
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1))


(use-package cython-mode
	:ensure t
  :hook
  ((cython-mode-hook . flycheck-cython)))

(use-package flycheck-cython
	:ensure t)

(use-package pyenv-mode
	:ensure t
	:config
	(pyenv-mode))

(use-package jupyter
	:ensure t
  )

(use-package elpy
  :ensure t
  ;; :ensure-system-package
  ;; ((jedi     . "pip install jedi")
  ;; (black    . "pip install black")
  ;; (flake8   . "pip install flake8"))
  :config
  (elpy-disable))

(use-package conda
  :ensure t
  :config
  ;; if you want interactive shell support, include:
  (conda-env-initialize-interactive-shells)
  ;; if you want eshell support, include:
  (conda-env-initialize-eshell))

(message "loading init-python done.")

(provide 'init-python)
;;; init-python.el ends here
