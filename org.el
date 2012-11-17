(require 'org-install)
(require 'org-publish) 
(setq org-publish-project-alist 
      `(("org-main"
	 :base-directory ,*org-root-directory* 
	 :publishing-directory ,*org-publish-directory* 
	 :base-extension "org" 
	 :recursive t 
	 publishing-function org-publish-org-to-html
	 :auto-index t 
	 :index-filename "index.org" 
	 :index-title "index" 
	 :link-home "index.html") 
	("org-static" 
	 :base-directory ,*org-root-directory* 
	 :publishing-directory ,*org-publish-directory* 
	 :recursive t 
	 :base-extension "css//|js//|png//|jpg//|gif//|pdf//|mp3//|swf//|zip//|gz//|txt//|el"
	publishing-function org-publish-attachment) 
	("org" :components ("org-main" "org-static"))))
