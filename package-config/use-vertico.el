(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  )

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("<help> a" . consult-apropos)
         ("C-s" . consult-line)
         ("C-c C-j" . consult-imenu))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :config
  (setq consult-project-root-function #'projectile-project-root)
  )

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))
