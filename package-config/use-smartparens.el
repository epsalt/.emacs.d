(use-package smartparens
  :ensure t
  :hook ((js-mode typescript-mode web-tsx-mode web-jsx-mode web-vue-mode) . smartparens-mode)
  :custom (sp-highlight-pair-overlay . nil)
  :config
  (require 'smartparens-config))
