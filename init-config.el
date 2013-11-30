(defun load-config (name)
  (setq config-path "~/.emacs.d/config/")
  (setq file-path (concat config-path name ".el"))
  (load file-path))




(provide 'init-config)
