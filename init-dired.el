;; set dired mode format,put it before the desktop load
(setq dired-listing-switches "-avl --time-style=long-iso")
(require-package 'dired+)
(toggle-diredp-find-file-reuse-dir 1)
(provide 'init-dired)


















