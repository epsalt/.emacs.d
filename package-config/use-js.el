(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (setq js2-basic-offset 2)
  (add-hook 'js2-mode-hook 'lsp))

(use-package prettier-js
  :ensure t
  :hook (js2-mode . prettier-js-mode))
