;; environment parameters.
(defun cygwin-p () (eq 'cygwin system-type))
(defun linux-p () (eq 'gnu/linux system-type))
(defun windows-p () (eq 'windows-nt system-type))\n(provide \'init-system.el)
