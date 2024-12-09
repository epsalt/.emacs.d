(use-package eglot
  :ensure t
  :bind (:map eglot-mode-map
              ("C-c ?" . eldoc-doc-buffer)
              ("C-c ." . xref-find-definitions)
              ("C-c ," . xref-pop-marker-stack)
              ("C-c r" . xref-find-references))
  :config
  (fset #'jsonrpc--log-event #'ignore)
  (setq eglot-events-buffer-size 0)
  (setq eglot-sync-connect nil)

  (setq eglot-ignored-server-capabilities
        '(:documentHighlightProvider
          :codeActionProvider
          :documentSymbolProvider
          :workspaceSymbolProvider
          :codeLensProvider
          :documentFormattingProvider
          :documentRangeFormattingProvider
          :documentOnTypeFormattingProvider
          :renameProvider
          :documentLinkProvider
          :colorProvider
          :foldingRangeProvider
          :inlayHintProvider))

  (add-to-list 'eglot-server-programs
               '(web-tsx-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(web-jsx-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(python-ts-mode . ("pyright-langserver" "--stdio"))))
