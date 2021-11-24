(use-package lsp-mode
  :ensure t
  :commands lsp
  :bind (:map lsp-mode-map
         ("C-c ?" . lsp-describe-thing-at-point)
         ("C-c ." . lsp-find-definition)
         ("C-c ," . xref-pop-marker-stack)
         ("C-c r" . lsp-find-references))
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  :custom
  (lsp-auto-guess-root t)
  (lsp-eldoc-enable-hover t)
  (lsp-eldoc-enable-signature-help t)
  (lsp-eldoc-prefer-signature-help t)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-modeline-code-actions-enable nil)
  (lsp-response-timeout 5)
  (lsp-prefer-flymake :none))
