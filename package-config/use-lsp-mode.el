(use-package lsp-mode
  :ensure t
  :commands lsp
  :bind ("C-?" . lsp-describe-thing-at-point)
  :custom
  (lsp-eldoc-enable-hover t)
  (lsp-eldoc-enable-signature-help t)
  (lsp-eldoc-prefer-signature-help t)
  (lsp-response-timeout 5)
  (lsp-prefer-flymake :none))

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :after (lsp-mode company)
  :custom
  (company-lsp-async t)
  (company-lsp-cache-candidates 'auto)
  (company-lsp-enable-recompletion t)
  :config
  (push 'company-lsp company-backends))
