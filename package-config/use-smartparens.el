(use-package smartparens
  :ensure t
  :hook ((js-mode typescript-mode web-tsx-mode web-jsx-mode) . smartparens-mode)
  :config
  (require 'smartparens-config))
