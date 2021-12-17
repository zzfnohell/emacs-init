;;; init-bookmark.el --- bookmark -*- lexical-binding: t -*-

;;; Commentary:
;; 

;;; Code:
(transient-mark-mode t)

(use-package bm
  :ensure t
	:bind (("M-<f2>" . bm-next)
         ("S-<f2>" . bm-previous)
         ("C-<f2>" . bm-toggle))
  :init
  ;; restore on load (even before you require bm)
  (setq bm-restore-repository-on-load t)
  :config
  ;; Allow cross-buffer 'next'
  (setq bm-cycle-all-buffers t)
	
  ;; where to store persistant files
  (setq bm-repository-file "~/.emacs.d/bm-repository")
	
  ;; save bookmarks
  (setq-default bm-buffer-persistence t)
	
  ;; Loading the repository from file when on start up.
  (add-hook 'after-init-hook 'bm-repository-load)
	
  ;; Saving bookmarks
  (add-hook 'kill-buffer-hook #'bm-buffer-save)
	
  ;; Saving the repository to file when on exit.
  ;; kill-buffer-hook is not called when Emacs is killed, so we
  ;; must save all bookmarks first.
  (add-hook 'kill-emacs-hook #'(lambda nil
                                 (bm-buffer-save-all)
                                 (bm-repository-save)))

  ;; The `after-save-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state.
  (add-hook 'after-save-hook #'bm-buffer-save)
	
  ;; Restoring bookmarks
  (add-hook 'find-file-hooks   #'bm-buffer-restore)
  (add-hook 'after-revert-hook #'bm-buffer-restore)
	
  ;; The `after-revert-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state. This hook might cause trouble when using packages
  ;; that automatically reverts the buffer (like vc after a check-in).
  ;; This can easily be avoided if the package provides a hook that is
  ;; called before the buffer is reverted (like `vc-before-checkin-hook').
  ;; Then new bookmarks can be saved before the buffer is reverted.
  ;; Make sure bookmarks is saved before check-in (and revert-buffer)
  (add-hook 'vc-before-checkin-hook #'bm-buffer-save))

(use-package visible-mark
  :ensure t
  :config
  (setq visible-mark-max 2)

  (defface init-ui/visible-mark-face-2
    `((t (:background "orange" :foreground "black")))
    "Face for the mark."
    :group 'visible-mark)
  
  (setq visible-mark-faces `(visible-mark-face init-ui/visible-mark-face-2))
  (global-visible-mark-mode +1))


(message "loading init-bookmark done.")
(provide 'init-bookmark)

;;; init-bookmark.el ends here
