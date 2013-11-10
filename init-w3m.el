(require 'w3m)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-use-mule-ucs t)
(setq w3m-home-page "https://www.google.com/ncr")
(setq w3m-default-display-inline-images t))))

(provide 'init-w3m)
