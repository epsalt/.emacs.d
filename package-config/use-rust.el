(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :hook (rust-mode . lsp)
  :custom (rust-format-on-save t)
  :init
  (setq lsp-rust-server 'rust-analyzer))

(use-package cargo
  :ensure t
  :config
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(use-package toml-mode
  :ensure t
  :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")
