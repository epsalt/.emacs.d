(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :hook ((go-mode . smartparens-mode)
         (before-save . gofmt-before-save))
  :config
  (eglot-ensure))
