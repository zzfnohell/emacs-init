;;; init-ivy.el --- Ivy

;;; Commentary:
;;

(use-package  ivy
  :ensure t
  :bind
  (
   ("C-c C-r" . ivy-resume)
   ("<f6>" . ivy-resume)
   )
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  )

(use-package counsel
  :after ivy
  :ensure t
  :bind
  (
   ("M-x" . counsel-M-x)
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
   ("C-r" . counsel-minibuffer-history)
   )
  )

(use-package swiper
  :after ivy
	:ensure t
  :bind
  (("C-s" . swiper))
  )

(provide 'init-ivy)

;;; init-ivy.el ends here
