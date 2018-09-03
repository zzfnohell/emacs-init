(package-initialize)

(load "~/.emacs.d/init/init-main.el")

(byte-recompile-directory (file-name-directory load-file-name) 0 t)