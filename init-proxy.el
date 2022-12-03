;;; init-proxy.el --- Proxy

;;; Commentary:
;;

;;; Code:

(defun enable-proxy ()
  "Enable proxy."
  (interactive)
  (message (format "enable proxy."))
  (let ((http-proxy-url  "http://sshost:2001")
        (https-proxy-url "http://sshost:2001"))
    (setenv "http_proxy" http-proxy-url)
    (setenv "https_proxy" http-proxy-url)
    (setenv "ftp_proxy" http-proxy-url)
    (setenv "rsync_proxy" http-proxy-url)

    (setenv "HTTP_PROXY" http-proxy-url)
    (setenv "HTTPS_PROXY" http-proxy-url)
    (setenv "FTP_PROXY"  http-proxy-url)
    (setenv "RSYNC_PROXY" http-proxy-url))

  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|192.*\\|sshost\\)")
          ("http" . "sshost:2001")
          ("https" . "sshost:2001"))))

(defun disable-proxy ()
  "Disable proxy."
  (interactive)
  (message (format "disable proxy."))
  (setenv "http_proxy")
  (setenv "https_proxy")
  (setenv "ftp_proxy")
  (setenv "rsync_proxy")

  (setenv "HTTP_PROXY")
  (setenv "HTTPS_PROXY")
  (setenv "FTP_PROXY")
  (setenv "RSYNC_PROXY")

  (setq url-proxy-services nil))

;; (setq url-http-proxy-basic-auth-storage
;;     (list (list "proxy.com:8080"
;;                 (cons "Input your LDAP UID !"
;;                       (base64-encode-string "LOGIN:PASSWORD")))))
(enable-proxy)
(provide 'init-proxy)

;;; init-proxy.el ends here
