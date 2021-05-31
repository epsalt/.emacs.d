(use-package lsp-mode
  :ensure t
  :commands lsp
  :bind (:map lsp-mode-map
         ("C-c ?" . lsp-describe-thing-at-point)
         ("C-c ." . lsp-find-definition)
         ("C-c r" . lsp-find-references))
  :custom
  (lsp-auto-guess-root t)
  (lsp-eldoc-enable-hover t)
  (lsp-eldoc-enable-signature-help t)
  (lsp-eldoc-prefer-signature-help t)
  (lsp-response-timeout 5)
  (lsp-prefer-flymake :none))
