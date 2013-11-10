;;close buffer when exit gdb,shell.
(defun interactive-mode-exit-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
			#'kill-buffer-on-exit))
(add-hook 'shell-mode-hook 'interactive-mode-exit-hook-func)
(add-hook 'gdb-mode-hook 'interactive-mode-exit-hook-func)



(provide 'init-interactive-mode)
