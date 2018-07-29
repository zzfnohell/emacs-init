;;; init-java.el --- JAVA


;;; Commentary:
;;

;;; Code:

(require 'cedet)
(require 'semantic)
(use-package java-snippets)
(use-package javadoc-lookup
  :config
  (progn (require 'javadoc-lookup)
		 (setq open-jdk-doc-path "/usr/share/doc/openjdk-7-jdk/api")
		 (if (file-exists-p open-jdk-doc-path)
		(javadoc-add-roots open-jdk-doc-path))
	)

  )

(use-package ant :ensure t)
(use-package mvn :ensure t)
(use-package autodisass-java-bytecode
  :ensure t
  :defer t)

(use-package google-c-style
  :defer t
  :ensure t
  :commands
  (google-set-c-style))

;; eval (meghanada-install-server)/ (meghanada-update-server)
(use-package meghanada
  :defer t
  :ensure t
  :init
  (add-hook 'java-mode-hook
			(lambda ()
			  (google-set-c-style)
			  (google-make-newline-indent)
			  (meghanada-mode t)
			  (smartparens-mode t)
              (rainbow-delimiters-mode t)
              (highlight-symbol-mode t)
              (add-hook 'before-save-hook
                        'meghanada-code-beautify-before-save)))

  :config
  (use-package realgud :ensure t)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq c-basic-offset 2)
  (setq meghanada-server-remote-debug t)
  (setq meghanada-javac-xlint "-Xlint:all,-processing")
  :bind
  (:map meghanada-mode-map
        ("C-S-t" . meghanada-switch-testcase)
        ("M-RET" . meghanada-local-variable)
        ("C-M-." . helm-imenu)
        ("M-r" . meghanada-reference)
        ("M-t" . meghanada-typeinfo)
        ("C-z" . hydra-meghanada/body))
  :commands
  (meghanada-mode)
  )


(defhydra hydra-meghanada (:hint nil :exit t)
  "
^Edit^                           ^Tast or Task^
^^^^^^-------------------------------------------------------
_f_: meghanada-compile-file      _m_: meghanada-restart
_c_: meghanada-compile-project   _t_: meghanada-run-task
_o_: meghanada-optimize-import   _j_: meghanada-run-junit-test-case
_s_: meghanada-switch-test-case  _J_: meghanada-run-junit-class
_v_: meghanada-local-variable    _R_: meghanada-run-junit-recent
_i_: meghanada-import-all        _r_: meghanada-reference
_g_: magit-status                _T_: meghanada-typeinfo
_l_: helm-ls-git-ls
_q_: exit
"
  ("f" meghanada-compile-file)
  ("m" meghanada-restart)

  ("c" meghanada-compile-project)
  ("o" meghanada-optimize-import)
  ("s" meghanada-switch-test-case)
  ("v" meghanada-local-variable)
  ("i" meghanada-import-all)

  ("g" magit-status)
  ("l" helm-ls-git-ls)

  ("t" meghanada-run-task)
  ("T" meghanada-typeinfo)
  ("j" meghanada-run-junit-test-case)
  ("J" meghanada-run-junit-class)
  ("R" meghanada-run-junit-recent)
  ("r" meghanada-reference)

  ("q" exit)
  ("z" nil "leave"))

;; (use-package jdee :ensure t)

(provide 'init-java)
;;; init-java.el ends here
