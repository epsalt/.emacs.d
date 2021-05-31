(use-package company
  :ensure t
  :diminish
  :hook (prog-mode . company-mode)
  :hook (inferior-python-mode . company-mode)
  :bind (:map company-mode-map
         ("C-<tab>" . 'company-complete))
  :custom
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 2)
)
