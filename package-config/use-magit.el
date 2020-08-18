(use-package magit
  :commands (magit-status magit-init)
  :bind
  ("C-x M-g" . magit-dispatch)
  ("C-c g" . magit-file-dispatch)
  :ensure t)
