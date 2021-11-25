(use-package org-roam
  :ensure t
  :hook (org-mode . company-mode)
  :custom
  (org-roam-directory "~/roam")
  (org-roam-dailies-directory "daily/")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))
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
                            "#+title: %<%Y-%m-%d>\n")))))
