;;; init-git.el --- GIT

;;; Commentary:
;; 

;;; Code:
(require-package 'magit)
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(require-package 'git-blame)
(require 'git-blame)
(autoload 'git-blame-mode "git-blame"
             "Minor mode for incremental blame for Git." t)

(require-package 'git-gutter)
(require 'git-gutter)
;; If you enable global minor mode
(global-git-gutter-mode t)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

(require-package 'magit-svn)
(require 'magit-svn)

(provide 'init-git)

;;; init-git.el ends here
