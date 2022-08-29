(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless)))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("<help> a" . consult-apropos)
         ("M-s l" . consult-line)
         ("C-c C-j" . consult-imenu))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :config
  (setq consult-project-root-function #'projectile-project-root)
  (setq consult-ripgrep-args "rg --null --line-buffered --color=never --max-columns=1000 --path-separator /\
         --smart-case --no-heading --line-number --hidden -g \"!vendor\" -g \"!.git\" -g \"!*.svg\" ."))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))
