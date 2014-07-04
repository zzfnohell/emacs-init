;;; init-system.el --- System
;; environment parameters.
;;; Code:

(defun cygwin-p () (eq 'cygwin system-type))
(defun linux-p () (eq 'gnu/linux system-type))
(defun windows-p () (eq 'windows-nt system-type))

;;; Commentary:
;; 
(require-package 'vkill)
(autoload 'vkill "vkill" nil t)
(autoload 'list-unix-processes "vkill" nil t)

(provide 'init-system)

;;; init-system.el ends here
