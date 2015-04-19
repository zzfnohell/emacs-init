;;; init-msvc.el --- MSVC

;;; Commentary:
;; 

;;; Code:
(require-package 'msvc)
(require 'msvc)
(if (windows-p) (setq w32-pipe-read-delay 0))

(when (msvc-initialize)
  (msvc-flags-load-db :parsing-buffer-delete-p t)
  (add-hook 'c-mode-common-hook 'msvc-mode-on t))

(provide 'init-msvc)

;;; init-msvc.el ends here
