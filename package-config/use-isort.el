(use-package py-isort
  :ensure t
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))
