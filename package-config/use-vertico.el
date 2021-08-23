(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  )

(use-package savehist
  :ensure t
  :init
  (savehist-mode)
  )

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless))
  )

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
  (setq consult-ripgrep-command "rg --null --line-buffered --color=ansi --max-columns=1000\
  --hidden --glob=!vendor/ --glob=!.git/ --glob=!*.svg --smart-case --no-heading --line-number . -e ARG OPTS")
  )

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode)
  )
