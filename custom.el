;;; custom.el --- custom


;;; Commentary:
;; 

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 307 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(custom-safe-themes
   (quote
	("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(cygwin-root-directory "/")
 '(default-frame-alist
	(quote
	 ((tool-bar-lines . 0)
	  (menu-bar-lines . 1)
	  (foreground-color . "Black")
	  (background-color . "White")
	  (cursor-type . box)
	  (cursor-color . "Red")
	  (internal-border-width . 0)
	  (left-fringe . 1)
	  (right-fringe)
	  (fringe))))
 '(diredp-hide-details-initially-flag nil)
 '(ecb-windows-width 30)
 '(evil-emacs-state-modes
   (quote
	(eshell-mode shell-mode archive-mode bbdb-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode Custom-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode doc-view-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode git-commit-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-cherry-mode magit-diff-mode magit-log-mode magit-log-select-mode magit-popup-mode magit-popup-sequence-mode magit-process-mode magit-reflog-mode magit-refs-mode magit-revision-mode magit-stash-mode magit-stashes-mode magit-status-mode magit-mode magit-branch-manager-mode magit-commit-mode magit-key-mode magit-rebase-mode magit-wazzup-mode mh-folder-mode monky-mode mu4e-main-mode mu4e-headers-mode mu4e-view-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode occur-mode org-agenda-mode package-menu-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-hg-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode)))
 '(evil-insert-state-modes
   (quote
	(comint-mode erc-mode geiser-repl-mode gud-mode inferior-apl-mode inferior-caml-mode inferior-emacs-lisp-mode inferior-j-mode inferior-python-mode inferior-scheme-mode inferior-sml-mode internal-ange-ftp-mode prolog-inferior-mode reb-mode shell-mode slime-repl-mode term-mode wdired-mode)))
 '(global-linum-mode t)
 '(httpd-host "0.0.0.0")
 '(httpd-port 8088)
 '(minimap-window-location (quote right))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode nil t)
 '(package-selected-packages
   (quote
	(evil logview auto-yasnippet fuzzy-format vlf shell-switcher yaml-mode web-beautify vkill visual-regexp tidy tern-auto-complete take-off tagedit tabbar sws-mode sql-indent skewer-less shell-command setup-cygwin session scss-mode sass-mode ruby-hash-syntax ruby-compilation robe redshank rainbow-mode rainbow-delimiters python-info pretty-mode powershell popup-kill-ring polymode paredit omnisharp nose noflet nodejs-repl nav mvn multi-web-mode multi-term msvc mmm-mode minimap malabar-mode macrostep lively lex less-css-mode kite kill-ring-search json-mode js-comint jedi javadoc-lookup java-snippets jade-mode ivy irfc impatient-mode idomenu hl-sexp helm-make helm-gtags helm-git-grep helm-git-files helm-fuzzy-find helm-flymake helm-flycheck helm-css-scss helm-c-yasnippet glsl-mode git-gutter git-blame ghci-completion ggtags fuzzy flymake-yaml flymake-json flymake-jslint flymake-css flymake-coffee ess-R-object-popup ess-R-data-view erlang elpy elein eldoc-eval ein ecb dsvn dos djvu diminish ctags-update ctags csv-nav csv-mode css-eldoc company-tern company-quickhelp company-jedi company-inf-ruby company-coq company-c-headers color-theme-solarized coffee-mode cmake-mode closure-lint-mode clojure-test-mode clojure-snippets cljsbuild-mode clang-format browse-kill-ring+ bison-mode bash-completion auto-indent-mode auto-highlight-symbol auto-complete-nxml auto-complete-exuberant-ctags auto-complete-clang auto-complete-c-headers ascope anyins ant angular-snippets anaconda-mode ahg ag ack-menu ack ace-jump-mode ac-slime ac-php ac-octave ac-js2 ac-inf-ruby ac-html-csswatcher ac-html-bootstrap ac-html ac-helm ac-etags ac-cider ac-c-headers)))
 '(scroll-bar-mode (quote right))
 '(session-use-package t nil (session))
 '(size-indication-mode t)
 '(tabbar-mode nil nil (tabbar))
 '(visual-line-mode nil t))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
