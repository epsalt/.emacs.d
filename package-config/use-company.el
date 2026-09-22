(use-package company
  :ensure t
  :diminish
  :hook (prog-mode . company-mode)
  :hook (inferior-python-mode . company-mode)
  :bind (:map company-mode-map
              ("C-<tab>" . 'company-complete))
  :custom
  (company-transformers nil)
  (company-idle-delay 0.2)
  (company-dabbrev-downcase nil)
  (company-dabbrev-ignore-case nil)
  (company-minimum-prefix-length 1)
  (company-transformers '(company-sort-prefer-same-case-prefix)))
