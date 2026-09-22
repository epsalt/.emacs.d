(use-package eldoc
  :ensure nil
  :diminish eldoc-mode
  :custom
  (eldoc-echo-area-use-multiline-p t)
  (eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly))
