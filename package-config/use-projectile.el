(use-package projectile
  :ensure t
  :diminish projectile-mode
  :custom
  ;; (projectile-completion-system 'ivy)
  (projectile-auto-discover t)
  (projectile-dynamic-mode-line nil)
  (projectile-mode-line-prefix " P")
  :bind (:map projectile-mode-map
              ("C-c p" . 'projectile-command-map)
              ("C-c p s" . 'consult-ripgrep)
              ("C-c p v" . 'projectile-run-vterm))
  :config
  (projectile-mode 1)
  )
