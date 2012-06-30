(setq w3m-p t)
(cond 
 ((cygwin-p) (require 'w3m-lnum))
 ((linux-p) (require 'w3m))
 (t (setq w3m-p nil)))

(if w3m-p
    (progn 
      (setq w3m-command-arguments '("-cookie" "-F"))
      (setq w3m-use-cookies t)
      (setq w3m-use-mule-ucs t)
      (setq w3m-home-page "http://www.google.com.hk")
      (setq w3m-default-display-inline-images t)))
