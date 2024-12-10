(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :hook ((go-mode . smartparens-mode)
         (go-mode . eglot-ensure)
         (before-save . gofmt-before-save)))
