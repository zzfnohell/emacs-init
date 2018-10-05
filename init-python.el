;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:


(use-package anaconda-mode
  :ensure t
  
  :config
  (progn
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
    )
  )

(use-package python-mode
  :init
  (progn
    (setq
		 python-shell-interpreter "python"
     python-shell-interpreter-args ""
		 python-shell-interpreter-interactive-arg "-i")
		
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
	:ensure t
  
  :config (setq ein:use-smartrep t))

(use-package jedi
	:ensure t
  
  :config
  (progn
    (setq jedi:complete-on-dot t)
		(when (memq window-system '(mac ns))
			(exec-path-from-shell-initialize))
    (add-hook 'python-mode-hook 'jedi:setup)
    (add-hook 'python-mode-hook 'jedi:ac-setup)))

(use-package highlight-indentation
	:ensure t
  
  :config
	(set-face-background 'highlight-indentation-face "#e3e3d3")
	(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
  )

(use-package elpy
	:ensure t
	
  :config
	(elpy-enable)
	(defalias 'workon 'pyvenv-workon)
	(setq elpy-rpc-backend "jedi"))

(use-package pyvenv
	:ensure t
  
  :config
	(setenv "WORKON_HOME" (expand-file-name "~/anaconda3/envs/"))
	(pyvenv-mode 1)
	(pyvenv-tracking-mode 1))


(use-package yapfify
	:ensure t
  
  :config (add-hook 'python-mode-hook 'yapf-mode)
	)

(use-package cython-mode
  :ensure t
  )

(use-package flycheck-cython
  :ensure t
  )


(provide 'init-python)
;;; init-python.el ends here
