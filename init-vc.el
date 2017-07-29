;;; init-vc.el --- Version Control

;;; Commentary:
;; 

;;; Code:

(use-package ahg
  :config
  (progn
    (defvar ahg-version-string "1.0.0")

    (defun ahg-version ()
      "Shows aHg version number."
      (interactive)
      (message "aHg version %s" ahg-version-string))

    (easy-menu-add-item nil '("tools")
                        '("aHg"
                          ["Status" ahg-status t]
                          ["Log Summary" ahg-short-log t]
                          ["Detailed Log" ahg-log t]
                          ["Revision DAG" ahg-glog t]
                          ["Commit Current File" ahg-commit-cur-file t]
                          ["View Changes of Current File" ahg-diff-cur-file t]
                          ["View Change Log of Current File" ahg-log-cur-file t]
                          ["Annotate Current File" ahg-annotate-cur-file t]
                          ["Revert Current File" ahg-revert-cur-file t]
                          ["Remove Current File" ahg-rm-cur-file t]
                          ["Grep the Working Directory" ahg-manifest-grep t]
                          ["--" nil nil]
                          ("Mercurial Queues"
                           ["New Patch..." ahg-qnew t]
                           ["View Qdiff" ahg-qdiff t]
                           ["Refresh Current Patch" ahg-qrefresh t]
                           ["Go to Patch..." ahg-qgoto t]
                           ["Move to Patch..." ahg-qmove t]
                           ["Switch to Patch..." ahg-qswitch t]
                           ["Apply Patch to the Working Copy..." ahg-qapply t]
                           ["Pop All Patches" ahg-qpop-all t]
                           ["Show Name of Current Patch" ahg-qtop t]
                           ["List All Patches" ahg-mq-list-patches t]
                           ["Delete Patch..." ahg-qdelete t]
                           ["Convert Current Patch to Changeset"
                            ahg-mq-convert-patch-to-changeset t]
                           ["Edit series File" ahg-mq-edit-series t])
                          ["--" nil nil]
                          ["Execute Hg Command" ahg-do-command t]
                          ["Help on Hg Command" ahg-command-help t])
                        "PCL-CVS")

    (defvar ahg-global-map
      (let ((map (make-sparse-keymap)))
        (define-key map "s" 'ahg-status)
        (define-key map "l" 'ahg-short-log)
        (define-key map "L" 'ahg-log)
        (define-key map "G" 'ahg-glog)
        (define-key map "g" 'ahg-glog)
        (define-key map "!" 'ahg-do-command)
        (define-key map "h" 'ahg-command-help)
        (define-key map "c" 'ahg-commit-cur-file)
        (define-key map "=" 'ahg-diff-cur-file)
        (define-key map "a" 'ahg-annotate-cur-file)
        (define-key map "r" 'ahg-revert-cur-file)
        (define-key map "R" 'ahg-rm-cur-file)
        (define-key map "f" 'ahg-manifest-grep)
        (define-key map (kbd "C-l") 'ahg-log-cur-file)
        (define-key map "Q"
          (let ((qmap (make-sparse-keymap)))
            (define-key qmap "n" 'ahg-qnew)
            (define-key qmap "=" 'ahg-qdiff)
            (define-key qmap "r" 'ahg-qrefresh)
            (define-key qmap "g" 'ahg-qgoto)
            (define-key qmap "m" 'ahg-qmove)
            (define-key qmap "s" 'ahg-qswitch)
            (define-key qmap "a" 'ahg-qapply)
            (define-key qmap "p" 'ahg-qpop-all)
            (define-key qmap "t" 'ahg-qtop)
            (define-key qmap "d" 'ahg-qdelete)
            (define-key qmap "f" 'ahg-mq-convert-patch-to-changeset)
            (define-key qmap "l" 'ahg-mq-list-patches)
            (define-key qmap "e" 'ahg-mq-edit-series)
            qmap))
        map))

    )
  )

(require 'diff-mode)
(require 'easymenu)
(require 'log-edit)
(require 'ewoc)
(require 'vc-annotate)


(use-package magit
  :config
  (progn
    (setq magit-last-seen-setup-instructions "1.4.0")))


(provide 'init-vc)

;;; init-vc.el ends here
