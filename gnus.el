(setq user-mail-address "heimdal@athetius.com")
(setq user-full-name "John Hutchison")
;; Athetius Mail config
(setq gnus-select-method '(nnimap "Athetius Mail"
				   (nnimap-address "imap.gmail.com")
				   (nnimap-server-port 993)
				   (nnimap-stream ssl)))
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "heimdal@athetius.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain nil)
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
;; MTSU email config
;;(setq gnus-secondary-select-methods '((nnimap "MTMAIL"
;;					      (nnimap-address "pod51004.outlook.com")
;;					      (nnimap-server-port "993")
;;					      (nnimap-stream ssl))))
;; GMANE USENSET config
(add-to-list 'gnus-secondary-select-methods '(nntp "news.gmane.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp "nntp.aioe.org"))
;; Slashdot
;(add-to-list 'gnus-secondary-select-methods '(nnslashdot ""))
;; ATOM to RSS
(require 'mm-url)
(defadvice mm-url-insert (after DE-convert-atom-to-rss () )
  "Converts atom to RSS by calling xsltproc."
  (when (re-search-forward "xmlns=\"http://www.w3.org/.*/Atom\"" 
			   nil t)
    (goto-char (point-min))
    (message "Converting Atom to RSS... ")
    (call-process-region (point-min) (point-max) 
			 "xsltproc" 
			 t t nil 
			 (expand-file-name "~/.emacs.d/atom2rss.xsl") "-")
    (goto-char (point-min))
    (message "Converting Atom to RSS... done")))

(ad-activate 'mm-url-insert)
