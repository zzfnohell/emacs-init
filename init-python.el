;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:


(use-package anaconda-mode
  :config
  (progn
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
    )
  )
(use-package ac-anaconda)
(use-package python-mode
  :config
  (progn
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i")
    ;; use IPython
    (setq-default py-shell-name "ipython")
    (setq-default py-which-bufname "IPython")
    ;; use the wx backend, for both mayavi and matplotlib
    (setq py-python-command-args
          '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
    (setq py-force-py-shell-name-p t)

    ;; switch to the interpreter after executing code
    (setq py-shell-switch-buffers-on-execute-p t)
    (setq py-switch-buffers-on-execute-p t)
    ;; don't split windows
    (setq py-split-windows-on-execute-p nil)
    ;; try to automagically figure out indentation
    (setq py-smart-indentation t)

    ;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/project")
    ;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/dependency")
    )
  )


(use-package ein
  :config (setq ein:use-smartrep t))

(req-package jedi
	:require exec-path-from-shell
	:defer t
  :config
  (progn
    (setq jedi:complete-on-dot t)
		(when (memq window-system '(mac ns))
			(exec-path-from-shell-initialize))
    (add-hook 'python-mode-hook 'jedi:setup)
    (add-hook 'python-mode-hook 'jedi:ac-setup)))

(use-package highlight-indentation
  :config
  (progn
    (set-face-background 'highlight-indentation-face "#e3e3d3")
    (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
    )
  )

(use-package elpy
  :config
  (progn
    (elpy-enable)
    (defalias 'workon 'pyvenv-workon)
    :config
    (setq elpy-rpc-backend "jedi")))

(use-package pyvenv
  :config
  (progn
    (setenv "WORKON_HOME" "/usr/local/Applications/anaconda3/envs/")
    (pyvenv-mode 1)))

(use-package yapfify
  :config (add-hook 'python-mode-hook 'yapf-mode)
  )

(provide 'init-python)
;;; init-python.el ends here
