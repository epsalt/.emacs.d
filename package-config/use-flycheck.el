(use-package flycheck
  :ensure t
  :custom
  (flycheck-python-flake8-executable "/home/epsalt/.local/bin/flake8")
  (flycheck-lake8rc "/home/epsalt/.flake8")
  :init (global-flycheck-mode)
  )
