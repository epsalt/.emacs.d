(use-package magit
  :ensure t
  :demand t
  :config
  (global-set-key (kbd "C-c g") 'magit-file-dispatch))
