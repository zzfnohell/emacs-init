;;display line numbers
(require 'linum)

;;; linum-mode
(defun turn-linum-on ()
  (unless
      (or (minibufferp)
	  ;;linum should turn off in non-editor buffer
	  (equal (string-match "\\*.*\\*"
			       (buffer-name (current-buffer))) 0)
	  ;;linum should turn off in non-editor buffer
	  (equal (string-match "\\#.*"
			       (buffer-name (current-buffer))) 0)
	  ;; linum should turn off in *.pdf buffer.
	  (equal (string-match ".*\\.pdf$"
			       (buffer-name (current-buffer))) 0))
    (linum-mode 1)))
(setq linum-format
      (lambda (line)
	(propertize
	 (format
	  (let ((w (length (number-to-string
			    (count-lines (point-min) (point-max))))))
	    (concat "%" (number-to-string w) "d "))
	  line) 'face 'linum)))

(define-globalized-minor-mode global-linum-mode linum-mode turn-linum-on)

(global-linum-mode 1)
