;;; init-python.el --- python

;;; Commentary:
;; elpy

;;; Code:

(setq python-shell-interpreter "ipython"
		python-shell-interpreter-args "-i")

(require-package 'ac-anaconda)
(require-package 'anaconda-mode)


(require-package 'python-mode)
(require 'python-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)


;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/project")
;; (add-to-list 'python-shell-extra-pythonpaths "/path/to/the/dependency")


(require-package 'ein)
(require 'ein)
(setq ein:use-smartrep t)

(require-package 'jedi)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(require-package 'highlight-indentation)
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

(require-package 'elpy)
(elpy-enable)

(provide 'init-python)
;;; init-python.el ends here
