;;; init-erc.el --- ERC

;;; Commentary:
;; 

;;; ERC
(setq erc-server-coding-system '(utf-8 . utf-8))
(setq erc-encoding-coding-alist '(("#linuxfire" . chinese-iso-8bit)))

(setq erc-nick "zzfnohell"
      erc-user-full-name "ZF.Z")

(setq socks-override-functions 1)
(setq socks-noproxy '("localhost" "sshost"))
(require 'socks)
(setq erc-server-connect-function 'socks-open-network-stream)
(setq socks-server '("Stunnel" "sshost" 2003 5))


(defun init-erc/erc-mode-hook-func ()
  (require 'erc-log)
  (setq erc-log-channels-directory "~/.emacs.d/log/erc/"
        erc-save-buffer-on-part t
        erc-log-file-coding-system 'utf-8
        erc-log-write-after-send t
        erc-log-write-after-insert t)
  (unless (file-exists-p erc-log-channels-directory)
    (mkdir erc-log-channels-directory t))
  
  (erc-log-mode 1))

(use-package erc
  :ensure nil
  :defer t
  :hook ((erc-mode-hook . init-erc/erc-mode-hook-func)))

(use-package telega
  :ensure t
  :defer t
  :init
  (setq telega-proxies
	(list
	 '(:server "sshost"
		   :port 2003
		   :enable :false
		   :type (:@type "proxyTypeSocks5")))))

(message "loading init-erc done")
(provide 'init-erc)

;;; init-erc.el ends here
