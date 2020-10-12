(use-package magit
  :commands (magit-status magit-init)
  :ensure t
  :demand t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-c g") 'magit-file-dispatch)
  )
