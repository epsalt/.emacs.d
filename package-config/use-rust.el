;; (use-package rust-mode
;;   :ensure t
;;   :mode ("\\.rs\\'" . rust-mode)
;;   :hook (rust-mode . lsp)
;;   :custom (rust-format-on-save t)
;;   :init
;;   (setq lsp-rust-server 'rust-analyzer)
;;   (setq lsp-prefer-capf t)
;;   (setq lsp-completion-provider :capf)
;;   (setq lsp-completion-enable t)
;;   )

;; (use-package cargo
;;   :ensure t
;;   :config
;;   :hook (rust-mode . cargo-minor-mode))

;; (use-package toml-mode
;;   :ensure t
;;   :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")

(use-package rustic
  :ensure t
  :mode ("\\.rs\\'" . rustic-mode)
  :hook (rust-mode . lsp)
  :config

  (setq rustic-lsp-server 'rust-analyzer)
  (setq lsp-rust-analyzer-server-command '("~/.local/bin/rust-analyzer"))
  ;; (setq lsp-prefer-capf t)
  ;; (setq lsp-completion-provider :capf)
  ;; (setq lsp-completion-enable t)

  (use-package flycheck-rust
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

  (use-package cargo
  :ensure t
  :config
  (cargo-minor-mode))
  )
