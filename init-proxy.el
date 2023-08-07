;;; init-proxy.el --- Proxy

;;; Commentary:
;;

;;; Code:
(setq socks-server '("SSHOST SOCKS5" "sshost.local" 2003 5))

;; (defadvice url-http (around url-http-around activate disable)
;;   "Fix the `url-gateway-method' bug in `url-http'."
;;   (if (eq 'socks url-gateway-method)
;;       (let ((gateway-method url-gateway-method))
;;         ad-do-it)
;;     ad-do-it))
;; 
;; (setq socks-override-functions 1)
;; (setq socks-noproxy '("localhost" "sshost" "sshost.local"))
;; (require 'socks)

(defun proxy-enable-socks-proxy ()
  "Enable socks5 proxy."
  (interactive)
  (message (format "enable socks proxy."))
  (setq url-gateway-method 'socks))

(defun proxy-disable-socks-proxy ()
  "Disable socks5 proxy."
  (interactive)
  (message (format "disable socks proxy."))
  (setq url-gateway-method 'native))

(defun proxy-enable-env-proxy ()
  "Enable sys proxy."
  (interactive)
  (message (format "enable proxy."))
  (let ((http-proxy-url  "http://sshost.local:2001")
        (https-proxy-url "http://sshost.local:2001"))
    (setenv "http_proxy" http-proxy-url)
    (setenv "https_proxy" http-proxy-url)
    (setenv "ftp_proxy" http-proxy-url)
    (setenv "rsync_proxy" http-proxy-url)

    (setenv "HTTP_PROXY" http-proxy-url)
    (setenv "HTTPS_PROXY" http-proxy-url)
    (setenv "FTP_PROXY"  http-proxy-url)
    (setenv "RSYNC_PROXY" http-proxy-url)))

(defun proxy-disable-env-proxy ()
  "Disable sys proxy."
  (interactive)
  (message (format "disable proxy."))
  (setenv "http_proxy")
  (setenv "https_proxy")
  (setenv "ftp_proxy")
  (setenv "rsync_proxy")

  (setenv "HTTP_PROXY")
  (setenv "HTTPS_PROXY")
  (setenv "FTP_PROXY")
  (setenv "RSYNC_PROXY"))


(defun proxy-enable-url-proxy ()
  "Enable url proxy."
  (interactive)
  (message (format "enable url proxy."))
  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|192.*\\|*.local\\|sshost\\)")
          ("http" . "sshost.local:2001")
          ("https" . "sshost.local:2001"))))

(defun proxy-disable-url-proxy ()
  "Disable url proxy."
  (interactive)
  (message (format "disable url proxy."))
  (setq url-proxy-services nil))

;; (setq url-http-proxy-basic-auth-storage
;;     (list (list "proxy.com:8080"
;;                 (cons "Input your LDAP UID !"
;;                       (base64-encode-string "LOGIN:PASSWORD")))))
;; (proxy-enable-url-proxy )
(provide 'init-proxy)

;;; init-proxy.el ends here
