(use-package org-roam
  :ensure t
  :hook
  (after-init . org-roam-setup)
  (org-mode . company-mode)
  :custom
  (org-roam-directory "~/roam")
  (org-roam-dailies-directory "daily/")
  :bind (("C-c n l" . org-roam)
         ("C-c n f" . org-roam-find-file)
         ("C-c n g" . org-roam-graph)
         ("C-c n c" . org-roam-dailies-capture-today)
         ("C-c n t" . org-roam-dailies-find-today)
         :map org-mode-map
         ("C-c n i" . org-roam-insert)
         ("C-c n I" . org-roam-insert-immediate))
  :init
  (setq org-roam-v2-ack t)
  :config
  (org-roam-db-autosync-mode)
  (add-hook 'org-mode-hook
            (lambda ()
              (make-local-variable 'company-backends)
              (setq company-backends '(company-capf))))
  (setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :if-new (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))
  )
