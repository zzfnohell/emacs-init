;;; init-proxy.el --- Proxy

;;; Commentary:
;; 

;;; Code:

(defun enable-proxy ()
  "Enable proxy."
  (interactive)
  (message (format "enable proxy."))
  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|192.*\\)")
          ("http" . "127.0.0.1:8087")
          ("https" . "127.0.0.1:8087"))))

(defun disable-proxy ()
  "Disable proxy."
  (interactive)
  (message (format "disable proxy."))
  (setq url-proxy-services nil))

;; (setq url-http-proxy-basic-auth-storage
;;     (list (list "proxy.com:8080"
;;                 (cons "Input your LDAP UID !"
;;                       (base64-encode-string "LOGIN:PASSWORD")))))

(provide 'init-proxy)

;;; init-proxy.el ends here
