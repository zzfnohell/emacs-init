;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

;; Intentionally not setting buffer-read-only: a repo-wide read-only flag
;; blocks normal editing (and agent workflows). Prefer VCS for safety.

((emacs-lisp-mode . ((indent-tabs-mode . nil)
                     (fill-column . 79)))
 (org-mode . ((indent-tabs-mode . nil)
              (fill-column . 80))))
