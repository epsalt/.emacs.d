(use-package magit
  :commands (magit-status magit-init)
  :ensure t
  :demand t
  :config
  (define-key magit-file-mode-map
    (kbd "C-c g") 'magit-file-dispatch)
  )
