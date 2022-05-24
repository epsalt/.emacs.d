(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :custom
  (mail-user-agent 'mu4e-user-agent)
  (mu4e-drafts-folder "/[Gmail]/Drafts")
  (mu4e-sent-folder   "/[Gmail]/Sent Mail")
  (mu4e-trash-folder  "/[Gmail]/Trash")
  (mu4e-sent-messages-behavior 'delete)
  (mu4e-get-mail-command "mbsync -a")
  (mu4e-change-filenames-when-moving t)
  (mu4e-update-interval 300)

  :config
  (setq mu4e-maildir-shortcuts '(("/INBOX"             . ?i)
				 ("/[Gmail]/Sent Mail" . ?s)
				 ("/[Gmail]/Trash"     . ?t)
				 ("/[Gmail]/All Mail"  . ?a)
				 ("/[Gmail]/Starred"   . ?r)
				 ("/[Gmail]/Drafts"    . ?d)))
  (setq
   user-mail-address "evan@myheat.ca"
   user-full-name  "Evan Saltman"
   mu4e-compose-signature
    (concat
      "Evan Saltman\n"
      "Software Developer @ MyHEAT\n"))

  (setq message-send-mail-function 'smtpmail-send-it
    smtpmail-stream-type 'starttls
    smtpmail-default-smtp-server "smtp.gmail.com"
    smtpmail-smtp-server "smtp.gmail.com"
    smtpmail-smtp-service 587)

  (with-eval-after-load "mm-decode"
    (add-to-list 'mm-discouraged-alternatives "text/html")
    (add-to-list 'mm-discouraged-alternatives "text/richtext"))

  (with-eval-after-load 'message
    (setq message-cite-style message-cite-style-gmail)
    (setq message-citation-line-function 'message-insert-formatted-citation-line)
    (setq message-citation-line-format "On %a, %b %e, %Y at %I:%M %p %f wrote:")
    (setq message-kill-buffer-on-exit t))
  (setq mu4e--get-mail-password-regexp "^Passphrase: $"))

(use-package mu4e-alert
  :ensure t
  :after mu4e
  :config
  (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)
  (setq mu4e-alert-interesting-mail-query
      (concat
       "flag:unread"
       " AND NOT flag:trashed"
       " AND maildir:/INBOX"
  )))
