(use-package company
  :ensure t
  :custom (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :hook (prog-mode . company-mode)
  :hook (inferior-python-mode . company-mode))
