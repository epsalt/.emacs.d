(use-package pyvenv
  :ensure t
  :commands (pyvenv-workon pyvenv-activate)
  :hook (python-mode . pyvenv-tracking-mode)
  :config
  (pyvenv-mode))
