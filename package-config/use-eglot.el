(use-package eglot
  :bind (:map eglot-mode-map
              ("C-c ?" . eldoc-doc-buffer)
              ("C-c ." . xref-find-definitions)
              ("C-c ," . xref-pop-marker-stack)
              ("C-c r" . xref-find-references))
  :hook
  (eglot--managed-mode . manually-activate-flymake)
  :custom
  (eglot-events-buffer-size 0)
  (eglot-sync-connect nil)
  (eglot-ignored-server-capabilities
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
  :preface
  (defun manually-activate-flymake ()
    (add-hook 'flymake-diagnostic-functions #'eglot-flymake-backend nil t)
    (flymake-mode 1))
  :config
  (fset #'jsonrpc--log-event #'ignore)
  (add-to-list 'eglot-server-programs '(python-ts-mode . ("jedi-language-server")))
  (add-to-list 'eglot-stay-out-of 'flymake))

(use-package flymake
  :bind (:map flymake-mode-map
              ("C-c C-l" . flymake-show-buffer-diagnostics)
              ("M-n" . flymake-goto-next-error)
              ("M-p" . flymake-goto-prev-error)))
