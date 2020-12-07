;;; init-ivy.el --- Ivy

;;; Commentary:
;;

(use-package  ivy
  :bind (("C-c C-r" . ivy-resume)
         ("<f6>" . ivy-resume))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package counsel
  :after ivy
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-function)
   ("<f1> l" . counsel-find-library)
   ("<f2> i" . counsel-info-lookup-symbol)
   ("<f2> u" . counsel-unicode-char)
   ("C-c g" . counsel-git)
   ("C-c j" . counsel-git-grep)
   ("C-c k" . counsel-ag)
   ("C-x l" . counsel-locate)
   ("C-S-o" . counsel-rhythmbox)
   ("C-r" . counsel-minibuffer-history)))

(use-package swiper
  :after ivy
  :bind
  (("C-s" . swiper)))

(use-package counsel-gtags
	:bind-keymap ("C-c g" . counsel-gtags-command-map)
	:config
	(counsel-gtags-mode 1))

(use-package counsel-etags
  :ensure t
  :bind (("C-]" . counsel-etags-find-tag-at-point))
  :init
  (add-hook 'prog-mode-hook
        (lambda ()
          (add-hook 'after-save-hook
            'counsel-etags-virtual-update-tags 'append 'local)))
  :config
  (setq counsel-etags-update-interval 60)
  (push "build" counsel-etags-ignore-directories)
  ;; counsel-etags-ignore-directories does NOT support wildcast
  (push "build_clang" counsel-etags-ignore-directories)
  (push "build_clang" counsel-etags-ignore-directories)
  ;; counsel-etags-ignore-filenames supports wildcast
  (push "TAGS" counsel-etags-ignore-filenames)
  (push "*.json" counsel-etags-ignore-filenames))

;; (use-package counsel-tramp
;;   :after (:all ivy counsel)
;;   :config
;;   (add-hook 'counsel-tramp-pre-command-hook
;;             '(lambda ()
;;                (global-aggressive-indent-mode 0)
;;                (editorconfig-mode 0)))
;;   (add-hook 'counsel-tramp-quit-hook
;;             '(lambda ()
;;                (global-aggressive-indent-mode 1)
;;                (editorconfig-mode 1))))

(provide 'init-ivy)

;;; init-ivy.el ends here
