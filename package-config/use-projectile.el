(use-package projectile
  :ensure t
  :custom
  (projectile-completion-system 'ivy)
  (projectile-auto-discover t)
  (projectile-dynamic-mode-line nil)
  (projectile-mode-line-prefix " P")
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p s") 'projectile-ripgrep)

  (setq projectile-switch-project-action
	'(lambda ()
	   (my/pyvenv-workon-projectile-venv)
	   (projectile-dired)))
  )
