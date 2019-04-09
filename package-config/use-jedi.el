(use-package company-jedi
  :ensure t
  :after (company python)
  :hook (python-mode . jedi-mode)
  :custom (jedi:complete-on-dot t)
  :config
  (add-to-list 'company-backends 'company-jedi))
