(use-package lsp-mode
  :ensure t
  :hook (js-mode . lsp)
  :commands lsp
  :bind (("C-c ?" . lsp-describe-thing-at-point)
	 ("C-c ." . lsp-find-implementation)
	 ("C-c r" . lsp-find-references))
  :custom
  (lsp-auto-guess-root t)
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
