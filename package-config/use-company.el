(use-package company
  :ensure t
  :diminish
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :hook (prog-mode . company-mode)
  :hook (inferior-python-mode . company-mode))
