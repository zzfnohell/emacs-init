;;; init-tabbar.el --- Tabbar


;;; Commentary:
;; Tabbar

;;; Code:
(require-package 'tabbar)
(require 'tabbar)
(defun customize-tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
     Return a list of one element based on major mode."
  (list
   (cond
    ((or (get-buffer-process (current-buffer))
         ;; Check if the major mode derives from `comint-mode' or
         ;; `compilation-mode'.
         (tabbar-buffer-mode-derived-p
          major-mode '(comint-mode compilation-mode)))
     "Process")
    ;; ((member (buffer-name)
    ;;          '("*scratch*" "*Messages*" "*Help*"))
    ;;  "Common"
    ;;  )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Common")
    ((member (buffer-name)
             '("xyz" "day" "m3" "abi" "for" "nws" "eng" "f_g" "tim" "tmp"))
     "Main")
    ((eq major-mode 'dired-mode)
     "Dired")
    ((memq major-mode
           '(help-mode apropos-mode Info-mode Man-mode))
     "Common")
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      "Mail")
     (t
      ;; Return `mode-name' if not blank, `major-mode' otherwise.
      (if (and (stringp mode-name)
               ;; Take care of preserving the match-data because this
               ;; function is called when updating the header line.
               (save-match-data (string-match "[^ ]" mode-name)))
          mode-name
        (symbol-name major-mode))))))

(setq tabbar-buffer-groups-function 'customize-tabbar-buffer-groups)
(tabbar-mode t)

(provide 'init-tabbar)

;;; init-tabbar.el ends here
