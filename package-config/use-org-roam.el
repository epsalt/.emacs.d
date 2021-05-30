(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      (org-mode . company-mode)
      :custom
      (org-roam-directory "~/roam")
      (org-roam-dailies-directory "daily/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph)
	       ("C-c n c" . org-roam-dailies-capture-today)
	       ("C-c n t" . org-roam-dailies-find-today))

              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate)))
      :config
      (add-to-list 'company-backends 'company-capf)

      (setq org-roam-dailies-capture-templates
	    '(("d" "default" entry
               #'org-roam-capture--get-point
               "* %?"
               :file-name "daily/%<%Y-%m-%d>"
               :head "#+title: %<%Y-%m-%d>\n\n")))

      )
