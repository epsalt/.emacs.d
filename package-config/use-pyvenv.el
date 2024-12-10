(use-package pyvenv
  :ensure t
  :commands (pyvenv-workon pyvenv-activate)
  :hook (python-ts-mode . pyvenv-tracking-mode)
  :config
  (setenv "WORKON_HOME" "~/.virtualenvs")
  (pyvenv-mode))
