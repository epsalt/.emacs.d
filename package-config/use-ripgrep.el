(use-package ripgrep
  :ensure t
  :bind (:map ripgrep-search-mode-map
              ("C-c C-f" . next-error-follow-minor-mode))
  :config
  (setq ripgrep-arguments '("--max-columns" "1000" "--hidden"))
  )
