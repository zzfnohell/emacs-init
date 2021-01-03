;;; init-global-set-key.el --- Global Key Map

;;; Commentary:
;; 

;;; Code:
;; scroll other window
(global-set-key (kbd "C-c C-v") 'scroll-other-window)
(global-set-key (kbd "C-c C-b") 'scroll-other-window-down)

;;; https://superuser.com/questions/132225/how-to-get-back-to-an-active-minibuffer-prompt-in-emacs-without-the-mouse
(defun switch-to-minibuffer-window ()
  "Switch to minibuffer window (if active)."
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))

(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)


(provide 'init-global-set-key)

;;; init-global-set-key.el ends here
